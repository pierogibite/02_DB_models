-- Vorbereitungen

DROP TABLE IF EXISTS design.servants,  design.cats;:

-- Mastertabelle (MT): unverändert

CREATE TABLE cats IF NOT EXISTS cats;
(
  cat_id    INT         NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  age       TINYINT     NOT NULL,
  PRIMARY KEY (cat_id)
) COMMENT 'table for cats';

-- Struktur: MT
DESCRIBE design.cats;

-- Inserts: MT 
INSERT INTO design.cats (id, cat_name,fur_color) VALUES 
(DEFAULT, "Grizabella", "white"),
(DEFAULT, "Alonzo", "grey"),
(DEFAULT, "Mausi", "striped")
;


-- Inhalte: MT

SELECT * FROM design.cats;


-- Detailtabelle: Verbindung zur MT über Fremdschlüssel
CREATE TABLE servants IF NOT EXISTS servants
(
  servant_id   INT         NOT NULL AUTO_INCREMENT,
  servant_name VARCHAR(45) NOT NULL,
  yrs_served   TINYINT     NOT NULL,
  cat_id       INT         NOT NULL,
  PRIMARY KEY (servant_id)
) COMMENT 'table for servants';

-- Fremdschlüssel: DT
ALTER TABLE servants
  ADD CONSTRAINT FK_cats_TO_servants
    FOREIGN KEY (cat_id)
    REFERENCES cats (cat_id);


-- wichtig bei 1:1  UNIQUE im fk

ALTER TABLE servants
  ADD CONSTRAINT UQ_cat_id UNIQUE (cat_id);


-- Struktur: DT
DESCRIBE design.servants;

-- Inserts: DT


-- Inhalte: DT
SELECT * FROM design.servants;
