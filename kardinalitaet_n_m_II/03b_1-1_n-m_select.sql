-- 3b SELECTS 1:1 / n:m

-- 1. JOIN 
-- SELECT
--  	*
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- INNER JOIN design.cats ON design.cats.id = design.servants.cats_id
-- ;



-- 2. JOIN mit allen Inhalts-Feldern als VIEW
-- - DROP VIEW IF EXISTS content_view;
-- CREATE OR REPLACE VIEW content_view AS
-- SELECT
-- 	servant_name, 
--     yrs_served,
-- 	product_name,
--     product_price,
-- 	cat_name, 
--     fur_color
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- INNER JOIN design.cats ON design.cats.id = design.servants.cats_id
-- ;
-- SELECT * FROM content_view;

-- 2. Wer bekommt den Lachs? 
-- SELECT
-- 	cat_name AS Herrschaft,
--     servant_name AS Diener,
--     product_name AS Produkt
-- FROM content_view -- eine VIEW wird wie eine Tabelle behandelt
-- WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
-- ;

-- 2a. Wer bekommt den Lachs? 

-- SELECT
-- 	concat(
-- 			servant_name, 
--             " ist der Diener von ", 
--             cat_name,", er kauft ",
--             product_name, 
--             "- somit bekommt ",
--             cat_name, " den Lachs."
--             ) 
--             AS "Wer bekommt den Lachs?"
-- FROM content_view
-- WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
-- ;

-- 2b. Wer bekommt den Lachs? 
SELECT
	 concat(cat_name, " bekommt den Lachs.") AS Gourmet
FROM content_view
WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...


