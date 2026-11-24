# Jeu « recherche d'exercices »

50 requêtes, figées le 18/11/2026 avant toute mesure (EVAL.md §2). Découpage par `eval/split.py`, graine 20261118 : 35 en développement (`dev.jsonl`), 15 verrouillées. Le développement lit uniquement par `eval.datasets.load_dev("exercise_search")`.

## Champs

| Champ | Contenu |
|---|---|
| `id` | `ex01` à `ex50` |
| `category` | `nom_exact` (10), `synonyme` (12), `faute` (9), `description` (10), `filtre` (9) |
| `query` | texte tapé par l'utilisateur |
| `expected_codes` | codes du catalogue acceptés comme bons résultats (`exercises.code`) |
| `filters` | pour `filtre` seulement : `muscle_primaire` (vocabulaire de `exercise_muscles`) et éventuellement `materiel` |
| `note` | règle utilisée pour les attendus, si besoin |

## Conventions

- Un résultat est bon s'il figure dans `expected_codes` (recall@5 et MRR, EVAL.md §3).
- Requêtes larges (`description`, `filtre`) : les attendus sont tous les exercices du catalogue qui satisfont la règle de `note`, appliquée au muscle **primaire** et au matériel principal.
- Les exercices sont référencés par code uniquement. Le catalogue n'est pas dans le dépôt.
