# ai-engine — règles de travail

Moteur IA public : un service Python sur AWS, deux clients aux données séparées (agent sur l'historique de séances d'une app, RAG sur appels d'offres publics). Spec et protocole : `README.md` et `EVAL.md`. Phrases courtes, pas de politesse, pas de récap après le code.

## Règles impératives
1. **Évaluation d'abord.** `EVAL.md` et les jeux de référence sont commités avant le code qu'ils évaluent. Ne jamais modifier une ligne existante d'`EVAL.md` : ajouter au journal, avec date et raison.
2. **Jeu verrouillé intouchable.** Jamais lu ni utilisé pendant le développement, seulement en fin de phase.
3. **Aucun chiffre inventé.** README, résultats, coûts : valeurs mesurées uniquement, sinon « à mesurer ».
4. **Dépôt public : aucun secret, aucune donnée réelle.** Données synthétiques ou comptes de test. Clés en secrets GitHub du dépôt, AWS par OIDC. Aucune donnée d'un tiers vers un LLM.
5. **Données isolées par client.** Un client ne lit jamais la base de l'autre. L'agent lit avec le jeton de l'utilisateur (RLS), jamais avec une clé de service.
6. **Outils d'agent typés.** Pas de SQL libre généré par le modèle.
7. **Pas de diagnostic ni de traitement.** Douleur ou blessure : le coach propose des variantes d'exercices, sans les présenter comme un soin, puis conseille de consulter un médecin. Symptômes généraux (vertiges, malaise) : refus. Comportement testé dans `eval/guardrails.jsonl`.
8. **Coût sous contrôle.** Cible sous ~20 €/mois. Alerte de budget AWS, plafond par requête, coût par question mesuré.

## Façon de travailler
- Une tâche = une branche = une PR. Jamais de push sur `main`.
- Avant de coder : annoncer en une ligne la méthode, signaler tout `pip install` ou ressource AWS nouvelle.
- Commits à l'auteur unique du mainteneur : aucune ligne `Co-Authored-By` ni mention d'outil dans les commits ou les PR.
- Tests : un fichier à la fois (`pytest chemin`), suite complète avant la PR.
- Température 0 pour toute mesure. Noter la version exacte du modèle dans les résultats.

## Structure cible
```
app/        API FastAPI, agent, outils
rag/        ingestion, recherche, reranker
eval/       jeux de référence, scripts d'évaluation, résultats datés
infra/      Terraform
tests/
.github/    workflows (tests, évaluation, déploiement)
```
