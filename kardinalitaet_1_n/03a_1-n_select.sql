
-- 04 SELECTS

-- Einzeltabellen
SELECT *
FROM
    design.catmoms;

SELECT *
FROM design.kittens;

-- Inner Join 1 / Gesamte Kombi-Tabelle
SELECT *
FROM design.catmoms
INNER JOIN design.kittens
ON catmoms.catmom_id = kittens.kitten_id;

-- Inner Join 2 / Verwandschaft
-- "X ist die Mutter von Y"
SELECT catmoms.catmom_id, catmoms.cat_name, kittens.kitten_id, kittens.kitten_name
FROM design.catmoms
INNER JOIN design.kittens
ON catmoms.catmom_id = kittens.kitten_id;


-- Inner Join 3 / Wieviel Kinder haben die Katzen?
SELECT COUNT(catmoms_id) AS CatMomsOnTheRoad FROM design.kittens;