"""Outils typés du coach. Tous les calculs sont faits ici, en Python, jamais par le modèle.

Chaque outil renvoie un dictionnaire (envoyé au modèle) et l'ensemble des séances qui
justifient ce résultat (gardé côté serveur, pour les citations).

Conventions (celles du jeu « coach », eval/sets/coach/README.md) :
- dates en heure de Paris, au format AAAA-MM-JJ, dernier jour inclus ;
- séries d'échauffement exclues ; volume = Σ répétitions × kg ;
- progression = charge max de la dernière séance de la période moins celle de la première ;
- 1RM estimé (Epley) = kg × (1 + répétitions / 30) ;
- répartition : muscle principal de l'exercice, en nombre de séries.
"""

from __future__ import annotations

from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from datetime import date

from app.coach.data import SetRow, Store, paris_bounds, paris_date, round_half_up


class ToolError(ValueError):
    """Erreur d'argument : renvoyée au modèle comme résultat d'erreur."""


@dataclass
class ToolResult:
    content: dict
    sessions: set[str] = field(default_factory=set)


def _date(value: str, name: str) -> date:
    try:
        return date.fromisoformat(value)
    except (TypeError, ValueError):
        raise ToolError(f"{name} : date attendue au format AAAA-MM-JJ, reçu {value!r}") from None


def _period(debut: str, fin: str) -> tuple[date, date]:
    d1, d2 = _date(debut, "debut"), _date(fin, "fin")
    if d2 < d1:
        raise ToolError("fin est avant debut")
    return d1, d2


def _work(rows: list[SetRow]) -> list[SetRow]:
    return [r for r in rows if r.set_type != "warmup"]


_DATE = {"type": "string", "description": "Jour en heure de Paris, AAAA-MM-JJ."}
_FIN = {"type": "string", "description": "Dernier jour inclus, heure de Paris, AAAA-MM-JJ."}
_EXO = {
    "type": "string",
    "description": "Code de l'exercice, tel que renvoyé par exercices_pratiques.",
}


def _schema(**props) -> dict:
    return {
        "type": "object",
        "properties": props,
        "required": list(props),
        "additionalProperties": False,
    }


DEFINITIONS: list[dict] = [
    {
        "name": "exercices_pratiques",
        "description": "Liste des exercices que l'utilisateur a déjà faits (codes), avec le "
        "nombre de séances et la dernière date. À appeler pour trouver le code d'un exercice. "
        "Un exercice absent de cette liste n'a jamais été fait : il n'y a pas de donnée.",
        "input_schema": _schema(),
    },
    {
        "name": "seances",
        "description": "Nombre de séances commencées entre deux jours (inclus), et leurs dates.",
        "input_schema": _schema(debut=_DATE, fin=_FIN),
    },
    {
        "name": "volume",
        "description": "Volume soulevé entre deux jours inclus (Σ répétitions × kg, hors "
        "échauffement), et nombre de séances.",
        "input_schema": _schema(debut=_DATE, fin=_FIN),
    },
    {
        "name": "comparer_volume",
        "description": "Volume de deux périodes et différence (période 2 moins période 1).",
        "input_schema": _schema(debut1=_DATE, fin1=_FIN, debut2=_DATE, fin2=_FIN),
    },
    {
        "name": "progression",
        "description": "Évolution de la charge maximale d'un exercice entre deux jours : charge "
        "max de la dernière séance de la période moins celle de la première.",
        "input_schema": _schema(exercice=_EXO, debut=_DATE, fin=_FIN),
    },
    {
        "name": "record",
        "description": "Record d'un exercice sur tout l'historique, avec sa date. Critère "
        "« charge » (kg) pour un exercice chargé ; « repetitions » pour un exercice au poids "
        "du corps (charge 0) ou isométrique (secondes stockées en répétitions).",
        "input_schema": _schema(
            exercice=_EXO, critere={"type": "string", "enum": ["charge", "repetitions"]}
        ),
    },
    {
        "name": "meilleure_serie",
        "description": "Meilleure série d'un exercice en 1RM estimé (formule d'Epley), avec "
        "charge, répétitions et date.",
        "input_schema": _schema(exercice=_EXO),
    },
    {
        "name": "repartition_muscles",
        "description": "Nombre de séries (hors échauffement) par muscle principal entre deux "
        "jours inclus, et part de chaque muscle en pourcentage.",
        "input_schema": _schema(debut=_DATE, fin=_FIN),
    },
]
SCHEMAS = {d["name"]: d["input_schema"] for d in DEFINITIONS}


class Toolbox:
    """Outils sur les données d'un seul utilisateur. `muscles` : code -> muscle principal."""

    def __init__(self, store: Store, muscles: dict[str, str]):
        self.store = store
        self.muscles = muscles
        self._handlers: dict[str, Callable[..., ToolResult]] = {
            d["name"]: getattr(self, d["name"]) for d in DEFINITIONS
        }

    def run(self, name: str, args: dict) -> ToolResult:
        handler = self._handlers.get(name)
        if handler is None:
            raise ToolError(f"outil inconnu : {name}")
        expected = set(SCHEMAS[name]["required"])
        if set(args) != expected:
            raise ToolError(f"arguments attendus : {sorted(expected)}")
        return handler(**args)

    # --- outils ---------------------------------------------------------------------------

    def exercices_pratiques(self) -> ToolResult:
        by_code: dict[str, set[str]] = defaultdict(set)
        last: dict[str, date] = {}
        for r in _work(self.store.sets(None, None)):
            by_code[r.code].add(r.workout_id)
            d = paris_date(r.started_at)
            last[r.code] = max(last.get(r.code, d), d)
        items = [
            {"code": c, "seances": len(ids), "derniere_date": last[c].isoformat()}
            for c, ids in sorted(by_code.items())
        ]
        return ToolResult({"exercices": items})

    def seances(self, debut: str, fin: str) -> ToolResult:
        workouts = self.store.workouts(*paris_bounds(*_period(debut, fin)))
        dates = [paris_date(w.started_at).isoformat() for w in workouts]
        return ToolResult({"nombre": len(workouts), "dates": dates}, {w.id for w in workouts})

    def _volume(self, debut: str, fin: str) -> tuple[float, set[str]]:
        bounds = paris_bounds(*_period(debut, fin))
        total = sum(r.reps * r.weight_kg for r in _work(self.store.sets(*bounds)))
        return total, {w.id for w in self.store.workouts(*bounds)}

    def volume(self, debut: str, fin: str) -> ToolResult:
        total, ids = self._volume(debut, fin)
        return ToolResult({"volume_kg": round_half_up(total, 2), "seances": len(ids)}, ids)

    def comparer_volume(self, debut1: str, fin1: str, debut2: str, fin2: str) -> ToolResult:
        v1, ids1 = self._volume(debut1, fin1)
        v2, ids2 = self._volume(debut2, fin2)
        v1, v2 = round_half_up(v1, 2), round_half_up(v2, 2)
        content = {
            "periode1": {"volume_kg": v1, "seances": len(ids1)},
            "periode2": {"volume_kg": v2, "seances": len(ids2)},
            "difference_kg": round_half_up(v2 - v1, 2),
        }
        return ToolResult(content, ids1 | ids2)

    def _exercise_sets(self, exercice: str, bounds=(None, None)) -> list[SetRow]:
        return [r for r in _work(self.store.sets(*bounds)) if r.code == exercice]

    def progression(self, exercice: str, debut: str, fin: str) -> ToolResult:
        rows = self._exercise_sets(exercice, paris_bounds(*_period(debut, fin)))
        if not rows:
            return ToolResult({"donnee": False, "exercice": exercice})
        sessions: dict[str, tuple] = {}
        for r in rows:
            prev = sessions.get(r.workout_id)
            if prev is None or r.weight_kg > prev[1]:
                sessions[r.workout_id] = (r.started_at, r.weight_kg)
        ordered = sorted(sessions.items(), key=lambda kv: kv[1][0])
        (id1, (t1, w1)), (id2, (t2, w2)) = ordered[0], ordered[-1]
        content = {
            "donnee": True,
            "exercice": exercice,
            "premiere_seance": {"date": paris_date(t1).isoformat(), "charge_max_kg": w1},
            "derniere_seance": {"date": paris_date(t2).isoformat(), "charge_max_kg": w2},
            "evolution_kg": round_half_up(w2 - w1, 2),
            "seances_dans_la_periode": len(ordered),
        }
        return ToolResult(content, {id1, id2})

    def record(self, exercice: str, critere: str) -> ToolResult:
        if critere not in ("charge", "repetitions"):
            raise ToolError("critere : « charge » ou « repetitions »")
        rows = self._exercise_sets(exercice)
        if not rows:
            return ToolResult({"donnee": False, "exercice": exercice})
        key = (lambda r: r.weight_kg) if critere == "charge" else (lambda r: r.reps)
        best = min(rows, key=lambda r: (-key(r), r.started_at))
        content = {
            "donnee": True,
            "exercice": exercice,
            "critere": critere,
            "valeur": best.weight_kg if critere == "charge" else best.reps,
            "unite": "kg" if critere == "charge" else "répétitions (secondes si isométrique)",
            "date": paris_date(best.started_at).isoformat(),
        }
        return ToolResult(content, {best.workout_id})

    def meilleure_serie(self, exercice: str) -> ToolResult:
        rows = self._exercise_sets(exercice)
        if not rows:
            return ToolResult({"donnee": False, "exercice": exercice})
        best = min(rows, key=lambda r: (-r.weight_kg * (1 + r.reps / 30.0), r.started_at))
        content = {
            "donnee": True,
            "exercice": exercice,
            "un_rm_estime_kg": round_half_up(best.weight_kg * (1 + best.reps / 30.0), 1),
            "charge_kg": best.weight_kg,
            "repetitions": best.reps,
            "date": paris_date(best.started_at).isoformat(),
        }
        return ToolResult(content, {best.workout_id})

    def repartition_muscles(self, debut: str, fin: str) -> ToolResult:
        bounds = paris_bounds(*_period(debut, fin))
        counts: dict[str, int] = defaultdict(int)
        for r in _work(self.store.sets(*bounds)):
            counts[self.muscles.get(r.code, "inconnu")] += 1
        total = sum(counts.values())
        items = [
            {"muscle": m, "series": n, "pourcentage": round_half_up(100 * n / total, 1)}
            for m, n in sorted(counts.items(), key=lambda kv: (-kv[1], kv[0]))
        ]
        ids = {w.id for w in self.store.workouts(*bounds)}
        return ToolResult({"total_series": total, "muscles": items}, ids)
