# Jeu « coach_jambes »

20 questions « combien de séances de jambes » sur les 3 comptes de test, figées le 26/11/2026 avant l'outil qu'elles évaluent (EVAL.md §2). Générées par `python -m eval.coach.generate_leg_questions` (graine 20261126), découpées 14 dev / 6 réservées à la fin de phase. Lecture en développement par `eval.datasets.load_dev("coach_jambes")`.

## Définition

Séance de jambes : au moins 50 % de ses séries hors échauffement portent sur un exercice dont le `muscle_group` du catalogue de l'app est `quadriceps`, `ischio_jambiers`, `fessiers` ou `mollets`. Un exercice classé `dos` (soulevé de terre roumain, par exemple) ne compte pas.

## Composition

10 questions sur le compte avancé, 5 sur le débutant, 5 sur l'irrégulier. Trois formes : depuis une date, entre deux dates, sur un mois. Seul le compte avancé a des séances à majorité jambes : sur les deux autres, la réponse attendue est 0.

## Champs et notation

Ceux du jeu « coach ». Réponse de type `entier` (exacte), séances citées : les séances de jambes comptées.
