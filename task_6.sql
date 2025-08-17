-- task_6.sql

-- Use the alx_book_store database
USE alx_book_store;

-- Insert multiple rows into the Customers table using a single INSERT statement
INSERT INTO Customers (customer_id, customer_name, email, address)
VALUES
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');