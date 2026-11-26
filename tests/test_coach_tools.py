"""Outils du coach contre les réponses SQL du jeu de développement, sans modèle.

Pour chaque question, l'outil adapté est appelé avec les paramètres de la requête de
référence : il doit redonner la valeur et les séances attendues. Ne lit que `dev.jsonl`.
"""

from datetime import date, datetime, timedelta

import pytest

from app.coach.data import paris_bounds, paris_date, round_half_up
from app.coach.tools import Toolbox, ToolError
from eval.coach.score import exact, sessions_scores
from eval.coach.store import SqliteStore
from eval.datasets import load_dev
from eval.synth.generate_accounts import EXERCISES
from eval.synth.sqlite_db import connect

ITEMS = load_dev("coach")


@pytest.fixture(scope="module")
def con():
    return connect()


def _days(a: str, b: str) -> tuple[str, str]:
    """Bornes UTC [a, b) de la requête de référence -> jours de Paris, dernier inclus."""
    d1 = paris_date(datetime.fromisoformat(a))
    d2 = paris_date(datetime.fromisoformat(b)) - timedelta(days=1)
    return d1.isoformat(), d2.isoformat()


def _call(tb: Toolbox, answer: dict):
    sql, p = answer["sql"], answer["params"]
    if sql in ("first_session_max+last_session_max", "first_session_max"):
        r = tb.progression(p[1], *_days(p[2], p[3]))
        return r, r.content.get("evolution_kg")
    if sql == "volume_between" and isinstance(p[0], list):
        r = tb.comparer_volume(*_days(*p[0][1:]), *_days(*p[1][1:]))
        return r, r.content["difference_kg"]
    if sql == "volume_between":
        r = tb.volume(*_days(p[1], p[2]))
        return r, r.content["volume_kg"]
    if sql == "workouts_between":
        r = tb.seances(*_days(p[1], p[2]))
        return r, r.content["nombre"]
    if sql in ("record_weight", "record_reps"):
        r = tb.record(p[1], "charge" if sql == "record_weight" else "repetitions")
        return r, r.content.get("valeur")
    if sql == "best_set":
        r = tb.meilleure_serie(p[1])
        return r, r.content.get("un_rm_estime_kg")
    if sql == "muscle_split":
        r = tb.repartition_muscles(*_days(p[1], p[2]))
        top = r.content["muscles"][0]
        assert top["muscle"] == answer["details"]["muscle"]
        return r, top["pourcentage"]
    raise AssertionError(sql)


@pytest.mark.parametrize("item", ITEMS, ids=[i["id"] for i in ITEMS])
def test_outil_redonne_la_reponse_sql(con, item):
    tb = Toolbox(SqliteStore(con, item["user_id"]), EXERCISES)
    result, value = _call(tb, item["answer"])
    absent = result.content.get("donnee") is False
    assert exact(item["answer"], value, absent)
    # Pourcentages : le jeu arrondit au pair (round de Python), l'outil vers le haut ;
    # l'écart (31,25 -> 31,2 ou 31,3) reste dans la tolérance du §3, vérifiée ci-dessus.
    if item["answer"]["type"] not in ("aucune_donnee", "pourcentage"):
        assert value == pytest.approx(item["answer"]["value"], abs=1e-9)
    assert result.sessions == set(item["expected_sessions"])


def test_isolation_par_utilisateur(con):
    users = {i["user_id"] for i in ITEMS}
    seen = [{w.id for w in SqliteStore(con, u).workouts(None, None)} for u in users]
    assert all(s for s in seen)
    assert len(set.union(*seen)) == sum(len(s) for s in seen)


def test_exercices_pratiques_sans_echauffement_seul(con):
    tb = Toolbox(SqliteStore(con, ITEMS[0]["user_id"]), EXERCISES)
    codes = [e["code"] for e in tb.exercices_pratiques().content["exercices"]]
    assert codes == sorted(codes) and codes


def test_erreurs_d_arguments(con):
    tb = Toolbox(SqliteStore(con, ITEMS[0]["user_id"]), EXERCISES)
    with pytest.raises(ToolError):
        tb.run("volume", {"debut": "01/06/2026", "fin": "2026-06-07"})
    with pytest.raises(ToolError):
        tb.run("volume", {"debut": "2026-06-07", "fin": "2026-06-01"})
    with pytest.raises(ToolError):
        tb.run("volume", {"debut": "2026-06-01"})
    with pytest.raises(ToolError):
        tb.run("sql_libre", {})


def test_bornes_de_paris():
    start, end = paris_bounds(date(2026, 10, 24), date(2026, 10, 25))
    assert start.isoformat() == "2026-10-23T22:00:00+00:00"  # heure d'été
    assert end.isoformat() == "2026-10-25T23:00:00+00:00"  # heure d'hiver


def test_arrondi_comme_sqlite():
    assert round_half_up(2.25, 1) == 2.3
    assert round_half_up(-2.25, 1) == -2.3
    assert round_half_up(0.125, 2) == 0.13


def test_notation():
    kg = {"type": "kg", "value": 10.0}
    assert exact(kg, 10.4, False) and not exact(kg, 10.6, False)
    assert not exact(kg, 10.0, True)
    assert exact({"type": "aucune_donnee", "value": None}, None, True)
    assert not exact({"type": "entier", "value": 3}, 4, False)
    assert sessions_scores({"a", "b"}, {"a"}) == (0.5, 1.0)
    assert sessions_scores(set(), set()) == (1.0, 1.0)
