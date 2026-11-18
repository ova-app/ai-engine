"""Jeu « coach » : bornes horaires, déterminisme, schéma. Les contrôles sur fichier ne lisent que
la partie développement (et les empreintes du manifeste)."""

import hashlib
import json

import pytest

from eval import split
from eval.coach import generate_questions as gq
from eval.datasets import SETS_DIR, load_dev
from eval.synth.generate_accounts import user_id
from eval.synth.sqlite_db import connect


@pytest.mark.parametrize(
    ("day", "expected"),
    [
        ("2026-06-01", "2026-05-31T22:00:00+00:00"),
        ("2026-03-29", "2026-03-28T23:00:00+00:00"),  # dimanche du passage à l'heure d'été
        ("2026-03-30", "2026-03-29T22:00:00+00:00"),
        ("2026-10-25", "2026-10-24T22:00:00+00:00"),  # dimanche du retour à l'heure d'hiver
        ("2026-10-26", "2026-10-25T23:00:00+00:00"),
        ("2026-12-01", "2026-11-30T23:00:00+00:00"),
    ],
)
def test_minuit_paris_en_utc(day, expected):
    from datetime import date

    assert gq.paris_midnight_utc(date.fromisoformat(day)) == expected


@pytest.fixture(scope="module")
def items():
    return gq.build()


def test_effectifs_et_part_de_donnee_absente(items):
    assert len(items) == 60
    absent = [i for i in items if i["answer"]["type"] == "aucune_donnee"]
    assert len(absent) == 9  # 15 %
    assert sum(1 for i in items if i["template"] == "piege") == 8
    assert {i["template"] for i in items} >= set(gq.TEMPLATES)
    assert len({(i["user"], i["question"]) for i in items}) == 60


def test_generation_deterministe(items):
    assert gq.build() == items


def test_partie_dev_commitee_identique_a_la_generation(items):
    manifest = json.loads((SETS_DIR / "coach" / "manifest.json").read_text("utf-8"))
    dev_ids = set(manifest["dev_ids"])
    regenerated = sorted((i for i in items if i["id"] in dev_ids), key=lambda i: i["id"])
    data = "".join(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n" for r in regenerated)
    assert hashlib.sha256(data.encode("utf-8")).hexdigest() == manifest["sha256"]["dev.jsonl"]
    split.verify("coach")


def test_schema_dev():
    dev = load_dev("coach")
    assert len(dev) == 42
    for q in dev:
        assert q["user"] in {"debutant", "avance", "irregulier"}
        assert q["user_id"] == user_id(q["user"])
        assert q["answer"]["type"] in {"kg", "entier", "pourcentage", "aucune_donnee"}
        assert (q["answer"]["value"] is None) == (q["answer"]["type"] == "aucune_donnee")
        assert (q["expected_sessions"] == []) <= (
            q["answer"]["type"] in {"aucune_donnee", "entier"}
        )
        assert q["answer"]["sql"]


def test_les_pieges_de_fuseau_en_sont_bien():
    """Couper les jours à minuit UTC donnerait une autre réponse que l'heure de Paris."""
    con = connect()
    uid = user_id("irregulier")

    def count_utc(a, b):
        sql = (
            "SELECT count(*) FROM workouts WHERE user_id = ? AND started_at >= ? AND started_at < ?"
        )
        return con.execute(sql, (uid, a, b)).fetchone()[0]

    by_q = {t["question"]: t for t in gq.build(con=con) if t["template"] == "piege"}
    week = by_q["Combien de séances ai-je faites la semaine du lundi 14/09/2026 ?"]
    assert week["answer"]["value"] == 2
    assert count_utc("2026-09-14T00:00:00+00:00", "2026-09-21T00:00:00+00:00") == 3
    day = by_q["Combien de séances ai-je faites le vendredi 23/10/2026 ?"]
    assert day["answer"]["value"] == 0
    assert count_utc("2026-10-23T00:00:00+00:00", "2026-10-24T00:00:00+00:00") == 1
