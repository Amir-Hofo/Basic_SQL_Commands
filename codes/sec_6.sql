# numerical functions
# Round
-- SELECT ROUND (5.7)

-- SELECT ROUND(5.26853, 2)

# TRUNCATE
-- SELECT TRUNCATE(5.26853, 2) 

# CEILING
-- SELECT CEILING(5.26853)

# FLOOR
-- SELECT FLOOR(5.26853)

# ABS
-- SELECT ABS(-5.26853)

# RAND
-- SELECT RAND()

-- ------------------------------------------------
# numerical functions
# LENGTH
-- SELECT LENGTH('Hello World!')

# UPPER
-- SELECT UPPER('Hello World!')

# LOWER
-- SELECT LOWER('Hello World!')

# TRIM, LTRIM, RTRIM
-- SELECT TRIM('   Hello World!  '), 
-- 	   LTRIM('   Hello World!  '), 
--        RTRIM('   Hello World!  ')

# SUBSTRING, LEFT, RIGHT
-- SELECT SUBSTRING('Hello World!', 2, 4) AS 'substring', 
-- 	   LEFT('Hello World!', 4) AS 'left', 
--        RIGHT('Hello World!', 4) AS 'right'

# LOCATE
-- SELECT LOCATE('wor', 'Hello World!')

-- SELECT LOCATE('war', 'Hello World!')

# REPLACE
-- SELECT REPLACE('Hello World!', 'World', 'amir')

# CONCAT
-- SELECT CONCAT('amir', 'ho', 'fo')

-- USE sql_store;
-- SELECT CONCAT(first_name, ' ', last_name) AS full_name
-- FROM customers

-- ------------------------------------------------
# date & time functions
# NOW, CURDATE, CURTIME
-- SELECT NOW(), CURDATE(), CURTIME()

# YEAR, MONTH, DAY
-- SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW())

# HOUR, MINUTE, SECOND
-- SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW())

# MONTHNAME, DAYNAME
-- SELECT MONTHNAME(NOW()), DAYNAME(NOW())

# EXTRACT
-- SELECT EXTRACT(YEAR FROM NOW()), EXTRACT(MONTH FROM NOW()), 
-- 		EXTRACT(DAY FROM NOW())

-- SELECT EXTRACT(HOUR FROM NOW()), EXTRACT(MINUTE FROM NOW()), 
-- 		EXTRACT(SECOND FROM NOW())

# DATE_FORMAT
-- SELECT
--   DATE_FORMAT(NOW(), '%a, %W') AS 'Short & Full Weekday',
--   DATE_FORMAT(NOW(), '%b, %M') AS 'Short & Full Month',
--   DATE_FORMAT(NOW(), '%c, %m') AS 'Month (no/with 0)',
--   DATE_FORMAT(NOW(), '%d, %e') AS 'Day (with/without 0)',
--   DATE_FORMAT(NOW(), '%f') AS 'Microseconds',
--   DATE_FORMAT(NOW(), '%H:%k') AS 'Hour 24h (with/without 0)',
--   DATE_FORMAT(NOW(), '%I:%l %p') AS 'Hour 12h (with/without 0) + AM/PM',
--   DATE_FORMAT(NOW(), '%i:%s:%S') AS 'Minutes:Seconds',
--   DATE_FORMAT(NOW(), '%j') AS 'Day of year',
--   DATE_FORMAT(NOW(), '%r') AS '12-hour Time (r)',
--   DATE_FORMAT(NOW(), '%T') AS '24-hour Time (T)',
--   DATE_FORMAT(NOW(), '%U, %u') AS 'Week no (Sun/Mon start)',
--   DATE_FORMAT(NOW(), '%V, %v') AS 'ISO Week no',
--   DATE_FORMAT(NOW(), '%w') AS 'Day of week (0=Sun)',
--   DATE_FORMAT(NOW(), '%X, %x') AS 'Week-based year',
--   DATE_FORMAT(NOW(), '%Y, %y') AS 'Year full/short';

# DATE_ADD, DATE_SUB
-- SELECT NOW() AS 'now',
-- 	   DATE_ADD(NOW(), INTERVAL 2 YEAR) AS '+2 year',
-- 	   DATE_ADD(NOW(), INTERVAL -5 MONTH) AS '-5 month',
--        DATE_ADD(NOW(), INTERVAL 12 DAY) AS '+12 day'

-- SELECT NOW() AS 'now',
-- 	   DATE_ADD(NOW(), INTERVAL 2 HOUR) AS '+2 hour',
-- 	   DATE_ADD(NOW(), INTERVAL -5 MINUTE) AS '-5 minute',
--        DATE_ADD(NOW(), INTERVAL -12 SECOND) AS '+12 second'

-- SELECT NOW() AS 'now',
-- 	   DATE_SUB(NOW(), INTERVAL 2 YEAR) AS '-2 year',
-- 	   DATE_SUB(NOW(), INTERVAL 2 HOUR) AS '-2 hour'

# DATEDIFF, TIMESTAMPDIFF
-- SELECT DATEDIFF(NOW(), '2022-08-23') AS diff_in_days,
-- 	   TIMESTAMPDIFF(MONTH, '2022-08-23', NOW()) AS diff_in_months,
--        TIMESTAMPDIFF(YEAR, '2022-08-23', NOW()) AS diff_in_years

# TIME_TO_SEC
-- SELECT TIME_TO_SEC('4:35') AS '4:35', 
-- 	   TIME_TO_SEC('5:00') AS '5:00',
-- 	   ABS(TIME_TO_SEC('4:35') - TIME_TO_SEC('5:00')) AS diff_in_days

-- ------------------------------------------------
# IFNULL
-- USE sql_store;
-- SELECT order_id, IFNULL(shipper_id, "not assigned") AS shipper
-- FROM orders

# COALESCE
-- USE sql_store;
-- ## if 'shipper_id' is null, use from column 'comments',
-- ## and if 'comments' is null then use "not assigned"
-- SELECT order_id, COALESCE(shipper_id, comments, "not assigned") AS shipper
-- FROM orders;

# IF
-- USE sql_store;
-- SELECT order_id, order_date,
-- 	   IF(YEAR(order_date) > '2017-05-01', 'active', 'archived') 
-- 		AS act_status
-- FROM orders;

# CASE
## CASE WHEN ... THEN ...
USE sql_store;
SELECT order_id, order_date,
	   CASE
			WHEN YEAR(order_date) >= '2019' THEN 'active'
            WHEN YEAR(order_date) = '2018' THEN 'recently'
            ELSE 'archived'
       END AS act_status
FROM orders;