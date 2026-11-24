# Pousser l'image de l'API dans ECR (à la main)

Procédure manuelle, avant l'automatisation par GitHub Actions. Prérequis : Docker, AWS CLI, connexion par `aws login --region eu-north-1`.

## 1. Construire l'image

```bash
docker build --provenance=false --sbom=false -t ai-engine-api:local .
```

`--provenance=false --sbom=false` : sans ces options, Docker ajoute des manifestes d'attestation. Lambda peut refuser ce format. Avec elles, l'image est un manifeste OCI simple.

## 2. Tester en local

```bash
docker run -d --rm --name ai-test -p 8000:8000 ai-engine-api:local
curl http://localhost:8000/health   # {"status":"ok"}
docker stop ai-test
```

## 3. Se connecter à ECR

```bash
REGION=eu-north-1
REPO_URI=$(aws ecr describe-repositories --repository-names ai-engine-api --region $REGION --query "repositories[0].repositoryUri" --output text)
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin "${REPO_URI%%/*}"
```

Le jeton est temporaire (12 h).

### Windows : « The stub received bad data »

Le gestionnaire d'identifiants de Windows refuse le jeton, trop long. Contournement : un dossier de configuration Docker temporaire, hors du dépôt.

```bash
mkdir -p "$TMP/docker-cfg"
echo '{"auths":{"placeholder":{}}}' > "$TMP/docker-cfg/config.json"
export DOCKER_CONFIG="$(cygpath -w "$TMP/docker-cfg")"   # Git Bash
# ... login et push ...
rm -rf "$TMP/docker-cfg"
```

L'entrée `auths` factice empêche Docker de reprendre le gestionnaire natif. Le jeton est écrit en clair dans ce dossier : le supprimer après le push.

## 4. Étiqueter et pousser

```bash
docker tag ai-engine-api:local "$REPO_URI:v0.1.0"
docker push "$REPO_URI:v0.1.0"
```

## 5. Vérifier

```bash
aws ecr describe-images --repository-name ai-engine-api --region eu-north-1 \
  --query "imageDetails[].{tags:imageTags,type:imageManifestMediaType,octets:imageSizeInBytes}"
```

Résultat constaté pour `v0.1.0` : `application/vnd.oci.image.manifest.v1+json`, 48 852 542 octets.
