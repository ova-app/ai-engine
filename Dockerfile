FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /srv

# Dépendances de production seulement, lues dans pyproject.toml (source unique des versions).
COPY pyproject.toml .
RUN python -c "import tomllib; print('\n'.join(tomllib.load(open('pyproject.toml','rb'))['project']['dependencies']))" > /tmp/requirements.txt \
    && pip install --no-cache-dir -r /tmp/requirements.txt

COPY app ./app

# AWS Lambda Web Adapter : sur Lambda, traduit les événements en requêtes HTTP vers uvicorn.
# Hors Lambda (docker run, ECS), l'extension est inerte.
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:1.1.0 /lambda-adapter /opt/extensions/lambda-adapter
ENV AWS_LWA_PORT=8000 \
    AWS_LWA_READINESS_CHECK_PATH=/health

# Utilisateur sans droits : le conteneur ne tourne pas en root.
RUN useradd --system --no-create-home appuser
USER appuser

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
