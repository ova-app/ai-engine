import json

import pytest

from eval import datasets, split


def _items(n: int) -> list[dict]:
    return [{"id": f"q{i:03d}", "v": i} for i in range(n)]


@pytest.mark.parametrize("n", [20, 50, 60])
def test_split_proportions_et_partition(n):
    dev, held = split.split(_items(n), seed=7)
    assert len(dev) == round(n * 0.7)
    assert len(dev) + len(held) == n
    dev_ids, held_ids = {r["id"] for r in dev}, {r["id"] for r in held}
    assert not dev_ids & held_ids
    assert dev_ids | held_ids == {r["id"] for r in _items(n)}


def test_split_deterministe_et_independant_de_l_ordre():
    items = _items(50)
    a = split.split(items, seed=7)
    b = split.split(list(reversed(items)), seed=7)
    assert a == b


def test_split_depend_de_la_graine():
    assert split.split(_items(50), seed=7)[0] != split.split(_items(50), seed=8)[0]


def test_split_refuse_ids_en_double():
    with pytest.raises(ValueError):
        split.split([{"id": "a"}, {"id": "a"}], seed=1)


def test_ecriture_verification_et_chargement(tmp_path):
    split.split_and_write("toy", _items(20), seed=3, sets_dir=tmp_path)
    split.verify("toy", sets_dir=tmp_path)
    dev = datasets.load_dev("toy", sets_dir=tmp_path)
    assert len(dev) == 14


def test_verify_detecte_une_modification(tmp_path):
    split.split_and_write("toy", _items(20), seed=3, sets_dir=tmp_path)
    p = tmp_path / "toy" / "dev.jsonl"
    rows = [json.loads(line) for line in p.read_text(encoding="utf-8").splitlines()]
    rows[0]["v"] = -1
    p.write_text("".join(json.dumps(r) + "\n" for r in rows), encoding="utf-8")
    with pytest.raises(AssertionError):
        split.verify("toy", sets_dir=tmp_path)


def test_load_dev_refuse_les_chemins_hors_jeux(tmp_path):
    with pytest.raises(ValueError):
        datasets.load_dev("../x", sets_dir=tmp_path)


def _committed_sets():
    return sorted(p.parent.name for p in split.SETS_DIR.glob("*/manifest.json"))


@pytest.mark.parametrize("name", _committed_sets())
def test_jeux_commites_integres(name):
    split.verify(name)
