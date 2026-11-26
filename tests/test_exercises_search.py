"""Recherche A1 sur un mini-catalogue synthétique. Demande DATABASE_URL (Postgres), sinon ignoré."""

import csv
import os

import pytest

from app.exercises.ingest import load, read_catalogue
from app.exercises.search import search
from app.exercises.text import fold, tsquery_or

BASE = [
    ("hip-thrust", "Hip Thrust", "Hip Thrust", "fessier_maximus", "", "barre"),
    ("dumbbell-bench-press", "Développé couché haltères", "Dumbbell Bench Press",
     "grand_pectoral", "triceps", "haltere"),
    ("barbell-squat", "Squat barre", "Barbell Squat", "quadriceps|fessier_maximus", "", "barre"),
    ("push-up", "Pompes", "Push Up", "grand_pectoral", "triceps", "poids_corps"),
    ("cable-rope-pushdown", "Extension triceps corde", "Cable Rope Pushdown",
     "triceps", "", "poulie"),
    ("dumbbell-lateral-raise", "Élévations latérales haltères", "Dumbbell Lateral Raise",
     "deltoide", "", "haltere"),
]  # fmt: skip


def test_fold():
    assert fold("Développé couché, haltères") == "developpe couche halteres"
    assert fold("Avant-bras") == "avant bras"
    assert tsquery_or("Hip trust !") == "hip | trust"


@pytest.fixture(scope="module")
def conn(tmp_path_factory):
    psycopg = pytest.importorskip("psycopg")
    url = os.environ.get("DATABASE_URL")
    if not url:
        pytest.skip("DATABASE_URL non défini")
    path = tmp_path_factory.mktemp("cat") / "base.csv"
    with path.open("w", encoding="utf-8", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            ["code", "nom_fr", "nom_en", "muscles_primaires", "muscles_secondaires", "materiel"]
        )
        w.writerows(BASE)
    with psycopg.connect(url) as c:
        load(c, read_catalogue(path))
        yield c


def test_nom_exact(conn):
    assert search(conn, "Squat barre")[0] == "barbell-squat"


def test_nom_anglais(conn):
    assert search(conn, "dumbbell bench press")[0] == "dumbbell-bench-press"


def test_faute_de_frappe(conn):
    assert search(conn, "hip trust")[0] == "hip-thrust"


def test_sans_accents(conn):
    assert search(conn, "elevations laterales")[0] == "dumbbell-lateral-raise"


def test_libelle_muscle(conn):
    assert search(conn, "épaules")[0] == "dumbbell-lateral-raise"


def test_filtres_stricts(conn):
    codes = search(conn, "pectoraux", {"muscle_primaire": "grand_pectoral", "materiel": "haltere"})
    assert codes == ["dumbbell-bench-press"]


def test_filtre_sans_resultat(conn):
    assert search(conn, "squat", {"materiel": "kettlebell"}) == []


def test_requete_de_mots_vides_ne_plante_pas(conn):
    assert isinstance(search(conn, "le la de"), list)
