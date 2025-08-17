
USE alx_book_store;

-- Retrieve the full description of the 'Books' table
-- by querying the INFORMATION_SCHEMA.COLUMNS table.
-- This approach is used because DESCRIBE and EXPLAIN are not allowed.
SELECT
    COLUMN_NAME,    -- The name of the column
    COLUMN_TYPE,    -- The data type and length/precision of the column
    IS_NULLABLE,    -- Indicates if the column can contain NULL values (YES/NO)
    COLUMN_KEY,     -- Indicates if the column is a key (PRI for Primary, MUL for Index, UNI for Unique)
    COLUMN_DEFAULT, -- The default value for the column
    EXTRA           -- Any extra information about the column (e.g., 'auto_increment')
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books';