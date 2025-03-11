
-- Vorbereitung
\! cls
USE design;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS servants;
DROP TABLE IF EXISTS cats;

/* Cats */

-- Mastertabelle: unverändert
CREATE TABLE IF NOT EXISTS cats
(
  cat_id INT NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  PRIMARY KEY (cat_id)
);

-- Struktur: MT
DESCRIBE design.cats;

-- Inserts: MT (Mastertable)
INSERT INTO cats (cat_id, cat_name,fur_color) VALUES (DEFAULT, "Grizabella", "white");
INSERT INTO cats (cat_id, cat_name,fur_color) VALUES (DEFAULT, "Alonzo", "grey");
INSERT INTO cats (cat_id, cat_name,fur_color) VALUES (DEFAULT, "Mausi", "striped");


/* SERVANTS */

-- Detailtabelle: Verbindung zur MT über Fremdschlüssel
CREATE TABLE IF NOT EXISTS servants
(
  servant_id INT NOT NULL AUTO_INCREMENT,
  servant_name VARCHAR(45) NOT NULL,
  yrs_served   TINYINT NOT NULL,
  cat_id      INT     NOT NULL,
  PRIMARY KEY (servant_id)
);

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
INSERT INTO servants (servant_id, servant_name, yrs_served, cat_id) VALUES (DEFAULT, "Hasan", 5, 1);
INSERT INTO servants (servant_id, servant_name, yrs_served, cat_id) VALUES (DEFAULT, "Dimitrij", 2, 2);
INSERT INTO servants (servant_id, servant_name, yrs_served, cat_id) VALUES (DEFAULT, "Benjamin", 4, 3);


-- Servants: Struktur
DESCRIBE design.servants;


/*  PRODUCTS */

-- Products: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS products
(
  product_id            INT          NOT NULL AUTO_INCREMENT,
  product_name  VARCHAR(45)  NOT NULL,
  product_price DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (product_id)
);

-- Products: Struktur
DESCRIBE design.products;

-- Products: Inserts
INSERT INTO products (product_id, product_name, product_price) VALUES (DEFAULT, "Whiskas|Lachs", 2.75);
INSERT INTO products (product_id, product_name, product_price) VALUES (DEFAULT, "Whiskas|Huhn", 2.80);
INSERT INTO products (product_id, product_name, product_price) VALUES (DEFAULT, "Felix|Jelly", 3.75);
INSERT INTO products (product_id, product_name, product_price) VALUES (DEFAULT, "Felix|Sauce", 3.80);

-- Products: Inhalte 
SELECT * FROM design.products;

/*  PURCHASES (Kaufprozesse)*/

-- ServantsProducts (purchases)
CREATE TABLE IF NOT EXISTS purchases
(
  servant_id INT NOT NULL,
  product_id INT NOT NULL
);

ALTER TABLE purchases
  ADD CONSTRAINT FK_servants_TO_purchases
    FOREIGN KEY (servant_id)
    REFERENCES servants (servant_id);

ALTER TABLE purchases
  ADD CONSTRAINT FK_products_TO_purchases
    FOREIGN KEY (product_id)
    REFERENCES products (product_id);

-- Purchases: Struktur
DESCRIBE design.purchases;

-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)
INSERT INTO purchases (servant_id, product_id) VALUES (1, 1);
INSERT INTO purchases (servant_id, product_id) VALUES (1, 3);
INSERT INTO purchases (servant_id, product_id) VALUES (2, 2);
INSERT INTO purchases (servant_id, product_id) VALUES (2, 3);
INSERT INTO purchases (servant_id, product_id) VALUES (2, 4);
INSERT INTO purchases (servant_id, product_id) VALUES (3, 4);


-- Purchases: Inhalte 
SELECT * FROM design.purchases;
