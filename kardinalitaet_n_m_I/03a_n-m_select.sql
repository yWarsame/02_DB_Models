\! cls
# SELECTS

# Einzeltabellen
-- SELECT * FROM design.cats;
-- SELECT * FROM design.servants;

# Kreuzprodukt (Kartesisches Produkt)
-- SELECT * FROM design.cats JOIN design.servants
-- ORDER BY design.cats.id ASC
-- ;

-- Inner Join 1 / Gesamte Tabelle
SELECT
    *
FROM design.cats INNER JOIN design.servants
ON design.cats.id = design.servants.cats_id
;

-- Inner Join 2 / (Wer dient wem?)
-- Wer dient Grizabella?
-- Wem dient X?

-- Inner Join 2a / (Wer dient wem?)
-- "X ist der Diener von Y" / Dienstverhältnis



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
