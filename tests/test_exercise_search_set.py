"""Schéma du jeu « recherche d'exercices ». Ne lit que la partie développement."""

import csv
import json
from pathlib import Path

import pytest

from eval.datasets import SETS_DIR, load_dev

ROOT = Path(__file__).resolve().parent.parent
CATALOGUE = ROOT / "context" / "exercices-extrait.csv"  # hors dépôt : test ignoré en CI
CATEGORIES = {"nom_exact", "synonyme", "faute", "description", "filtre"}


@pytest.fixture(scope="module")
def dev():
    return load_dev("exercise_search")


def test_effectifs():
    manifest = json.loads((SETS_DIR / "exercise_search" / "manifest.json").read_text("utf-8"))
    assert manifest["n_total"] == 50
    assert len(manifest["dev_ids"]) == 35


def test_schema(dev):
    assert len(dev) == 35
    for q in dev:
        assert set(q) <= {"id", "category", "query", "expected_codes", "filters", "note"}
        assert q["category"] in CATEGORIES
        assert q["query"].strip()
        assert q["expected_codes"] and len(set(q["expected_codes"])) == len(q["expected_codes"])
        assert ("filters" in q) == (q["category"] == "filtre")


@pytest.mark.skipif(not CATALOGUE.exists(), reason="catalogue hors dépôt absent")
def test_codes_et_filtres_conformes_au_catalogue(dev):
    with CATALOGUE.open(encoding="utf-8") as f:
        catalogue = {row["code"]: row for row in csv.DictReader(f)}
    for q in dev:
        for code in q["expected_codes"]:
            assert code in catalogue, (q["id"], code)
        if "filters" in q:
            muscle, materiel = q["filters"]["muscle_primaire"], q["filters"].get("materiel")
            expected = {
                code
                for code, row in catalogue.items()
                if muscle in row["muscles_primaires"].split("|")
                and (materiel is None or row["materiel"] == materiel)
            }
            assert set(q["expected_codes"]) == expected, q["id"]
