"""Boucle de l'agent avec un modèle factice (aucun appel réseau)."""

from datetime import date
from types import SimpleNamespace as NS

import pytest

from app.coach.agent import MAX_TURNS, SYSTEM, AnthropicLLM, Coach
from app.coach.tools import Toolbox
from eval.coach.store import SqliteStore
from eval.synth.generate_accounts import EXERCISES, user_id
from eval.synth.sqlite_db import connect

TODAY = date(2026, 11, 1)


def tool_use(id_, name, args):
    return NS(type="tool_use", id=id_, name=name, input=args)


def message(*blocks, stop="tool_use"):
    usage = NS(input_tokens=100, output_tokens=10, cache_read_input_tokens=50)
    return NS(content=list(blocks), stop_reason=stop, usage=usage, model="faux")


class Scripted:
    """Renvoie les réponses prévues, dans l'ordre, et garde les requêtes reçues."""

    def __init__(self, *responses):
        self.responses = list(responses)
        self.requests = []

    def __call__(self, **request):
        self.requests.append({**request, "messages": list(request["messages"])})
        return self.responses.pop(0)


@pytest.fixture(scope="module")
def toolbox():
    return Toolbox(SqliteStore(connect(), user_id("irregulier")), EXERCISES)


def test_reponse_citee_par_reference(toolbox):
    llm = Scripted(
        message(tool_use("t1", "seances", {"debut": "2026-07-06", "fin": "2026-08-09"})),
        message(
            tool_use(
                "t2",
                "repondre",
                {
                    "texte": "Aucune séance sur cette période.",
                    "valeur": 0,
                    "unite": "séances",
                    "aucune_donnee": False,
                    "sources": ["r1"],
                },
            )
        ),
    )
    answer = Coach(llm, toolbox).ask("Combien de séances entre le 06/07 et le 09/08 ?", TODAY)
    assert answer.finished and answer.valeur == 0.0 and not answer.aucune_donnee
    assert answer.sessions == set()
    assert answer.turns == 2 and answer.usage.input_tokens == 200
    assert answer.usage.cache_read_input_tokens == 100
    # le résultat d'outil renvoyé au modèle porte sa référence
    result = llm.requests[1]["messages"][-1]["content"][0]
    assert result["tool_use_id"] == "t1" and '"ref": "r1"' in result["content"]


def test_seances_citees_union_des_sources(toolbox):
    llm = Scripted(
        message(
            tool_use("a", "seances", {"debut": "2026-09-14", "fin": "2026-09-20"}),
            tool_use("b", "seances", {"debut": "2026-06-01", "fin": "2026-06-30"}),
        ),
        message(
            tool_use(
                "c",
                "repondre",
                {"texte": "…", "valeur": 1, "unite": None, "aucune_donnee": False,
                 "sources": ["r1", "inconnue"]},
            )
        ),
    )  # fmt: skip
    answer = Coach(llm, toolbox).ask("q", TODAY)
    week = toolbox.seances("2026-09-14", "2026-09-20").sessions
    assert answer.sessions == week
    # deux résultats d'outils renvoyés dans un seul message
    assert len(llm.requests[1]["messages"][-1]["content"]) == 2


def test_erreur_d_outil_renvoyee_au_modele(toolbox):
    llm = Scripted(
        message(tool_use("a", "volume", {"debut": "14/09/2026", "fin": "2026-09-20"})),
        message(NS(type="text", text="Je ne peux pas répondre."), stop="end_turn"),
    )
    answer = Coach(llm, toolbox).ask("q", TODAY)
    result = llm.requests[1]["messages"][-1]["content"][0]
    assert result["is_error"] is True
    assert not answer.finished and answer.texte == "Je ne peux pas répondre."
    assert answer.tool_calls[0]["erreur"]


def test_plafond_de_tours(toolbox):
    call = tool_use("a", "exercices_pratiques", {})
    llm = Scripted(*[message(call) for _ in range(MAX_TURNS + 1)])
    answer = Coach(llm, toolbox).ask("q", TODAY)
    assert answer.turns == MAX_TURNS and not answer.finished


def test_requete_outils_stricts_sans_temperature(toolbox):
    llm = Scripted(message(NS(type="text", text="ok"), stop="end_turn"))
    Coach(llm, toolbox).ask("q", TODAY)
    req = llm.requests[0]
    assert "temperature" not in req and "tool_choice" not in req
    assert all(t["strict"] and not t["input_schema"]["additionalProperties"] for t in req["tools"])
    for t in req["tools"]:
        assert set(t["input_schema"]["required"]) == set(t["input_schema"]["properties"])
    assert req["output_config"] == {"effort": "low"}
    assert req["model"] == "claude-sonnet-5-5"
    assert "2026-11-01" in req["messages"][0]["content"]


def test_prefixe_commun_en_cache(toolbox):
    llm = Scripted(*[message(NS(type="text", text="ok"), stop="end_turn") for _ in range(2)])
    Coach(llm, toolbox).ask("première", TODAY)
    Coach(llm, toolbox).ask("seconde", TODAY)
    first, second = llm.requests
    # point de cache sur les consignes : outils et consignes relus d'une question à l'autre
    assert first["system"] == [
        {"type": "text", "text": SYSTEM, "cache_control": {"type": "ephemeral"}}
    ]
    assert (first["system"], first["tools"]) == (second["system"], second["tools"])
    assert first["cache_control"] == {"type": "ephemeral"}


def test_client_anthropic_repli_serveur():
    seen = {}

    class FakeMessages:
        def create(self, **kw):
            seen.update(kw)
            return "ok"

    client = NS(beta=NS(messages=FakeMessages()))
    assert AnthropicLLM(client)(model="m", messages=[]) == "ok"
    assert seen["fallbacks"] == "default" and seen["betas"] == [AnthropicLLM.FALLBACK_BETA]
