import re

from eval.coach import check_sample


def test_tirage_deterministe_dev_seulement_et_reponse_masquee(capsys):
    check_sample.main(["--n", "10", "--seed", "3"])
    out = capsys.readouterr().out
    assert len(re.findall(r"^c\d\d  \[", out, flags=re.M)) == 10
    assert "Réponse attendue" not in out
    ids = {int(i) for i in re.findall(r"^c(\d\d)  \[", out, flags=re.M)}
    from eval.datasets import load_dev

    dev_ids = {int(q["id"][1:]) for q in load_dev("coach")}
    assert ids <= dev_ids
    check_sample.main(["--n", "10", "--seed", "3"])
    assert capsys.readouterr().out == out


def test_reveal_et_ids(capsys):
    check_sample.main(["--ids", "c01", "--reveal"])
    out = capsys.readouterr().out
    assert "Réponse attendue : 7.5" in out
    assert "11 séances" in out
