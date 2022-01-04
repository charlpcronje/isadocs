# SQL Migration Hash Function

## Synopsis

The idea here is to not let the same queries run twice when a migration is run twice by accident

This function (Incomplete) concatenates all the columns of a row and creates a n MD5 Hash and saves it in the table's comment field. 

```sql
/* CREATE HASH FUNCTIONS  */
(SELECT 'Creates a hash of all the columns concatenated and stores it in the comments of the table so that the same query cant be run twice' AS '');
DROP FUNCTION IF EXISTS fn_get_ai_table;
delimiter $$
CREATE FUNCTION `fn_check_row_hash`(`tableName` VARCHAR(50),`dbName` VARCHAR(50) RETURNS int(11)
COMMENT 'Creates a hash of all the columns concatenated and stores it in the comments of the table so that the same query cant be run twice'
BEGIN
SELECT
  CONCAT(
    'SELECT CONCAT_WS(\'\',',
    GROUP_CONCAT(CONCAT('`', column_name, '`') ORDER BY column_name),
    ') AS all_columns FROM ',tableName,';')
FROM   `information_schema`.`columns` 
WHERE  `table_schema`= dbName AND 
`table_name`= tableName
INTO @sql;
END
delimiter ;
```