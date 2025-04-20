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

### Q3: Products that have not been ordered (i.e., not present in order_items)
-- USE sql_store;
-- SELECT *
-- FROM products
-- WHERE product_id NOT IN (SELECT DISTINCT product_id
-- 						 FROM order_items)
                         
                       
# ALL
-- USE sql_invoicing;
-- SELECT *
-- FROM invoices
-- WHERE invoice_total > ALL(SELECT invoice_total
-- 						  FROM invoices
-- 						  WHERE client_id = 3)

# ANY
-- USE sql_invoicing;
-- SELECT *
-- FROM clients
-- WHERE client_id = ANY(SELECT client_id
-- 					  FROM invoices
-- 					  GROUP BY client_id
--                       HAVING COUNT(client_id) > 3)

# correlation
-- USE sql_hr;
-- SELECT *
-- FROM employees AS emp
-- WHERE salary > (SELECT AVG(salary)
-- 					 FROM employees
-- 					 GROUP BY office_id
-- 					 HAVING office_id = emp.office_id)

# EXIST
## like 'IN' but subquerry haven't return & effect on main querry
## for more program optimization like ram in use
-- USE sql_invoicing;
-- SELECT *
-- FROM clients AS cl_tbl
-- WHERE EXISTS (SELECT client_id
-- 			  FROM invoices
--               WHERE client_id = cl_tbl.client_id)

# select subquerry
-- USE sql_invoicing;
-- SELECT invoice_id, invoice_total,
-- 	   (SELECT AVG(invoice_total) FROM invoices) AS avrage,
--        invoice_total - (SELECT(avrage)) AS difference
-- FROM invoices

-- USE sql_invoicing;
-- SELECT client_id, name,
-- 	   (SELECT SUM(invoice_total) FROM invoices WHERE client_id = cls_tbl.client_id) 
-- 			AS total_sales,
-- 	   (SELECT AVG(invoice_total) FROM invoices) AS avrage,
--        (SELECT total_sales - avrage) AS difference
-- FROM clients AS cls_tbl

# from subquerry
USE sql_invoicing;
SELECT *
FROM (SELECT client_id, name,
	  (SELECT SUM(invoice_total) FROM invoices WHERE client_id = cls_tbl.client_id) 
			AS total_sales,
	  (SELECT AVG(invoice_total) FROM invoices) AS avrage,
      (SELECT total_sales - avrage) AS difference
	  FROM clients AS cls_tbl
      ) AS sales_summary
WHERE difference > 500
                    