"""Agent coach : répond aux questions d'un utilisateur sur ses propres séances.

Boucle d'appel d'outils écrite à la main : chaque résultat d'outil reçoit une référence
(`r1`, `r2`…) et les séances qui le justifient restent côté serveur. Le modèle termine en
appelant `repondre` avec les références de ses sources. Les séances citées sont l'union des
séances de ces références : le modèle ne recopie aucun identifiant.

Le modèle ne fait aucun calcul ni aucune requête : il choisit des outils typés (`tools.py`).
"""

from __future__ import annotations

import json
from dataclasses import dataclass, field
from datetime import date
from typing import Any, Protocol

from app.coach.tools import DEFINITIONS, Toolbox, ToolError
from app.coach.verify import unsupported

MODEL = "claude-opus-5-5"
EFFORT = "medium"
MAX_TOKENS = 8000  # plafond de sortie par appel (règle 8 de CLAUDE.md)
MAX_TURNS = 8  # plafond d'appels au modèle par question

ANSWER_TOOL = {
    "name": "repondre",
    "description": "Donne la réponse finale à l'utilisateur. À appeler une seule fois, à la "
    "fin, y compris pour dire qu'il n'y a pas de donnée ou pour refuser.",
    "input_schema": {
        "type": "object",
        "properties": {
            "texte": {"type": "string", "description": "Réponse en français, courte."},
            "valeur": {
                "type": ["number", "null"],
                "description": "Le nombre qui répond à la question, recopié d'un résultat "
                "d'outil ; null s'il n'y en a pas.",
            },
            "unite": {
                "type": ["string", "null"],
                "description": "kg, séances, répétitions, secondes ou %, null sans valeur.",
            },
            "aucune_donnee": {
                "type": "boolean",
                "description": "Vrai si l'historique ne contient pas la donnée demandée.",
            },
            "sources": {
                "type": "array",
                "items": {"type": "string"},
                "description": "Références (r1, r2…) des résultats d'outils utilisés.",
            },
        },
        "required": ["texte", "valeur", "unite", "aucune_donnee", "sources"],
        "additionalProperties": False,
    },
}

SYSTEM = """Tu es le coach d'une application de musculation. Tu réponds en français aux \
questions de l'utilisateur sur son propre historique de séances.

Règles :
- Tu ne connais l'historique que par les outils. N'invente aucune valeur.
- Ne fais aucun calcul toi-même : chaque nombre de ta réponse vient tel quel d'un résultat \
d'outil. Si aucun outil ne donne le nombre demandé, dis-le.
- Les dates des outils sont des jours en heure de Paris (AAAA-MM-JJ), dernier jour inclus. \
Une semaine va du lundi au dimanche. Un mois va du premier au dernier jour.
- Pour un exercice, appelle d'abord exercices_pratiques et choisis le code qui correspond. \
Si l'exercice demandé n'y figure pas, ni une variante évidente, il n'y a pas de donnée : \
dis-le, sans valeur. Si seule une variante figure (haltères au lieu de barre, par exemple), \
réponds sur celle-ci et précise-le.
- Une période sans séance n'est pas une donnée absente : la réponse est 0.
- Tu ne donnes aucun conseil de santé, de blessure, de douleur, de nutrition ou de \
complément, et tu ne réponds pas aux questions hors de l'historique d'entraînement. Dans ces \
cas, refuse en une phrase et renvoie vers un médecin ou un professionnel de santé si c'est \
médical, ou vers les questions sur l'historique sinon.
- Termine toujours en appelant repondre une seule fois, avec les références des résultats \
utilisés dans sources."""


class LLM(Protocol):
    def __call__(self, **request: Any) -> Any:
        """Un appel à l'API Messages. Renvoie un message (content, stop_reason, usage, model)."""
        ...


@dataclass
class Usage:
    input_tokens: int = 0
    output_tokens: int = 0
    cache_read_input_tokens: int = 0
    cache_creation_input_tokens: int = 0

    def add(self, usage: Any) -> None:
        for name in vars(self):
            setattr(self, name, getattr(self, name) + (getattr(usage, name, 0) or 0))


@dataclass
class CoachAnswer:
    texte: str
    valeur: float | None
    unite: str | None
    aucune_donnee: bool
    sessions: set[str]
    tool_calls: list[dict] = field(default_factory=list)
    models: list[str] = field(default_factory=list)
    usage: Usage = field(default_factory=Usage)
    turns: int = 0
    finished: bool = True  # faux : plafond atteint ou modèle arrêté sans `repondre`
    verification: dict = field(
        default_factory=lambda: {"rejets": [], "reecritures": 0, "remplacee": False}
    )


UNVERIFIED = {
    "texte": "Je n'ai pas pu vérifier ce chiffre dans ton historique, je préfère ne pas le donner.",
    "valeur": None,
    "unite": None,
}


def _rejection(block: Any, bad: list[float]) -> dict:
    listed = ", ".join(f"{n:g}" for n in bad)
    return {
        "type": "tool_result",
        "tool_use_id": block.id,
        "content": f"Réponse refusée : ces nombres ne figurent dans aucun résultat d'outil : "
        f"{listed}. Réécris la réponse avec les seuls nombres des résultats d'outils, puis "
        "rappelle repondre.",
        "is_error": True,
    }


class Coach:
    def __init__(
        self,
        llm: LLM,
        toolbox: Toolbox,
        model: str = MODEL,
        effort: str = EFFORT,
        verify: bool = False,
    ):
        """`verify` : variante « avec vérification des chiffres » de l'ablation A3."""
        self.llm, self.toolbox, self.model, self.effort = llm, toolbox, model, effort
        self.verify = verify

    def request(self, messages: list) -> dict:
        return {
            "model": self.model,
            "max_tokens": MAX_TOKENS,
            "system": SYSTEM,
            "tools": [{**d, "strict": True} for d in [*DEFINITIONS, ANSWER_TOOL]],
            "output_config": {"effort": self.effort},
            "cache_control": {"type": "ephemeral"},  # le préfixe grandit d'un tour à l'autre
            "messages": messages,
        }

    def ask(self, question: str, today: date) -> CoachAnswer:
        messages: list = [
            {"role": "user", "content": f"Aujourd'hui : {today.isoformat()}.\n\n{question}"}
        ]
        refs: dict[str, set[str]] = {}
        answer = CoachAnswer("", None, None, False, set(), finished=False)
        for _ in range(MAX_TURNS):
            response = self.llm(**self.request(messages))
            answer.turns += 1
            answer.usage.add(response.usage)
            answer.models.append(response.model)
            messages.append({"role": "assistant", "content": response.content})
            if response.stop_reason == "pause_turn":
                continue
            uses = [b for b in response.content if b.type == "tool_use"]
            final = next((b for b in uses if b.name == "repondre"), None)
            bad: list[float] = []
            if final is not None:
                bad = self._check(answer, final.input)
                if not bad:
                    return self._finish(answer, final.input, refs)
                if answer.verification["reecritures"] >= 1:
                    answer.verification["remplacee"] = True
                    return self._finish(answer, {**final.input, **UNVERIFIED}, refs)
                answer.verification["reecritures"] += 1
            if not uses:
                answer.texte = "".join(b.text for b in response.content if b.type == "text")
                return answer
            results = []
            for block in uses:
                if block.name == "repondre":
                    results.append(_rejection(block, bad))
                else:
                    results.append(self._run_tool(block, refs, answer))
            messages.append({"role": "user", "content": results})
        return answer

    def _check(self, answer: CoachAnswer, args: dict) -> list[float]:
        """A3 : nombres de la réponse non soutenus par les outils (vide sans vérification)."""
        if not self.verify:
            return []
        results = [c["resultat"] for c in answer.tool_calls if "resultat" in c]
        valeur = args.get("valeur")
        valeur = float(valeur) if isinstance(valeur, int | float) else None
        bad = unsupported(args.get("texte", ""), valeur, args.get("unite"), results)
        if bad:
            answer.verification["rejets"].append(bad)
        return bad

    def _run_tool(self, block: Any, refs: dict[str, set[str]], answer: CoachAnswer) -> dict:
        call = {"outil": block.name, "arguments": block.input}
        try:
            result = self.toolbox.run(block.name, dict(block.input))
        except ToolError as e:
            call["erreur"] = str(e)
            answer.tool_calls.append(call)
            return {
                "type": "tool_result",
                "tool_use_id": block.id,
                "content": str(e),
                "is_error": True,
            }
        ref = f"r{len(refs) + 1}"
        refs[ref] = result.sessions
        content = {"ref": ref, **result.content}
        call["resultat"] = content
        answer.tool_calls.append(call)
        return {
            "type": "tool_result",
            "tool_use_id": block.id,
            "content": json.dumps(content, ensure_ascii=False),
        }

    @staticmethod
    def _finish(answer: CoachAnswer, args: dict, refs: dict[str, set[str]]) -> CoachAnswer:
        answer.texte = args.get("texte", "")
        valeur = args.get("valeur")
        answer.valeur = float(valeur) if isinstance(valeur, int | float) else None
        answer.unite = args.get("unite")
        answer.aucune_donnee = bool(args.get("aucune_donnee"))
        for ref in args.get("sources") or []:
            answer.sessions |= refs.get(ref, set())
        answer.tool_calls.append({"outil": "repondre", "arguments": args})
        answer.finished = True
        return answer


class AnthropicLLM:
    """Client de l'API Messages (SDK officiel). Clé lue par le SDK (ANTHROPIC_API_KEY).

    Repli serveur en cas de refus du modèle (`fallbacks: "default"`) : le modèle qui a
    réellement répondu est noté dans `CoachAnswer.models`.
    Pas de `temperature` : l'API ne l'accepte plus sur les modèles actuels.
    """

    FALLBACK_BETA = "server-side-fallback-2026-07-01"

    def __init__(self, client: Any = None):
        if client is None:
            import anthropic

            client = anthropic.Anthropic()
        self.client = client

    def __call__(self, **request: Any) -> Any:
        return self.client.beta.messages.create(
            **request, betas=[self.FALLBACK_BETA], fallbacks="default"
        )
