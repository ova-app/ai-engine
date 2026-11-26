"""Magasin Supabase avec un transport factice : jeton de l'utilisateur, pagination, lecture."""

import urllib.parse
from datetime import UTC, datetime

import pytest

from app.coach.supabase import PAGE, SupabaseStore
from app.coach.tools import Toolbox

WORKOUT = {
    "id": "w1",
    "started_at": "2026-06-01T17:34:00+00:00",
    "workout_exercises": [
        {
            "exercises": {"code": "plank"},
            "workout_sets": [
                {"set_type": "normal", "reps": 45, "weight_kg": None},
                {"set_type": "warmup", "reps": 20, "weight_kg": 0},
            ],
        }
    ],
}


class Fake:
    def __init__(self, pages):
        self.pages, self.calls = list(pages), []

    def __call__(self, url, headers):
        self.calls.append((url, headers))
        return self.pages.pop(0)


def test_jeton_utilisateur_et_cle_publique_seulement():
    fake = Fake([[WORKOUT]])
    store = SupabaseStore("https://x.supabase.co/", "anon", "jwt-u", "u", fetch=fake)
    start = datetime(2026, 5, 31, 22, tzinfo=UTC)
    [w] = store.workouts(start, None)
    url, headers = fake.calls[0]
    assert headers["Authorization"] == "Bearer jwt-u"
    assert headers["apikey"] == "anon"  # pragma: allowlist secret
    assert url.startswith("https://x.supabase.co/rest/v1/workouts?")
    query = urllib.parse.parse_qs(urllib.parse.urlparse(url).query)
    assert query["started_at"] == ["gte.2026-05-31T22:00:00+00:00"]
    # la RLS laisse lire les séances publiques d'autrui : filtre obligatoire
    assert query["user_id"] == ["eq.u"]
    assert w.id == "w1" and w.started_at.tzinfo is not None


def test_series_et_cache():
    fake = Fake([[WORKOUT]])
    store = SupabaseStore("https://x", "anon", "jwt", "u", fetch=fake)
    sets = store.sets(None, None)
    assert [(s.code, s.set_type, s.reps, s.weight_kg) for s in sets] == [
        ("plank", "normal", 45, 0.0),
        ("plank", "warmup", 20, 0.0),
    ]
    store.workouts(None, None)
    assert len(fake.calls) == 1


def test_muscle_group_et_exercice_sans_code():
    custom = {
        "id": "w2",
        "started_at": "2026-06-02T17:00:00+00:00",
        "workout_exercises": [
            {
                "exercises": {"code": None, "muscle_group": "quadriceps"},
                "workout_sets": [{"set_type": "normal", "reps": 10, "weight_kg": 20}],
            }
        ],
    }
    fake = Fake([[custom]])
    store = SupabaseStore("https://x", "anon", "jwt", "u", fetch=fake)
    [s] = store.sets(None, None)
    assert (s.code, s.muscle_group) == (None, "quadriceps")
    query = urllib.parse.parse_qs(urllib.parse.urlparse(fake.calls[0][0]).query)
    assert "exercises(code,muscle_group)" in query["select"][0]
    toolbox = Toolbox(store, {})
    assert toolbox.exercices_pratiques().content["exercices"] == []
    fake.pages.append([custom])
    result = toolbox.seances_par_groupe("2026-06-01", "2026-06-07", "jambes")
    assert result.content["nombre"] == 1 and result.sessions == {"w2"}


def test_pagination():
    fake = Fake([[WORKOUT] * PAGE, [WORKOUT]])
    store = SupabaseStore("https://x", "anon", "jwt", "u", fetch=fake)
    assert len(store.workouts(None, None)) == PAGE + 1
    assert "offset=1000" in fake.calls[1][0]
    assert all("user_id=eq.u" in url for url, _ in fake.calls)


def test_sans_jeton_refuse():
    with pytest.raises(ValueError):
        SupabaseStore("https://x", "anon", "", "u")
    with pytest.raises(ValueError):
        SupabaseStore("https://x", "anon", "jwt", "")
