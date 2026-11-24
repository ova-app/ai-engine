# Grille du LLM juge : fidélité au texte

Version 1. Cette grille est écrite avant toute validation (voir `EVAL.md` §6). Une modification se fait par une nouvelle version, datée, avec sa raison.

## Rôle du juge

Le juge note une seule chose : la **fidélité au texte** (`EVAL.md` §3). Il ne note ni le style, ni l'utilité, ni la complétude.

- Modèle différent du générateur. Température 0. Version exacte du modèle notée dans chaque résultat.
- Le juge ne voit que trois éléments : la question, les passages fournis au générateur, la réponse du générateur. Il ne voit pas le passage attendu du jeu de référence.

## Entrées

1. `question` : la question posée.
2. `passages` : les extraits fournis au générateur, avec leur référence.
3. `reponse` : la réponse à noter.

## Procédure

1. Découper la réponse en affirmations. Une affirmation est un fait vérifiable : un montant, une date, un nom, une condition, une exigence.
2. Pour chaque affirmation, chercher dans `passages` un extrait qui la soutient.
3. Une affirmation est **soutenue** si un passage la dit explicitement, ou si elle s'en déduit sans connaissance extérieure. Sinon, elle est **non soutenue**.

## Note

| Note | Condition |
|---|---|
| 1 | Toutes les affirmations sont soutenues. |
| 0 | Au moins une affirmation est non soutenue. |

## Cas particuliers

- **Réponse qui dit ne rien trouver** : note 1 si elle n'affirme aucun fait. La justesse du refus est une autre mesure (« refus si rien ne correspond »).
- **Chiffre ou date modifié**, même légèrement : non soutenue.
- **Connaissance générale vraie mais absente des passages** : non soutenue.
- **Reformulation fidèle** : soutenue.
- **Mauvaise référence citée, texte pourtant présent dans un autre passage fourni** : soutenue pour la fidélité. L'erreur de référence relève de la mesure « citations exactes ».
- **Réponse vide ou hors sujet sans fait affirmé** : note 1, la fidélité est respectée par défaut.

## Sortie attendue

Un JSON, sans texte autour :

```json
{"affirmations": [{"texte": "...", "soutenue": true, "passage": "ref"}], "note": 1}
```

`note` vaut 0 si une entrée de `affirmations` a `soutenue` à `false`, sinon 1. Le juge justifie chaque affirmation non soutenue dans `texte`.

## Validation

Elle suit `EVAL.md` §6 : 30 réponses notées à la main par le mainteneur, échantillon tiré avec graine, accord en pourcentage et kappa de Cohen. Résultat : à mesurer.
