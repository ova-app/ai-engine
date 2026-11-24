# Comprendre ai-engine

Ce document explique le projet pas à pas, sans supposer que tu connais l'IA, AWS, Docker ou Terraform. Chaque mot technique est expliqué la première fois qu'il apparaît. Un glossaire est en fin de document.

État décrit : 24/11/2026.

## 1. Le projet en une phrase

ai-engine est un moteur qui répond à des questions à partir de données précises, et qui prouve par des mesures qu'il répond bien.

Imagine une bibliothécaire. Quand on lui pose une question, elle ne répond pas de mémoire. Elle va chercher le bon livre, lit la bonne page, puis répond en disant d'où vient l'information. Si le livre n'existe pas, elle dit « je ne trouve rien ».

Un modèle de langage (un LLM, comme Claude) est très doué pour rédiger. Mais s'il ne sait pas, il peut inventer. Ce projet lui donne donc le bon dossier avant qu'il écrive, puis vérifie sa réponse.

Le deuxième mot important est « mesures ». Le projet ne dit jamais « ça marche bien ». Il écrit d'abord comment il va mesurer, puis il mesure, puis il publie le chiffre. Tant qu'un chiffre n'est pas mesuré, le dépôt écrit « à mesurer ».

## 2. Les deux clients, et pourquoi un seul moteur

Le moteur sert deux usages très différents.

| | Client A | Client B |
| --- | --- | --- |
| Ce que c'est | Une application mobile de musculation | Un assistant d'appels d'offres publics |
| Ce qu'on interroge | L'historique de séances d'un utilisateur | Des avis de marchés publics français |
| Exemple de question | « Combien de séances ai-je faites depuis le 1er novembre ? » | « Quels marchés de nettoyage sont ouverts en Bretagne ? » |
| Technique principale | Un agent qui appelle des outils | Un RAG (recherche de passages, puis réponse citée) |
| Phase du plan | 1 | 2 |

Les deux exemples de questions sont là pour illustrer, ils ne viennent pas des jeux de référence.

Pourquoi un seul moteur ? Les deux usages ont les mêmes besoins : chercher des données, faire rédiger une réponse, vérifier, mesurer, limiter le coût. On construit ces pièces une fois et on les réutilise.

**Les données restent séparées.** Chaque client a sa propre base. Un client ne lit jamais la base de l'autre. Pour l'application de musculation, le moteur lit avec le jeton de l'utilisateur. La base applique alors une règle de sécurité par ligne (RLS) : chaque utilisateur ne voit que ses propres séances, même si le code se trompe.

## 3. Ce qui se passe quand on pose une question

Le moteur suit toujours quatre étapes.

1. **Comprendre.** Le moteur lit la question et choisit un outil.
2. **Chercher.** L'outil va chercher les bonnes données : séances, exercices ou passages d'avis.
3. **Rédiger.** Le LLM écrit la réponse à partir de ces seules données.
4. **Vérifier.** Le moteur contrôle la réponse, cite ses sources, et refuse ce qui sort de son rôle.

Prenons l'exemple « Combien de séances ai-je faites depuis le 1er novembre ? ».

1. Le moteur voit que la question demande un comptage. Il choisit l'outil « nombre de séances depuis une date ».
2. L'outil interroge la base avec le jeton de l'utilisateur et renvoie un nombre.
3. Le LLM rédige : « Tu as fait N séances depuis le 1er novembre. »
4. Le moteur doit vérifier que le nombre de la phrase est bien celui renvoyé par l'outil. Cette vérification n'est pas encore construite : l'ablation A3 (voir section 6) mesurera si elle améliore les réponses.

Maintenant une question hors du rôle du moteur : « Que prendre contre une douleur au genou ? ». Le moteur ne donne aucun conseil de santé ou de blessure. Il refuse et redirige, par exemple vers un médecin. Ce refus est testé avec 20 questions (`eval/guardrails.jsonl`).

## 4. Les blocs de l'architecture

```text
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

Les blocs, du haut vers le bas :

- **L'API FastAPI.** C'est la porte d'entrée. Une API est un programme qui reçoit des requêtes sur le réseau et renvoie des réponses. FastAPI est la bibliothèque Python qui la fabrique. Aujourd'hui, elle a une seule route, `/health`, qui répond que tout va bien.
- **L'agent.** Il décide quoi faire avec une question. Il utilise l'appel d'outils de l'API du LLM : on donne au modèle une liste d'outils, il choisit lequel appeler.
- **Les outils typés.** Chaque outil a des paramètres précis (par exemple « un exercice » et « deux dates »). Le modèle ne peut pas écrire du SQL libre. Il ne peut donc pas poser une requête dangereuse.
- **Le RAG.** Pour les appels d'offres. Le système découpe les documents en passages, retrouve les plus pertinents (par mots-clés et par vecteurs), les reclasse avec un reranker, applique des filtres, puis fait rédiger une réponse avec des citations.
- **La base de données.** Postgres avec l'extension pgvector, qui sait ranger et comparer des vecteurs (des suites de nombres qui représentent le sens d'un texte). Une base par client.
- **Le LLM.** Claude et Mistral. On les compare pour voir lequel répond le mieux.
- **L'observabilité.** Chaque requête laisse une trace : outils appelés, durée, coût. L'outil prévu est Phoenix.

## 5. Le socle cloud : ce qui existe déjà

Le socle est la partie « installation ». Il est fait. Voici chaque brique, avec une image pour la comprendre.

| Brique | À quoi ça sert | Image |
| --- | --- | --- |
| Docker | Emballe le programme avec tout ce dont il a besoin | Une boîte de transport scellée : elle marche pareil chez toi et chez AWS |
| ECR | Stocke les images Docker sur AWS | Un entrepôt de boîtes |
| Lambda | Lance le programme seulement quand on l'appelle | Un employé payé à la tâche, pas au mois |
| Function URL | Donne à la fonction une adresse HTTPS | Une porte sur la rue |
| Terraform | Décrit l'infrastructure dans des fichiers | Une recette de cuisine que l'on peut relire et rejouer |
| État Terraform | Mémorise ce que Terraform a déjà créé | Le carnet de commandes du cuisinier |
| Bucket S3 | Garde cet état, versionné et chiffré | Un coffre fermé, avec l'historique des carnets |
| OIDC | Permet à GitHub Actions d'entrer sur AWS sans mot de passe stocké | Un badge temporaire, délivré au dernier moment |
| AWS Budgets | Envoie une alerte quand la facture grimpe | Une alarme de facture |

**Pourquoi Lambda ?** On ne paie que quand l'API est appelée. C'est adapté à un budget cible sous environ 20 € par mois. D'autres services (Fargate, App Runner) ne figurent pas dans la liste des services supportés par ce compte.

**Mesures faites sur Lambda** (appel de `/health`, depuis un poste local) :

- Démarrage à froid : 2 703 ms. C'est le temps pris quand la fonction n'a pas servi récemment et doit se préparer.
- Requête à chaud : 2 à 3 ms de traitement.
- Mémoire utilisée : 76 Mo sur 512 Mo alloués.
- Taille de l'image Docker : 48 852 542 octets.

**Sécurité du déploiement.** GitHub Actions obtient des identifiants AWS temporaires. Le rôle ne fonctionne que pour ce dépôt et la branche `main`. Il peut pousser une image dans ECR et mettre à jour le code de la fonction. Il ne peut rien faire d'autre.

**Un point à garder en tête.** L'adresse publique de l'API n'a pas d'authentification pour l'instant. Seule la route `/health` existe. Il faudra une authentification avant d'ajouter une route qui appelle un LLM, car chaque appel coûte de l'argent.

## 6. Mesurer au lieu d'affirmer

Le protocole est dans `EVAL.md`. Il est écrit avant les premiers tests. Quand on le modifie, on ajoute une ligne au journal avec la date et la raison. On ne change jamais une ligne existante pour « faire passer » un résultat.

**Les jeux de référence.** Un jeu est une liste de questions avec la bonne réponse connue. Chaque jeu est coupé en deux par tirage au sort avec une graine fixe :

- **70 % de développement.** On s'en sert pour régler, comparer, déboguer.
- **30 % verrouillé.** On ne le touche qu'une fois, en fin de phase. C'est l'examen final. Si on s'entraînait dessus, la note ne voudrait plus rien dire.

Jeux existants :

| Fonction | Questions | Dont développement |
| --- | --- | --- |
| Recherche d'exercices | 50 | 35 |
| Coach (agent sur l'historique) | 60 | 42 |
| Garde-fous | 20 (15 à refuser, 5 à ne pas refuser) | — |

**Les mesures principales.**

| Mesure | Ce qu'elle dit |
| --- | --- |
| recall@5 | Part des requêtes dont un bon exercice est dans les 5 premiers résultats |
| MRR | Plus le bon résultat arrive tôt, plus la note est haute |
| Exactitude du coach | La valeur donnée est celle que calcule le SQL |
| Refus correct | Le moteur refuse, ne conseille pas, et redirige |
| Fidélité au texte | Chaque affirmation de la réponse est soutenue par les passages fournis |
| Latence et coût | Durée et prix par question |

**Les ablations.** Une ablation consiste à retirer ou changer une seule pièce pour voir si elle sert vraiment. Exemples déclarés pour la phase 1 :

- A1 : recherche d'exercices avec ou sans embeddings (les vecteurs de sens).
- A2 : coach avec Claude ou avec Mistral.
- A3 : à déclarer avant le jour 5. Le candidat est la vérification des chiffres de la réponse contre les résultats des outils.

**Les intervalles de confiance.** Avec 50 à 60 questions, un score bouge d'un jeu à l'autre. On donne donc une fourchette (intervalle de confiance à 95 %, calculé par bootstrap), pas un chiffre isolé. On ne conclut à un gain que si la différence entre deux variantes dépasse le bruit.

**Le LLM juge.** Pour noter la fidélité au texte, un second modèle, différent du générateur, joue le juge. Avant de l'utiliser, le mainteneur note à la main 30 réponses. On compare ses notes à celles du juge.

**Où en sont les seuils.** Les seuils de réussite dans `EVAL.md` sont marqués « proposé ». Ils seront validés après une première mesure sans réglage. **Aucun résultat n'a encore été mesuré.**

## 7. Les règles du projet

Elles sont dans `CLAUDE.md`. Chacune évite un risque précis.

| Règle | Pourquoi |
| --- | --- |
| Évaluation d'abord | On ne peut pas truquer un test écrit après coup |
| Jeu verrouillé intouchable | Sinon la note finale est biaisée |
| Aucun chiffre inventé | Un chiffre faux publié détruit la confiance |
| Dépôt public : aucun secret, aucune donnée réelle | N'importe qui peut lire le dépôt |
| Données isolées par client | Un client ne doit jamais voir les données d'un autre |
| Outils d'agent typés | Le modèle ne doit pas pouvoir écrire du SQL libre |
| Pas de conseil de santé ou de blessure | Une mauvaise réponse peut faire du mal |
| Coût sous contrôle | Une API de LLM peut coûter cher si on ne la surveille pas |

Côté méthode : une tâche = une branche = une PR, jamais de push sur `main`, température 0 pour toute mesure, et la version exacte du modèle notée dans les résultats.

## 8. Où on en est

**Fait :**

- Le socle : API `/health`, Dockerfile, CI (ruff et pytest), protection de `main`, alerte de budget, dépôt ECR, déploiement sur Lambda, connexion OIDC, état Terraform dans S3.
- Les fondations de l'évaluation : `EVAL.md`, jeux de recherche d'exercices et de coach avec leur découpage, comptes de test synthétiques, jeu de garde-fous, grille du juge (écrite, pas encore validée).

**À faire, phase 1 :**

- Recherche d'exercices, sa mesure de base et l'ablation A1.
- Outils typés de l'agent, agent, mesure du coach, ablation A2.
- Déclaration de A3.
- Garde-fous implémentés.
- Script d'évaluation avec intervalles de confiance, et évaluation en CI.
- Traces Phoenix, coût et latence par question.
- Authentification de l'API.
- Validation du juge sur 30 réponses à la main.
- Écran dans l'application.
- Mesure finale sur le jeu verrouillé et résultats dans le README.

**À faire, phase 2 :** jeu de 60 questions d'appels d'offres, ingestion des données BOAMP, RAG complet, ablations B1 à B3, démo web, mesures.

La phase 3 (génération de programmes, bilan de la semaine) est optionnelle.

## 9. Glossaire

| Mot | Définition simple |
| --- | --- |
| LLM | Modèle de langage : un programme qui écrit du texte (Claude, Mistral) |
| Agent | Un programme qui décide quel outil appeler pour répondre |
| Outil typé | Une fonction aux paramètres précis, que l'agent peut appeler |
| RAG | Chercher des passages dans des documents, puis rédiger en s'appuyant dessus |
| Embedding | Suite de nombres qui représente le sens d'un texte |
| Base vectorielle / pgvector | Base qui retrouve les textes de sens proche |
| Reranker | Second tri qui reclasse les résultats par pertinence |
| RLS | Règle de sécurité par ligne : chaque utilisateur ne voit que ses lignes |
| Docker / image | Boîte qui contient le programme et ses dépendances |
| ECR | Entrepôt d'images Docker sur AWS |
| Lambda | Service AWS qui lance du code à chaque appel |
| Démarrage à froid | Délai du premier appel après une période d'inactivité |
| Terraform | Outil qui décrit et crée l'infrastructure à partir de fichiers |
| État Terraform | Fichier qui mémorise ce que Terraform a créé |
| OIDC | Façon de prouver son identité avec un jeton temporaire, sans mot de passe stocké |
| CI | Vérifications automatiques à chaque modification du code |
| recall@5 | Part des requêtes où un bon résultat est dans les 5 premiers |
| MRR | Note qui récompense un bon résultat placé tôt |
| Ablation | Test qui retire ou change une pièce pour voir si elle sert |
| Intervalle de confiance | Fourchette qui dit à quel point une mesure est incertaine |
| Bootstrap | Méthode de rééchantillonnage pour calculer cette fourchette |
| LLM juge | Second modèle qui note les réponses du premier |
| Phoenix | Outil qui garde la trace de chaque requête |
