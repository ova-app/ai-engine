-- Catalogue d'exercices pour la recherche. Recréé à chaque ingestion (données dérivées d'un CSV).
CREATE EXTENSION IF NOT EXISTS pg_trgm;

DROP TABLE IF EXISTS exercise_muscles;
DROP TABLE IF EXISTS exercises;

CREATE TABLE exercises (
    code         text PRIMARY KEY,
    name_fr      text NOT NULL,
    name_en      text NOT NULL,
    equipment    text NOT NULL,           -- matériel principal
    -- Textes repliés (minuscules, sans accents), calculés par app.exercises.text.fold.
    name_fr_fold text NOT NULL,
    name_en_fold text NOT NULL,
    meta_fold    text NOT NULL,           -- muscles, matériel, étiquettes
    body_fold    text NOT NULL,           -- description et points clés (vide si absents)
    tsv          tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('french', name_fr_fold || ' ' || name_en_fold), 'A')
        || setweight(to_tsvector('french', meta_fold), 'B')
        || setweight(to_tsvector('french', body_fold), 'C')
    ) STORED
);
CREATE INDEX exercises_tsv_idx ON exercises USING gin (tsv);
CREATE INDEX exercises_name_fr_trgm ON exercises USING gin (name_fr_fold gin_trgm_ops);
CREATE INDEX exercises_name_en_trgm ON exercises USING gin (name_en_fold gin_trgm_ops);

CREATE TABLE exercise_muscles (
    code   text NOT NULL REFERENCES exercises(code) ON DELETE CASCADE,
    muscle text NOT NULL,
    role   text NOT NULL CHECK (role IN ('primary', 'secondary')),
    PRIMARY KEY (code, muscle, role)
);
