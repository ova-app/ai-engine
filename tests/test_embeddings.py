"""Embeddings : lecture des réponses de l'API (sans réseau) et recherche vectorielle.

La partie Postgres demande TEST_DATABASE_URL (base jetable), sinon elle est ignorée.
"""

import csv
import os
import zlib

import pytest

from app.exercises import embeddings
from app.exercises.embeddings import DIM, EmbeddingResult, MistralEmbedder, to_pgvector
from app.exercises.ingest import load, read_catalogue
from app.exercises.search import search_vector
from app.exercises.text import fold
from eval.exercise_search import run


def fake_embedder(texts):
    """Sac de mots haché sur DIM dimensions : deux textes qui partagent des mots sont proches."""
    vectors = []
    for text in texts:
        v = [0.0] * DIM
        for word in fold(text).split():
            v[zlib.crc32(word.encode()) % DIM] += 1.0
        vectors.append(v)
    return EmbeddingResult(vectors, tokens=sum(len(t.split()) for t in texts), model="faux")


def test_mistral_lots_ordre_et_jetons(monkeypatch):
    calls = []

    def fake_post(self, texts):
        calls.append(list(texts))
        data = [{"index": i, "embedding": [float(len(t))]} for i, t in enumerate(texts)]
        return {"data": data[::-1], "usage": {"prompt_tokens": len(texts)}, "model": "m-v1"}

    monkeypatch.setattr(MistralEmbedder, "_post", fake_post)
    monkeypatch.setattr(embeddings, "BATCH", 2)
    result = MistralEmbedder(api_key="test")(["a", "bb", "ccc"])
    assert calls == [["a", "bb"], ["ccc"]]
    assert result.vectors == [[1.0], [2.0], [3.0]]
    assert result.tokens == 3
    assert result.model == "m-v1"


def test_to_pgvector():
    assert to_pgvector([1, 0.5]) == "[1.0,0.5]"


BASE = [
    ("push-up", "Pompes", "Push Up", "grand_pectoral", "triceps", "poids_corps"),
    ("dumbbell-curl", "Curl haltères", "Dumbbell Curl", "biceps", "", "haltere"),
    ("band-curl", "Curl élastique", "Band Curl", "biceps", "", "elastique"),
]


@pytest.fixture(scope="module")
def conn(tmp_path_factory):
    psycopg = pytest.importorskip("psycopg")
    url = os.environ.get("TEST_DATABASE_URL")
    if not url:
        pytest.skip("TEST_DATABASE_URL non défini")
    path = tmp_path_factory.mktemp("cat") / "base.csv"
    with path.open("w", encoding="utf-8", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            ["code", "nom_fr", "nom_en", "muscles_primaires", "muscles_secondaires", "materiel"]
        )
        w.writerows(BASE)
    with psycopg.connect(url) as c:
        assert load(c, read_catalogue(path), fake_embedder) > 0
        yield c


def test_recherche_vectorielle(conn):
    query = fake_embedder(["pompes"]).vectors[0]
    assert search_vector(conn, query)[0] == "push-up"


def test_recherche_vectorielle_filtres_stricts(conn):
    query = fake_embedder(["curl"]).vectors[0]
    assert search_vector(conn, query, {"materiel": "elastique"}) == ["band-curl"]


def test_mesure_variante_embeddings(conn):
    items = [{"id": "q1", "category": "nom_exact", "query": "Curl haltères",
              "expected_codes": ["dumbbell-curl"]}]  # fmt: skip
    (row,) = run(conn, items, fake_embedder)
    assert row["hit5"] == 1.0 and row["rr"] == 1.0
    assert row["tokens"] == 2 and row["model"] == "faux"
