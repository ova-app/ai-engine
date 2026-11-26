"""Outil seances_par_groupe contre les réponses SQL de « coach_jambes » (dev), sans modèle."""

from datetime import UTC, datetime, timedelta

import pytest

from app.coach.data import SetRow, paris_date
from app.coach.tools import SCHEMAS, Toolbox, ToolError
from eval.coach.store import SqliteStore
from eval.datasets import load_dev
from eval.synth.generate_accounts import EXERCISES
from eval.synth.sqlite_db import connect

ITEMS = load_dev("coach_jambes")


@pytest.fixture(scope="module")
def con():
    return connect()


@pytest.mark.parametrize("item", ITEMS, ids=[i["id"] for i in ITEMS])
def test_outil_redonne_la_reponse_sql(con, item):
    _, start, end = item["answer"]["params"]
    debut = paris_date(datetime.fromisoformat(start))
    fin = paris_date(datetime.fromisoformat(end)) - timedelta(days=1)
    toolbox = Toolbox(SqliteStore(con, item["user_id"]), EXERCISES)
    args = {"debut": debut.isoformat(), "fin": fin.isoformat(), "groupe": "jambes"}
    result = toolbox.run("seances_par_groupe", args)
    assert result.content["nombre"] == item["answer"]["value"]
    assert len(result.content["dates"]) == item["answer"]["value"]
    assert result.sessions == set(item["expected_sessions"])


class Rows:
    def __init__(self, sets):
        self._sets = sets

    def sets(self, start, end):
        return self._sets


def _set(workout, group, set_type="normal"):
    return SetRow(workout, datetime(2026, 6, 1, 17, tzinfo=UTC), None, set_type, 10, 20.0, group)


def test_seuil_et_echauffement():
    rows = [
        _set("moitie", "mollets"),
        _set("moitie", "dos"),
        _set("sous", "fessiers"),
        _set("sous", "dos"),
        _set("sous", None),
        _set("echauffement", "quadriceps", "warmup"),
        _set("echauffement", "dos"),
        _set("seul", "quadriceps", "warmup"),
    ]
    result = Toolbox(Rows(rows), {}).seances_par_groupe("2026-06-01", "2026-06-01", "jambes")
    assert result.sessions == {"moitie"}
    assert result.content["dates"] == ["2026-06-01"]
    assert result.content["regle"]["seuil_minimal_pourcentage"] == 50


def test_groupe_ferme():
    assert SCHEMAS["seances_par_groupe"]["properties"]["groupe"]["enum"] == ["jambes"]
    with pytest.raises(ToolError):
        Toolbox(Rows([]), {}).seances_par_groupe("2026-06-01", "2026-06-01", "dos")
