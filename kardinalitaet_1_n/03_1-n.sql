
-- Vorbereitung

DROP TABLE IF EXISTS design.catmoms;
DROP TABLE IF EXISTS design.kittens;



-- MT: catmoms


CREATE TABLE catmoms
(
  catmom_id        INT         NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  PRIMARY KEY (catmoms_id)
);



ALTER TABLE kittens
  ADD CONSTRAINT FK_catmoms_TO_kittens
    FOREIGN KEY (catmoms_id)
    REFERENCES catmoms (catmoms_id);

-- MT: Struktur

DESCRIBE design.catmoms;

-- MT: Inserts


-- MT: Inhalte
SELECT * FROM design.catmoms

-- DT: kittens
CREATE TABLE kittens
(
  kitten_id          INT         NOT NULL AUTO_INCREMENT,
  kitten_name VARCHAR(45) NOT NULL,
  fur_color   VARCHAR(45) NOT NULL,
  catmoms_id  INT         NOT NULL,
  PRIMARY KEY (kitten_id)
);

-- DT: Struktur
DESCRIBE design.kittens;


-- DT: Inserts


-- DT: Inhalte

SELECT * FROM design.kittens;
