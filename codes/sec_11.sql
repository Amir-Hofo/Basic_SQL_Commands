# data type #

# string
## CHAR
## VAERCHAR
## MEDIUMTEXT
## LONGTEXT
## TINYTEXT
## TEXT
-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# int
## TINYINT:: -128:+128
## UNSIGNED TINYINT:: 0:255
## SMALLINT:: -32'000:+32'000
## MEDIUMINT:: -8M:+8M
## INT:: -2'000M:+2'000M
## BIGINT
-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# float
## DECIMAL(5,2):: 543.21
## FLOAT
## DOUBLE
-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# DATE
## DATE
## TIME
## DATETIME
## YEAR
-- !!!!!!!!!!!!@@@@@@@@@@@@@############$$$$$$$$$$$$

# JSON
## json object (like dictionary and json)
SET @data_1 = '{"name": "Amir", 
				"age": 25}';

SET @data_2 = JSON_OBJECT('name', 'Amir', 
						  'age', 25);
                          
SELECT JSON_EXTRACT(@data_1, '$.name');
-- SELECT @data_2->'$.age';
                          
## json array (like list)
SET @data_3 = '["name", "Amir", "age", 25]';

SET @data_4 = JSON_ARRAY('name', 'Amir', 'age', 25);

SELECT JSON_EXTRACT(@data_3, '$[0]');
-- SELECT @data_4->'$[3]';

## json set (edit json)
SET @data_2 = JSON_SET(@data_2, '$.age', 30);
SET @data_4 = JSON_SET(@data_4, '$[3]', 40);

## jason remove
SET @data_1 = JSON_REMOVE(@data_1, '$.age');
SET @data_3 = JSON_REMOVE(@data_3, '$[2]');
