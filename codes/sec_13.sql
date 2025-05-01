# index

# CREATE INDEX
-- USE sql_store;
-- CREATE INDEX idx_state ON customers(state);

-- CREATE INDEX idx_last_name ON customers(last_name(20));

-- SHOW INDEXES IN customers;

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# ANALYZE
-- ANALYZE TABLE customers;
-- SHOW INDEXES IN customers;

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# FULLTEXT INDEX
-- USE sql_blog;
-- CREATE FULLTEXT INDEX idx_title_body ON posts(title, body);

-- SELECT *, MATCH(title, body) AGAINST('react redux') AS similarity
-- FROM posts
-- WHERE MATCH(title, body) AGAINST('react redux');

-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# composite index
-- USE sql_store;
-- CREATE INDEX idx_state_points ON customers(state, points);
-- SHOW INDEXES IN customers;