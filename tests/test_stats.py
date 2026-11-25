import pytest

from eval.stats import bootstrap_ci, hit_at, paired_bootstrap_ci, percentile, reciprocal_rank


def test_hit_at_k():
    assert hit_at(["a", "b", "c", "d", "e", "x"], {"x"}) == 0.0
    assert hit_at(["a", "b", "c", "d", "x"], {"x", "y"}) == 1.0


def test_reciprocal_rank():
    assert reciprocal_rank(["a", "b", "x"], {"x"}) == pytest.approx(1 / 3)
    assert reciprocal_rank(["a"] * 10 + ["x"], {"x"}) == 0.0
    assert reciprocal_rank([], {"x"}) == 0.0


def test_bootstrap_ci_est_reproductible_et_encadre_la_moyenne():
    values = [1.0] * 30 + [0.0] * 20
    mean, low, high = bootstrap_ci(values)
    assert mean == pytest.approx(0.6)
    assert low < mean < high
    assert (mean, low, high) == bootstrap_ci(values)


def test_bootstrap_ci_valeurs_constantes():
    assert bootstrap_ci([1.0] * 10) == (1.0, 1.0, 1.0)


def test_bootstrap_apparie_exclut_zero_si_gain_net():
    a, b = [1.0] * 40, [0.0] * 40
    mean, low, _ = paired_bootstrap_ci(a, b)
    assert mean == 1.0 and low > 0


def test_bootstrap_apparie_refuse_des_tailles_differentes():
    with pytest.raises(ValueError):
        paired_bootstrap_ci([1.0], [1.0, 0.0])


def test_percentile():
    assert percentile([5, 1, 3], 0.5) == 3
