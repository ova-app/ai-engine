"""Magasin du coach sur la base SQLite des comptes synthétiques (eval/synth/sqlite_db.py).

Filtre par `user_id` : simule la sécurité par ligne de Supabase pour l'évaluation locale.
"""

from __future__ import annotations

import sqlite3
from datetime import datetime

from app.coach.data import SetRow, Workout


def _ts(value: str) -> datetime:
    return datetime.fromisoformat(value)


def _range(start: datetime | None, end: datetime | None) -> tuple[str, list[str]]:
    # Les horodatages sont stockés en ISO UTC « +00:00 » : la comparaison de chaînes suffit.
    clause, params = "", []
    if start is not None:
        clause += " AND w.started_at >= ?"
        params.append(start.isoformat())
    if end is not None:
        clause += " AND w.started_at < ?"
        params.append(end.isoformat())
    return clause, params


class SqliteStore:
    def __init__(self, con: sqlite3.Connection, user_id: str):
        self.con, self.user_id = con, user_id

    def workouts(self, start: datetime | None, end: datetime | None) -> list[Workout]:
        clause, params = _range(start, end)
        rows = self.con.execute(
            f"SELECT w.id, w.started_at FROM workouts w WHERE w.user_id = ?{clause} "
            "ORDER BY w.started_at, w.id",
            [self.user_id, *params],
        ).fetchall()
        return [Workout(i, _ts(t)) for i, t in rows]

    def sets(self, start: datetime | None, end: datetime | None) -> list[SetRow]:
        clause, params = _range(start, end)
        rows = self.con.execute(
            "SELECT w.id, w.started_at, e.code, s.set_type, s.reps, s.weight_kg "
            "FROM workout_sets s JOIN workout_exercises we ON we.id = s.workout_exercise_id "
            "JOIN workouts w ON w.id = we.workout_id JOIN exercises e ON e.id = we.exercise_id "
            f"WHERE w.user_id = ?{clause} ORDER BY w.started_at, w.id, we.order_index, "
            "s.set_number",
            [self.user_id, *params],
        ).fetchall()
        return [SetRow(i, _ts(t), c, st, r or 0, float(k or 0)) for i, t, c, st, r, k in rows]
