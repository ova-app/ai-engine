import csv
import itertools
from datetime import timedelta
from pathlib import Path

import pytest

from eval.synth import generate_accounts as g
from eval.synth.sqlite_db import connect

ROOT = Path(__file__).resolve().parent.parent
CATALOGUE = ROOT / "context" / "exercices-extrait.csv"  # hors dépôt : test ignoré en CI


@pytest.fixture(scope="module")
def workouts():
    return g.generate()


def test_fichier_commite_identique_a_la_generation(workouts):
    assert g.OUT.read_text(encoding="utf-8") == g.render_sql(workouts)


def test_generation_deterministe():
    assert g.render_sql(g.generate()) == g.render_sql(g.generate())


def test_bornes_des_triggers(workouts):
    for w in workouts:
        assert w.ended_at >= w.started_at
        assert 0 <= (w.ended_at - w.started_at).total_seconds() <= 172_800
        assert 0 <= w.volume_kg <= 2_000_000
        assert 0 <= w.total_reps <= 100_000
        assert len(w.exercises) <= 60
        for e in w.exercises:
            assert 0 <= e.order_index <= 500
            assert len(e.sets) <= 100
            for s in e.sets:
                assert 0 <= s.reps <= 1000
                assert 0 <= s.weight_kg <= 1500
                assert s.rest_seconds is None or 0 <= s.rest_seconds <= 86_400
                assert 0 <= s.set_number <= 500
                assert s.set_type in {"warmup", "working", "dropset", "failure"}


def test_ids_uniques(workouts):
    ids = [w.id for w in workouts]
    ids += [e.id for w in workouts for e in w.exercises]
    ids += [s.id for w in workouts for e in w.exercises for s in e.sets]
    assert len(ids) == len(set(ids))


def _days_by_user(workouts):
    out = {}
    for w in workouts:
        out.setdefault(w.user, []).append(w.started_at.date())
    return out


def _max_gap(days):
    return max((b - a for a, b in itertools.pairwise(days)), default=timedelta(0))


def test_profils_distincts(workouts):
    days = _days_by_user(workouts)
    assert set(days) == {g.user_id(p.key) for p in g.PROFILES}
    assert _max_gap(days[g.user_id("debutant")]) <= timedelta(days=7)
    assert _max_gap(days[g.user_id("irregulier")]) >= timedelta(days=21)
    types = {
        s.set_type
        for w in workouts
        if w.user == g.user_id("avance")
        for e in w.exercises
        for s in e.sets
    }
    assert {"warmup", "dropset", "failure"} <= types


def test_codes_connus_et_exercices_jamais_pratiques(workouts):
    used = {e.code for w in workouts for e in w.exercises}
    assert used <= set(g.EXERCISES)
    assert {"kettlebell-swing", "farmer-walk", "machine-leg-extension"}.isdisjoint(used)


def test_chargement_sqlite(workouts):
    con = connect()
    assert con.execute("SELECT count(*) FROM workouts").fetchone()[0] == len(workouts)
    n_sets = sum(len(e.sets) for w in workouts for e in w.exercises)
    assert con.execute("SELECT count(*) FROM workout_sets").fetchone()[0] == n_sets
    assert (
        con.execute("SELECT count(*) FROM workout_exercises WHERE exercise_id IS NULL").fetchone()[
            0
        ]
        == 0
    )


@pytest.mark.skipif(not CATALOGUE.exists(), reason="catalogue hors dépôt absent")
def test_codes_presents_dans_le_catalogue():
    with CATALOGUE.open(encoding="utf-8") as f:
        catalogue = {row["code"]: row for row in csv.DictReader(f)}
    for code, muscle in g.EXERCISES.items():
        assert code in catalogue, code
        assert catalogue[code]["muscles_primaires"].split("|")[0] == muscle, code
