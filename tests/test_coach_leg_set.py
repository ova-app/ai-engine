"""Jeu « coach_jambes ». Les contrôles sur fichier ne lisent que la partie développement."""

import hashlib
import json

from app.coach.catalogue import EXERCISES
from eval import split
from eval.coach import generate_leg_questions as gl
from eval.datasets import SETS_DIR, load_dev
from eval.synth.generate_accounts import EXERCISE_GROUPS
from eval.synth.sqlite_db import connect


def test_un_groupe_par_exercice():
    assert set(EXERCISE_GROUPS) == set(EXERCISES)


def test_partie_dev_commitee_identique_a_la_generation():
    manifest = json.loads((SETS_DIR / "coach_jambes" / "manifest.json").read_text("utf-8"))
    items = gl.build()
    assert len(items) == 20 and gl.build() == items
    dev_ids = set(manifest["dev_ids"])
    rows = sorted((i for i in items if i["id"] in dev_ids), key=lambda i: i["id"])
    data = "".join(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n" for r in rows)
    assert hashlib.sha256(data.encode("utf-8")).hexdigest() == manifest["sha256"]["dev.jsonl"]
    split.verify("coach_jambes")


def test_reponses_dev_recomptees_sans_le_sql_du_generateur():
    con = connect()
    dev = load_dev("coach_jambes")
    assert len(dev) == 14
    for q in dev:
        uid, start, end = q["answer"]["params"]
        rows = con.execute(
            "SELECT w.id, e.code FROM workouts w "
            "JOIN workout_exercises we ON we.workout_id = w.id "
            "JOIN exercises e ON e.id = we.exercise_id "
            "JOIN workout_sets s ON s.workout_exercise_id = we.id "
            "WHERE s.set_type <> 'warmup' AND w.user_id = ? "
            "AND w.started_at >= ? AND w.started_at < ?",
            (uid, start, end),
        ).fetchall()
        flags: dict[str, list[bool]] = {}
        for workout, code in rows:
            flags.setdefault(workout, []).append(EXERCISE_GROUPS[code] in gl.LEG_GROUPS)
        legs = {w for w, f in flags.items() if sum(f) / len(f) >= 0.5}
        assert set(q["expected_sessions"]) == legs
        assert q["answer"]["value"] == len(legs)
