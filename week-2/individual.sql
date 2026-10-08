-- Harjutus A: ROW_NUMBER() klientide duplikaatide leidmiseks. Leitud 130 sama emailiga klienti.
SELECT * FROM ( SELECT customer_id, first_name, last_name, email, ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn FROM customers WHERE email IS NOT NULL) numbered WHERE rn > 1 ORDER BY email;

-- Harjutus B: COALESCE puuduvatele andmetele. See otsib üles kõik kliendid, kelle andmetes on midagi puudu (tühi ehk NULL väärtus), ja asendab need tühimikud loetava tekstiga.
SELECT customer_id, COALESCE(first_name, 'Tundmatu') AS eesnimi, COALESCE(last_name, '') AS perenimi, COALESCE(email, 'puudub') AS email, COALESCE(phone, 'puudub') AS telefon, city FROM customers WHERE first_name IS NULL OR last_name IS NULL OR email IS NULL OR phone IS NULL ORDER BY customer_id;

-- Harjutus 3: Linnade puhastatud statistika (koondame linnade erinevad kirjaviisid ühe korrektse nime alla)
SELECT INITCAP(TRIM(city)) AS puhas_linn, COUNT(*) AS kliente, COUNT(DISTINCT city) AS erinevaid_kirjaviise, STRING_AGG(DISTINCT city, ', ' ORDER BY city) AS algkirjaviisid FROM customers WHERE city IS NOT NULL GROUP BY INITCAP(TRIM(city))ORDER BY kliente DESC;

-- Toodete hinna kontroll (NULL, negatiivne hind või 0-hind)
SELECT product_id, product_name, retail_price, CASE WHEN retail_price IS NULL THEN 'NULL' WHEN retail_price = 0 THEN 'NULL (0 = puudub?)' WHEN retail_price < 0 THEN 'NEGATIIVNE!' ELSE 'OK' END AS hinna_staatus FROM products WHERE retail_price IS NULL OR retail_price <= 0 ORDER BY retail_price;



