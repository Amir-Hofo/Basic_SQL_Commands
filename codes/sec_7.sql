-- # VIEW
-- # CREATE VIEW
-- USE sql_invoicing;

-- CREATE VIEW sales_by_client AS

-- SELECT cli_tbl.client_id, name,
-- 	   SUM(invoice_total) AS total_sales
-- FROM clients AS cli_tbl
-- JOIN invoices AS inv_tbl USING(client_id)
-- GROUP BY client_id, name;

-- SELECT *
-- FROM sales_by_client
-- WHERE total_sales > 550;

-- # CREATE OR REPLACE VIEW
-- CREATE OR REPLACE VIEW sample_view AS
-- SELECT client_id, name
-- FROM clients;

-- # DROP VIEW
-- DROP VIEW sample_view;

-- -------------------------------------
# updateable view
## updatable view = no expressions, aggregation, 
## GROUP BY, DISTINCT, UNION, subqueries, or joins


