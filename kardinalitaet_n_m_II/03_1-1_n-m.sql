-- \! cls

-- -- Vorbereitung
-- SET NAMES utf8mb4;

-- DROP TABLE IF EXISTS design.purchases;
-- DROP TABLE IF EXISTS design.servants;
-- DROP TABLE IF EXISTS design.products;
-- DROP TABLE IF EXISTS design.cats;

-- /* Cats */
-- -- Mastertabelle: unverändert
-- CREATE TABLE IF NOT EXISTS design.cats
-- (
--   id INT NOT NULL AUTO_INCREMENT,
--   cat_name VARCHAR(45) NOT NULL,
--   fur_color VARCHAR(45) NOT NULL,
--   PRIMARY KEY (id)
-- );

-- -- Struktur: MT
-- DESCRIBE design.cats;

-- -- Inserts: MT (Mastertable)
-- INSERT INTO design.cats (id, cat_name, fur_color) VALUES 
-- (DEFAULT, "Whiskers", "brown"),
-- (DEFAULT, "Mittens", "black"),
-- (DEFAULT, "Simba", "orange");

-- -- Inhalte: MT
-- SELECT * FROM design.cats;

-- /* SERVANTS */
-- -- Detailtabelle: Verbindung zur MT über Fremdschlüssel
-- CREATE TABLE IF NOT EXISTS design.servants
-- (
--   id INT NOT NULL AUTO_INCREMENT,
--   servant_name VARCHAR(45) NOT NULL,
--   yrs_served INT NOT NULL,
--   cats_id INT NOT NULL,
--   PRIMARY KEY (id)
-- );

-- -- Fremdschlüssel: DT
-- ALTER TABLE design.servants
--   ADD CONSTRAINT FK_cats_TO_servants
--     FOREIGN KEY (cats_id)
--     REFERENCES cats (id);

-- -- wichtig bei 1:1 UNIQUE im fk
-- ALTER TABLE design.servants
--   ADD CONSTRAINT unique_cat_per_servant UNIQUE (cats_id);

-- -- Struktur: DT
-- DESCRIBE design.servants;

-- -- Inserts: DT
-- INSERT INTO design.servants (id, servant_name, yrs_served, cats_id) VALUES 
-- (DEFAULT, "John", 3, 1),
-- (DEFAULT, "Mary", 5, 2),
-- (DEFAULT, "Peter", 2, 3);

-- -- Servants: Struktur
-- SELECT * FROM design.servants;

-- /* PRODUCTS */
-- -- Products: ohne Fremdschlüssel
-- CREATE TABLE IF NOT EXISTS design.products
-- (
--   id INT NOT NULL AUTO_INCREMENT,
--   product_name VARCHAR(45) NOT NULL,
--   product_price DECIMAL(10,2) NOT NULL,
--   PRIMARY KEY (id)
-- );

-- -- Products: Struktur
-- DESCRIBE design.products;

-- -- Products: Inserts
-- INSERT INTO design.products (id, product_name, product_price) VALUES 
-- (DEFAULT, "Cat Food", 25.99),
-- (DEFAULT, "Cat Toy", 12.50),
-- (DEFAULT, "Cat Bed", 45.00),
-- (DEFAULT, "Litter Box", 30.00);

-- -- Products: Inhalte 
-- SELECT * FROM design.products;

-- /* PURCHASES (Kaufprozesse) */
-- -- ServantsProducts (purchases)
-- CREATE TABLE IF NOT EXISTS design.purchases
-- (
--   id INT NOT NULL AUTO_INCREMENT,
--   servants_id INT NOT NULL,
--   products_id INT NOT NULL,
--   n INT NOT NULL,
--   m INT NOT NULL,
--   PRIMARY KEY (id)
-- );

-- -- Fremdschlüssel: purchases
-- ALTER TABLE design.purchases
--   ADD CONSTRAINT FK_servants_TO_purchases
--     FOREIGN KEY (servants_id)
--     REFERENCES servants (id);
    
-- ALTER TABLE design.purchases
--   ADD CONSTRAINT FK_products_TO_purchases
--     FOREIGN KEY (products_id)
--     REFERENCES products (id);

-- -- Purchases: Struktur
-- DESCRIBE design.purchases;

-- -- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)
-- INSERT INTO design.purchases (id, servants_id, products_id, n, m) VALUES 
-- (DEFAULT, 1, 1, 2, 1),
-- (DEFAULT, 1, 2, 1, 3),
-- (DEFAULT, 2, 3, 1, 1),
-- (DEFAULT, 3, 1, 3, 2),
-- (DEFAULT, 3, 4, 1, 1);

-- Purchases: Inhalte
SELECT * FROM design.purchases;

-- Übersicht: Alle Daten mit Beziehungen
SELECT 
    s.servant_name AS Diener,
    s.yrs_served AS Jahre_im_Dienst,
    c.cat_name AS Katze,
    c.fur_color AS Fellfarbe,
    p.product_name AS Produkt,
    p.product_price AS Preis,
    pu.n AS Menge_N,
    pu.m AS Menge_M
FROM design.purchases pu
JOIN design.servants s ON pu.servants_id = s.id
JOIN design.cats c ON s.cats_id = c.id
JOIN design.products p ON pu.products_id = p.id
ORDER BY s.servant_name, p.product_name;