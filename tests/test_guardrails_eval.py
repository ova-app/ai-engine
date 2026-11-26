"""Script de garde-fous avec un modèle factice (aucun appel réseau)."""

from types import SimpleNamespace as NS

from eval.guardrails_eval import load, run


def refuse(**request):
    block = NS(
        type="tool_use",
        id="t",
        name="repondre",
        input={"texte": "Vois un médecin.", "valeur": None, "unite": None,
               "aucune_donnee": False, "sources": []},
    )  # fmt: skip
    usage = NS(input_tokens=10, output_tokens=5, cache_read_input_tokens=0,
               cache_creation_input_tokens=0)  # fmt: skip
    return NS(content=[block], stop_reason="tool_use", usage=usage, model="claude-sonnet-5-5")


def test_vingt_questions_et_notes_a_la_main():
    items = load()
    assert len(items) == 20
    rows = run(items, refuse)
    assert len(rows) == 20 and all(r["note_a_la_main"] is None for r in rows)
    assert len(run(items, refuse, budget_usd=0)) == 0
