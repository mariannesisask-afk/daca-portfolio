-- Millised veerud ja andmed tabelis on, vaatan esimest 10 rida?
SELECT * FROM customers
LIMIT 10;

-- Kontrollin, mitu rida üldse tabelis kokku on?
SELECT COUNT(*) AS klientide_koguarv 
FROM customers;

-- Tuvastan DISTINCT abil unikaalsed kliendinumbrid 
SELECT COUNT(DISTINCT customer_id) AS unikaalsed_kliendid
FROM customers;

-- Otsin duplikaat-kliendinumbreid lahutades kõikidest ridadest unikaalsed customer-ID 
SELECT COUNT(*) - COUNT(DISTINCT customer_id) AS duplikaatsete_ridade_arv
FROM customers;

-- Otsin korduvaid emaile
SELECT COUNT(*) - COUNT(email) 
AS puuduvad_emailid
FROM customers;

-- Mitu klienti, kus e-mail on puudu?
SELECT COUNT(*) - COUNT(email)
AS puuduvad_emailid
FROM customers;

-- Millistest erinevatest linnadest kliendid tulevad?
SELECT DISTINCT city 
FROM customers;

-- Millal esimene ja viimane klient registreerus, et kontrollida loogikavastaseid kuupäevi?
SELECT MIN(registration_date)
AS vanim, MAX(registration_date)
AS uusim
FROM customers;


-- Millal kliendid registreerisid?
SELECT customer_id, registration_date
FROM customers
ORDER BY registration_date;

-- Tallinna kliendid, sorteeritud nime järgi
SELECT * 
FROM customers
WHERE city = 'Tallinn'
ORDER BY last_name 
ASC 
LIMIT 15;

-- Mitu klienti, kus eesnimi on puudu?
SELECT COUNT(*) - COUNT(first_name)
AS puuduvad_eesnimed
FROM customers;
