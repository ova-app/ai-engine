"""Magasin Supabase : lit les séances par l'API REST (PostgREST) avec le jeton de l'utilisateur.

Le service n'envoie que la clé publique (anon) et le jeton de session de l'utilisateur,
jamais de clé de service (règle 5 de CLAUDE.md). La sécurité par ligne (RLS) ne suffit pas :
elle laisse aussi lire les séances publiques d'autres comptes. Chaque requête filtre donc sur
`user_id`. Lecture seule, aucune requête SQL écrite par le modèle.

À vérifier sur le projet Supabase de test avant la mise en service : les relations
imbriquées (`workout_exercises`, `exercises`, `workout_sets`) et la limite de lignes par page.
"""

from __future__ import annotations

import json
import urllib.parse
import urllib.request
from collections.abc import Callable
from datetime import datetime

from app.coach.data import SetRow, Workout

SELECT = (
    "id,started_at,"
    "workout_exercises(exercises(code,muscle_group),workout_sets(set_type,reps,weight_kg))"
)
PAGE = 1000

Fetch = Callable[[str, dict[str, str]], list[dict]]


def _fetch(url: str, headers: dict[str, str]) -> list[dict]:
    request = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(request, timeout=20) as response:
        return json.loads(response.read())


def _ts(value: str) -> datetime:
    return datetime.fromisoformat(value.replace("Z", "+00:00"))


class SupabaseStore:
    def __init__(self, url: str, anon_key: str, user_jwt: str, user_id: str, fetch: Fetch = _fetch):
        """`user_id` : identifiant vérifié auprès de Supabase, jamais fourni par le client."""
        if not user_jwt:
            raise ValueError("jeton de l'utilisateur manquant")
        if not user_id:
            raise ValueError("identifiant de l'utilisateur manquant")
        self.user_id = user_id
        self.base = url.rstrip("/") + "/rest/v1/workouts"
        self.headers = {
            "apikey": anon_key,
            "Authorization": f"Bearer {user_jwt}",
            "Accept": "application/json",
        }
        self.fetch = fetch
        self._cache: dict[tuple, list[dict]] = {}

    def _rows(self, start: datetime | None, end: datetime | None) -> list[dict]:
        key = (start, end)
        if key in self._cache:
            return self._cache[key]
        params = [
            ("select", SELECT),
            ("user_id", f"eq.{self.user_id}"),
            ("order", "started_at.asc,id.asc"),
        ]
        if start is not None:
            params.append(("started_at", f"gte.{start.isoformat()}"))
        if end is not None:
            params.append(("started_at", f"lt.{end.isoformat()}"))
        rows: list[dict] = []
        offset = 0
        while True:
            query = urllib.parse.urlencode([*params, ("limit", PAGE), ("offset", offset)])
            page = self.fetch(f"{self.base}?{query}", self.headers)
            rows += page
            if len(page) < PAGE:
                break
            offset += PAGE
        self._cache[key] = rows
        return rows

    def workouts(self, start: datetime | None, end: datetime | None) -> list[Workout]:
        return [Workout(r["id"], _ts(r["started_at"])) for r in self._rows(start, end)]

    def sets(self, start: datetime | None, end: datetime | None) -> list[SetRow]:
        out = []
        for w in self._rows(start, end):
            started = _ts(w["started_at"])
            for we in w.get("workout_exercises") or []:
                exercise = we.get("exercises") or {}
                for s in we.get("workout_sets") or []:
                    out.append(
                        SetRow(
                            w["id"],
                            started,
                            exercise.get("code"),
                            s["set_type"],
                            s["reps"] or 0,
                            float(s["weight_kg"] or 0),
                            exercise.get("muscle_group"),
                        )
                    )
        return out
