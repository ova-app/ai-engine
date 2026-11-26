"""Script de mesure du coach avec un modèle factice (aucun appel réseau)."""

from types import SimpleNamespace as NS

from eval.coach_eval import cost_usd, run, summarize
from eval.datasets import load_dev


def absent_partout(**request):
    """Répond toujours « pas de donnée » : exact sur les seules questions sans donnée."""
    block = NS(
        type="tool_use",
        id="t",
        name="repondre",
        input={"texte": "Pas de donnée.", "valeur": None, "unite": None,
               "aucune_donnee": True, "sources": []},
    )  # fmt: skip
    usage = NS(input_tokens=1000, output_tokens=100, cache_read_input_tokens=0,
               cache_creation_input_tokens=0)  # fmt: skip
    return NS(content=[block], stop_reason="tool_use", usage=usage, model="claude-sonnet-5-5")


def test_run_et_resume():
    items = load_dev("coach")
    rows = run(items, absent_partout)
    n_absent = sum(1 for i in items if i["answer"]["type"] == "aucune_donnee")
    assert sum(r["exact"] for r in rows) == n_absent
    summary = summarize(rows)
    assert summary["global"]["n"] == len(items) and summary["non_terminees"] == 0
    assert summary["cout_usd_par_question"] == round((1000 * 2 + 100 * 10) / 1e6, 5)


def test_cout_inconnu_si_repli():
    usage = {"input_tokens": 1, "output_tokens": 1, "cache_read_input_tokens": 0,
             "cache_creation_input_tokens": 0}  # fmt: skip
    assert cost_usd(["claude-sonnet-5-5", "autre"], usage) == "à mesurer"
    assert cost_usd([], usage) == "à mesurer"


def test_plafond_de_depense():
    items = load_dev("coach")
    unit = (1000 * 2 + 100 * 10) / 1e6
    rows = run(items, absent_partout, budget_usd=2.5 * unit)
    assert len(rows) == 3  # 0, 1 et 2 unités dépensées avant la 3e ; 3 unités atteint le plafond
    assert len(run(items, absent_partout, budget_usd=0)) == 0
