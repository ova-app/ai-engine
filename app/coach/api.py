"""Route du coach : POST /coach/question.

Ordre des contrôles, tous avant le premier appel payant :
1. route configurée (variables d'environnement), sinon 503 ;
2. jeton de session Supabase valide, vérifié auprès de Supabase, sinon 401 ;
3. utilisateur inscrit dans COACH_ALLOWED_USERS, sinon 403. La liste ne doit contenir que des
   comptes du mainteneur ou de test : aucune donnée d'un tiers vers un LLM (règle 4).

Les séances sont lues avec le jeton de l'utilisateur (RLS), jamais avec une clé de service.
Les journaux ne contiennent ni jeton, ni question, ni réponse.

Variables : SUPABASE_URL, SUPABASE_ANON_KEY, ANTHROPIC_API_KEY, COACH_ALLOWED_USERS
(identifiants séparés par des virgules), COACH_MAX_COST_USD (facultatif).
"""

from __future__ import annotations

import json
import logging
import os
import time
import urllib.error
import urllib.request
from collections.abc import Callable
from dataclasses import asdict, dataclass
from datetime import UTC, datetime
from functools import lru_cache
from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from pydantic import BaseModel, Field

from app.coach.agent import LLM, AnthropicLLM, Coach
from app.coach.catalogue import EXERCISES
from app.coach.data import Store, paris_date
from app.coach.pricing import cost_usd
from app.coach.supabase import SupabaseStore
from app.coach.tools import Toolbox

MAX_QUESTION = 500  # caractères
MAX_COST_USD = 0.05  # plafond par question ; le plus cher mesuré en développement : 0,032 $

log = logging.getLogger("uvicorn.error")
router = APIRouter()
bearer = HTTPBearer(auto_error=False)


@dataclass(frozen=True)
class Settings:
    supabase_url: str
    anon_key: str
    allowed_users: frozenset[str]
    max_cost_usd: float = MAX_COST_USD


def settings() -> Settings:
    url, key = os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_ANON_KEY")
    listed = os.getenv("COACH_ALLOWED_USERS", "").split(",")
    users = frozenset(u.strip() for u in listed if u.strip())
    if not (url and key and users and os.getenv("ANTHROPIC_API_KEY")):
        raise HTTPException(503, "coach non configuré")
    cap = float(os.getenv("COACH_MAX_COST_USD") or MAX_COST_USD)
    return Settings(url, key, users, cap)


def fetch_user_id(url: str, anon_key: str, token: str) -> str | None:
    """Identifiant de l'utilisateur du jeton, ou None si Supabase le refuse."""
    request = urllib.request.Request(
        url.rstrip("/") + "/auth/v1/user",
        headers={"apikey": anon_key, "Authorization": f"Bearer {token}"},
    )
    try:
        with urllib.request.urlopen(request, timeout=10) as response:
            return json.loads(response.read()).get("id")
    except urllib.error.HTTPError as e:
        if e.code in (401, 403):
            return None
        raise


def auth_lookup() -> Callable[[str, str, str], str | None]:
    return fetch_user_id


def user_token(
    credentials: Annotated[HTTPAuthorizationCredentials | None, Depends(bearer)],
    config: Annotated[Settings, Depends(settings)],
    lookup: Annotated[Callable, Depends(auth_lookup)],
) -> str:
    refused = HTTPException(401, "jeton invalide", {"WWW-Authenticate": "Bearer"})
    if credentials is None:
        raise refused
    try:
        user = lookup(config.supabase_url, config.anon_key, credentials.credentials)
    except (OSError, ValueError):
        raise HTTPException(502, "authentification indisponible") from None
    if not user:
        raise refused
    if user not in config.allowed_users:
        raise HTTPException(403, "compte non autorisé")
    return credentials.credentials


def user_store(
    token: Annotated[str, Depends(user_token)],
    config: Annotated[Settings, Depends(settings)],
) -> Store:
    return SupabaseStore(config.supabase_url, config.anon_key, token)


@lru_cache
def _anthropic() -> AnthropicLLM:
    return AnthropicLLM()


def llm_client() -> LLM:
    return _anthropic()


class Question(BaseModel):
    question: str = Field(min_length=1, max_length=MAX_QUESTION)


class Reply(BaseModel):
    texte: str
    valeur: float | None
    unite: str | None
    aucune_donnee: bool
    seances: list[str]


@router.post("/coach/question")
def ask(
    body: Question,
    store: Annotated[Store, Depends(user_store)],
    config: Annotated[Settings, Depends(settings)],
    llm: Annotated[LLM, Depends(llm_client)],
) -> Reply:
    coach = Coach(llm, Toolbox(store, EXERCISES), max_cost_usd=config.max_cost_usd)
    start = time.perf_counter()
    try:
        answer = coach.ask(body.question, paris_date(datetime.now(UTC)))
    except Exception as e:  # base ou modèle indisponible : aucun détail renvoyé au client
        log.error("coach en échec : %s", type(e).__name__)
        raise HTTPException(502, "service indisponible") from None
    log.info(
        "coach outils=%s tours=%d latence_ms=%.0f cout_usd=%s terminee=%s",
        ",".join(c["outil"] for c in answer.tool_calls),
        answer.turns,
        (time.perf_counter() - start) * 1000,
        cost_usd(answer.models, asdict(answer.usage)),
        answer.finished,
    )
    if not answer.finished:
        raise HTTPException(502, "réponse inachevée")
    return Reply(
        texte=answer.texte,
        valeur=answer.valeur,
        unite=answer.unite,
        aucune_donnee=answer.aucune_donnee,
        seances=sorted(answer.sessions),
    )
