-- -- # SELECTS

-- -- # Einzeltabellen
-- -- SELECT * FROM design.servants;
-- -- SELECT * FROM design.products;
-- -- SELECT * FROM design.purchases;

-- -- # Kreuzprodukt (Kartesisches Produkt)
-- -- SELECT * FROM design.servants CROSS JOIN design.products;

-- -- # 1. Inner Join - Gesamte Tabelle (ohne p_time ORDER BY)
-- SELECT
--     *
-- FROM design.purchases
-- INNER JOIN design.servants ON design.purchases.servants_id = design.servants.id
-- INNER JOIN design.products ON design.purchases.products_id = design.products.id;

-- -- DESCRIBE design.purchases;

-- -- # 2. Wer dient wem? (Dienstverhältnis)
-- -- # 2a. Wer dient Grizabella? (Beispielabfrage)
-- SELECT
--     s.servant_name AS Diener,
--     p.product_name AS Produkt
-- FROM design.purchases pr
-- INNER JOIN design.servants s ON pr.servants_id = s.id
-- INNER JOIN design.products p ON pr.products_id = p.id
-- ORDER BY s.servant_name;

-- -- # 3. Welche Artikel hat X gekauft?
-- SELECT
--     s.servant_name AS Diener,
--     p.product_name AS Produkt,
--     p.product_price AS Preis
-- FROM design.purchases pr
-- INNER JOIN design.servants s ON pr.servants_id = s.id
-- INNER JOIN design.products p ON pr.products_id = p.id
-- WHERE s.servant_name = 'Max'
-- ORDER BY p.product_name;

-- -- # 4. Wieviele Produkte hat X gekauft?
-- SELECT
--     s.servant_name AS Diener,
--     COUNT(pr.id) AS Anzahl_Produkte
-- FROM design.purchases pr
-- INNER JOIN design.servants s ON pr.servants_id = s.id
-- GROUP BY s.servant_name
-- ORDER BY Anzahl_Produkte DESC;

-- -- # 5. Wieviel Geld hat jeder Diener ausgegeben?
-- SELECT
--     s.servant_name AS Diener,
-- COUNT(pr.id) AS Anzahl_Produkte,
-- SUM(p.product_price) AS Gesamtausgaben,
-- -- AVG(p.product_price) AS Durchschnittspreis
--     -- CAST(ROUND(AVG(product_price), 2))  AS Durchschnittspreis
-- FROM design.purchases pr
-- INNER JOIN design.servants s ON pr.servants_id = s.id
-- INNER JOIN design.products p ON pr.products_id = p.id
-- GROUP BY s.servant_name
-- ORDER BY Gesamtausgaben DESC;

-- -- # 6. Wer hat das Produkt X gekauft?
-- -- Produkte mit "Lachs"
-- SELECT
--     s.servant_name AS Diener,
--     p.product_name AS Produkt
-- FROM design.purchases pr
-- INNER JOIN design.servants s ON pr.servants_id = s.id
-- INNER JOIN design.products p ON pr.products_id = p.id
-- WHERE p.product_name LIKE '%Lachs%'
-- ORDER BY s.servant_name;

-- Produkte mit "Sauce"
-- SELECT
--     s.servant_name AS Diener,
--     p.product_name AS Produkt
-- FROM design.purchases pr
-- INNER JOIN design.servants s ON pr.servants_id = s.id
-- INNER JOIN design.products p ON pr.products_id = p.id
-- WHERE p.product_name LIKE '%Sauce%'
-- ORDER BY s.servant_name;

-- -- # 7. Wie oft wurde das Produkt X gekauft?
-- -- Nach Produkt gruppiert
-- SELECT
--     p.product_name AS Produkt,
--     COUNT(pr.id) AS Anzahl_Kauefe
-- FROM design.purchases pr
-- INNER JOIN design.products p ON pr.products_id = p.id
-- GROUP BY p.product_name
-- ORDER BY Anzahl_Kauefe DESC;

-- -- Für ein spezifisches Produkt (z.B. Whiskas|Lachs)
-- SELECT
--     p.product_name AS Produkt,
--     COUNT(pr.id) AS Anzahl_Kauefe
-- FROM design.purchases pr
-- INNER JOIN design.products p ON pr.products_id = p.id
-- WHERE p.product_name = 'Whiskas|Lachs'
-- GROUP BY p.product_name;

-- -- # 8. Welche Umsätze hatte das Produkt X?
-- -- Gesamtumsatz pro Produkt
-- SELECT
--     p.product_name AS Produkt,
--     COUNT(pr.id) AS Anzahl_Verkaeufe,
--     SUM(p.product_price) AS Gesamtumsatz,
--     AVG(p.product_price) AS Durchschnittspreis
-- FROM design.purchases pr
-- INNER JOIN design.products p ON pr.products_id = p.id
-- GROUP BY p.product_name
-- ORDER BY Gesamtumsatz DESC;

-- Für ein spezifisches Produkt (z.B. Whiskas|Lachs)
SELECT
    p.product_name AS Produkt,
    COUNT(pr.id) AS Anzahl_Verkaeufe,
    SUM(p.product_price) AS Gesamtumsatz
FROM design.purchases pr
INNER JOIN design.products p ON pr.products_id = p.id
WHERE p.product_name = 'Whiskas|Lachs'
GROUP BY p.product_name;