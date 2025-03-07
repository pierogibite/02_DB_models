
-- Vorbereitung

DROP TABLE IF EXISTS design.catmoms;
DROP TABLE IF EXISTS design.kittens;

-- MT: catmoms

CREATE TABLE design.catmoms
(
  catmom_id        INT         NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  PRIMARY KEY (catmom_id)
);


-- MT: Struktur

DESCRIBE design.catmoms;

-- MT: Inserts
INSERT INTO design.catmoms (catmom_id, cat_name, fur_color) VALUES 
(DEFAULT, "Grizabella", "white"),
(DEFAULT, "Mausi", "striped");

-- MT: Inhalte
SELECT * FROM design.catmoms;

-- DT: kittens
CREATE TABLE design.kittens
(
  kitten_id          INT         NOT NULL AUTO_INCREMENT,
  kitten_name VARCHAR(45) NOT NULL,
  fur_color   VARCHAR(45) NOT NULL,
  catmoms_id  INT         NOT NULL,
  PRIMARY KEY (kitten_id)
);

ALTER TABLE design.kittens
  ADD CONSTRAINT FK_catmoms_TO_kittens
    FOREIGN KEY (catmoms_id)
    REFERENCES catmoms (catmom_id);
-- DT: Struktur
DESCRIBE design.kittens;

-- DT: Inserts
INSERT INTO design.kittens (kitten_id, kitten_name, fur_color, catmoms_id) VALUES 
(DEFAULT, "Grizzi_1", "white", 1),
(DEFAULT, "Grizzi_2", "white", 1),
(DEFAULT, "Mausini", "striped", 2);
-- DT: Inhalte

SELECT * FROM design.kittens;
