
-- Vorbereitung

DROP Table IF EXISTS design.products;
DROP TABLE IF EXISTS design.servants;
DROP TABLE IF EXISTS design.purchases;

/* SERVANTS */


-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS design.servants
(
  servant_id   INT         NOT NULL AUTO_INCREMENT,
  servant_name VARCHAR(45) NOT NULL,
  yrs_served   TINYINT     NOT NULL,
  PRIMARY KEY (servant_id)
);

-- Servants: Struktur

DESCRIBE design.servants;
-- Servants: Inserts



-- Servants: Inhalte 
INSERT INTO design.servants (servant_id, servant_name, yrs_served) VALUES (DEFAULT, "Hubert", 5);
INSERT INTO design.servants (servant_id, servant_name, yrs_served) VALUES (DEFAULT, "Arian", 3);

SELECT FROM * design.servants;

/*  PRODUCTS */

-- Products: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS design.products
(
  product_id    INT          NOT NULL AUTO_INCREMENT,
  product_name  VARCHAR(45)  NOT NULL,
  product_price DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (product_id)
);



-- Products: Struktur

DESCRIBE design.products;
-- Products: Inserts

INSERT INTO design.products (product_id, product_name, product_price) VALUES 
(DEFAULT, "Whiskas|Lachs", 2.75),
(DEFAULT, "Whiskas|Huhn", 2.80),
(DEFAULT, "Felix|Jelly", 3.75),
(DEFAULT, "Felix|Sauce", 3.80);


-- Products: Inhalte 
SELECT * FROM design.products;

/*  PURCHASES (Kaufprozesse)*/

-- ServantsProducts (purchases)

CREATE TABLE IF NOT EXISTS design.purchases
(
  purchase_id INT NOT NULL AUTO_INCREMENT,
  servant_id  INT NOT NULL,
  product_id  INT NOT NULL,
  p_time      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (purchase_id)
);

ALTER TABLE design.purchases
  ADD CONSTRAINT FK_servants_TO_purchases
    FOREIGN KEY (servant_id)
    REFERENCES servants (servant_id);

ALTER TABLE design.purchases
  ADD CONSTRAINT FK_products_TO_purchases
    FOREIGN KEY (product_id)
    REFERENCES products (product_id);
-- Purchases: Struktur
DESCRIBE design.purchases;

-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)

INSERT INTO design.purchases (servant_id, product_id) VALUES 
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4);



-- Purchases: Inhalte 
SELECT * FROM design.purchases;