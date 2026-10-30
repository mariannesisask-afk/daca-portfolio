-- Näitab eraldi 2024. aasta iga kuu kohta: tellimuste arv, kogukäive ja keskmine tellimusväärtus
SELECT DATE_TRUNC('month', sale_date) AS kuu, COUNT(sale_id) AS tellimuste_arv, SUM(total_price) AS kogukäive, ROUND(AVG(total_price), 2) AS keskmine_tellimus FROM sales WHERE sale_date >= '2024-01-01' AND sale_date < '2025-01-01' GROUP BY DATE_TRUNC('month', sale_date)ORDER BY kuu;

-- müük kategooriate kaupa
SELECT p.category AS kategooria, COUNT(DISTINCT p.product_id) AS toodete_arv, SUM(s.total_price) AS kogumuuk, ROUND(AVG(s.unit_price), 2) AS keskmine_hind FROM sales s INNER JOIN products p ON s.product_id = p.product_id GROUP BY p.category HAVING SUM(s.total_price) > 100000 ORDER BY kogumuuk DESC;

-- kuised trendid, muutus kuust kuusse
WITH kuu_myyk AS ( SELECT DATE_TRUNC('month', sale_date) AS kuu, SUM(total_price) AS käive FROM sales WHERE sale_date >= '2024-01-01' AND sale_date < '2025-01-01' GROUP BY DATE_TRUNC('month', sale_date))SELECT kuu, käive, LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu, käive - LAG(käive) OVER (ORDER BY kuu) AS muutus FROM kuu_myyk ORDER BY kuu;

-- kuust kuusse kasvu %
WITH kuu_myyk AS (SELECT DATE_TRUNC('month', sale_date) AS kuu, COUNT(sale_id) AS tellimuste_arv, SUM(total_price) AS käive, ROUND(AVG(total_price), 2) AS keskmine_tellimus FROM sales WHERE sale_date >= '2024-01-01' AND sale_date < '2025-01-01' GROUP BY DATE_TRUNC('month', sale_date)) SELECT kuu, tellimuste_arv, käive AS kogukäive, keskmine_tellimus, LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu, ROUND((käive - LAG(käive) OVER (ORDER BY kuu)) / NULLIF(LAG(käive) OVER (ORDER BY kuu), 0) * 100, 1) AS kasvu_protsent FROM kuu_myyk ORDER BY kuu;

