# subquerry
## Q1: The products whose unit_price is greater than that of product_id number 3.
-- USE sql_store;
-- SELECT *
-- FROM products
-- WHERE unit_price > (SELECT unit_price
-- 					FROM products
-- 					WHERE product_id = 3)

## Q2: The invoices whose invoice_total is greater than 
## all the invoices of client number 3.
-- USE sql_invoicing;
-- SELECT *
-- FROM invoices
-- WHERE invoice_total > (SELECT MAX(invoice_total)
-- 					   FROM invoices
-- 					   WHERE client_id = 3)
                       
# ALL
USE sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > ALL(SELECT invoice_total
						  FROM invoices
						  WHERE client_id = 3)