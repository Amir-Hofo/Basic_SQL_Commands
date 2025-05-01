# CREATE TABLE
-- USE sql_store;
-- CREATE TABLE orders_archived
-- SELECT * FROM orders

# INSERT
-- USE sql_store;
-- INSERT INTO customers
-- VALUES (DEFAULT, 'amir', 'hofo', '1995-10-08',
-- 		NULL, 'narmak', 'tehran', 'CA', DEFAULT)

-- USE sql_store;
-- INSERT INTO customers(last_name, first_name, city, address, state)
-- VALUES ('shokohi', 'shima', 'shiraz', 'street', 'tx')

## Multi-line
-- USE sql_store;
-- INSERT INTO products(name, quantity_in_stock, unit_price)
-- VALUES('p1', 10, 1.98),
-- 	  ('p2', 11, 3),
--       ('p3', 12, 2.2)

## Multi-table (LAST_INSERT_ID)
-- USE sql_store;
-- INSERT INTO orders(customer_id, order_date, status)
-- VALUE(1, '2022-03-30', 1);
-- INSERT INTO order_items
-- VALUE(LAST_INSERT_ID(), 1, 1, 2.29),
-- 	 (LAST_INSERT_ID(), 2, 3, 5.5)

## from table to another
-- INSERT INTO orders_archived
-- SELECT * FROM orders
-- WHERE order_date < '2019-01-01'

# UPDATE
-- USE sql_invoicing;
-- UPDATE invoices
-- SET payment_total = 10, payment_date = '2021-12-11'
-- WHERE invoice_id = 1

-- USE sql_invoicing;
-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5,
-- 	payment_date = due_date
-- WHERE invoice_id = 3

## update without using primary key
### Preferences-> SQL Editor -> Deselect 'safe updates'
-- USE sql_invoicing;
-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5,
-- 	payment_date = due_date
-- WHERE client_id IN (3,4)

# subquerry
-- USE sql_invoicing;
-- UPDATE invoices
-- SET payment_total = invoice_total * 1.2,
-- 	payment_date = due_date
-- WHERE client_id = (
-- 	SELECT client_id
--     FROM clients
--     WHERE name = 'Kwideo')

-- USE sql_invoicing;
-- UPDATE invoices
-- SET payment_total = invoice_total * 1.2,
-- 	payment_date = due_date
-- WHERE client_id IN (
-- 	SELECT client_id
--     FROM clients
--     WHERE state IN ('CA', 'NY'))

# DELETE
-- USE sql_invoicing;
-- DELETE FROM invoices
-- WHERE client_id = 2

USE sql_invoicing;
DELETE FROM invoices
WHERE client_id = (
		SELECT client_id
        FROM clients
        WHERE name= 'Myworks')
