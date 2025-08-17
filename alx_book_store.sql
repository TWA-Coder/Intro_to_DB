-- alx_book_store.sql

-- Drop the database if it exists to ensure a clean slate
DROP DATABASE IF EXISTS alx_book_store;

-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;

--
-- Table structure for table `Authors`
--
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

--
-- Table structure for table `Books`
--
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

--
-- Table structure for table `Customers`
--
-- Note: 'email' field is set to be unique to prevent duplicate customer entries
--
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215) UNIQUE,
    address TEXT
);

--
-- Table structure for table `Orders`
--
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

--
-- Table structure for table `Order_Details`
--
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

--
-- Create indexes for foreign keys to improve performance on joins
--
CREATE INDEX idx_author_id ON Books (author_id);
CREATE INDEX idx_customer_id ON Orders (customer_id);
CREATE INDEX idx_order_id ON Order_Details (order_id);
CREATE INDEX idx_book_id ON Order_Details (book_id);