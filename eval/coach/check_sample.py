"""Tire des questions du jeu coach (partie développement) et affiche les séries brutes utilisées,
pour recalculer les réponses à la main. La réponse attendue est masquée sauf avec --reveal.

Lit uniquement `load_dev("coach")` : jamais la partie fermée.

Les horodatages sont convertis en heure de Paris (UTC+2 du 29/03 au 25/10/2026, sinon UTC+1).
Les séries d'échauffement sont affichées, marquées `warmup` : elles sont exclues des calculs.

Usage : python -m eval.coach.check_sample [--n 10] [--seed 1] [--reveal] [--ids c03,c12]
"""

from __future__ import annotations

import argparse
import random
from datetime import datetime, timedelta

from eval.coach.generate_questions import _last_sunday
from eval.datasets import load_dev
from eval.synth.sqlite_db import connect

RAW = """
SELECT w.started_at, w.id, e.code, s.set_type, s.set_number, s.reps, s.weight_kg,
       e.muscle_principal
FROM workout_sets s
JOIN workout_exercises we ON we.id = s.workout_exercise_id
JOIN workouts w ON w.id = we.workout_id
JOIN exercises e ON e.id = we.exercise_id
WHERE w.user_id = ?
"""


def paris(iso: str) -> datetime:
    t = datetime.fromisoformat(iso)

    summer = _last_sunday(t.year, 3) <= t.date() <= _last_sunday(t.year, 10)
    # bascule à 1 h UTC ; à l'échelle de ce jeu, les séances sont à 6 h, 17 h ou 22 h UTC
    if t.date() == _last_sunday(t.year, 3) or t.date() == _last_sunday(t.year, 10):
        summer = t.hour >= 1 if t.date().month == 3 else t.hour < 1
    return t + timedelta(hours=2 if summer else 1)


def windows(params) -> list[tuple[str, str, str | None]]:
    """Normalise les paramètres d'une question en (uid, code|None, début, fin) selon sa forme."""
    plist = params if isinstance(params[0], list) else [params]
    out = []
    for p in plist:
        uid, rest = p[0], p[1:]
        code = rest[0] if rest and "T" not in rest[0] else None
        bounds = [x for x in rest if isinstance(x, str) and "T" in x]
        out.append((uid, code, bounds[0] if bounds else None, bounds[1] if bounds else None))
    return out


def raw_sets(con, uid: str, code: str | None, start: str | None, end: str | None):
    sql, args = RAW, [uid]
    if code:
        sql += " AND e.code = ?"
        args.append(code)
    if start:
        sql += " AND w.started_at >= ? AND w.started_at < ?"
        args += [start, end]
    sql += " ORDER BY w.started_at, we.order_index, s.set_number"
    return con.execute(sql, args).fetchall()


def show(con, q: dict, reveal: bool) -> None:
    print("=" * 100)
    print(f"{q['id']}  [{q['template']}]  compte : {q['user']}")
    print(f"Question : {q['question']}")
    if q.get("note"):
        print(f"Piège    : {q['note']}")
    if reveal:
        print(f"Réponse attendue : {q['answer']['value']}  {q['answer'].get('details', '')}")
    p = q["answer"]["params"]
    for uid, code, start, end in windows(p):
        if start:
            a, b = paris(start), paris(end) - timedelta(seconds=1)
            print(f"Fenêtre  : {a:%d/%m/%Y %H:%M} -> {b:%d/%m/%Y %H:%M} (Paris)")
        if code:
            print(f"Exercice : {code}")
        rows = raw_sets(con, uid, code, start, end)
        if not rows:
            print("  (aucune série)")
        last = None
        for started, wid, c, set_type, number, reps, kg, muscle in rows:
            if wid != last:
                print(f"  --- séance {wid[:8]}  {paris(started):%a %d/%m/%Y %H:%M}")
                last = wid
            print(
                f"      {c:<32} {muscle:<16} #{number:<2} {set_type:<8} {reps:>3} reps x {kg:>7} kg"
            )
        n_work = sum(1 for r in rows if r[3] != "warmup")
        n_sess = len({r[1] for r in rows})
        print(f"  = {len(rows)} séries ({n_work} hors échauffement), {n_sess} séances")


def main(argv=None) -> None:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--n", type=int, default=10)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--reveal", action="store_true")
    ap.add_argument("--ids", help="liste d'ids séparés par des virgules, au lieu du tirage")
    args = ap.parse_args(argv)
    dev = load_dev("coach")
    if args.ids:
        wanted = args.ids.split(",")
        sample = [q for q in dev if q["id"] in wanted]
    else:
        sample = sorted(random.Random(args.seed).sample(dev, args.n), key=lambda q: q["id"])
    con = connect()
    for q in sample:
        show(con, q, args.reveal)


if __name__ == "__main__":
    main()
