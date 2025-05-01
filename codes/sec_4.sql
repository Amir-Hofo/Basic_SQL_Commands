# AVG, MAX & MIN
-- USE sql_invoicing;
-- SELECT AVG(invoice_total) AS avrage,
-- 	   MAX(invoice_total) AS highest,
--        MIN(invoice_total) AS lowest
-- FROM invoices

# SUM, COUNT, GROUP BY
-- USE sql_invoicing;
-- SELECT SUM(invoice_total * 1.15) AS 'total benefits',
-- 	   COUNT(invoice_date) AS 'days count'
-- FROM invoices

-- USE sql_invoicing;
-- SELECT client_id, SUM(invoice_total) AS total_sales
-- FROM invoices
-- GROUP BY client_id

# HAVING 
## 'where' is before 'group by'
## 'having' is after 'group by'
-- USE sql_invoicing;
-- SELECT client_id, SUM(invoice_total) AS total_sales,
-- 	   COUNT(*) AS 'number of record'
-- FROM invoices
-- GROUP BY client_id
-- HAVING total_sales > 500

# ROLLUP
-- USE sql_invoicing;
-- SELECT client_id, SUM(invoice_total) AS total_sales
-- FROM invoices
-- GROUP BY client_id WITH ROLLUP

USE sql_invoicing;
SELECT state, city, SUM(invoice_total) AS total_sales,
	   COUNT(*) AS 'number of record'
FROM invoices
JOIN clients USING(client_id)
GROUP BY state, city WITH ROLLUP