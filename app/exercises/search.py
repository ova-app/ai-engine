"""Recherche d'exercices. `search` : filtres et texte Postgres, sans embeddings (A1, base).

Score = similarité de trigrammes avec les noms (tolère les fautes de frappe)
      + classement plein texte français (mots reliés par OU ;
        poids : noms > muscles et matériel > description).
Les filtres (muscle primaire, matériel principal) sont des conditions strictes.
Paramètres fixés ici avant toute mesure, non réglés sur le jeu de développement.
"""

from __future__ import annotations

import psycopg

from app.exercises.embeddings import to_pgvector
from app.exercises.text import fold, tsquery_or

SQL = """
WITH q AS (
    SELECT %(q)s::text AS folded,
           CASE WHEN %(tsq)s = '' THEN NULL ELSE to_tsquery('french', %(tsq)s) END AS tsq
)
SELECT e.code,
       GREATEST(similarity(q.folded, e.name_fr_fold), word_similarity(q.folded, e.name_fr_fold),
                similarity(q.folded, e.name_en_fold), word_similarity(q.folded, e.name_en_fold))
       + COALESCE(ts_rank_cd(e.tsv, q.tsq), 0) AS score
FROM exercises e, q
WHERE (%(muscle)s::text IS NULL OR EXISTS (
          SELECT 1 FROM exercise_muscles m
          WHERE m.code = e.code AND m.role = 'primary' AND m.muscle = %(muscle)s))
  AND (%(equipment)s::text IS NULL OR e.equipment = %(equipment)s)
ORDER BY score DESC, e.code
LIMIT %(k)s
"""


def search(
    conn: psycopg.Connection, query: str, filters: dict | None = None, k: int = 10
) -> list[str]:
    """Codes des exercices, du meilleur au moins bon, au plus k, score nul exclu."""
    filters = filters or {}
    params = {
        "q": fold(query),
        "tsq": tsquery_or(query),
        "muscle": filters.get("muscle_primaire"),
        "equipment": filters.get("materiel"),
        "k": k,
    }
    with conn.cursor() as cur:
        cur.execute(SQL, params)
        return [code for code, score in cur.fetchall() if score > 0]


SQL_VECTOR = """
SELECT e.code
FROM exercises e
WHERE e.embedding IS NOT NULL
  AND (%(muscle)s::text IS NULL OR EXISTS (
          SELECT 1 FROM exercise_muscles m
          WHERE m.code = e.code AND m.role = 'primary' AND m.muscle = %(muscle)s))
  AND (%(equipment)s::text IS NULL OR e.equipment = %(equipment)s)
ORDER BY e.embedding <=> %(vec)s::vector, e.code
LIMIT %(k)s
"""


def search_vector(
    conn: psycopg.Connection, query_vector: list[float], filters: dict | None = None, k: int = 10
) -> list[str]:
    """Variante embeddings + filtres (ablation A1) : distance cosinus, mêmes filtres stricts."""
    filters = filters or {}
    params = {
        "vec": to_pgvector(query_vector),
        "muscle": filters.get("muscle_primaire"),
        "equipment": filters.get("materiel"),
        "k": k,
    }
    with conn.cursor() as cur:
        cur.execute(SQL_VECTOR, params)
        return [code for (code,) in cur.fetchall()]
