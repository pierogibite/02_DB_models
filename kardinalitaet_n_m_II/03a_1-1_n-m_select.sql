-- 3b SELECTS 1:1 / n:m

-- 1. JOIN 
SELECT
	*
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
INNER JOIN design.cats ON design.cats.cat_id = design.servants.cat_id
;

-- 2. Wer bekommt den Lachs? 
SELECT
	cat_name AS Herrschaft,
    servant_name AS Diener,
    product_name AS Produkt
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
INNER JOIN design.cats ON design.cats.cat_id = design.servants.cat_id
WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

-- 2a. Wer bekommt den Lachs? 
SELECT
	concat(
			servant_name, 
            " ist der Diener von ", 
            cat_name,", er kauft ",
            product_name, 
            "- somit bekommt ",
            cat_name, " den Lachs."
            ) 
            AS "Wer bekommt den Lachs?"
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id  = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
INNER JOIN design.cats ON design.cats.cat_id = design.servants.cat_id
WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

-- 2b. Variante mit einer VIEW
DROP VIEW IF EXISTS design.who_purchased_salmon;
CREATE VIEW  design.who_purchased_salmon AS
	SELECT
		servant_name AS Diener,
		cat_id
	FROM design.purchases
	INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
	INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
	WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

SELECT * FROM design.who_purchased_salmon;

SELECT
	 concat(cat_name, " bekommt den Lachs.") AS Gourmet
FROM design.cats INNER JOIN design.who_purchased_salmon  --  VIEW wird als Tabelle behandelt
ON design.cats.cat_id = design.who_purchased_salmon.cat_id;



