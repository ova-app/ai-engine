"""Données lues par les outils du coach : séances et séries d'un seul utilisateur.

Le magasin (`Store`) ne voit que l'utilisateur courant. En production, c'est la sécurité par
ligne de Supabase qui l'impose (`app.coach.supabase`, jeton de l'utilisateur). Les dates
d'entrée sont des jours en heure de Paris ; les horodatages lus sont en UTC.
"""

from __future__ import annotations

from dataclasses import dataclass
from datetime import date, datetime, time, timedelta
from decimal import ROUND_HALF_UP, Decimal
from typing import Protocol
from zoneinfo import ZoneInfo

PARIS = ZoneInfo("Europe/Paris")


@dataclass(frozen=True)
class Workout:
    id: str
    started_at: datetime  # UTC, avec fuseau


@dataclass(frozen=True)
class SetRow:
    workout_id: str
    started_at: datetime  # début de la séance, UTC
    code: str | None  # None : exercice personnalisé sans code
    set_type: str
    reps: int
    weight_kg: float
    muscle_group: str | None = None  # champ `muscle_group` du catalogue de l'app


class Store(Protocol):
    def workouts(self, start: datetime | None, end: datetime | None) -> list[Workout]:
        """Séances commencées dans [start, end), triées par date. None : pas de borne."""
        ...

    def sets(self, start: datetime | None, end: datetime | None) -> list[SetRow]:
        """Séries des séances commencées dans [start, end), échauffements compris."""
        ...


def paris_bounds(first: date, last: date) -> tuple[datetime, datetime]:
    """Du premier jour à minuit jusqu'au lendemain du dernier jour à minuit, heure de Paris,
    en UTC. Le dernier jour est inclus."""
    start = datetime.combine(first, time(), PARIS)
    end = datetime.combine(last + timedelta(days=1), time(), PARIS)
    return start.astimezone(ZoneInfo("UTC")), end.astimezone(ZoneInfo("UTC"))


def paris_date(ts: datetime) -> date:
    return ts.astimezone(PARIS).date()


def round_half_up(x: float, digits: int) -> float:
    """Arrondi de la moitié vers l'infini (comme ROUND de SQLite, qui calcule le jeu)."""
    q = Decimal(1).scaleb(-digits)
    return float(Decimal(repr(x)).quantize(q, rounding=ROUND_HALF_UP))
