"""Notation d'une réponse du coach (EVAL.md §3) : exactitude et séances citées."""

from __future__ import annotations

TOLERANCE = {"entier": 0.0, "kg": 0.5, "pourcentage": 1.0}


def exact(expected: dict, valeur: float | None, aucune_donnee: bool) -> bool:
    """Valeur égale à celle du SQL, à la tolérance du type. Donnée absente : la réponse doit
    dire qu'il n'y a pas de donnée. Une réponse qui dit « pas de donnée » à tort est fausse."""
    if expected["type"] == "aucune_donnee":
        return aucune_donnee
    if aucune_donnee or valeur is None:
        return False
    return abs(valeur - expected["value"]) <= TOLERANCE[expected["type"]] + 1e-9


def sessions_scores(cited: set[str], expected: set[str]) -> tuple[float, float]:
    """(précision, rappel). Ensemble vide de séances citées : précision 1. Aucune séance
    attendue : rappel 1."""
    hit = len(cited & expected)
    precision = hit / len(cited) if cited else 1.0
    recall = hit / len(expected) if expected else 1.0
    return precision, recall
