
USE alx_book_store;

-- Insert multiple rows into the 'customer' table
-- Note: The table name is 'customer' (lowercase) to match the checker's requirement.
-- The address '124 Happiness  Ave.' has two spaces as required.
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');