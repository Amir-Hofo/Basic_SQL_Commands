# TRIGGER
## A trigger is a predefined action that automatically executes 
## in response to specific events on a table or view in a database.

# CREATE TRIGGER
## after_insert
-- DELIMITER $$
-- CREATE TRIGGER payments_after_insert
-- 	AFTER INSERT ON payments
--     FOR EACH ROW
--     
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total = payment_total + NEW.amount
--     WHERE invoice_id = NEW.invoice_id;
-- END $$
-- DELIMITER ;

-- INSERT INTO payments
-- VALUES(DEFAULT, 5, 3, '2023-09-10', 23, 1)


## after_delete
-- DELIMITER $$
-- CREATE TRIGGER payments_after_delete
-- 	AFTER DELETE ON payments
--     FOR EACH ROW
--     
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total = payment_total - OLD.amount
--     WHERE invoice_id = OLD.invoice_id;
-- END $$
-- DELIMITER ;

-- DELETE FROM payments WHERE payment_id = 9;


-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# SHOW TRIGGERS
-- SHOW TRIGGERS

-- SHOW TRIGGERS LIKE 'payments%'

# DROP TRIGGER
-- DROP TRIGGER IF EXISTS payments_after_delete

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# trigger log
-- DROP TRIGGER IF EXISTS payments_after_insert;
-- DELIMITER $$
-- CREATE TRIGGER payments_after_insert
-- 	AFTER INSERT ON payments
--     FOR EACH ROW
--     
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total = payment_total + NEW.amount
--     WHERE invoice_id = NEW.invoice_id;
--     
--     INSERT INTO payments_audit
-- 	VALUES(NEW.client_id, NEW.date, NEW.amount, 
-- 		   'INSERT', NOW());
-- END $$
-- DELIMITER ;

-- INSERT INTO payments
-- VALUES(DEFAULT, 5, 3, '2023-09-10', 23, 1)

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# EVENT
-- SHOW VARIABLES LIKE 'event%';
-- SET GLOBAL event_scheduler = ON;

-- DELIMITER $$
-- CREATE EVENT yearly_delete_stale_audit_rows
-- ON SCHEDULE
-- 	-- AT '2022-01-01'
--     -- EVERY 2 DAY
--     EVERY 1 YEAR START '2022-01-01'
-- 				 ENDS '2030-01-01'
-- DO BEGIN 
-- 	DELETE FROM payment_audit
--     WHERE action_date < NOW() - INTERVAL 1 YEAR;
-- END %%
-- DELIMITER ;

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# ALTER EVENT
## edit event
-- DELIMITER $$
-- CREATE EVENT yearly_delete_stale_audit_rows
-- ON SCHEDULE
--     EVERY 2 DAY
-- DO BEGIN 
-- 	DELETE FROM payment_audit
--     WHERE action_date < NOW() - INTERVAL 1 YEAR;
-- END %%
-- DELIMITER ;


## enable & disable
-- SHOW EVENTS;
-- ALTER EVENT `yearly_delete_stale_audit_rows` DISABLE;

-- ALTER EVENT `yearly_delete_stale_audit_rows` ENABLE;




