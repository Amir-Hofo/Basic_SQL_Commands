# TRANSACTION
## A transaction is a block of code where all operations must succeed together, 
## and if any operation fails, the entire process is rolled back, 
## following the "all or nothing" principle.

USE sql_store;

START TRANSACTION;
	INSERT INTO orders(customer_id, order_date, status)
	VALUES(1, '2022-12-03', 1);
    
    INSERT INTO order_items
    VALUES(LAST_INSERT_ID(), 1, 1, 1);
COMMIT;