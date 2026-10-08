W2-GT (roll product cleaner)

-- Teen tootetabelist koopia
CREATE TABLE products_test AS SELECT * FROM products;SELECT COUNT(*) AS ridade_arv FROM products_test;

-- Leian duplikaadid — kas on korduvaid tootenimesid?
SELECT product_name, COUNT(*) AS koopiate_arv FROM products_test GROUP BY product_name HAVING COUNT(*) > 1 ORDER BY koopiate_arv DESC;

-- Leian NULL väärtused kriitilistes väljades:
SELECT COUNT(*) FILTER (WHERE product_name IS NULL OR product_name = '') AS null_nimi, COUNT(*) FILTER (WHERE category IS NULL OR category = '') AS null_kategooria, COUNT(*) FILTER (WHERE retail_price IS NULL) AS null_jaehind, COUNT(*) FILTER (WHERE cost_price IS NULL) AS null_omahind FROM products_test;

-- Kontrollin negatiivseid hindasid
SELECT COUNT(*) AS negatiivne_hind FROM products_test WHERE retail_price < 0;

-- Kontrollin kas on äärmuslikke hindasid (<1000)
SELECT product_name, retail_price FROM products_test WHERE retail_price > 1000 ORDER BY retail_price DESC;

-- Kontrollin kategooriaid (kas esineb mitmes kirjapildis või tähesuuruses)
SELECT category, COUNT(*) AS arv FROM products_test GROUP BY category ORDER BY category;
