-- -- Vorbereitungen
-- DROP Table IF EXISTS design.purchases;
-- DROP Table IF EXISTS design.products;

-- DROP TABLE IF EXISTS design.servants;
-- Drop TABLE IF EXISTS design.cats;

-- -- Mastertabelle (MT): unverändert

-- CREATE TABLE design.cats 
-- (
--   cat_id    INT         NOT NULL AUTO_INCREMENT,
--   cat_name  VARCHAR(45) NOT NULL,
--   fur_color VARCHAR(45) NOT NULL,
--   age       TINYINT     NOT NULL,
--   PRIMARY KEY (cat_id)
-- ) COMMENT 'table for cats';

-- -- Struktur: MT
-- DESCRIBE design.cats;

-- -- Inserts: MT 
-- INSERT INTO design.cats (cat_id, cat_name,fur_color, age) VALUES 
-- (DEFAULT, "Grizabella", "white", 1),
-- (DEFAULT, "Alonzo", "grey", 3),
-- (DEFAULT, "Mausi", "striped", 4)
-- ;


-- -- Inhalte: MT

-- SELECT * FROM design.cats;


-- -- Detailtabelle: Verbindung zur MT über Fremdschlüssel
-- CREATE TABLE design.servants
-- (
--   servant_id   INT         NOT NULL AUTO_INCREMENT,
--   servant_name VARCHAR(45) NOT NULL,
--   yrs_served   TINYINT     NOT NULL,
--   cat_id       INT         NOT NULL,
--   PRIMARY KEY (servant_id)
-- ) COMMENT 'table for servants';

-- -- Fremdschlüssel: DT
-- ALTER TABLE design.servants
--   ADD CONSTRAINT FK_cats_TO_servants
--     FOREIGN KEY (cat_id)
--     REFERENCES cats (cat_id);


-- -- wichtig bei 1:1  UNIQUE im fk

-- ALTER TABLE design.servants
--   ADD CONSTRAINT UQ_cat_id UNIQUE (cat_id);


-- -- Struktur: DT
-- DESCRIBE design.servants;

-- -- Inserts: DT
-- INSERT INTO design.servants (servant_id, servant_name, yrs_served, cat_id) VALUES 
-- (DEFAULT, "Monk", 5, 1),
-- (DEFAULT, "Rod", 2, 2),
-- (DEFAULT, "Luke", 10, 3)
-- ;


-- -- Inhalte: DT
-- SELECT * FROM design.servants;
\! cls

# Vorbereitungen

DROP TABLE IF EXISTS design.purchases;
DROP TABLE IF EXISTS design.products;
DROP TABLE IF EXISTS design.servants;
DROP TABLE IF EXISTS design.cats;

# Mastertabelle (MT): unverändert
CREATE TABLE IF NOT EXISTS design.cats
(
  id        INT         NOT NULL AUTO_INCREMENT COMMENT 'PK',
  cat_name  VARCHAR(45) NOT NULL COMMENT 'Katzennamen',
  fur_color VARCHAR(45) NOT NULL COMMENT 'Fellfarbe',
  PRIMARY KEY (cat_id)
) COMMENT 'Katzen';

# Struktur: MT
DESCRIBE design.cats;

# Inserts: MT 
INSERT INTO design.cats (cat_id, cat_name,fur_color) VALUES 
(DEFAULT, "Grizabella", "white"),
(DEFAULT, "Alonzo", "grey"),
(DEFAULT, "Mausi", "striped")
;

# Inhalte: MT
SELECT * FROM design.cats;

# Detailtabelle: Verbindung zur MT über Fremdschlüssel
CREATE TABLE design.servants
(
  servant_id           INT         NOT NULL AUTO_INCREMENT COMMENT 'PK',
  servant_name VARCHAR(45) NOT NULL COMMENT 'Namen der Diener',
  yrs_served   TINYINT     NOT NULL COMMENT 'Dienstzeit',
  cat_id      INT         NOT NULL COMMENT 'FK',
  PRIMARY KEY (servant_id)
) COMMENT 'Diener';

# Fremdschlüssel: DT
ALTER TABLE design.servants
  ADD CONSTRAINT FK_cats_TO_servants
    FOREIGN KEY (cat_id)
    REFERENCES cats (cat_id);

# wichtig bei 1:1 UNIQUE im fk
ALTER TABLE design.servants
  ADD CONSTRAINT UQ_cats_id UNIQUE (cat_id);

# Struktur: DT
DESCRIBE design.servants;

# Inserts: DT
INSERT INTO design.servants (servant_id, servant_name, yrs_served, cat_id) VALUES 
(DEFAULT, "Max", 5, 1),
(DEFAULT, "Maxine", 2, 2),
(DEFAULT, "Mohammed", 10, 3)
;

# Inhalte: DT
SELECT * FROM design.servants;
