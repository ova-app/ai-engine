"""Coût d'un appel : jetons facturés (`usage`) multipliés par le tarif public.

Un modèle absent de PRICES (repli serveur) laisse le coût « à mesurer ».
"""

# USD par million de jetons. Source : tarifs publics Anthropic, relevés le 03/11/2026.
# Écriture en cache (5 min) = 1,25 × entrée.
PRICES = {
    "claude-sonnet-5-5": {"input": 2.0, "output": 10.0, "cache_read": 0.10, "cache_write": 2.5},
}


def cost_usd(models: list[str], usage: dict) -> float | str:
    if not models or any(m not in PRICES for m in models) or len(set(models)) > 1:
        return "à mesurer"
    p = PRICES[models[0]]
    return (
        usage["input_tokens"] * p["input"]
        + usage["output_tokens"] * p["output"]
        + usage["cache_read_input_tokens"] * p["cache_read"]
        + usage["cache_creation_input_tokens"] * p["cache_write"]
    ) / 1e6
