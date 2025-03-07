
-- SELECTS

-- Einzeltabellen
SELECT * FROM design.cats;
SELECT * FROM design.servants;

-- Kreuzprodukt (Kartesisches Produkt)



-- Inner Join 1 / Gesamte Tabelle
SELECT *
FROM design.cats
INNER JOIN design.servants ON cats.cat_id = servants.cat_id;


-- Inner Join 2 / (Wer dient wem?)
-- Wer dient Grizabella?
-- Wem dient X?

SELECT cats.cat_id, cats.cat_name, servants.servant_id, servants.servant_name
FROM design.cats
INNER JOIN design.servants ON cats.cat_id = servants.cat_id
WHERE cats.cat_name = "Grizabella";


-- Inner Join 2a / (Wer dient wem?)
-- "X ist der Diener von Y"  / Dienstverhältnis




-- Inner Join 3 / Dienstzeit


-- Inner Join 4 / Dienstzeit 
-- "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit" // MAX()



-- 1. LIMIT (QUICK & DIRTY / Nur bei einem MAX-Wert vollständige Lösung)




-- 2. Subquery

-- QUERY / MAX()
-- SELECT MAX(yrs_served) FROM design.servants;





-- 3. VIEW / QUERY / MAX() in VIEW gekapselt
