-- 03. SELECTS / Servants, Products, Purchases

-- -- Einzeltabellen
-- SELECT * FROM design.cats;
-- SELECT * FROM design.servants;
-- -- Inner Join 1 / Kombi (servants / products / purchases)

-- SELECT * FROM design.cats JOIN design.servants;

-- Welche Artikel hat X/Y gekauft?





-- Wieviele Produkte hat X gekauft?
-- "X kauft Y Produkte"





-- Wieviel Geld hat jeder Diener ausgegeben?





-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE





-- Wie oft wurde das Produkt X gekauft?




-- Welche Umsätze hatte das Produkt X?
\! cls

# 03. SELECTS / Servants, Products, Purchases

# Einzeltabellen
SELECT * FROM design.servants;
SELECT * FROM design.products;
SELECT * FROM design.purchases;

# Inner Join 1 / Kombi (servants / products / purchases)
SELECT
    *
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
;

-- # Welche Artikel hat X/Y gekauft?
SELECT
    servant_name AS Diener,
    product_name AS "Von X gekaufte Produkte:",
    CONCAT(servant_name, " kauft ", product_name, ".") AS Kaufhandlung
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
-- WHERE servant_name = "Hasan"
-- WHERE servant_name LIKE "%ij"

;

-- # Wieviele Produkte hat X gekauft?
-- # "X kauft Y Produkte"
SELECT
    CONCAT(servant_name, " kauft ", COUNT(product_name), " Produkte.") AS Kaufhandlung
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
GROUP BY servant_name -- organisch / aggregiert
-- -- WHERE servant_name = "Hasan"
-- HAVING servant_name LIKE "%ij"
;

-- # Wieviel Geld hat jeder Diener ausgegeben?
SELECT
    servant_name AS Diener,  -- organisch
    COUNT(servant_name) AS Artikelanzahl, -- aggregiert / f()
    SUM(product_price) AS "Gesamtkosten (Euro)" -- aggregiert / f()
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
WHERE servant_name = "Dimitrij"
GROUP BY servant_name
;

-- -- # Wer hat das Produkt X gekauft?  
-- -- # Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- -- # Spalten --> Diener / Produkt
-- -- # WHERE / LIKE
SELECT
	servant_name AS Diener,
    product_name AS "Irgendwas mit Sauce oder Lachs"
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
-- WHERE product_name LIKE "%Lachs%" OR product_name LIKE "%Sauce%" -- IN() ??
WHERE product_name LIKE "%Huhn%"
;

-- -- # Wie oft wurde das Produkt X gekauft?
SELECT
	product_name AS Produkte,
    COUNT(product_name) AS Anzahl
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
GROUP BY product_name
ORDER BY Anzahl DESC
;

-- -- -- Welche Umsätze hatte das Produkt X?
SELECT
	product_name AS Produkte, -- nicht aggr.
    COUNT(product_name) AS Anzahl, -- aggr.
    SUM(product_price) AS Umsaetze-- aggr. // count() * price
FROM design.purchases
INNER JOIN design.servants ON design.servants.servant_id = design.purchases.servant_id
INNER JOIN design.products ON design.products.product_id = design.purchases.product_id
GROUP BY product_name
ORDER BY Umsaetze DESC
;
