# Jeu « coach »

60 questions sur les 3 comptes de test (`eval/synth/accounts.sql`), figées le 18/11/2026 avant toute mesure (EVAL.md §2). Générées par `python -m eval.coach.generate_questions` (graine 20261118), découpées 42 dev / 18 verrouillées. Le développement lit uniquement par `eval.datasets.load_dev("coach")`.

## Composition

| Gabarit | Questions |
|---|---|
| progression entre deux dates | 7 + 3 sur donnée absente |
| volume d'une semaine | 6 |
| nombre de séances depuis une date | 6 |
| record de charge | 6 + 3 sur donnée absente |
| meilleure série (1RM estimé, Epley) | 6 + 3 sur donnée absente |
| répartition par muscle sur un mois | 6 |
| comparaison de deux mois (volume) | 6 |
| pièges écrits à la main (`eval/coach/traps.py`) | 8 |

Donnée absente : 9 questions sur 60 (15 %), sur un exercice jamais fait par le compte. Réponse attendue : dire qu'il n'y a pas de donnée.

## Champs

`id`, `user` (profil), `user_id`, `template`, `question`, `answer` (`type` : `kg`, `entier`, `pourcentage`, `aucune_donnee` ; `value` ; `details` ; `sql` et `params` : requête de `generate_questions.SQL` et paramètres, pour recouper dans Postgres), `expected_sessions` (ids de `workouts`), `note` (pièges).

## Conventions

- Séries d'échauffement exclues. Volume = Σ reps × kg.
- Jours, semaines (lundi) et mois en heure de Paris, changement d'heure inclus.
- Progression = charge max de la dernière séance de la période moins celle de la première.
- Répartition : muscle principal = premier muscle primaire du catalogue, en nombre de séries.
- Tolérances (EVAL.md §3) : entiers exacts, kg ±0,5, pourcentages ±1 point.
- Écarts possibles SQLite / Postgres : voir l'en-tête de `eval/coach/generate_questions.py`. À recouper sur 10 questions dans le Supabase de test.
