"""Réponses du coach aux 20 questions de garde-fous (EVAL.md §3, §4).

Usage :
    python -m eval.guardrails_eval [--budget-usd X] [--suffixe S]

Demande ANTHROPIC_API_KEY. Pas de note automatique : le refus correct se note à la main
(§3, sans LLM juge). Écrit eval/results/<date>_guardrails_<modèle>.json avec les réponses,
à lire et à noter, sans jamais écraser
un fichier : `--suffixe` distingue deux mesures du même jour. Les 20 questions ne sont pas
coupées en développement et verrouillé.
"""

from __future__ import annotations

import argparse
import json
import time
from dataclasses import asdict
from datetime import date
from pathlib import Path

from app.coach.agent import EFFORT, MAX_TOKENS, MAX_TURNS, MODEL, AnthropicLLM, Coach
from app.coach.tools import Toolbox
from eval.coach.store import SqliteStore
from eval.coach_eval import PRICES, TODAY, _git, cost_usd
from eval.synth.generate_accounts import EXERCISES, user_id
from eval.synth.sqlite_db import connect

HERE = Path(__file__).resolve().parent
RESULTS_DIR = HERE / "results"


def load() -> list[dict]:
    lines = (HERE / "guardrails.jsonl").read_text(encoding="utf-8").splitlines()
    return [json.loads(line) for line in lines if line.strip()]


def run(items: list[dict], llm, model: str = MODEL, budget_usd: float | None = None) -> list[dict]:
    toolbox = Toolbox(SqliteStore(connect(), user_id("irregulier")), EXERCISES)
    rows, spent = [], 0.0
    for item in items:
        if budget_usd is not None and (spent >= budget_usd or spent != spent):
            break
        start = time.perf_counter()
        answer = Coach(llm, toolbox, model=model).ask(item["question"], TODAY)
        usage = asdict(answer.usage)
        cost = cost_usd(answer.models, usage)
        spent = spent + cost if isinstance(cost, float) else float("nan")
        rows.append(
            {
                "id": item["id"],
                "categorie": item["category"],
                "attendu": item["expected"],
                "question": item["question"],
                "reponse": answer.texte,
                "terminee": answer.finished,
                "outils_appeles": [c["outil"] for c in answer.tool_calls],
                "modeles": sorted(set(answer.models)),
                "jetons": usage,
                "cout_usd": cost,
                "latency_ms": (time.perf_counter() - start) * 1000,
                "note_a_la_main": None,
            }
        )
    return rows


def result_path(day: str, suffixe: str | None = None) -> Path:
    suffix = f"_{suffixe}" if suffixe else ""
    return RESULTS_DIR / f"{day}_guardrails_{MODEL}{suffix}.json"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--budget-usd", type=float)
    parser.add_argument("--suffixe", help="suffixe du fichier de résultats")
    args = parser.parse_args()
    day = date.today().isoformat()
    path = result_path(day, args.suffixe)
    # Vérifié avant tout appel payant : le fichier existant peut porter des notes à la main.
    if path.exists():
        parser.error(f"{path.name} existe déjà : choisir un autre --suffixe")
    items = load()
    rows = run(items, AnthropicLLM(), budget_usd=args.budget_usd)
    costs = [r["cout_usd"] for r in rows]
    result = {
        "date": day,
        "fonction": "garde-fous",
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
            "compte_de_test": "irregulier",
        },
        "tarifs_usd_par_million": PRICES,
        "n": len(rows),
        "cout_usd_total": round(sum(costs), 5)
        if all(isinstance(c, float) for c in costs)
        else "à mesurer",
        "questions": rows,
    }
    RESULTS_DIR.mkdir(exist_ok=True)
    path.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(path, result["cout_usd_total"])


if __name__ == "__main__":
    main()
