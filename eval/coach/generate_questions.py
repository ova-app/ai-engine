"""Jeu « coach » : 60 questions sur les 3 comptes de test, réponse calculée en SQL (EVAL.md §2).

Gabarits : progression entre deux dates, volume d'une semaine, nombre de séances depuis une
date, record, meilleure série, répartition par muscle, comparaison de deux périodes. Environ
15 % de questions portent sur un exercice jamais fait (réponse attendue : pas de donnée).
Les pièges écrits à la main sont dans `eval/coach/traps.py`.

Les réponses sont calculées dans SQLite (`eval/synth/sqlite_db.py`), sur `accounts.sql`.

RISQUE DE DIALECTE SQLite / Postgres (à recouper sur 10 questions dans le Supabase de test) :
- Bornes de jour, semaine, mois : calculées ici en Python, à minuit heure de Paris
  (Europe/Paris, changement d'heure inclus), puis passées en UTC. En Postgres, l'agent
  pourrait utiliser `date_trunc('week', started_at AT TIME ZONE 'Europe/Paris')` : même
  résultat seulement si le fuseau est explicite. Sans `AT TIME ZONE`, la semaine est coupée à
  minuit UTC (session du dimanche 22 h UTC = lundi à Paris).
- Comparaison d'horodatages : SQLite compare des chaînes ISO 8601, toutes au même format
  `+00:00` ici. Postgres compare des `timestamptz` : identique tant que le format ne varie pas.
- Arrondis : `ROUND` de SQLite arrondit la moitié vers l'infini ; `round(double precision)`
  de Postgres arrondit la moitié au pair. Les valeurs arrondies ici (2 décimales pour les kg,
  1 pour les pourcentages et le 1RM) sont donc à recouper aux cas « ,x5 ».
- 1RM estimé (formule d'Epley) : `weight_kg * (1 + reps / 30.0)`. En Postgres, `reps / 30`
  sur deux entiers est une division entière (= 0 pour reps < 30) : écrire `reps / 30.0`.
- `COUNT(*)` renvoie `bigint` en Postgres, `integer` en SQLite : sans effet sur les valeurs.

Conventions de réponse : séries d'échauffement exclues partout ; volume = Σ reps × kg ;
dates exprimées en heure de Paris ; une séance est rattachée à sa date locale de début.

Usage : python -m eval.coach.generate_questions
"""

from __future__ import annotations

import random
import sqlite3
from datetime import UTC, date, datetime, timedelta

from eval import split
from eval.synth.generate_accounts import PROFILES, user_id
from eval.synth.sqlite_db import connect

SEED = 20261118
DATA_START, DATA_END = date(2026, 6, 1), date(2026, 10, 31)
ABSENT = ("kettlebell-swing", "farmer-walk", "machine-leg-extension")

# Libellés familiers (rédigés ici, pas repris du catalogue), avec préposition contractée.
AU: dict[str, str] = {
    "machine-leg-press": "à la presse à cuisses",
    "machine-chest-press": "au développé pectoraux à la machine",
    "machine-pulldown": "au tirage vertical à la machine",
    "dumbbell-lateral-raise": "aux élévations latérales aux haltères",
    "dumbbell-curl": "au curl haltères",
    "cable-rope-pushdown": "aux extensions triceps à la corde",
    "plank": "au gainage",
    "goblet-squat": "au squat goblet",
    "seated-cable-row": "au tirage horizontal à la poulie",
    "lying-leg-curl-machine": "au leg curl couché",
    "barbell-squat": "au squat barre",
    "barbell-bench-press": "au développé couché barre",
    "barbell-deadlift": "au soulevé de terre",
    "barbell-overhead-press": "au développé militaire barre",
    "pull-ups": "aux tractions",
    "barbell-bent-over-row": "au rowing barre",
    "dumbbell-incline-bench-press": "au développé incliné haltères",
    "romanian-deadlift": "au soulevé de terre roumain",
    "hip-thrust": "au hip thrust",
    "barbell-curl": "au curl barre",
    "skull-crusher-ez-bar": "à la barre au front",
    "standing-calf-raise-machine": "aux mollets debout à la machine",
    "cable-lateral-raise": "aux élévations latérales à la poulie",
    "hanging-leg-raise": "aux relevés de jambes suspendu",
    "dumbbell-bench-press": "au développé couché haltères",
    "dumbbell-goblet-squat": "au squat goblet haltère",
    "dumbbell-row-unilateral": "au rowing un bras haltère",
    "push-up": "aux pompes",
    "dumbbell-seated-overhead-press": "au développé épaules assis haltères",
    "dumbbell-hammer-curl": "au curl marteau",
    "kettlebell-swing": "au swing kettlebell",
    "farmer-walk": "à la marche du fermier",
    "machine-leg-extension": "au leg extension",
}
# Exercices proches : jamais pris comme « donnée absente » si le compte pratique l'autre
# (la question serait ambiguë, pas absente).
CONFUSABLE = (
    ("goblet-squat", "dumbbell-goblet-squat"),
    ("barbell-deadlift", "romanian-deadlift"),
    ("barbell-bench-press", "dumbbell-bench-press"),
    ("dumbbell-lateral-raise", "cable-lateral-raise"),
)
MOIS = {6: "juin", 7: "juillet", 8: "août", 9: "septembre", 10: "octobre"}

# --- temps : heure de Paris -> UTC ---------------------------------------------------------


def _last_sunday(year: int, month: int) -> date:
    d = date(year, month + 1, 1) - timedelta(days=1)
    return d - timedelta(days=(d.weekday() + 1) % 7)


def paris_midnight_utc(d: date) -> str:
    """Minuit heure de Paris du jour `d`, en UTC ISO. Heure d'été (UTC+2) du dernier dimanche
    de mars au dernier dimanche d'octobre ; à minuit, le changement (2 h / 3 h) n'a pas eu lieu."""
    summer = _last_sunday(d.year, 3) < d <= _last_sunday(d.year, 10)
    offset = 2 if summer else 1
    return (datetime(d.year, d.month, d.day, tzinfo=UTC) - timedelta(hours=offset)).isoformat()


def month_bounds(year: int, month: int) -> tuple[str, str]:
    nxt = date(year + month // 12, month % 12 + 1, 1)
    return paris_midnight_utc(date(year, month, 1)), paris_midnight_utc(nxt)


def fr(d: date) -> str:
    return d.strftime("%d/%m/%Y")


# --- requêtes ------------------------------------------------------------------------------

SETS_CTE = """
WITH sets AS (
  SELECT w.id AS workout_id, w.user_id, w.started_at, e.code, e.muscle_principal,
         s.set_type, s.set_number, s.reps, s.weight_kg
  FROM workout_sets s
  JOIN workout_exercises we ON we.id = s.workout_exercise_id
  JOIN workouts w ON w.id = we.workout_id
  JOIN exercises e ON e.id = we.exercise_id
  WHERE s.set_type <> 'warmup'
)
"""

SQL = {
    # séance (première ou dernière) d'un exercice dans [début, fin), avec sa charge max
    "first_session_max": SETS_CTE
    + """
SELECT workout_id, started_at, MAX(weight_kg) FROM sets
WHERE user_id = ? AND code = ? AND started_at >= ? AND started_at < ?
GROUP BY workout_id, started_at ORDER BY started_at ASC LIMIT 1""",
    "last_session_max": SETS_CTE
    + """
SELECT workout_id, started_at, MAX(weight_kg) FROM sets
WHERE user_id = ? AND code = ? AND started_at >= ? AND started_at < ?
GROUP BY workout_id, started_at ORDER BY started_at DESC LIMIT 1""",
    "volume_between": SETS_CTE
    + """
SELECT ROUND(COALESCE(SUM(reps * weight_kg), 0), 2), COUNT(DISTINCT workout_id) FROM sets
WHERE user_id = ? AND started_at >= ? AND started_at < ?""",
    "workouts_between": """
SELECT id FROM workouts WHERE user_id = ? AND started_at >= ? AND started_at < ?
ORDER BY started_at""",
    "record_weight": SETS_CTE
    + """
SELECT weight_kg, workout_id, started_at FROM sets WHERE user_id = ? AND code = ?
ORDER BY weight_kg DESC, started_at ASC LIMIT 1""",
    "record_reps": SETS_CTE
    + """
SELECT reps, workout_id, started_at FROM sets WHERE user_id = ? AND code = ?
ORDER BY reps DESC, started_at ASC LIMIT 1""",
    "best_set": SETS_CTE
    + """
SELECT ROUND(weight_kg * (1 + reps / 30.0), 1) AS e1rm, weight_kg, reps, workout_id, started_at
FROM sets WHERE user_id = ? AND code = ?
ORDER BY weight_kg * (1 + reps / 30.0) DESC, started_at ASC LIMIT 1""",
    "muscle_split": SETS_CTE
    + """
SELECT muscle_principal, COUNT(*) AS n FROM sets
WHERE user_id = ? AND started_at >= ? AND started_at < ?
GROUP BY muscle_principal ORDER BY n DESC, muscle_principal ASC""",
}


class Ctx:
    def __init__(self, con: sqlite3.Connection):
        self.con = con

    def one(self, name: str, *params):
        return self.con.execute(SQL[name], params).fetchone()

    def all(self, name: str, *params):
        return self.con.execute(SQL[name], params).fetchall()

    def practiced(self, uid: str, weighted: bool) -> list[str]:
        rows = self.con.execute(
            SETS_CTE + "SELECT code, MAX(weight_kg) FROM sets WHERE user_id = ? GROUP BY code "
            "ORDER BY code",
            (uid,),
        ).fetchall()
        return [c for c, w in rows if (w > 0) == weighted]


def _absent(sql_name: str, params: list) -> dict:
    return {"type": "aucune_donnee", "value": None, "sql": sql_name, "params": params}


# --- gabarits ------------------------------------------------------------------------------
# Chaque gabarit renvoie (question, réponse, séances attendues) ou None si le tirage ne convient
# pas (le générateur retire alors un autre tirage).


def t_progression(ctx: Ctx, rng: random.Random, uid: str, code: str | None = None):
    code = code or rng.choice(ctx.practiced(uid, weighted=True))
    d1 = DATA_START + timedelta(days=rng.randint(0, 50))
    d2 = d1 + timedelta(days=rng.randint(35, 100))
    if d2 > DATA_END:
        return None
    a, b = paris_midnight_utc(d1), paris_midnight_utc(d2 + timedelta(days=1))
    q = f"De combien a évolué ma charge maximale {AU[code]} entre le {fr(d1)} et le {fr(d2)} ?"
    params = [uid, code, a, b]
    first = ctx.one("first_session_max", *params)
    last = ctx.one("last_session_max", *params)
    if first is None:
        return q, _absent("first_session_max", params), []
    if first[0] == last[0]:
        return None
    ans = {
        "type": "kg",
        "value": round(last[2] - first[2], 2),
        "details": {"debut_kg": first[2], "fin_kg": last[2]},
        "sql": "first_session_max+last_session_max",
        "params": params,
    }
    return q, ans, [first[0], last[0]]


def t_volume_week(ctx: Ctx, rng: random.Random, uid: str):
    monday = DATA_START + timedelta(weeks=rng.randint(0, 21))
    a, b = paris_midnight_utc(monday), paris_midnight_utc(monday + timedelta(days=7))
    vol, n = ctx.one("volume_between", uid, a, b)
    if n == 0:
        return None
    q = f"Quel volume total ai-je soulevé la semaine du lundi {fr(monday)} ?"
    ans = {
        "type": "kg",
        "value": vol,
        "details": {"seances": n},
        "sql": "volume_between",
        "params": [uid, a, b],
    }
    return q, ans, [r[0] for r in ctx.all("workouts_between", uid, a, b)]


def t_count_since(ctx: Ctx, rng: random.Random, uid: str):
    d = DATA_START + timedelta(days=rng.randint(20, 140))
    a, b = paris_midnight_utc(d), paris_midnight_utc(DATA_END + timedelta(days=1))
    ids = [r[0] for r in ctx.all("workouts_between", uid, a, b)]
    q = f"Combien de séances ai-je faites depuis le {fr(d)} ?"
    ans = {"type": "entier", "value": len(ids), "sql": "workouts_between", "params": [uid, a, b]}
    return q, ans, ids


def t_record(ctx: Ctx, rng: random.Random, uid: str, code: str | None = None):
    code = code or rng.choice(ctx.practiced(uid, weighted=True))
    q = f"Quel est mon record de charge {AU[code]}, et quand l'ai-je fait ?"
    row = ctx.one("record_weight", uid, code)
    if row is None:
        return q, _absent("record_weight", [uid, code]), []
    ans = {"type": "kg", "value": row[0], "sql": "record_weight", "params": [uid, code]}
    return q, ans, [row[1]]


def t_best_set(ctx: Ctx, rng: random.Random, uid: str, code: str | None = None):
    code = code or rng.choice(ctx.practiced(uid, weighted=True))
    q = f"Quelle a été ma meilleure série {AU[code]}, en 1RM estimé (formule d'Epley) ?"
    row = ctx.one("best_set", uid, code)
    if row is None:
        return q, _absent("best_set", [uid, code]), []
    ans = {
        "type": "kg",
        "value": row[0],
        "details": {"charge_kg": row[1], "reps": row[2]},
        "sql": "best_set",
        "params": [uid, code],
    }
    return q, ans, [row[3]]


def t_muscle_split(ctx: Ctx, rng: random.Random, uid: str):
    month = rng.choice(list(MOIS))
    a, b = month_bounds(2026, month)
    rows = ctx.all("muscle_split", uid, a, b)
    if not rows or (len(rows) > 1 and rows[0][1] == rows[1][1]):
        return None  # mois vide ou ex aequo en tête : réponse ambiguë
    total = sum(n for _, n in rows)
    q = (
        f"En {MOIS[month]} 2026, quel muscle ai-je le plus travaillé, et quelle part de mes "
        "séries (hors échauffement) cela représente-t-il ?"
    )
    ans = {
        "type": "pourcentage",
        "value": round(100 * rows[0][1] / total, 1),
        "details": {"muscle": rows[0][0], "series": rows[0][1], "total_series": total},
        "sql": "muscle_split",
        "params": [uid, a, b],
    }
    return q, ans, [r[0] for r in ctx.all("workouts_between", uid, a, b)]


def t_compare_months(ctx: Ctx, rng: random.Random, uid: str):
    m1, m2 = sorted(rng.sample(list(MOIS), 2))
    (a1, b1), (a2, b2) = month_bounds(2026, m1), month_bounds(2026, m2)
    v1, n1 = ctx.one("volume_between", uid, a1, b1)
    v2, n2 = ctx.one("volume_between", uid, a2, b2)
    if n1 == 0 or n2 == 0:
        return None
    q = (
        f"J'ai soulevé plus ou moins de volume en {MOIS[m2]} qu'en {MOIS[m1]} 2026 ? "
        "De combien de kilos ?"
    )
    ans = {
        "type": "kg",
        "value": round(v2 - v1, 2),
        "details": {f"volume_{MOIS[m1]}": v1, f"volume_{MOIS[m2]}": v2},
        "sql": "volume_between",
        "params": [[uid, a1, b1], [uid, a2, b2]],
    }
    ids = ctx.all("workouts_between", uid, a1, b1) + ctx.all("workouts_between", uid, a2, b2)
    return q, ans, [r[0] for r in ids]


TEMPLATES = {
    "progression": (t_progression, 7),
    "volume_semaine": (t_volume_week, 6),
    "nb_seances": (t_count_since, 6),
    "record": (t_record, 6),
    "meilleure_serie": (t_best_set, 6),
    "repartition_muscle": (t_muscle_split, 6),
    "comparaison_periodes": (t_compare_months, 6),
}
# Questions sur donnée absente : 9 sur 60 (15 %), sur un exercice jamais fait par le compte.
ABSENT_TEMPLATES = {"progression": 3, "record": 3, "meilleure_serie": 3}


def _item(qid, profile, template, generated):
    q, ans, sessions = generated
    return {
        "id": qid,
        "user": profile,
        "user_id": user_id(profile),
        "template": template,
        "question": q,
        "answer": ans,
        "expected_sessions": sessions,
    }


def build(seed: int = SEED, con: sqlite3.Connection | None = None) -> list[dict]:
    from eval.coach.traps import build_traps

    ctx = Ctx(con or connect())
    rng = random.Random(seed)
    users = [p.key for p in PROFILES]
    items: list[dict] = []
    seen: set[tuple[str, str]] = set()

    def push(profile, template, gen):
        key = (profile, gen[0])
        if key in seen:
            return False
        seen.add(key)
        items.append(_item(f"c{len(items) + 1:02d}", profile, template, gen))
        return True

    def fill(template, n, attempt):
        made = tries = 0
        while made < n:
            tries += 1
            if tries > 1000:
                raise RuntimeError(f"gabarit {template} : tirages épuisés")
            profile = users[(made + tries) % len(users)]  # on change de compte à chaque essai
            if attempt(profile):
                made += 1

    for template, (fn, n) in TEMPLATES.items():

        def regular(profile, fn=fn, template=template):
            gen = fn(ctx, rng, user_id(profile))
            return bool(gen) and gen[1]["type"] != "aucune_donnee" and push(profile, template, gen)

        fill(template, n, regular)

    for template, n in ABSENT_TEMPLATES.items():
        fn = TEMPLATES[template][0]

        def absent(profile, fn=fn, template=template):
            uid = user_id(profile)
            done = set(ctx.practiced(uid, True)) | set(ctx.practiced(uid, False))
            done |= {b for a, b in CONFUSABLE if a in done} | {
                a for a, b in CONFUSABLE if b in done
            }
            code = rng.choice(sorted(c for c in AU if c not in done))
            gen = fn(ctx, rng, uid, code=code)
            return bool(gen) and gen[1]["type"] == "aucune_donnee" and push(profile, template, gen)

        fill(template, n, absent)

    for trap in build_traps(ctx):
        push(trap["user"], "piege", (trap["question"], trap["answer"], trap["sessions"]))
        items[-1]["note"] = trap["note"]
    return items


def main() -> None:
    items = build()
    manifest = split.split_and_write("coach", items, SEED)
    absent = sum(1 for it in items if it["answer"]["type"] == "aucune_donnee")
    print(
        f"coach : {len(items)} questions ({absent} sur donnée absente), "
        f"{len(manifest['dev_ids'])} dev"
    )


if __name__ == "__main__":
    main()
