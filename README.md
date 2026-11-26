# ai-engine

Un moteur IA unique (service Python sur AWS) prévu pour deux clients aux données séparées :

1. **Un assistant dans une application mobile de musculation** : un agent répond aux questions d'un utilisateur sur ses propres séances, et une recherche sémantique retrouve des exercices.
2. **Une recherche dans des appels d'offres publics** : retrouver les passages d'avis de marchés publics français, avec filtres.

Le projet est construit pour être mesuré : le protocole d'évaluation est écrit avant les premiers tests, et aucun chiffre n'est publié sans avoir été mesuré.

> **Statut : en construction.** Le périmètre a été réduit le 26/11/2026 pour limiter les coûts (journal de [`EVAL.md`](EVAL.md)). Les résultats ci-dessous portent sur les jeux de développement. La route du coach n'est pas déployée.

## Ce que fait le moteur

Pour une question sur l'historique, le coach :

1. comprend la demande et choisit un outil ;
2. lit les séances de l'utilisateur ; les calculs sont faits en Python, pas par le modèle ;
3. rédige une réponse à partir des résultats d'outils et cite les séances utilisées ;
4. applique ses règles sur la douleur, les produits et le hors-sujet.

Les recherches d'exercices et d'appels d'offres renvoient des résultats classés. La recherche d'appels d'offres ne rédige pas de réponse.

## Architecture

```
Client A (app mobile)        Client B (appels d'offres)
        │                            │
        └──────────┬─────────────────┘
                   ▼
        ┌────────────────────────┐
        │  API FastAPI (Docker)  │  AWS
        │  coach · recherche ·   │
        │  garde-fous · journaux │
        └───┬──────────┬─────────┘
            │          │
            ▼          ▼
          LLM      Postgres + pgvector
   (Claude, Mistral)  (une base par client)
```

- **Isolation des données.** Le moteur lit la base du client A avec le jeton de l'utilisateur, jamais avec une clé de service. La sécurité par ligne (RLS) s'applique, et chaque requête filtre en plus sur l'identifiant de l'utilisateur : la RLS de l'application laisse lire les séances publiques d'autres comptes. Chaque client a sa propre base.
- **Agent.** Appel d'outils natif de l'API du LLM, avec des outils typés (pas de SQL libre généré par le modèle).
- **Route.** `POST /coach/question` : jeton vérifié, liste de comptes autorisés vide par défaut, longueur de question et coût par requête plafonnés.
- **Recherche d'appels d'offres (à venir).** Extraction, découpage, recherche hybride (mots-clés et vecteurs), reranker, filtres. Une ablation de base sans embeddings sert de point de comparaison.
- **Observabilité.** Une ligne de journal par requête : outils appelés, tours, latence, coût. Ni jeton, ni question, ni réponse.

## Stack

Python · FastAPI · Docker · AWS (ECR, Lambda en image Docker) · Terraform · GitHub Actions · Postgres + pgvector (Supabase) · API Claude et Mistral

## Évaluation

Le protocole complet est dans [`EVAL.md`](EVAL.md), écrit avant le premier test. Ses changements sont au journal, en bas.

| Fonction | Jeu de référence | Mesures |
|---|---|---|
| Recherche d'exercices | 50 requêtes, bons exercices attendus | recall@5, MRR |
| Agent sur l'historique | 60 questions sur 3 comptes de test, réponse calculée en SQL ; 20 questions « jambes » à part | exactitude face au SQL, séances citées justes |
| Garde-fous | 20 questions : 9 refus et 11 réponses attendus | refus correct, échecs sur les réponses attendues |
| Appels d'offres | 60 questions avec passage attendu (à venir) | recall@5 |
| Toutes | chaque requête | latence, coût par question |

Règles :
- Intervalles de confiance à 95 % par bootstrap ; les comparaisons entre variantes utilisent un bootstrap apparié.
- Trois ablations au maximum par phase, choisies à l'avance.
- Une partie des jeux est verrouillée : elle ne sert jamais à régler le système.
- En intégration continue, les tests sans appel payant tournent à chaque pull request. L'évaluation payante se lance à la demande ou quand `app/coach/` change ; elle n'est pas encore automatisée.

## Résultats

Jeux de **développement** seulement, mesures du 26/11/2026. Fichiers dans [`eval/results/`](eval/results/). Les jeux verrouillés ne sont pas encore mesurés.

| Fonction | Mesure | Développement | IC 95 % | Verrouillé |
|---|---|---|---|---|
| Recherche d'exercices (35 requêtes) | recall@5 | 0,943 | 0,857 à 1,00 | à mesurer |
| Recherche d'exercices (35 requêtes) | MRR | 0,880 | 0,785 à 0,962 | à mesurer |
| Agent sur l'historique (42 questions) | exactitude | 1,00 | 1,00 à 1,00 | à mesurer |
| Agent, jeu « jambes » (14 questions) | exactitude | 1,00 | 1,00 à 1,00 | à mesurer |
| Garde-fous (20 questions, notes à la main) | refus correct | 9 sur 9 | non calculé | pas de découpage |
| Garde-fous (20 questions, notes à la main) | échecs sur les réponses attendues | 0 sur 11 | non calculé | pas de découpage |
| Appels d'offres | recall@5 | à mesurer | | à mesurer |

À lire avec prudence :
- Les consignes du coach ont été écrites au vu des 20 questions de garde-fous : ces deux taux sont optimistes.
- Les outils typés font tous les calculs : le jeu du coach ne discrimine plus à ce niveau.
- Dans le jeu « jambes », 8 réponses attendues sur 14 valent 0.

## Coût

Modèle du coach : `claude-sonnet-5-5`, effort `low`.

| Mesure | Valeur |
|---|---|
| Coach, par question (42 questions, avant le point de cache) | 0,0142 $ |
| Coach, latence médiane / 95e centile (même mesure) | 3,67 s / 5,80 s |
| Coach, par question avec le point de cache, jeu entier | à mesurer (essai sur 3 questions : −38 %) |
| Recherche d'exercices, par requête | à mesurer |

## Plan

| Phase | Contenu | Statut |
|---|---|---|
| 1 | Socle (API, Docker, Terraform, CI), recherche d'exercices, agent sur l'historique, évaluation | en cours : route du coach essayée sur un projet de test, non déployée |
| 2 | Recherche dans les appels d'offres, sans génération de réponse | à venir |

L'écran dans l'application et la génération de programmes sont retirés du périmètre.

## Données et confidentialité

- Les jeux de référence et les comptes de test sont synthétiques ou appartiennent au mainteneur. Aucune donnée d'un tiers n'est envoyée à un LLM.
- Aucun secret dans ce dépôt. Les clés vivent dans les secrets GitHub du dépôt, et AWS est appelé par connexion OIDC.
- Le corpus d'appels d'offres viendra du BOAMP (open data, Licence Ouverte Etalab).
- Le moteur ne pose aucun diagnostic et ne propose aucun traitement. Pour une douleur ou une blessure, il propose des variantes d'exercices puis conseille de consulter un médecin. Les symptômes généraux sont refusés. Ce comportement est testé.

## Limites connues

- Les évaluations reposent sur des jeux de quelques dizaines de questions : les intervalles de confiance sont larges et les petites différences entre variantes ne sont pas significatives.
- Le moteur n'a pas été exposé à un trafic réel d'utilisateurs externes.
- Le projet de test utilise une version réduite du schéma de l'application.
- Pas de limite de débit par utilisateur.
- Le muscle principal n'est connu que pour les 33 exercices des comptes synthétiques ; les autres sont comptés « inconnu ».
- Le corpus d'appels d'offres sera limité à quelques secteurs.

## Licence

MIT.
