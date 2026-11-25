"""Charge le catalogue d'exercices dans Postgres.

Le catalogue n'est pas dans le dépôt (dossier `context/`, ignoré par git).

Usage :
    python -m app.exercises.ingest context/exercices-extrait.csv \
        [--texts context/catalogue-textes.csv] [--embed]

Fichier de base (colonnes) : code, nom_fr, nom_en, muscles_primaires, muscles_secondaires,
materiel (valeurs séparées par `|`). Fichier de textes, optionnel : code, description_fr, tags,
key_points. L'URL de la base est lue dans DATABASE_URL. `--embed` calcule les embeddings
(mistral-embed, clé MISTRAL_API_KEY) du même texte que celui indexé en plein texte.
"""

from __future__ import annotations

import argparse
import csv
import os
from pathlib import Path

import psycopg

from app.exercises.embeddings import Embedder, MistralEmbedder, to_pgvector
from app.exercises.text import EQUIPMENT_LABELS, MUSCLE_LABELS, fold

SCHEMA = Path(__file__).with_name("schema.sql")


def _split(value: str) -> list[str]:
    return [v for v in (value or "").split("|") if v]


def read_catalogue(base: Path, texts: Path | None = None) -> list[dict]:
    with base.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    extra: dict[str, dict] = {}
    if texts is not None:
        with texts.open(encoding="utf-8", newline="") as f:
            extra = {r["code"]: r for r in csv.DictReader(f)}
        if set(extra) != {r["code"] for r in rows}:
            raise ValueError("les codes du fichier de textes ne sont pas ceux du fichier de base")
    catalogue = []
    for r in rows:
        primary, secondary = _split(r["muscles_primaires"]), _split(r["muscles_secondaires"])
        equipment = _split(r["materiel"])
        e = extra.get(r["code"], {})
        meta = [MUSCLE_LABELS.get(m, m.replace("_", " ")) for m in primary]
        meta += [EQUIPMENT_LABELS.get(q, q.replace("_", " ")) for q in equipment[:1]]
        meta += _split(e.get("tags", ""))
        body = [e.get("description_fr", ""), *_split(e.get("key_points", ""))]
        catalogue.append(
            {
                "code": r["code"],
                "name_fr": r["nom_fr"],
                "name_en": r["nom_en"],
                "equipment": equipment[0],
                "name_fr_fold": fold(r["nom_fr"]),
                "name_en_fold": fold(r["nom_en"]),
                "meta_fold": fold(" ".join(meta)),
                "body_fold": fold(" ".join(body)),
                "primary": primary,
                "secondary": secondary,
                "doc": ". ".join(
                    x for x in (r["nom_fr"], r["nom_en"], " ".join(meta), " ".join(body)) if x
                ),
            }
        )
    return catalogue


def load(conn: psycopg.Connection, catalogue: list[dict], embedder: Embedder | None = None) -> int:
    """Recrée les tables et charge le catalogue. Renvoie les jetons d'embedding consommés."""
    tokens = 0
    with conn.cursor() as cur:
        cur.execute(SCHEMA.read_text(encoding="utf-8"))
        for ex in catalogue:
            cur.execute(
                """INSERT INTO exercises (code, name_fr, name_en, equipment, name_fr_fold,
                       name_en_fold, meta_fold, body_fold)
                   VALUES (%(code)s, %(name_fr)s, %(name_en)s, %(equipment)s, %(name_fr_fold)s,
                       %(name_en_fold)s, %(meta_fold)s, %(body_fold)s)""",
                ex,
            )
            for role in ("primary", "secondary"):
                for muscle in ex[role]:
                    cur.execute(
                        "INSERT INTO exercise_muscles (code, muscle, role) VALUES (%s, %s, %s)"
                        " ON CONFLICT DO NOTHING",
                        (ex["code"], muscle, role),
                    )
        if embedder is not None:
            result = embedder([ex["doc"] for ex in catalogue])
            tokens = result.tokens
            for ex, vec in zip(catalogue, result.vectors, strict=True):
                cur.execute(
                    "UPDATE exercises SET embedding = %s::vector WHERE code = %s",
                    (to_pgvector(vec), ex["code"]),
                )
    conn.commit()
    return tokens


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("base", type=Path)
    parser.add_argument("--texts", type=Path)
    parser.add_argument("--embed", action="store_true")
    args = parser.parse_args()
    catalogue = read_catalogue(args.base, args.texts)
    embedder = MistralEmbedder() if args.embed else None
    with psycopg.connect(os.environ["DATABASE_URL"]) as conn:
        tokens = load(conn, catalogue, embedder)
    print(f"{len(catalogue)} exercices chargés, {tokens} jetons d'embedding")


if __name__ == "__main__":
    main()
