"""Route du coach avec un modèle, une base et une authentification factices (aucun réseau)."""

import urllib.error
from types import SimpleNamespace as NS

import pytest
from fastapi.testclient import TestClient

from app.coach import api
from app.coach.supabase import SupabaseStore
from app.main import app

USER = "compte-de-test"
AUTH = {"Authorization": "Bearer jwt-u"}


def message(name="repondre", args=None, model="claude-sonnet-5-5", output=10):
    block = NS(
        type="tool_use",
        id="t",
        name=name,
        input=args
        if args is not None
        else {
            "texte": "Aucune séance.",
            "valeur": 0,
            "unite": "séances",
            "aucune_donnee": False,
            "sources": [],
        },
    )
    usage = NS(input_tokens=10, output_tokens=output)
    return NS(content=[block], stop_reason="tool_use", usage=usage, model=model)


class LLM:
    def __init__(self, *responses):
        self.responses, self.calls = list(responses), 0

    def __call__(self, **request):
        self.calls += 1
        return self.responses.pop(0)


@pytest.fixture
def env(monkeypatch):
    monkeypatch.setenv("SUPABASE_URL", "https://x.supabase.co")
    monkeypatch.setenv("SUPABASE_ANON_KEY", "anon")
    monkeypatch.setenv("ANTHROPIC_API_KEY", "factice")  # pragma: allowlist secret
    monkeypatch.setenv("COACH_ALLOWED_USERS", f"autre, {USER}")
    monkeypatch.delenv("COACH_MAX_COST_USD", raising=False)


@pytest.fixture
def client():
    llm = LLM(message())
    app.dependency_overrides = {
        api.llm_client: lambda: llm,
        api.auth_lookup: lambda: lambda url, key, token: USER if token == "jwt-u" else None,
        api.user_store: _store,
    }
    yield NS(http=TestClient(app), llm=llm)
    app.dependency_overrides = {}


class EmptyStore:
    def workouts(self, start, end):
        return []

    def sets(self, start, end):
        return []


def _store(token: str = api.Depends(api.user_token)):
    return EmptyStore()


def post(client, headers=AUTH, question="Combien de séances ?"):
    return client.http.post("/coach/question", json={"question": question}, headers=headers)


def test_reponse(env, client):
    response = post(client)
    assert response.status_code == 200
    assert response.json() == {
        "texte": "Aucune séance.",
        "valeur": 0.0,
        "unite": "séances",
        "aucune_donnee": False,
        "seances": [],
    }


@pytest.mark.parametrize(
    "variable", ["SUPABASE_URL", "SUPABASE_ANON_KEY", "ANTHROPIC_API_KEY", "COACH_ALLOWED_USERS"]
)
def test_route_fermee_sans_configuration(env, client, monkeypatch, variable):
    monkeypatch.delenv(variable)
    assert post(client).status_code == 503
    assert client.llm.calls == 0


@pytest.mark.parametrize("headers", [{}, {"Authorization": "Bearer faux"}])
def test_sans_jeton_valide(env, client, headers):
    assert post(client, headers=headers).status_code == 401
    assert client.llm.calls == 0


def test_compte_non_autorise(env, client, monkeypatch):
    monkeypatch.setenv("COACH_ALLOWED_USERS", "autre")
    assert post(client).status_code == 403
    assert client.llm.calls == 0


@pytest.mark.parametrize("question", ["", "x" * (api.MAX_QUESTION + 1)])
def test_question_bornee(env, client, question):
    assert post(client, question=question).status_code == 422
    assert client.llm.calls == 0


def test_authentification_indisponible(env, client):
    def down(url, key, token):
        raise urllib.error.URLError("coupure")

    app.dependency_overrides[api.auth_lookup] = lambda: down
    assert post(client).status_code == 502
    assert client.llm.calls == 0


@pytest.mark.parametrize(
    "couteux",
    [
        message("exercices_pratiques", {}, output=10_000),  # 0,10 $ : au-dessus du plafond
        message("exercices_pratiques", {}, model="autre-modele"),  # coût inconnu
    ],
)
def test_plafond_par_requete(env, client, couteux):
    client.llm.responses = [couteux, message()]
    assert post(client).status_code == 502
    assert client.llm.calls == 1


def test_reponse_finale_rendue_meme_au_dessus_du_plafond(env, client):
    client.llm.responses = [message(output=10_000)]
    assert post(client).status_code == 200


def test_echec_sans_detail(env, client):
    def boom(**request):
        raise RuntimeError("détail interne")

    app.dependency_overrides[api.llm_client] = lambda: boom
    response = post(client)
    assert response.status_code == 502 and "interne" not in response.text


def test_base_lue_avec_le_jeton_de_l_utilisateur():
    config = api.Settings("https://x.supabase.co", "anon", frozenset({USER}))
    store = api.user_store("jwt-u", config)
    assert isinstance(store, SupabaseStore)
    assert store.headers["Authorization"] == "Bearer jwt-u"


@pytest.mark.parametrize("code, attendu", [(401, None), (403, None), (500, "erreur")])
def test_verification_du_jeton(monkeypatch, code, attendu):
    def urlopen(request, timeout):
        assert request.full_url == "https://x.supabase.co/auth/v1/user"
        assert request.get_header("Authorization") == "Bearer j"
        raise urllib.error.HTTPError(request.full_url, code, "", {}, None)

    monkeypatch.setattr(api.urllib.request, "urlopen", urlopen)
    if attendu is None:
        assert api.fetch_user_id("https://x.supabase.co/", "anon", "j") is None
    else:
        with pytest.raises(urllib.error.HTTPError):
            api.fetch_user_id("https://x.supabase.co/", "anon", "j")
