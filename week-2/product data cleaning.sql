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

-- Leian tooted, mis pole kunagi müüdud (kui sale_id on 0, siis seda pole kunagi müüdud)
SELECT p.product_name, p.category, p.subcategory, p.retail_price, s.sale_id FROM products p LEFT JOIN sales s ON p.product_id = s.product_id WHERE s.sale_id IS NULL;

-- Loen müümata tooted kokku
SELECT COUNT(*) AS müümata_tooteid FROM products p LEFT JOIN sales s ON p.product_id = s.product_id WHERE s.sale_id IS NULL;

-- Leian enimmüüdud tooted
SELECT p.product_name, p.category, p.subcategory, COUNT(s.sale_id) AS müüdud_kordi, SUM(s.total_price) AS kogumüük FROM products p INNER JOIN sales s ON p.product_id = s.product_id GROUP BY p.product_id, p.product_name, p.category, p.subcategory ORDER BY kogumüük DESC LIMIT 10;

-- Vaatan müüke kategooriate kaupa 
SELECT p.category, COUNT(DISTINCT p.product_id) AS tooteid, COUNT(s.sale_id) AS müüke, SUM(s.total_price) AS kogumüük FROM products p LEFT JOIN sales s ON p.product_id = s.product_id GROUP BY p.category ORDER BY kogumüük DESC;

-- Ühendan inventuuriga — millised tooted on laos?
SELECT p.product_name, p.category, i.location, i.quantity_available, i.reorder_point, CASE WHEN i.quantity_available <= i.reorder_point THEN 'TELLI JUURDE' ELSE 'OK' END AS staatus FROM products p LEFT JOIN inventory i ON p.product_id = i.product_id ORDER BY i.quantity_available ASC;

-- leia tooted, mis on laos, aga pole kunagi müüdud — topelt kahju (laoseis + müümata)
SELECT p.product_name, p.category, p.retail_price, i.quantity_available, (p.retail_price * i.quantity_available) AS kinni_olev_raha FROM products p LEFT JOIN sales s ON p.product_id = s.product_id LEFT JOIN inventory i ON p.product_id = i.product_id WHERE s.sale_id IS NULL AND i.quantity_available > 0 ORDER BY kinni_olev_raha DESC;
