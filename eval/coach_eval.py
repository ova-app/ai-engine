"""Mesure du coach sur le jeu de développement (EVAL.md §3, §5, §8).

Usage :
    python -m eval.coach_eval [--limit N]

Demande ANTHROPIC_API_KEY. Les comptes de test sont lus dans la base SQLite construite depuis
`eval/synth/accounts.sql`, un magasin par utilisateur. Ne lit que `dev.jsonl`.
Écrit eval/results/<date>_coach_<modèle>.json. `--limit` sert aux essais : un résultat
partiel n'est pas une mesure du §4.

Coût : jetons facturés (`usage`) multipliés par le tarif public noté dans PRICES. Un modèle
absent de PRICES (repli serveur) laisse le coût « à mesurer ».
"""

from __future__ import annotations

import argparse
import json
import subprocess
import time
from collections import defaultdict
from dataclasses import asdict
from datetime import date
from pathlib import Path

from app.coach.agent import EFFORT, MAX_TOKENS, MAX_TURNS, MODEL, AnthropicLLM, Coach
from app.coach.tools import Toolbox
from eval.coach.score import exact, sessions_scores
from eval.coach.store import SqliteStore
from eval.datasets import load_dev
from eval.stats import bootstrap_ci, percentile
from eval.synth.generate_accounts import EXERCISES
from eval.synth.sqlite_db import connect

RESULTS_DIR = Path(__file__).resolve().parent / "results"
TODAY = date(2026, 11, 1)  # lendemain de la fin des données synthétiques : mesure reproductible

# USD par million de jetons. Source : tarifs publics Anthropic, relevés le 03/11/2026.
# Écriture en cache (5 min) = 1,25 × entrée.
PRICES = {
    "claude-sonnet-5-5": {"input": 2.0, "output": 10.0, "cache_read": 0.10, "cache_write": 2.5},
}


def _git(*args: str) -> str:
    return subprocess.run(["git", *args], capture_output=True, text=True, check=True).stdout.strip()


def cost_usd(models: list[str], usage: dict) -> float | str:
    if not models or any(m not in PRICES for m in models) or len(set(models)) > 1:
        return "à mesurer"
    p = PRICES[models[0]]
    return (
        usage["input_tokens"] * p["input"]
        + usage["output_tokens"] * p["output"]
        + usage["cache_read_input_tokens"] * p["cache_read"]
        + usage["cache_creation_input_tokens"] * p["cache_write"]
    ) / 1e6


def run(items: list[dict], llm, model: str = MODEL) -> list[dict]:
    con = connect()
    rows = []
    for item in items:
        coach = Coach(llm, Toolbox(SqliteStore(con, item["user_id"]), EXERCISES), model=model)
        start = time.perf_counter()
        answer = coach.ask(item["question"], TODAY)
        latency_ms = (time.perf_counter() - start) * 1000
        precision, recall = sessions_scores(answer.sessions, set(item["expected_sessions"]))
        usage = asdict(answer.usage)
        rows.append(
            {
                "id": item["id"],
                "template": item["template"],
                "question": item["question"],
                "attendu": {k: item["answer"].get(k) for k in ("type", "value")},
                "reponse": {
                    "texte": answer.texte,
                    "valeur": answer.valeur,
                    "unite": answer.unite,
                    "aucune_donnee": answer.aucune_donnee,
                    "terminee": answer.finished,
                },
                "exact": float(exact(item["answer"], answer.valeur, answer.aucune_donnee)),
                "precision_seances": precision,
                "rappel_seances": recall,
                "outils": answer.tool_calls,
                "tours": answer.turns,
                "modeles": sorted(set(answer.models)),
                "jetons": usage,
                "cout_usd": cost_usd(answer.models, usage),
                "latency_ms": latency_ms,
            }
        )
    return rows


def summarize(rows: list[dict]) -> dict:
    def block(subset: list[dict]) -> dict:
        out = {"n": len(subset)}
        for key in ("exact", "precision_seances", "rappel_seances"):
            mean, low, high = bootstrap_ci([r[key] for r in subset])
            out[key] = {"valeur": round(mean, 4), "ic95": [round(low, 4), round(high, 4)]}
        return out

    by_template = defaultdict(list)
    for r in rows:
        by_template[r["template"]].append(r)
    latencies = [r["latency_ms"] for r in rows]
    costs = [r["cout_usd"] for r in rows]
    known = all(isinstance(c, float) for c in costs)
    return {
        "global": block(rows),
        "par_gabarit": {t: block(rs) for t, rs in sorted(by_template.items())},
        "latence_ms": {
            "mediane": round(percentile(latencies, 0.5), 1),
            "p95": round(percentile(latencies, 0.95), 1),
        },
        "cout_usd_par_question": round(sum(costs) / len(costs), 5) if known else "à mesurer",
        "non_terminees": sum(1 for r in rows if not r["reponse"]["terminee"]),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()
    items = load_dev("coach")[: args.limit]
    rows = run(items, AnthropicLLM())
    result = {
        "date": date.today().isoformat(),
        "fonction": "coach",
        "jeu": "développement" + (f" (essai, {len(items)} questions)" if args.limit else ""),
        "code": {
            "commit": _git("rev-parse", "HEAD"),
            "modifie": bool(_git("status", "--porcelain")),
        },
        "modele_demande": MODEL,
        "modeles_ayant_repondu": sorted({m for r in rows for m in r["modeles"]}),
        "reglages": {
            "effort": EFFORT,
            "max_tokens": MAX_TOKENS,
            "max_tours": MAX_TURNS,
            "temperature": "non réglable (refusée par l'API sur ce modèle)",
            "repli_serveur": AnthropicLLM.FALLBACK_BETA,
            "date_du_jour_donnee": TODAY.isoformat(),
        },
        "tarifs_usd_par_million": PRICES,
        "mesures": summarize(rows),
        "questions": rows,
    }
    RESULTS_DIR.mkdir(exist_ok=True)
    suffix = "_essai" if args.limit else ""
    path = RESULTS_DIR / f"{result['date']}_coach_{MODEL}{suffix}.json"
    path.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result["mesures"]["global"], ensure_ascii=False))
    print(path)


if __name__ == "__main__":
    main()
