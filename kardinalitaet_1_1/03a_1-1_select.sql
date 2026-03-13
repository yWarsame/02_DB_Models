-- \! cls
-- # SELECTS

-- # Einzeltabellen
-- SELECT * FROM design.cats;
-- SELECT * FROM design.servants;


-- # Kreuzprodukt (Kartesisches Produkt)
-- SELECT * FROM design.cats JOIN design.servants;

-- -- Inner Join 1 / Gesamte Tabelle
-- SELECT
--     *
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- ;

-- SELECT
--     cat_name AS "Katze (Herrschaft)",
--     servant_name As Diener
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- -- Filtern mit WHERE
-- -- WHERE cat_name = "Grizabella"
-- WHERE servant_name = "Maxl"
-- ;

-- SELECT
--     CONCAT(servant_name, " ist der Diener von ", cat_name) AS Dienstverhaeltnis
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- # Filtern mit WHERE
-- # WHERE cat_name = "Grizabella"
-- WHERE servant_name = "Maxine"
-- ;

-- SELECT
-- 	servant_name Diener,
--     yrs_served AS Dienstzeit
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- ;
-- SELECT
--     -- yrs_served AS Dienstzeit,
--     CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- ORDER BY yrs_served DESC
-- LIMIT 1
-- ;


-- SELECT
--     yrs_served AS Zeit,
--     CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- WHERE yrs_served = (SELECT MAX(yrs_served) FROM design.servants)
-- ;


-- DROP VIEW IF EXISTS design.max_time;

-- CREATE VIEW design.max_time AS 
-- SELECT 
--     MAX(yrs_served) AS Test
-- FROM design.servants;

-- SELECT * FROM design.max_time;

-- SELECT
--     yrs_served AS Zeit,
--     CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der laengsten Dienstzeit") AS Dienstzeit
-- FROM design.cats INNER JOIN design.servants
-- ON design.cats.id = design.servants.cats_id
-- WHERE yrs_served = (SELECT * FROM design.max_time)
-- ;


