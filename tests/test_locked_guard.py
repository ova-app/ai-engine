"""Garde-fou (CLAUDE.md règle 2) : aucun script de développement n'ouvre le jeu verrouillé.

Vérification statique : seul `eval/split.py` (et ce test) peut mentionner le mot-clé
du fichier verrouillé. Tout autre script, workflow ou configuration qui le cite fait échouer
le test.
"""

from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
KEYWORD = "lock" + "ed"  # écrit en deux morceaux pour ne pas se signaler lui-même
ALLOWED = {Path("eval/split.py"), Path("tests/test_locked_guard.py")}
SCANNED_SUFFIXES = {".py", ".sh", ".ps1", ".yml", ".yaml", ".toml", ".cfg", ".ini", ".sql"}
SKIPPED_DIRS = {".git", ".venv", "context", "__pycache__", ".ruff_cache", ".pytest_cache"}


def offenders(root: Path) -> list[str]:
    found = []
    for path in root.rglob("*"):
        rel = path.relative_to(root)
        if any(part in SKIPPED_DIRS for part in rel.parts) or rel in ALLOWED:
            continue
        if (
            path.is_file()
            and path.suffix in SCANNED_SUFFIXES
            and KEYWORD in path.read_text(encoding="utf-8", errors="ignore").lower()
        ):
            found.append(rel.as_posix())
    return sorted(found)


def test_aucun_script_ne_cite_le_jeu_verrouille():
    assert offenders(ROOT) == [], "accès au jeu verrouillé hors eval/split.py"


def test_le_garde_fou_detecte_un_acces(tmp_path):
    (tmp_path / "eval").mkdir()
    (tmp_path / "eval" / "split.py").write_text(f"# {KEYWORD}.jsonl", encoding="utf-8")
    (tmp_path / "eval" / "run_eval.py").write_text(
        f'open("eval/sets/x/{KEYWORD.upper()}.jsonl")', encoding="utf-8"
    )
    (tmp_path / "ci.yml").write_text(f"run: cat {KEYWORD}.jsonl", encoding="utf-8")
    (tmp_path / "ok.py").write_text("load_dev('x')", encoding="utf-8")
    assert offenders(tmp_path) == ["ci.yml", "eval/run_eval.py"]


def test_load_dev_n_ouvre_que_dev():
    src = (ROOT / "eval" / "datasets.py").read_text(encoding="utf-8")
    assert '"dev.jsonl"' in src
    assert KEYWORD not in src.lower()
