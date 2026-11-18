"""Trois comptes de test synthétiques (EVAL.md §2), bibliothèque standard, graine fixe.

Profils :
- `debutant` : régulier, 3 séances par semaine, corps entier, machines, progression linéaire.
- `avance`   : 4 séances par semaine (haut / bas), barres, échauffements, séries dégressives et
  à l'échec, progression lente avec semaines d'allègement.
- `irregulier` : 0 à 3 séances par semaine, deux longues interruptions, charges en baisse
  au retour.

Sortie : `eval/synth/accounts.sql`, au format des tables `workouts`, `workout_exercises`,
`workout_sets` décrites dans le schéma de l'app. À charger dans le projet Supabase de TEST
uniquement, jamais en production.

Conventions (à confirmer avec l'app, elles conditionnent les réponses du jeu « coach ») :
- `exercise_id` est résolu au chargement par `exercises.code` (catalogue, `owner_id IS NULL`) :
  aucun UUID du catalogue n'est écrit ici.
- Volume = somme de `reps × weight_kg` sur les séries dont `set_type <> 'warmup'`.
  `workouts.total_volume_kg` et `workouts.total_reps` suivent cette convention.
- `weight_kg` d'un exercice aux haltères = charge d'un haltère.
- Isométrique (gainage) : secondes dans `reps`, `weight_kg = 0`.
- Horodatages en UTC. `is_pr`, `pr_charge`, `pr_serie`, `pr_exercice` ne sont pas calculés
  (false / NULL) : le coach calcule les records depuis les séries.

Usage : python -m eval.synth.generate_accounts
"""

from __future__ import annotations

import random
import uuid
from dataclasses import dataclass, field
from datetime import UTC, date, datetime, timedelta
from pathlib import Path

SEED = 20261118
NAMESPACE = uuid.UUID("6f1c2a52-6d2b-4c58-9a3e-1d4f0b7e9c11")  # espace de noms fixe, arbitraire
START = date(2026, 6, 1)  # lundi
END = date(2026, 10, 31)
OUT = Path(__file__).resolve().parent / "accounts.sql"

# code catalogue -> muscle principal (premier muscle primaire du catalogue).
# Sous-ensemble minimal, sans nom ni description, utilisé par les questions de répartition.
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


@dataclass(frozen=True)
class Lift:
    """Prescription d'un exercice : charge de départ, pas de progression, séries x reps."""

    code: str
    start_kg: float
    step_kg: float  # 0 pour poids du corps
    every: int  # nombre de séances entre deux augmentations
    sets: int
    reps: int
    warmup: bool = False
    isometric: bool = False


@dataclass(frozen=True)
class Profile:
    key: str
    title_prefix: str
    bodyweight_kg: float
    days: dict[int, tuple[str, tuple[Lift, ...]]]  # jour de semaine -> (titre, exercices)
    skip_prob: float
    gaps: tuple[tuple[date, date], ...] = ()
    deload_every_weeks: int = 0
    random_week: bool = False
    hour_utc: int = 17


DEBUTANT_A = (
    Lift("machine-leg-press", 60, 5, 2, 3, 10),
    Lift("machine-chest-press", 30, 2.5, 2, 3, 10),
    Lift("machine-pulldown", 35, 2.5, 3, 3, 10),
    Lift("plank", 0, 0, 1, 3, 30, isometric=True),
)
DEBUTANT_B = (
    Lift("goblet-squat", 12, 2, 3, 3, 10),
    Lift("seated-cable-row", 30, 2.5, 2, 3, 10),
    Lift("dumbbell-lateral-raise", 4, 1, 4, 3, 12),
    Lift("dumbbell-curl", 6, 1, 4, 3, 12),
    Lift("cable-rope-pushdown", 15, 2.5, 3, 3, 12),
)
AVANCE_HAUT_1 = (
    Lift("barbell-bench-press", 90, 2.5, 4, 4, 5, warmup=True),
    Lift("barbell-bent-over-row", 80, 2.5, 4, 4, 6, warmup=True),
    Lift("dumbbell-incline-bench-press", 30, 2, 4, 3, 8),
    Lift("pull-ups", 0, 0, 1, 4, 8),
    Lift("skull-crusher-ez-bar", 30, 2.5, 4, 3, 10),
)
AVANCE_BAS_1 = (
    Lift("barbell-squat", 120, 2.5, 3, 4, 5, warmup=True),
    Lift("romanian-deadlift", 100, 2.5, 4, 3, 8),
    Lift("lying-leg-curl-machine", 45, 2.5, 4, 3, 10),
    Lift("standing-calf-raise-machine", 80, 5, 4, 4, 12),
    Lift("hanging-leg-raise", 0, 0, 1, 3, 12),
)
AVANCE_HAUT_2 = (
    Lift("barbell-overhead-press", 55, 2.5, 4, 4, 5, warmup=True),
    Lift("pull-ups", 0, 0, 1, 4, 8),
    Lift("dumbbell-incline-bench-press", 30, 2, 4, 3, 10),
    Lift("cable-lateral-raise", 10, 1.25, 4, 3, 15),
    Lift("barbell-curl", 35, 2.5, 4, 3, 10),
)
AVANCE_BAS_2 = (
    Lift("barbell-deadlift", 150, 5, 4, 3, 5, warmup=True),
    Lift("hip-thrust", 120, 5, 3, 3, 8),
    Lift("barbell-squat", 100, 2.5, 4, 3, 8),
    Lift("standing-calf-raise-machine", 80, 5, 4, 4, 12),
)
IRREGULIER = (
    Lift("dumbbell-bench-press", 20, 2, 3, 3, 10),
    Lift("dumbbell-goblet-squat", 18, 2, 3, 3, 12),
    Lift("dumbbell-row-unilateral", 22, 2, 3, 3, 10),
    Lift("push-up", 0, 0, 1, 2, 15),
    Lift("dumbbell-seated-overhead-press", 14, 2, 4, 3, 10),
    Lift("dumbbell-hammer-curl", 10, 1, 4, 2, 12),
)

PROFILES = (
    Profile(
        "debutant",
        "Full body",
        bodyweight_kg=68.0,
        days={0: ("A", DEBUTANT_A), 2: ("B", DEBUTANT_B), 4: ("A", DEBUTANT_A)},
        skip_prob=0.05,
        hour_utc=17,
    ),
    Profile(
        "avance",
        "Séance",
        bodyweight_kg=84.0,
        days={
            0: ("Haut 1", AVANCE_HAUT_1),
            1: ("Bas 1", AVANCE_BAS_1),
            3: ("Haut 2", AVANCE_HAUT_2),
            5: ("Bas 2", AVANCE_BAS_2),
        },
        skip_prob=0.08,
        deload_every_weeks=6,
        hour_utc=6,
    ),
    Profile(
        "irregulier",
        "Haltères maison",
        bodyweight_kg=76.0,
        days={d: ("", IRREGULIER) for d in range(7)},
        skip_prob=0.0,
        gaps=((date(2026, 7, 6), date(2026, 8, 9)), (date(2026, 9, 21), date(2026, 10, 11))),
        random_week=True,
        # 22 h-22 h 45 UTC = après minuit à Paris : piège des bornes de jour et de semaine
        hour_utc=22,
    ),
)


def user_id(profile_key: str) -> str:
    return str(uuid.uuid5(NAMESPACE, f"user:{profile_key}"))


def _id(*parts: object) -> str:
    return str(uuid.uuid5(NAMESPACE, ":".join(str(p) for p in parts)))


def _round_to(x: float, step: float) -> float:
    return float(round(round(x / step) * step, 2)) if step else 0.0


@dataclass
class SetRow:
    id: str
    set_type: str
    set_number: int
    reps: int
    weight_kg: float
    rest_seconds: int | None
    logged_at: datetime


@dataclass
class ExerciseRow:
    id: str
    code: str
    order_index: int
    sets: list[SetRow] = field(default_factory=list)


@dataclass
class Workout:
    id: str
    user: str
    title: str
    started_at: datetime
    ended_at: datetime
    bodyweight_kg: float
    exercises: list[ExerciseRow] = field(default_factory=list)

    @property
    def working_sets(self):
        return [s for e in self.exercises for s in e.sets if s.set_type != "warmup"]

    @property
    def volume_kg(self) -> float:
        return round(sum(s.reps * s.weight_kg for s in self.working_sets), 2)

    @property
    def total_reps(self) -> int:
        return sum(s.reps for s in self.working_sets)


def _session_dates(p: Profile, rng: random.Random) -> list[date]:
    out = []
    chosen: set[int] = set()
    day = START
    while day <= END:
        if p.random_week:
            if day.weekday() == 0:  # tirage des jours au début de chaque semaine
                chosen = set(rng.sample(range(7), rng.choice([0, 1, 1, 2, 2, 3])))
            keep = day.weekday() in chosen
        else:
            keep = day.weekday() in p.days and rng.random() >= p.skip_prob
        if keep and not any(a <= day <= b for a, b in p.gaps):
            out.append(day)
        day += timedelta(days=1)
    return out


def _build_profile(p: Profile, rng: random.Random) -> list[Workout]:
    workouts: list[Workout] = []
    counts: dict[str, int] = {}
    last_day: date | None = None
    setback: dict[str, float] = {}
    for n, day in enumerate(_session_dates(p, rng)):
        label, lifts = p.days[day.weekday()]
        week_index = (day - START).days // 7
        deload = bool(p.deload_every_weeks) and week_index % p.deload_every_weeks == (
            p.deload_every_weeks - 1
        )
        if last_day and (day - last_day).days > 14:
            for code in setback:
                setback[code] *= 0.9  # reprise après interruption : charges réduites
        last_day = day
        minute = rng.randint(0, 45)
        start = datetime(day.year, day.month, day.day, p.hour_utc, minute, tzinfo=UTC)
        t = start + timedelta(minutes=5)
        title = f"{p.title_prefix} {label}".strip()
        w = Workout(_id(p.key, "workout", n), user_id(p.key), title, start, start, p.bodyweight_kg)
        for order, lift in enumerate(lifts):
            k = counts.get(lift.code, 0)
            counts[lift.code] = k + 1
            setback.setdefault(lift.code, 1.0)
            step = lift.step_kg or 1
            target = (lift.start_kg + lift.step_kg * (k // lift.every)) * setback[lift.code]
            if deload:
                target *= 0.85
            target = _round_to(target, step) if lift.step_kg else 0.0
            ex = ExerciseRow(_id(w.id, "ex", order), lift.code, order)
            number = 1
            plan: list[tuple[str, int, float]] = []
            if lift.warmup:
                plan.append(("warmup", 8, _round_to(target * 0.5, step)))
                plan.append(("warmup", 5, _round_to(target * 0.75, step)))
            for i in range(lift.sets):
                reps = lift.reps
                if lift.isometric:
                    reps = lift.reps + 5 * (k // 2) + rng.choice([-5, 0, 0, 5])
                elif lift.step_kg == 0:
                    reps = lift.reps + k // 6 + rng.choice([-2, -1, 0, 0, 1])
                elif i == lift.sets - 1 and rng.random() < 0.3:
                    reps = max(1, reps - rng.choice([1, 2]))
                set_type = "working"
                if p.key == "avance" and i == lift.sets - 1 and not lift.warmup:
                    set_type = rng.choice(["working", "working", "failure", "dropset"])
                weight = target
                if set_type == "dropset":
                    weight = _round_to(target * 0.8, step)
                    reps += 3
                plan.append((set_type, max(1, reps), weight))
            for set_type, reps, weight in plan:
                rest = None if set_type == "warmup" else rng.choice([60, 90, 90, 120, 150])
                t += timedelta(seconds=40 + reps * 3 + (rest or 45))
                ex.sets.append(
                    SetRow(_id(ex.id, "set", number), set_type, number, reps, weight, rest, t)
                )
                number += 1
            w.exercises.append(ex)
        w.ended_at = t + timedelta(minutes=3)
        workouts.append(w)
    return workouts


def generate(seed: int = SEED) -> list[Workout]:
    rng = random.Random(seed)
    return [w for p in PROFILES for w in _build_profile(p, rng)]


# --- rendu SQL ---------------------------------------------------------------------------


def _q(v: object) -> str:
    if v is None:
        return "NULL"
    if isinstance(v, bool):
        return "TRUE" if v else "FALSE"
    if isinstance(v, int | float):
        return repr(v)
    if isinstance(v, datetime):
        return "'" + v.isoformat() + "'"
    return "'" + str(v).replace("'", "''") + "'"


def _laterality(code: str) -> str:
    return "unilateral" if "unilateral" in code else "bilateral"


def _exercise_ref(code: str) -> str:
    return f"(SELECT id FROM exercises WHERE code = {_q(code)} AND owner_id IS NULL)"


def render_sql(workouts: list[Workout]) -> str:
    lines = [
        "-- Comptes de test synthétiques. Généré par eval/synth/generate_accounts.py",
        f"-- (graine {SEED}). Ne pas modifier à la main : regénérer.",
        "-- Projet Supabase de TEST uniquement. Prérequis :",
        "--   1. le catalogue `exercises` chargé (codes ci-dessous, owner_id NULL) ;",
        "--   2. les trois utilisateurs créés avec ces UUID :",
    ]
    for p in PROFILES:
        lines.append(f"--      {p.key:<11} {user_id(p.key)}")
    lines += [
        "-- Chargement en rôle propriétaire (éditeur SQL) : triggers de garde et RLS contournés,",
        "-- le générateur respecte lui-même leurs bornes (tests/test_synth_accounts.py).",
        "BEGIN;",
        "",
    ]
    cols_w = (
        "id, user_id, title, started_at, ended_at, duration_sec, total_volume_kg, is_public, "
        "poids_corps_kg, session_mode, total_reps"
    )
    cols_e = "id, workout_id, exercise_id, order_index, laterality"
    cols_s = (
        "id, workout_exercise_id, set_type, set_number, reps, weight_kg, rest_seconds, is_pr, "
        "logged_at"
    )
    for w in workouts:
        duration = int((w.ended_at - w.started_at).total_seconds())
        row = (w.id, w.user, w.title, w.started_at, w.ended_at, duration, w.volume_kg, False,
               w.bodyweight_kg, "gym", w.total_reps)  # fmt: skip
        lines.append(f"INSERT INTO workouts ({cols_w}) VALUES ({', '.join(map(_q, row))});")
        ex_values = [
            f"({_q(e.id)}, {_q(w.id)}, {_exercise_ref(e.code)}, {e.order_index}, "
            f"{_q(_laterality(e.code))})"
            for e in w.exercises
        ]
        lines.append(
            f"INSERT INTO workout_exercises ({cols_e}) VALUES\n  " + ",\n  ".join(ex_values) + ";"
        )
        set_values = [
            "("
            + ", ".join(
                _q(v)
                for v in (
                    s.id,
                    e.id,
                    s.set_type,
                    s.set_number,
                    s.reps,
                    s.weight_kg,
                    s.rest_seconds,
                    False,
                    s.logged_at,
                )
            )
            + ")"
            for e in w.exercises
            for s in e.sets
        ]
        lines.append(
            f"INSERT INTO workout_sets ({cols_s}) VALUES\n  " + ",\n  ".join(set_values) + ";"
        )
        lines.append("")
    lines.append("COMMIT;")
    return "\n".join(lines) + "\n"


def main() -> None:
    workouts = generate()
    OUT.write_text(render_sql(workouts), encoding="utf-8", newline="\n")
    by_user: dict[str, int] = {}
    for w in workouts:
        by_user[w.user] = by_user.get(w.user, 0) + 1
    for p in PROFILES:
        print(f"{p.key}: {by_user.get(user_id(p.key), 0)} séances")
    print(f"écrit : {OUT.relative_to(Path.cwd()) if OUT.is_relative_to(Path.cwd()) else OUT}")


if __name__ == "__main__":
    main()
