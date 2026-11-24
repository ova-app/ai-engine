"""Base SQLite locale, en mémoire, chargée avec `accounts.sql`.

Sert à calculer les réponses du jeu « coach ». Reproduit uniquement les colonnes écrites par
le générateur. Le catalogue est réduit à `EXERCISES` (code, muscle principal), avec des UUID
locaux : en Postgres, `exercise_id` est résolu par `code`, donc les UUID diffèrent mais les
jointures par `code` donnent les mêmes résultats.
"""

from __future__ import annotations

import sqlite3
import uuid
from pathlib import Path

from eval.synth.generate_accounts import EXERCISES, NAMESPACE, OUT

DDL = """
CREATE TABLE exercises (
  id TEXT PRIMARY KEY, code TEXT UNIQUE NOT NULL, owner_id TEXT, muscle_principal TEXT
);
CREATE TABLE workouts (
  id TEXT PRIMARY KEY, user_id TEXT NOT NULL, title TEXT, started_at TEXT, ended_at TEXT,
  duration_sec INTEGER, total_volume_kg REAL, is_public INTEGER NOT NULL DEFAULT 0,
  poids_corps_kg REAL, session_mode TEXT, total_reps INTEGER
);
CREATE TABLE workout_exercises (
  id TEXT PRIMARY KEY, workout_id TEXT NOT NULL REFERENCES workouts(id),
  exercise_id TEXT NOT NULL REFERENCES exercises(id), order_index INTEGER, laterality TEXT
);
CREATE TABLE workout_sets (
  id TEXT PRIMARY KEY, workout_exercise_id TEXT NOT NULL REFERENCES workout_exercises(id),
  set_type TEXT, set_number INTEGER, reps INTEGER, weight_kg REAL, rest_seconds INTEGER,
  is_pr INTEGER NOT NULL DEFAULT 0, logged_at TEXT
);
"""


def connect(sql_path: Path = OUT) -> sqlite3.Connection:
    con = sqlite3.connect(":memory:")
    con.execute("PRAGMA foreign_keys = ON")
    con.executescript(DDL)
    con.executemany(
        "INSERT INTO exercises (id, code, owner_id, muscle_principal) VALUES (?, ?, NULL, ?)",
        [
            (str(uuid.uuid5(NAMESPACE, f"exercise:{code}")), code, muscle)
            for code, muscle in EXERCISES.items()
        ],
    )
    con.executescript(sql_path.read_text(encoding="utf-8"))
    return con
