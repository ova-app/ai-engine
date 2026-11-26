"""Normalisation de texte et libellés français des clés du catalogue.

Les libellés sont écrits une fois, avant toute mesure, avec les mots courants des utilisateurs.
Ils ne sont pas ajustés d'après les résultats de développement (EVAL.md §2).
"""

from __future__ import annotations

import re
import unicodedata

MUSCLE_LABELS = {
    "grand_pectoral": "pectoraux pectoral pecs poitrine",
    "deltoide": "epaules epaule deltoides deltoide",
    "grand_dorsal": "dos dorsaux dorsal grand dorsal",
    "trapeze": "trapezes trapeze",
    "biceps": "biceps bras",
    "triceps": "triceps bras",
    "quadriceps": "quadriceps cuisses",
    "ischio_jambiers": "ischio jambiers ischios cuisses",
    "mollets": "mollets mollet",
    "abdominaux": "abdominaux abdos",
    "avant_bras": "avant bras",
    "fessier_maximus": "fessiers fessier",
    "fessier_median": "fessiers fessier",
    "fessier_minimus": "fessiers fessier",
    "rhomboide": "rhomboides dos",
    "grand_rond": "grand rond dos",
    "erecteurs_rachis": "lombaires bas du dos",
    "serratus_anterieur": "dentele",
    "brachial": "bras",
    "brachioradial": "avant bras",
    "adducteurs": "adducteurs cuisses",
    "iliopsoas": "psoas hanches",
    "infra_epineux": "epaules coiffe des rotateurs",
    "elevateur_scapula": "cou omoplate",
    "tenseur_fascia_lata": "hanches",
    "quadratus_lumborum": "lombaires",
}

EQUIPMENT_LABELS = {
    "haltere": "haltere halteres alteres",
    "barre": "barre",
    "poulie": "poulie cable",
    "machine": "machine",
    "poids_corps": "poids du corps",
    "kettlebell": "kettlebell",
    "elastique": "elastique bande",
}


def fold(text: str) -> str:
    """Minuscules, sans accents, ponctuation et tirets remplacés par des espaces."""
    decomposed = unicodedata.normalize("NFKD", text.lower())
    stripped = "".join(c for c in decomposed if not unicodedata.combining(c))
    return " ".join(re.findall(r"[a-z0-9]+", stripped))


def tsquery_or(query: str) -> str:
    """Mots de la question reliés par OU. Postgres retire les mots vides."""
    return " | ".join(fold(query).split())
