"""Chargement des jeux de référence pour le développement.

N'ouvre que la partie développement (`dev.jsonl`). La partie fermée n'est accessible que
par `eval/split.py`, en fin de phase (EVAL.md §2, CLAUDE.md règle 2).
"""

from __future__ import annotations

import json
from pathlib import Path

SETS_DIR = Path(__file__).resolve().parent / "sets"


def load_dev(name: str, sets_dir: Path = SETS_DIR) -> list[dict]:
    path = (sets_dir / name / "dev.jsonl").resolve()
    if path.parent.parent != sets_dir.resolve():
        raise ValueError(f"nom de jeu invalide : {name!r}")
    return [json.loads(line) for line in path.read_text(encoding="utf-8").splitlines() if line]
