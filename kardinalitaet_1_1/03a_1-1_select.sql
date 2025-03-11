
-- -- SELECTS
-- -- DROP VIEW IF EXISTS design.MaxYearsServedView;


-- -- -- Einzeltabellen
-- -- SELECT *
-- -- FROM design.cats;
-- -- SELECT *
-- -- FROM design.servants;

-- -- -- Kreuzprodukt (Kartesisches Produkt)



-- -- -- Inner Join 1 / Gesamte Tabelle
-- -- SELECT *
-- -- FROM design.cats
-- -- INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id;


-- -- -- Inner Join 2 / (Wer dient wem?)
-- -- -- Wer dient Grizabella?
-- -- -- Wem dient X?

-- -- SELECT 
-- --         cats.cat_id,
-- --         cats.cat_name,
-- --         servants.servant_id,
-- --         servants.servant_name
-- -- FROM
-- --     design.cats
-- -- INNER JOIN
-- --     design.servants
-- -- ON
-- --     cats.cat_id = servants.cat_id
-- -- WHERE
-- --     cats.cat_name = "Grizabella";


-- -- -- Inner Join 2a / (Wer dient wem?)
-- -- -- "X ist der Diener von Y"  / Dienstverhältnis
-- -- SELECT  cats.cat_id,
-- --         cats.cat_name,
-- --         servants.servant_id,
-- --         servants.servant_name
-- -- FROM design.cats
-- -- INNER JOIN design.servants
-- -- ON
-- --     cats.cat_id = servants.cat_id;



-- -- -- Inner Join 3 / Dienstzeit
-- -- SELECT servants.yrs_served
-- -- FROM design.cats
-- -- INNER JOIN design.servants
-- -- ON
-- --     cats.cat_id = servants.cat_id;

-- -- -- Inner Join 4 / Dienstzeit 
-- -- -- "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit" // MAX()
-- -- SELECT 
-- --     cats.cat_id, 
-- --     cats.cat_name, 
-- --     servants.servant_id, 
-- --     servants.servant_name, 
-- --     MAX(servants.yrs_served) AS max_years_served
-- -- FROM 
-- --     design.cats
-- -- INNER JOIN 
-- --     design.servants 
-- -- ON 
-- --     cats.cat_id = servants.cat_id
-- -- GROUP BY 
-- --     cats.cat_id, 
-- --     cats.cat_name, 
-- --     servants.servant_id, 
-- --     servants.servant_name
-- -- ORDER BY 
-- --     max_years_served DESC
-- -- ;


-- -- -- 1. LIMIT (QUICK & DIRTY / Nur bei einem MAX-Wert vollständige Lösung)
-- -- SELECT 
-- --     cats.cat_id, 
-- --     cats.cat_name, 
-- --     servants.servant_id, 
-- --     servants.servant_name, 
-- --     MAX(servants.yrs_served) AS max_years_served
-- -- FROM 
-- --     design.cats
-- -- INNER JOIN 
-- --     design.servants 
-- -- ON 
-- --     cats.cat_id = servants.cat_id
-- -- GROUP BY 
-- --     cats.cat_id, 
-- --     cats.cat_name, 
-- --     servants.servant_id, 
-- --     servants.servant_name
-- -- ORDER BY 
-- --     max_years_served DESC
-- -- LIMIT 1;



-- -- -- 2. Subquery

-- -- -- QUERY / MAX()
-- -- SELECT MAX(yrs_served) FROM design.servants;



-- -- -- 3. VIEW / QUERY / MAX() in VIEW gekapselt
-- -- CREATE VIEW design.MaxYearsServedView AS
-- -- SELECT MAX(yrs_served) AS max_years_served
-- -- FROM design.servants;


-- -- SELECTS

-- -- Einzeltabellen
-- SELECT * FROM design.cats;
-- SELECT * FROM design.servants;

-- -- Kreuzprodukt (Kartesisches Produkt)
-- -- SELECT * FROM design.cats JOIN design.servants;

-- -- Inner Join 1 / Gesamte Tabelle
-- SELECT
--     *
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.cat_id = design.servants.cat_id
-- ;


-- -- -- Inner Join 2 / (Wer dient wem?)
-- -- -- Wer dient Grizabella?
-- -- -- Wem dient Sven?
-- -- SELECT
-- --     cat_name AS Katze,
-- --     servant_name AS Diener
-- -- FROM design.cats INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id
-- -- -- Filtern mit WHERE
-- -- -- WHERE cat_name = "Grizabella"
-- -- WHERE servant_name = "Sven"
-- -- ;

-- -- -- Inner Join 2a / (Wer dient wem?)
-- -- -- "X ist der Diener von Y"  / Dienstverhältnis
-- -- SELECT
-- --     CONCAT(servant_name, " ist der Diener von ", cat_name) AS Dienstverhaeltnis
-- -- FROM design.cats INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id
-- -- -- Filtern mit WHERE
-- -- -- WHERE cat_name = "Grizabella"
-- -- WHERE servant_name = "Sven"
-- -- ;

-- -- -- Inner Join 3 / Dienstzeit
-- -- SELECT
-- -- 	servant_name Diener,
-- --     yrs_served AS Dienstzeit
-- -- FROM design.cats INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id
-- -- ;

-- -- -- Inner Join 4 / Dienstzeit 
-- -- -- "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit" // MAX()

-- -- -- 1. LIMIT (QUICK & DIRTY / Nur bei einem MAX-Wert vollständige Lösung)
-- -- SELECT
-- --     -- yrs_served AS Dienstzeit,
-- --     CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
-- -- FROM design.cats INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id
-- -- ORDER BY yrs_served DESC
-- -- LIMIT 1
-- -- ;

-- -- -- 2. Subquery

-- -- -- QUERY / MAX()
-- -- -- SELECT MAX(yrs_served) FROM design.servants;

-- -- SELECT
-- --     yrs_served AS Zeit,
-- --     CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
-- -- FROM design.cats INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id
-- -- WHERE yrs_served = (SELECT MAX(yrs_served) FROM design.servants)
-- -- ;

-- -- -- 3. VIEW / QUERY / MAX() in VIEW gekapselt
-- -- DROP VIEW IF EXISTS design.max_time;

-- -- CREATE VIEW design.max_time AS boo
-- -- SELECT 
-- --     MAX(yrs_served) AS Test
-- -- FROM design.servants;

-- -- SELECT * FROM design.max_time;

-- -- SELECT
-- --     yrs_served AS Zeit,
-- --     CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
-- -- FROM design.cats INNER JOIN design.servants
-- -- ON cats.cat_id = servants.cat_id
-- -- WHERE yrs_served = (SELECT  Test  FROM design.max_time)
-- -- ;

\! cls
# SELECTS

# Einzeltabellen
SELECT * FROM design.cats;
SELECT * FROM design.servants;

# Kreuzprodukt (Kartesisches Produkt)
-- SELECT * FROM design.cats JOIN design.servants;

# Inner Join 1 / Gesamte Tabelle
SELECT
    *
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
;

# Inner Join 2 / (Wer dient wem?)
# Wer dient Grizabella?
# Wem dient X?
SELECT
    cat_name AS "Katze (Herrschaft)",
    servant_name AS Diener
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
-- Filtern mit WHERE
-- WHERE cat_name = "Grizabella"
WHERE servant_name = "Mohammed"
;

# Inner Join 2a / (Wer dient wem?)
# "X ist der Diener von Y"  / Dienstverhältnis
SELECT
    CONCAT(servant_name, " ist der Diener von ", cat_name) AS Dienstverhaeltnis
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
# Filtern mit WHERE
# WHERE cat_name = "Grizabella"
WHERE servant_name = "Maxine"
;

# Inner Join 3 / Dienstzeit
SELECT
	servant_name Diener,
    yrs_served AS Dienstzeit
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
;

# Inner Join 4 / Dienstzeit 
# "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit" // MAX()

-- 1. LIMIT (QUICK & DIRTY / Nur bei einem MAX-Wert vollständige Lösung)
SELECT
    -- yrs_served AS Dienstzeit,
    CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
ORDER BY yrs_served DESC
LIMIT 1
;

# 2. Subquery

# QUERY / MAX()
-- SELECT MAX(yrs_served) FROM design.servants;

SELECT
    yrs_served AS Zeit,
    CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
WHERE yrs_served = (SELECT MAX(yrs_served) FROM design.servants)
;

# 3. VIEW / QUERY / MAX() in VIEW gekapselt
DROP VIEW IF EXISTS design.max_time;

CREATE VIEW design.max_time AS 
SELECT 
    MAX(yrs_served) AS Test
FROM design.servants;

SELECT * FROM design.max_time;

SELECT
    yrs_served AS Zeit,
    CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
FROM design.cats INNER JOIN design.servants
ON design.cats.cat_id = design.servants.cat_id
WHERE yrs_served = (SELECT * FROM design.max_time)
;

