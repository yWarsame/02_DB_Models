\! cls
-- 3a SELECTS 1:1 / n:m

-- 1. JOIN 
-- SELECT
-- 	*
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- INNER JOIN design.cats ON design.cats.id = design.servants.cats_id
-- ;

-- 2. Wer bekommt den Lachs? 
# 2. Wer bekommt den Lachs? 
-- SELECT
-- 	cat_name AS Herrschaft,
--     servant_name AS Diener,
--     product_name AS Produkt
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- INNER JOIN design.cats ON design.cats.id = design.servants.cats_id
-- WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
-- ;

-- 2a. Wer bekommt den Lachs? 
-- Version mit REGEXP, damit auch "Lachsfilet" gefunden wird:
SELECT
    cat_name AS Herrschaft,
    servant_name AS Diener,
    product_name AS Produkt
FROM design.purchases
INNER JOIN design.servants ON servants.id = purchases.servants_id
INNER JOIN design.products ON products.id = purchases.products_id
INNER JOIN design.cats ON cats.id = servants.cats_id
WHERE product_name REGEXP 'Lachs';

 # 2a. Wer bekommt den Lachs? 
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
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- INNER JOIN design.cats ON design.cats.id = design.servants.cats_id
-- WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
-- ;

-- 2b. Variante mit einer VIEW
# 2b. Variante mit einer VIEW
DROP VIEW IF EXISTS design.who_purchased_salmon;
CREATE VIEW  design.who_purchased_salmon AS
	SELECT
		servant_name AS Diener,
		cats_id
	FROM design.purchases
	INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
	INNER JOIN design.products ON design.products.id = design.purchases.products_id
	WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

SELECT * FROM design.who_purchased_salmon;

SELECT
	 concat(cat_name, " bekommt den Lachs.") AS Gourmet
FROM design.cats INNER JOIN design.who_purchased_salmon  --  VIEW wird als Tabelle behandelt
ON design.cats.id = design.who_purchased_salmon.cats_id;




