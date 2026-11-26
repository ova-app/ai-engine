"""Ablation A3 : vérification déterministe des chiffres de la réponse."""

from datetime import date
from types import SimpleNamespace as NS

import pytest

from app.coach.agent import UNVERIFIED, Coach
from app.coach.catalogue import EXERCISES
from app.coach.tools import Toolbox
from app.coach.verify import numbers_in_text, unsupported
from eval.coach.store import SqliteStore
from eval.synth.generate_accounts import user_id
from eval.synth.sqlite_db import connect

RESULT = {"ref": "r1", "volume_kg": 3650.5, "seances": 3, "difference_kg": -1200.0}


def test_dates_exclues_et_format_francais():
    text = "Le 14/09/2026, le 2026-09-20 et le 1er octobre 2026, en juin 2026 : 3 650,5 kg (1RM)."
    assert numbers_in_text(text) == [(3650.5, "kg")]
    assert numbers_in_text("31,3 % des séries") == [(31.3, "%")]
    assert numbers_in_text("12 répétitions") == [(12.0, "")]


@pytest.mark.parametrize(
    ("texte", "valeur", "unite", "bad"),
    [
        ("Tu as soulevé 3 650,5 kg en 3 séances.", 3650.5, "kg", []),
        ("Environ 3 650 kg.", None, None, []),  # décimal ±0,5 : 3650 contre 3650,5
        ("1 200 kg de moins.", -1200, "kg", []),  # le signe n'est pas contrôlé
        ("4 séances.", 4, "séances", [4.0]),
        ("Volume : 3 700 kg.", None, None, [3700.0]),
        ("Pas de séance sur la période.", None, None, []),
        ("Soit 31 % du total.", 31, "%", [31.0]),
    ],
)
def test_unsupported(texte, valeur, unite, bad):
    assert unsupported(texte, valeur, unite, [RESULT]) == bad


def test_pourcentage_tolerance_un_point():
    assert unsupported("31 % des séries", 31, "%", [{"pourcentage": 31.3}]) == []


def tool_use(id_, name, args):
    return NS(type="tool_use", id=id_, name=name, input=args)


def message(*blocks):
    usage = NS(input_tokens=1, output_tokens=1)
    return NS(content=list(blocks), stop_reason="tool_use", usage=usage, model="faux")


def answer_call(id_, texte, valeur):
    args = {"texte": texte, "valeur": valeur, "unite": "séances", "aucune_donnee": False,
            "sources": ["r1"]}  # fmt: skip
    return message(tool_use(id_, "repondre", args))


class Scripted:
    def __init__(self, *responses):
        self.responses, self.requests = list(responses), []

    def __call__(self, **request):
        self.requests.append({**request, "messages": list(request["messages"])})
        return self.responses.pop(0)


@pytest.fixture(scope="module")
def toolbox():
    return Toolbox(SqliteStore(connect(), user_id("irregulier")), EXERCISES)


SEANCES = message(tool_use("t1", "seances", {"debut": "2026-09-14", "fin": "2026-09-20"}))


def _n(toolbox):
    return toolbox.seances("2026-09-14", "2026-09-20").content["nombre"]


def test_sans_verification_chiffre_faux_accepte(toolbox):
    llm = Scripted(SEANCES, answer_call("a", "99 séances.", 99))
    answer = Coach(llm, toolbox).ask("q", date(2026, 11, 1))
    assert answer.valeur == 99 and answer.verification["rejets"] == []


def test_reecriture_unique_puis_acceptee(toolbox):
    n = _n(toolbox)
    llm = Scripted(SEANCES, answer_call("a", "99 séances.", 99), answer_call("b", f"{n}.", n))
    answer = Coach(llm, toolbox, verify=True).ask("q", date(2026, 11, 1))
    assert answer.valeur == n and answer.verification["reecritures"] == 1
    rejected = llm.requests[2]["messages"][-1]["content"][0]
    assert rejected["is_error"] and "99" in rejected["content"]
    assert answer.sessions  # sources gardées


def test_deuxieme_echec_remplace_la_reponse(toolbox):
    llm = Scripted(SEANCES, answer_call("a", "99.", 99), answer_call("b", "98.", 98))
    answer = Coach(llm, toolbox, verify=True).ask("q", date(2026, 11, 1))
    assert answer.verification["remplacee"] and answer.texte == UNVERIFIED["texte"]
    assert answer.valeur is None and answer.finished
    assert answer.verification["rejets"] == [[99.0], [98.0]]
