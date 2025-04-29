# store procedures
## procedure is similar to a function

# CREATE PROCEDURE
## DELIMITER: change the default statement separator 
-- DELIMITER $$
-- CREATE PROCEDURE get_client()
-- BEGIN
-- 	SELECT * FROM clients
--     WHERE client_id IN (1,2,4);
-- END $$
-- DELIMITER ;

# CALL PROCEDURE
-- CALL get_client();

# DROP PROCEDURE
-- DROP PROCEDURE get_client;
-- DROP PROCEDURE IF EXISTS get_client;

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# PROCEDURE with input
-- DELIMITER $$
-- CREATE PROCEDURE get_client_by_state(in_state CHAR(2))
-- BEGIN
-- 	SELECT * FROM clients
--     WHERE clients.state = in_state;
-- END $$
-- DELIMITER ;
-- CALL get_client_by_state('ca');

## input with default
### IF
-- DROP PROCEDURE IF EXISTS get_client_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_client_by_state(in_state CHAR(2))
-- BEGIN
-- 	IF in_state IS NULL THEN
-- 		SET in_state = 'TX';
-- 	END IF;
-- 	SELECT * FROM clients
--     WHERE clients.state = in_state;
-- END $$
-- DELIMITER ;
-- CALL get_client_by_state(NULL);


### IF ELSE
-- DROP PROCEDURE IF EXISTS get_client_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_client_by_state(in_state CHAR(2))
-- BEGIN
-- 	IF in_state IS NULL THEN
-- 		SELECT * FROM clients;
-- 	ELSE
-- 		SELECT * FROM clients
-- 		WHERE clients.state = in_state;
-- 	END IF;
-- END $$
-- DELIMITER ;
-- CALL get_client_by_state(NULL);


### IFNULL
-- DROP PROCEDURE IF EXISTS get_client_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_client_by_state(in_state CHAR(2))
-- BEGIN
-- 	SELECT * FROM clients
--     WHERE clients.state = IFNULL(in_state, clients.state);
--     -- WHERE clients.state = IFNULL(in_state, 'TX');
-- END $$
-- DELIMITER ;
-- CALL get_client_by_state(NULL);

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# PROCEDURE with return
-- DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;
-- DELIMITER $$
-- CREATE PROCEDURE get_unpaid_invoices_for_client(client_id INT, 
-- 	OUT invoices_count INT, OUT invoices_total DECIMAL(9,2))
-- BEGIN
-- 	SELECT COUNT(*), SUM(invoice_total)
--     -- INTO invoices_count, invoices_total
--     FROM invoices
--     WHERE invoices.client_id = client_id
-- 		AND payment_total = 0;
-- END $$
-- DELIMITER ;

-- SET @invoices_count = 0, @invoices_total = 0;
-- CALL get_unpaid_invoices_for_client(3, @invoices_count, @invoices_total)

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# DECLARE (variable)
-- DROP PROCEDURE IF EXISTS get_risk_factor;
-- DELIMITER $$
-- CREATE PROCEDURE get_risk_factor()
-- BEGIN
-- 	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
--     DECLARE invoices_total DECIMAL(9,2);
--     DECLARE invoices_count INT;
--     
--     SELECT COUNT(*), SUM(invoice_total)
--     INTO invoices_count, invoices_total
--     FROM invoices;
--     
--     SET risk_factor = invoices_total / invoices_count * 5;
--     SELECT risk_factor;
-- END $$
-- DELIMITER ;

-- CALL get_risk_factor();

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# another example of PROCEDURE
-- DELIMITER $$
-- CREATE PROCEDURE make_payment(invoice_id INT,
-- 							  payment_amount DECIMAL(9,2),
--                               payment_date DATE)
-- BEGIN
-- 	IF payment_amount <= 0 THEN
-- 		SIGNAL SQLSTATE '22003'
--         SET MESSAGE_TEXT = 'invalid payment amount';
-- 	END IF;
--     
--     UPDATE invoices AS inv_tbl
--     SET inv_tbl.payment_total = payment_amount,
-- 		inv_tbl.payment_date = payment_date
-- 	WHERE inv_tbl.invoice_id = invoice_id;
-- END $$
-- DELIMITER ;

-- CALL make_payment(1, 120, '2024-05-10')

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# NOTE:
## The difference between a PROCEDURE and a FUNCTION 
## is that a FUNCTION can return only one value.

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# FUNCTION
-- DELIMITER $$
-- CREATE FUNCTION risk_factor_for_client(client_id INT)
-- RETURNS INTEGER
-- READS SQL DATA
-- -- MODIFIES SQL DATA

-- BEGIN
-- 	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
--     DECLARE invoices_total DECIMAL(9,2);
--     DECLARE invoices_count INT;
--     
--     SELECT COUNT(*), SUM(invoice_total)
--     INTO invoices_count, invoices_total
--     FROM invoices
--     WHERE invoices.client_id = client_id;
--     
--     SET risk_factor = invoices_total / invoices_count * 5;
--     
--     RETURN risk_factor;
-- END $$
-- DELIMITER ;

-- SELECT client_id, name,
-- 	risk_factor_for_client(client_id) AS risk_factor
-- FROM clients;

# DROP FUNCTION
-- DROP FUNCTION IF EXISTS risk_factor_for_client;
