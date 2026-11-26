"""Mesures et intervalles de confiance (EVAL.md §3 et §5)."""

from __future__ import annotations

import random
from collections.abc import Sequence

N_BOOT = 2000
SEED = 20261118


def reciprocal_rank(results: Sequence[str], expected: set[str], depth: int = 10) -> float:
    """1/rang du premier bon résultat, 0 s'il n'est pas dans les `depth` premiers."""
    for rank, code in enumerate(results[:depth], start=1):
        if code in expected:
            return 1 / rank
    return 0.0


def hit_at(results: Sequence[str], expected: set[str], k: int = 5) -> float:
    """1 si au moins un bon résultat figure dans les k premiers, sinon 0."""
    return float(any(code in expected for code in results[:k]))


def bootstrap_ci(values: Sequence[float], n_boot: int = N_BOOT, seed: int = SEED):
    """Moyenne et intervalle à 95 % (percentiles) par bootstrap sur les questions."""
    rng = random.Random(seed)
    n = len(values)
    means = sorted(sum(rng.choices(values, k=n)) / n for _ in range(n_boot))
    return sum(values) / n, means[int(0.025 * n_boot)], means[int(0.975 * n_boot) - 1]


def paired_bootstrap_ci(
    a: Sequence[float], b: Sequence[float], n_boot: int = N_BOOT, seed: int = SEED
):
    """Différence moyenne a - b sur les mêmes questions, et son intervalle à 95 %."""
    if len(a) != len(b):
        raise ValueError("les deux variantes doivent porter sur les mêmes questions")
    diffs = [x - y for x, y in zip(a, b, strict=True)]
    return bootstrap_ci(diffs, n_boot, seed)


def percentile(values: Sequence[float], p: float) -> float:
    ordered = sorted(values)
    return ordered[min(len(ordered) - 1, round(p * (len(ordered) - 1)))]
