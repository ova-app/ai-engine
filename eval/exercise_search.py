"""Mesure de la recherche d'exercices sur le jeu de développement (EVAL.md §3, §5, §8).

Usage :
    python -m eval.exercise_search {a1|emb} context/exercices-extrait.csv \
        context/catalogue-textes.csv [--prix-eur-par-million-jetons P]

`emb` demande un catalogue chargé avec `--embed` et MISTRAL_API_KEY. Sans prix donné, le coût
des embeddings reste « à mesurer » : seuls les jetons facturés (champ `usage`) sont notés.

Écrit eval/results/<date>_exercise-search_<variante>.json. Ne lit que `dev.jsonl`.
Le catalogue chargé dans DATABASE_URL doit venir des deux fichiers donnés.
Leur empreinte est notée dans le résultat.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import time
from collections import defaultdict
from datetime import date
from pathlib import Path

import psycopg

from app.exercises.embeddings import Embedder, MistralEmbedder
from app.exercises.search import search, search_vector
from eval.datasets import load_dev
from eval.stats import bootstrap_ci, hit_at, percentile, reciprocal_rank

RESULTS_DIR = Path(__file__).resolve().parent / "results"


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _git(*args: str) -> str:
    return subprocess.run(["git", *args], capture_output=True, text=True, check=True).stdout.strip()


def run(
    conn: psycopg.Connection, items: list[dict], embedder: Embedder | None = None
) -> list[dict]:
    """Sans `embedder` : variante texte (a1). Avec : variante embeddings + filtres (emb).

    La latence inclut l'appel d'embedding de la question.
    """
    rows = []
    for item in items:
        expected = set(item["expected_codes"])
        tokens, model = 0, None
        start = time.perf_counter()
        if embedder is None:
            results = search(conn, item["query"], item.get("filters"))
        else:
            embedded = embedder([item["query"]])
            tokens, model = embedded.tokens, embedded.model
            results = search_vector(conn, embedded.vectors[0], item.get("filters"))
        latency_ms = (time.perf_counter() - start) * 1000
        rows.append(
            {
                "id": item["id"],
                "category": item["category"],
                "query": item["query"],
                "results": results,
                "hit5": hit_at(results, expected),
                "rr": reciprocal_rank(results, expected),
                "latency_ms": latency_ms,
                "tokens": tokens,
                "model": model,
            }
        )
    return rows


def summarize(rows: list[dict]) -> dict:
    def block(subset: list[dict]) -> dict:
        out = {"n": len(subset)}
        for key, name in (("hit5", "recall@5"), ("rr", "MRR")):
            mean, low, high = bootstrap_ci([r[key] for r in subset])
            out[name] = {"valeur": round(mean, 4), "ic95": [round(low, 4), round(high, 4)]}
        return out

    by_category = defaultdict(list)
    for r in rows:
        by_category[r["category"]].append(r)
    latencies = [r["latency_ms"] for r in rows]
    return {
        "global": block(rows),
        "par_categorie": {c: block(rs) for c, rs in sorted(by_category.items())},
        "latence_ms": {
            "mediane": round(percentile(latencies, 0.5), 2),
            "p95": round(percentile(latencies, 0.95), 2),
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("variant", choices=["a1", "emb"])
    parser.add_argument("base", type=Path)
    parser.add_argument("texts", type=Path)
    parser.add_argument("--prix-eur-par-million-jetons", type=float)
    args = parser.parse_args()
    items = load_dev("exercise_search")
    embedder = MistralEmbedder() if args.variant == "emb" else None
    with psycopg.connect(os.environ["DATABASE_URL"]) as conn:
        n_catalogue = conn.execute("SELECT count(*) FROM exercises").fetchone()[0]
        if embedder is not None:
            n_vec = conn.execute(
                "SELECT count(*) FROM exercises WHERE embedding IS NOT NULL"
            ).fetchone()[0]
            if n_vec != n_catalogue:
                raise SystemExit(f"{n_vec}/{n_catalogue} exercices ont un embedding : --embed")
        rows = run(conn, items, embedder)
    tokens = sum(r["tokens"] for r in rows)
    if embedder is None:
        model, cost = "aucun (pas d'appel de modèle)", 0
    else:
        model = sorted({r["model"] for r in rows})
        price = args.prix_eur_par_million_jetons
        cost = "à mesurer" if price is None else tokens / len(rows) * price / 1e6
    result = {
        "date": date.today().isoformat(),
        "fonction": "recherche d'exercices",
        "variante": args.variant,
        "jeu": "développement",
        "code": {
            "commit": _git("rev-parse", "HEAD"),
            "modifie": bool(_git("status", "--porcelain")),
        },
        "catalogue": {
            "n": n_catalogue,
            "sha256_base": _sha256(args.base),
            "sha256_textes": _sha256(args.texts),
        },
        "modele": model,
        "jetons_question_total": tokens,
        "prix_eur_par_million_jetons": args.prix_eur_par_million_jetons,
        "cout_eur_par_question": cost,
        "mesures": summarize(rows),
        "questions": rows,
    }
    RESULTS_DIR.mkdir(exist_ok=True)
    path = RESULTS_DIR / f"{result['date']}_exercise-search_{args.variant}.json"
    path.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result["mesures"]["global"], ensure_ascii=False))
    print(path)


if __name__ == "__main__":
    main()
