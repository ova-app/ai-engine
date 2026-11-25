"""Embeddings par l'API Mistral (`mistral-embed`, 1024 dimensions), sans dépendance externe."""

from __future__ import annotations

import json
import os
import urllib.request
from collections.abc import Callable, Sequence
from dataclasses import dataclass

URL = "https://api.mistral.ai/v1/embeddings"
MODEL = "mistral-embed"
DIM = 1024
BATCH = 64


@dataclass
class EmbeddingResult:
    vectors: list[list[float]]
    tokens: int  # jetons facturés, d'après `usage` de la réponse
    model: str  # modèle renvoyé par l'API


Embedder = Callable[[Sequence[str]], EmbeddingResult]


class MistralEmbedder:
    def __init__(self, api_key: str | None = None, timeout: float = 60):
        self.api_key = api_key or os.environ["MISTRAL_API_KEY"]
        self.timeout = timeout

    def _post(self, texts: Sequence[str]) -> dict:
        request = urllib.request.Request(
            URL,
            data=json.dumps({"model": MODEL, "input": list(texts)}).encode("utf-8"),
            headers={
                "Authorization": f"Bearer {self.api_key}",
                "Content-Type": "application/json",
            },
        )
        with urllib.request.urlopen(request, timeout=self.timeout) as response:
            return json.load(response)

    def __call__(self, texts: Sequence[str]) -> EmbeddingResult:
        vectors, tokens, model = [], 0, MODEL
        for start in range(0, len(texts), BATCH):
            body = self._post(texts[start : start + BATCH])
            vectors += [d["embedding"] for d in sorted(body["data"], key=lambda d: d["index"])]
            tokens += body["usage"]["prompt_tokens"]
            model = body.get("model", model)
        return EmbeddingResult(vectors, tokens, model)


def to_pgvector(vector: Sequence[float]) -> str:
    return "[" + ",".join(repr(float(x)) for x in vector) + "]"
