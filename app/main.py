from fastapi import FastAPI

app = FastAPI(title="ai-engine")


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
