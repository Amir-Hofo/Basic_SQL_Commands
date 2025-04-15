#JOIN
-- USE sql_store;
## INNER JOIN
-- SELECT order_id, or_tbl.customer_id, last_name, first_name, status
-- From orders or_tbl
-- JOIN customers cs_tbl 
-- 	ON or_tbl.customer_id = cs_tbl.customer_id

## join different dataset   
-- SELECT *
-- From order_items orit_tbl
-- JOIN sql_inventory.products pr_tbl 
-- 	ON orit_tbl.product_id = pr_tbl.product_id

## self join
-- USE sql_hr;
-- SELECT emp.employee_id, emp.first_name, emp.last_name,
-- 		mng.first_name AS manager
-- FROM employees emp
-- JOIN employees mng
-- 	ON emp.reports_to = mng.employee_id

# three table join
-- USE sql_store;
-- SELECT or_tbl.order_id, or_tbl.order_date,
-- 	   cs_tbl.first_name, cs_tbl.last_name,
--        or_st_tbl.name AS status
-- FROM orders or_tbl
-- JOIN customers cs_tbl
-- 	on or_tbl.customer_id = cs_tbl.customer_id
-- JOIN order_statuses or_st_tbl
-- 	on or_tbl.status = or_st_tbl.order_status_id

# composite primary key
-- USE sql_store;
-- SELECT *
-- FROM order_items AS oi_tbl
-- JOIN order_item_notes AS oin_tbl
-- 	on oi_tbl.order_id = oin_tbl.order_id
-- 		AND oi_tbl.product_id = oin_tbl.product_id

-- USE sql_store;
-- SELECT *
-- FROM order_items AS oi_tbl,
-- 	 order_item_notes AS oin_tbl
-- WHERE oi_tbl.order_id = oin_tbl.order_id
-- 	  AND oi_tbl.product_id = oin_tbl.product_id

# OUTER JOIN
-- USE sql_store;
-- SELECT cs_tbl.customer_id, cs_tbl.first_name,
-- 	   or_tbl.order_id, sh_tbl.name AS shipper
-- FROM customers AS cs_tbl
-- LEFT JOIN orders AS or_tbl
-- 		ON cs_tbl.customer_id = or_tbl.customer_id
-- LEFT JOIN shippers AS sh_tbl
-- 		ON or_tbl.shipper_id = sh_tbl.shipper_id
-- ORDER BY cs_tbl.customer_id

-- USE sql_store;
-- SELECT cs_tbl.customer_id, cs_tbl.first_name,
-- 	   or_tbl.order_id
-- FROM orders AS or_tbl
-- RIGHT JOIN customers AS cs_tbl
-- 		ON cs_tbl.customer_id = or_tbl.customer_id
-- ORDER BY cs_tbl.customer_id

# USING
-- USE sql_store;
-- SELECT or_tbl.order_id, cs_tbl.first_name,
-- 	   sh_tbl.name AS shipper
-- FROM orders AS or_tbl
-- JOIN customers AS cs_tbl
-- 	USING(customer_id)
-- LEFT JoIN shippers AS sh_tbl
-- 	USING(shipper_id)

-- USE sql_store;
-- SELECT *
-- FROM order_items
-- JOIN order_item_notes
-- 	USING(order_id, product_id)
    
# NATURAL JOIN
-- USE sql_store;
-- SELECT orders.order_id, customers.first_name
-- FROM orders
-- NATURAL JOIN customers

# CROSS JOIN
-- USE sql_store;
-- SELECT customers.first_name AS customer,
-- 	   products.name AS product
-- FROM customers
-- CROSS JOIN products
-- ORDER BY customer

-- USE sql_store;
-- SELECT customers.first_name AS customer,
-- 	   products.name AS product
-- FROM customers, products
-- ORDER BY customer

# UNION
USE sql_store;
SELECT order_id, order_date, 'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT order_id, order_date, 'Inactive' AS status
FROM orders
WHERE order_date < '2019-01-01'
