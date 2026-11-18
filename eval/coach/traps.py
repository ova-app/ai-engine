"""Pièges écrits à la main pour le jeu « coach ». Questions et paramètres choisis à la main,
réponses calculées par les mêmes requêtes SQL que les gabarits."""

from __future__ import annotations

from datetime import date, timedelta

from eval.synth.generate_accounts import user_id


def _day(d: date):
    from eval.coach.generate_questions import paris_midnight_utc

    return paris_midnight_utc(d), paris_midnight_utc(d + timedelta(days=1))


def _range(d1: date, d2: date):
    from eval.coach.generate_questions import paris_midnight_utc

    return paris_midnight_utc(d1), paris_midnight_utc(d2 + timedelta(days=1))


def _count(ctx, profile, bounds, question, note):
    uid = user_id(profile)
    ids = [r[0] for r in ctx.all("workouts_between", uid, *bounds)]
    return {
        "user": profile,
        "question": question,
        "answer": {
            "type": "entier",
            "value": len(ids),
            "sql": "workouts_between",
            "params": [uid, *bounds],
        },
        "sessions": ids,
        "note": note,
    }


def build_traps(ctx) -> list[dict]:
    traps = []
    traps.append(
        _count(
            ctx,
            "irregulier",
            _range(date(2026, 9, 14), date(2026, 9, 20)),
            "Combien de séances ai-je faites la semaine du lundi 14/09/2026 ?",
            "Borne de semaine : la séance du dimanche 20/09 à 22 h 43 UTC est le lundi 21/09 à "
            "Paris, donc hors de cette semaine. Couper à minuit UTC donne une séance de trop.",
        )
    )
    traps.append(
        _count(
            ctx,
            "irregulier",
            _day(date(2026, 6, 1)),
            "Combien de séances ai-je faites le lundi 01/06/2026 ?",
            "Borne de jour : la séance du 01/06 à 22 h 37 UTC est le 02/06 à Paris. Réponse 0.",
        )
    )
    traps.append(
        _count(
            ctx,
            "irregulier",
            _day(date(2026, 10, 23)),
            "Combien de séances ai-je faites le vendredi 23/10/2026 ?",
            "Heure d'été : le 23/10 à 22 h 03 UTC est le 24/10 à 0 h 03 à Paris (UTC+2). "
            "Après le 25/10, le décalage passe à UTC+1. Réponse 0.",
        )
    )
    traps.append(
        _count(
            ctx,
            "irregulier",
            _range(date(2026, 7, 6), date(2026, 8, 9)),
            "Combien de séances ai-je faites entre le 06/07/2026 et le 09/08/2026 ?",
            "Interruption : la réponse est 0 séance, ce n'est pas une donnée absente.",
        )
    )

    uid = user_id("irregulier")
    code = "dumbbell-bench-press"
    params = [uid, code, *_range(date(2026, 9, 1), date(2026, 10, 20))]
    first = ctx.one("first_session_max", *params)
    last = ctx.one("last_session_max", *params)
    traps.append(
        {
            "user": "irregulier",
            "question": "De combien a évolué ma charge maximale au développé couché haltères "
            "entre le 01/09/2026 et le 20/10/2026 ?",
            "answer": {
                "type": "kg",
                "value": round(last[2] - first[2], 2),
                "details": {"debut_kg": first[2], "fin_kg": last[2]},
                "sql": "first_session_max+last_session_max",
                "params": params,
            },
            "sessions": [first[0], last[0]],
            "note": "Reprise après interruption : le pic de la période (21/09) précède une "
            "pause de trois semaines, la dernière séance (13/10) est revenue à la charge de la "
            "première. Évolution = première contre dernière séance, pas le maximum de la période.",
        }
    )

    for profile, code, question, note in (
        (
            "avance",
            "pull-ups",
            "Quel est mon record aux tractions ?",
            "Poids du corps (weight_kg = 0) : le record se lit en répétitions, pas en kilos.",
        ),
        (
            "debutant",
            "plank",
            "Combien de temps ai-je tenu au maximum en gainage ?",
            "Isométrique : les secondes sont stockées dans `reps`.",
        ),
    ):
        uid = user_id(profile)
        row = ctx.one("record_reps", uid, code)
        traps.append(
            {
                "user": profile,
                "question": question,
                "answer": {
                    "type": "entier",
                    "value": row[0],
                    "unite": "secondes" if code == "plank" else "répétitions",
                    "sql": "record_reps",
                    "params": [uid, code],
                },
                "sessions": [row[1]],
                "note": note,
            }
        )

    uid = user_id("irregulier")
    row = ctx.one("record_weight", uid, "dumbbell-bench-press")
    traps.append(
        {
            "user": "irregulier",
            "question": "Quel est mon record au développé couché ?",
            "answer": {
                "type": "kg",
                "value": row[0],
                "sql": "record_weight",
                "params": [uid, "dumbbell-bench-press"],
            },
            "sessions": [row[1]],
            "note": "Ambiguïté : le compte ne pratique que la version haltères. Répondre sur "
            "celle-ci (en le précisant), pas « aucune donnée ».",
        }
    )
    return traps
