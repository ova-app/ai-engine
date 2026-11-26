"""Muscle principal par code d'exercice, pour l'outil de répartition.

Sous-ensemble du catalogue : les seuls exercices des comptes synthétiques. Un exercice absent
est compté « inconnu » dans la répartition par muscle.
"""

# code catalogue -> muscle principal (premier muscle primaire du catalogue).
# Sans nom ni description.
EXERCISES: dict[str, str] = {
    "machine-leg-press": "quadriceps",
    "machine-chest-press": "grand_pectoral",
    "machine-pulldown": "grand_dorsal",
    "dumbbell-lateral-raise": "deltoide",
    "dumbbell-curl": "biceps",
    "cable-rope-pushdown": "triceps",
    "plank": "abdominaux",
    "goblet-squat": "quadriceps",
    "seated-cable-row": "grand_dorsal",
    "lying-leg-curl-machine": "ischio_jambiers",
    "barbell-squat": "fessier_maximus",
    "barbell-bench-press": "grand_pectoral",
    "barbell-deadlift": "erecteurs_rachis",
    "barbell-overhead-press": "deltoide",
    "pull-ups": "grand_dorsal",
    "barbell-bent-over-row": "grand_dorsal",
    "dumbbell-incline-bench-press": "grand_pectoral",
    "romanian-deadlift": "fessier_maximus",
    "hip-thrust": "fessier_maximus",
    "barbell-curl": "biceps",
    "skull-crusher-ez-bar": "triceps",
    "standing-calf-raise-machine": "mollets",
    "cable-lateral-raise": "deltoide",
    "hanging-leg-raise": "abdominaux",
    "dumbbell-bench-press": "grand_pectoral",
    "dumbbell-goblet-squat": "fessier_maximus",
    "dumbbell-row-unilateral": "grand_dorsal",
    "push-up": "grand_pectoral",
    "dumbbell-seated-overhead-press": "deltoide",
    "dumbbell-hammer-curl": "brachioradial",
    # jamais pratiqués par les comptes : servent aux questions « donnée absente »
    "kettlebell-swing": "fessier_maximus",
    "farmer-walk": "avant_bras",
    "machine-leg-extension": "quadriceps",
}
