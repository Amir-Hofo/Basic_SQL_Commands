USE sql_store;

# sorting
-- Select customer_id, last_name, state,
-- 	   points* customer_id AS val
-- FROM customers 
-- WHERE customer_id > 1 
-- ORDER BY state DESC, last_name, val

# IN & BETWEEN
-- SELECT DISTINCT state AS label
-- FROM customers
-- WHERE state NOT IN ('ca', 'va', 'tx')
-- AND (birth_date BETWEEN '1990.01.01' 
-- 				AND '2000.01.01')

# LIKE
-- SELECT *
-- FROM customers
-- WHERE (last_name LIKE '%y')
-- OR (first_name LIKE 'e_k_' )

# REGEXP
-- SELECT *
-- FROM customers
-- WHERE (address REGEXP 'spring')
-- OR (address REGEXP '^0')
-- OR (address REGEXP 'drive$')
-- OR ((last_name REGEXP 'ros|mac|field$')
-- 	AND (first_name REGEXP '[a-m]b[au]'))

# IS NULL
-- SELECT *
-- FROM customers
-- WHERE (phone IS NULL) 
-- AND (address IS NOT NULL)

# LIMIT
SELECT *
FROM customers
ORDER BY points DESC
-- LIMIT 3
LIMIT 3,2 -- 3 skip & limit 2