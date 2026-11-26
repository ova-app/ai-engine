# ai-engine

Un moteur IA unique (service Python déployé sur AWS) qui sert deux clients aux données séparées :

1. **Un assistant dans une application mobile de musculation** : un agent répond aux questions d'un utilisateur sur ses propres séances, et une recherche sémantique retrouve des exercices.
2. **Un assistant d'appels d'offres publics** : un RAG sur des avis de marchés publics français, avec filtres et réponses citées.

Le projet est construit pour être mesuré : le protocole d'évaluation est écrit avant les premiers tests, et aucun chiffre n'est publié sans avoir été mesuré.

> **Statut : en construction.** Les sections « Résultats » et « Coût » seront remplies avec les valeurs mesurées. Rien n'est annoncé avant.

## Ce que fait le moteur

Pour chaque question, le moteur :

1. comprend la demande et choisit un outil ;
2. va chercher les bonnes données (historique de séances, exercices, passages d'avis) ;
3. demande au LLM de rédiger une réponse à partir de ces seules données ;
4. vérifie la réponse, cite ses sources, et refuse ce qui sort de son rôle.

## Architecture

```
Client A (app mobile)        Client B (démo web)
        │                            │
        └──────────┬─────────────────┘
                   ▼
        ┌────────────────────────┐
        │  API FastAPI (Docker)  │  AWS
        │  agent · RAG · garde-  │
        │  fous · traces         │
        └───┬──────────┬─────────┘
            │          │
            ▼          ▼
          LLM      Postgres + pgvector
   (Claude, Mistral)  (une base par client)
```

- **Isolation des données.** Le moteur lit la base du client A avec le jeton de l'utilisateur : la sécurité par ligne (RLS) de Postgres s'applique, un utilisateur ne voit que ses séances. Chaque client a sa propre base.
- **Agent.** Appel d'outils natif de l'API du LLM, avec des outils typés (pas de SQL libre généré par le modèle).
- **RAG.** Extraction, découpage, recherche hybride (mots-clés et vecteurs), reranker, filtres, citations. Une ablation de base sans embeddings sert de point de comparaison.
- **Observabilité.** Traces par requête (outils appelés, latence, coût) avec Phoenix.

## Stack

Python · FastAPI · Docker · AWS (ECR, Lambda en image Docker) · Terraform · GitHub Actions · Postgres + pgvector (Supabase) · API Claude et Mistral · Phoenix · Streamlit (démo) · LlamaIndex (ingestion de documents)

## Évaluation

Le protocole complet est dans [`EVAL.md`](EVAL.md), écrit avant le premier test.

| Fonction | Jeu de référence | Mesures |
|---|---|---|
| Recherche d'exercices | 50 requêtes, bons exercices attendus | recall@5, MRR |
| Agent sur l'historique | 60 questions sur 3 comptes de test, réponse calculée en SQL | exactitude face au SQL, séances citées justes |
| Garde-fous | 15 questions médicales ou hors sujet | taux de refus correct |
| Appels d'offres | 60 questions avec passage attendu | recall@5, fidélité au texte, citations exactes, refus si rien ne correspond |
| Toutes | chaque requête | latence, coût par question |

Règles :
- Intervalles de confiance à 95 % par bootstrap ; les comparaisons entre variantes utilisent un bootstrap apparié.
- Trois ablations au maximum par phase, choisies à l'avance.
- La fidélité au texte est notée par un LLM juge, validé à la main sur 30 réponses avant d'être utilisé.
- Une partie du jeu de référence est verrouillée : elle ne sert jamais à régler le système.
- En intégration continue, un sous-ensemble de questions tourne à chaque modification. Une baisse sous le seuil fixé dans `EVAL.md` bloque le déploiement. L'évaluation complète se lance à la demande.

## Résultats

_À mesurer. Ce tableau sera rempli avec les valeurs et leurs intervalles de confiance._

| Fonction | Mesure | Valeur | IC 95 % |
|---|---|---|---|
| Recherche d'exercices | recall@5 | à mesurer | |
| Agent sur l'historique | exactitude | à mesurer | |
| Garde-fous | refus correct | à mesurer | |
| Appels d'offres | recall@5 | à mesurer | |
| Appels d'offres | fidélité au texte | à mesurer | |

## Coût

_À mesurer : coût moyen par question pour chaque fonction._

## Plan

| Phase | Contenu | Statut |
|---|---|---|
| 1 | Socle (API, Docker, Terraform, CI), recherche d'exercices, agent sur l'historique, évaluation, écran dans l'application | à venir |
| 2 | Assistant d'appels d'offres : RAG complet, démo web publique | à venir |
| 3 (option) | Génération de programmes, bilan de la semaine | à décider |

## Données et confidentialité

- Les jeux de référence et les comptes de test sont synthétiques ou appartiennent au mainteneur. Aucune donnée d'un tiers n'est envoyée à un LLM.
- Aucun secret dans ce dépôt. Les clés vivent dans les secrets GitHub du dépôt, et AWS est appelé par connexion OIDC.
- Le corpus d'appels d'offres vient du BOAMP (open data, Licence Ouverte Etalab).
- Le moteur ne pose aucun diagnostic et ne propose aucun traitement. Pour une douleur ou une blessure, il propose des variantes d'exercices puis conseille de consulter un médecin. Les symptômes généraux sont refusés. Ce comportement est testé.

## Limites connues

- Les évaluations reposent sur des jeux de quelques dizaines de questions : les intervalles de confiance sont larges et les petites différences entre variantes ne sont pas significatives.
- Le moteur n'a pas été exposé à un trafic réel d'utilisateurs externes.
- Le corpus d'appels d'offres se limite à quelques secteurs.

## Licence

MIT.
