"""Vérification des chiffres d'une réponse du coach (ablation A3, journal d'EVAL.md, 25/11/2026).

Contrôle déterministe, sans LLM : chaque nombre de la réponse (texte et champ `valeur`),
dates exclues, doit figurer dans les résultats des outils de la même question, à la tolérance
du §3 d'EVAL.md : entier exact, décimal ±0,5 (kg), pourcentage ±1 point. Le signe n'est pas
contrôlé : « 5 000 kg de moins » est soutenu par une différence de -5000.
"""

from __future__ import annotations

import re

MOIS = (
    "janvier|février|fevrier|mars|avril|mai|juin|juillet|août|aout|septembre|octobre|"
    "novembre|décembre|decembre"
)
DATES = [
    r"\b\d{4}-\d{2}-\d{2}\b",  # 2026-09-14
    r"\b\d{1,2}/\d{1,2}(?:/\d{2,4})?\b",  # 14/09/2026, 14/09
    rf"\b(?:1er|\d{{1,2}})\s+(?:{MOIS})(?:\s+\d{{4}})?\b",  # 14 septembre 2026
    rf"\b(?:{MOIS})\s+\d{{4}}\b",  # septembre 2026
    r"\b1\s?RM\b",  # « 1RM » est un nom, pas une valeur
]
# Nombre français : espaces (y compris insécables) entre milliers, virgule décimale.
NUMBER = re.compile(r"(?<![\w.,])\d{1,3}(?:[   ]\d{3})+(?:,\d+)?(?![\w])|\d+(?:[.,]\d+)?")


def numbers_in_text(text: str) -> list[tuple[float, str]]:
    """Nombres du texte, dates retirées. Pour chacun : (valeur, unité lue : "%", "kg" ou "")."""
    for pattern in DATES:
        text = re.sub(pattern, " ", text, flags=re.IGNORECASE)
    out = []
    for m in NUMBER.finditer(text):
        raw = re.sub(r"[   ]", "", m.group()).replace(",", ".")
        after = text[m.end() :].lstrip().lower()
        unit = "%" if after.startswith("%") else "kg" if re.match(r"kg\b|kilo", after) else ""
        out.append((float(raw), unit))
    return out


def numbers_in_results(results: list) -> list[float]:
    found: list[float] = []

    def walk(x):
        if isinstance(x, bool):
            return
        if isinstance(x, int | float):
            found.append(float(x))
        elif isinstance(x, dict):
            for v in x.values():
                walk(v)
        elif isinstance(x, list):
            found.append(float(len(x)))
            for v in x:
                walk(v)

    walk(results)
    return found


def _supported(n: float, unit: str, pool: list[float]) -> bool:
    if unit == "%":
        tol = 1.0
    elif unit == "kg" or not n.is_integer():
        tol = 0.5
    else:
        tol = 0.0
    return any(abs(abs(n) - abs(t)) <= tol + 1e-9 for t in pool)


def unsupported(texte: str, valeur: float | None, unite: str | None, results: list) -> list[float]:
    """Nombres de la réponse qu'aucun résultat d'outil ne soutient."""
    pool = numbers_in_results(results)
    candidates = numbers_in_text(texte)
    if valeur is not None:
        unit = (unite or "").strip().lower()
        candidates.append((float(valeur), unit if unit in ("%", "kg") else ""))
    bad = []
    for n, unit in candidates:
        if not _supported(n, unit, pool) and n not in bad:
            bad.append(n)
    return bad
