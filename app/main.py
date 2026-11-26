from fastapi import FastAPI

from app.coach.api import router as coach

app = FastAPI(title="ai-engine")
app.include_router(coach)


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
