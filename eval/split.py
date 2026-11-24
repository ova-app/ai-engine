"""Découpage 70 % développement / 30 % verrouillé (EVAL.md §2).

Seul module autorisé à écrire ou toucher le jeu verrouillé. Le développement lit les jeux
par `eval.datasets.load_dev`, qui n'ouvre que `dev.jsonl`. Un test (`tests/test_locked_guard.py`)
échoue si un autre fichier du dépôt mentionne le jeu verrouillé.

Disposition d'un jeu : `eval/sets/<nom>/dev.jsonl`, `locked.jsonl`, `manifest.json`.
Le manifeste porte la graine, les ids de chaque partie et l'empreinte sha256 de chaque fichier.
`verify` contrôle l'intégrité sans analyser le contenu du verrouillé (empreinte des octets).

Usage : python -m eval.split <nom> <source.jsonl> --seed <graine>
"""

from __future__ import annotations

import argparse
import hashlib
import json
import random
from collections.abc import Sequence
from pathlib import Path

SETS_DIR = Path(__file__).resolve().parent / "sets"
DEV_FRACTION = 0.7
_DEV = "dev.jsonl"
_LOCKED = "locked.jsonl"
_MANIFEST = "manifest.json"


def split(items: Sequence[dict], seed: int, dev_fraction: float = DEV_FRACTION):
    """Renvoie (dev, verrouillé). Déterministe : tri par id, puis mélange à graine fixe."""
    ids = [it["id"] for it in items]
    if len(set(ids)) != len(ids):
        raise ValueError("ids en double dans le jeu")
    ordered = sorted(items, key=lambda it: it["id"])
    random.Random(seed).shuffle(ordered)
    n_dev = round(len(ordered) * dev_fraction)
    dev = sorted(ordered[:n_dev], key=lambda it: it["id"])
    held = sorted(ordered[n_dev:], key=lambda it: it["id"])
    return dev, held


def _dump(rows: Sequence[dict]) -> bytes:
    text = "".join(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n" for r in rows)
    return text.encode("utf-8")


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def split_and_write(name: str, items: Sequence[dict], seed: int, sets_dir: Path = SETS_DIR):
    dev, held = split(items, seed)
    target = sets_dir / name
    target.mkdir(parents=True, exist_ok=True)
    dev_bytes, held_bytes = _dump(dev), _dump(held)
    (target / _DEV).write_bytes(dev_bytes)
    (target / _LOCKED).write_bytes(held_bytes)
    manifest = {
        "name": name,
        "seed": seed,
        "dev_fraction": DEV_FRACTION,
        "n_total": len(items),
        "dev_ids": [r["id"] for r in dev],
        "locked_ids": [r["id"] for r in held],
        "sha256": {_DEV: _sha256(dev_bytes), _LOCKED: _sha256(held_bytes)},
    }
    (target / _MANIFEST).write_bytes(
        (json.dumps(manifest, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
    )
    return manifest


def verify(name: str, sets_dir: Path = SETS_DIR) -> None:
    """Contrôle d'intégrité : empreintes conformes, parties disjointes, proportions, et
    découpage reproductible depuis les ids et la graine. Ne lit pas le contenu du verrouillé."""
    target = sets_dir / name
    manifest = json.loads((target / _MANIFEST).read_text(encoding="utf-8"))
    for fname in (_DEV, _LOCKED):
        actual = _sha256((target / fname).read_bytes())
        if actual != manifest["sha256"][fname]:
            raise AssertionError(f"{name}/{fname} modifié depuis le découpage")
    dev_ids, held_ids = manifest["dev_ids"], manifest["locked_ids"]
    if set(dev_ids) & set(held_ids):
        raise AssertionError(f"{name} : parties non disjointes")
    if len(dev_ids) + len(held_ids) != manifest["n_total"]:
        raise AssertionError(f"{name} : effectif incohérent")
    pseudo = [{"id": i} for i in dev_ids + held_ids]
    re_dev, re_held = split(pseudo, manifest["seed"], manifest["dev_fraction"])
    if [r["id"] for r in re_dev] != dev_ids or [r["id"] for r in re_held] != held_ids:
        raise AssertionError(f"{name} : découpage non reproductible avec la graine")
    on_disk_dev = [
        json.loads(line)["id"]
        for line in (target / _DEV).read_text(encoding="utf-8").splitlines()
        if line
    ]
    if on_disk_dev != dev_ids:
        raise AssertionError(f"{name} : ids de dev.jsonl différents du manifeste")


def _main(argv: Sequence[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("name")
    parser.add_argument("source", type=Path)
    parser.add_argument("--seed", type=int, required=True)
    args = parser.parse_args(argv)
    rows = [
        json.loads(line) for line in args.source.read_text(encoding="utf-8").splitlines() if line
    ]
    manifest = split_and_write(args.name, rows, args.seed)
    print(
        f"{args.name} : {len(manifest['dev_ids'])} dev, "
        f"{len(manifest['locked_ids'])} verrouillées, graine {args.seed}"
    )


if __name__ == "__main__":
    _main()
