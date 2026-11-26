"""Jeu « coach_jambes » : nombre de séances de jambes, réponse calculée en SQL (EVAL.md §2).

Définition : une séance est une séance de jambes si au moins la moitié de ses séries (hors
échauffement) portent sur un exercice dont le `muscle_group` du catalogue de l'app est dans
`LEG_GROUPS`. Jours et mois en heure de Paris, dernier jour inclus.

Usage : python -m eval.coach.generate_leg_questions
"""

from __future__ import annotations

import random
import sqlite3
from datetime import timedelta

from eval import split
from eval.coach.generate_questions import (
    DATA_END,
    DATA_START,
    MOIS,
    fr,
    month_bounds,
    paris_midnight_utc,
)
from eval.synth.generate_accounts import user_id
from eval.synth.sqlite_db import connect

SEED = 20261126
LEG_GROUPS = ("quadriceps", "ischio_jambiers", "fessiers", "mollets")
# Seul le compte « avancé » a des séances à majorité jambes : il pèse la moitié du jeu. Les
# deux autres testent la réponse 0 alors que le compte travaille parfois les jambes.
PER_USER = {"avance": 10, "debutant": 5, "irregulier": 5}

SQL = f"""
SELECT w.id
FROM workouts w
JOIN workout_exercises we ON we.workout_id = w.id
JOIN exercises e ON e.id = we.exercise_id
JOIN workout_sets s ON s.workout_exercise_id = we.id
WHERE s.set_type <> 'warmup' AND w.user_id = ? AND w.started_at >= ? AND w.started_at < ?
GROUP BY w.id, w.started_at
HAVING 2 * SUM(CASE WHEN e.muscle_group IN {LEG_GROUPS} THEN 1 ELSE 0 END) >= COUNT(*)
ORDER BY w.started_at"""


def _draw(rng: random.Random, kind: str) -> tuple[str, str, str]:
    """(question, début UTC, fin UTC exclue)."""
    end = paris_midnight_utc(DATA_END + timedelta(days=1))
    if kind == "depuis":
        d = DATA_START + timedelta(days=rng.randint(20, 140))
        question = f"Combien de séances de jambes ai-je faites depuis le {fr(d)} ?"
        return question, paris_midnight_utc(d), end
    if kind == "entre":
        d1 = DATA_START + timedelta(days=rng.randint(0, 90))
        d2 = d1 + timedelta(days=rng.randint(10, 60))
        question = f"Combien de séances de jambes ai-je faites entre le {fr(d1)} et le {fr(d2)} ?"
        return question, paris_midnight_utc(d1), paris_midnight_utc(d2 + timedelta(days=1))
    month = rng.choice(list(MOIS))
    question = f"En {MOIS[month]} 2026, combien de fois ai-je fait une séance de jambes ?"
    return question, *month_bounds(2026, month)


def build(seed: int = SEED, con: sqlite3.Connection | None = None) -> list[dict]:
    con = con or connect()
    rng = random.Random(seed)
    items: list[dict] = []
    seen: set[tuple[str, str]] = set()
    for profile, n in PER_USER.items():
        uid = user_id(profile)
        made = 0
        while made < n:
            kind = ("depuis", "entre", "mois")[made % 3]
            question, a, b = _draw(rng, kind)
            if (profile, question) in seen:
                continue
            seen.add((profile, question))
            made += 1
            ids = [r[0] for r in con.execute(SQL, (uid, a, b))]
            items.append(
                {
                    "id": f"j{len(items) + 1:02d}",
                    "user": profile,
                    "user_id": uid,
                    "template": f"jambes_{kind}",
                    "question": question,
                    "answer": {
                        "type": "entier",
                        "value": len(ids),
                        "sql": "generate_leg_questions.SQL",
                        "params": [uid, a, b],
                    },
                    "expected_sessions": ids,
                }
            )
    return items


def main() -> None:
    manifest = split.split_and_write("coach_jambes", build(), SEED)
    print(f"coach_jambes : {manifest['n_total']} questions, {len(manifest['dev_ids'])} dev")


if __name__ == "__main__":
    main()
