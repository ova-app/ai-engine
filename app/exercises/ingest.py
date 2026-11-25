"""Charge le catalogue d'exercices dans Postgres.

Le catalogue n'est pas dans le dépôt (dossier `context/`, ignoré par git).

Usage :
    python -m app.exercises.ingest context/exercices-extrait.csv \
        [--texts context/catalogue-textes.csv]

Fichier de base (colonnes) : code, nom_fr, nom_en, muscles_primaires, muscles_secondaires,
materiel (valeurs séparées par `|`). Fichier de textes, optionnel : code, description_fr, tags,
key_points. L'URL de la base est lue dans DATABASE_URL.
"""

from __future__ import annotations

import argparse
import csv
import os
from pathlib import Path

import psycopg

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
            }
        )
    return catalogue


def load(conn: psycopg.Connection, catalogue: list[dict]) -> None:
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
    conn.commit()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("base", type=Path)
    parser.add_argument("--texts", type=Path)
    args = parser.parse_args()
    catalogue = read_catalogue(args.base, args.texts)
    with psycopg.connect(os.environ["DATABASE_URL"]) as conn:
        load(conn, catalogue)
    print(f"{len(catalogue)} exercices chargés")


if __name__ == "__main__":
    main()
