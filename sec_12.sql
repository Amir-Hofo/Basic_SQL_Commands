# database

# CREATE & DROP DATABASE
-- CREATE DATABASE IF NOT EXISTS sql_store2;
-- DROP DATABASE IF EXISTS sql_store2;

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# CREATE & DROP TABLE
-- USE sql_store2;
-- DROP TABLE IF EXISTS customers;

-- CREATE TABLE IF NOT EXISTS customers
-- (
-- 	customer_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(64) NOT NULL,
--     points INT NOT NULL DEFAULT 0,
--     email VARCHAR(64) NOT NULL UNIQUE
-- );

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# ALTER TABLE
-- ALTER TABLE customers
-- 	ADD last_name VARCHAR(64) NOT NULL AFTER first_name,
--     ADD city VARCHAR(64) NOT NULL,
--     MODIFY COLUMN first_name VARCHAR(64) DEFAULT "",
--     DROP points;

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# relation (FOREIGN KEY)
-- CREATE TABLE orders
-- (
-- 	order_id INT PRIMARY KEY,
--     customer_id INT NOT NULL,
--     FOREIGN KEY fk_orders_customers(customer_id)
-- 		REFERENCES customers(customer_id)
--         ON UPDATE CASCADE
--         ON DELETE NO ACTION
-- );