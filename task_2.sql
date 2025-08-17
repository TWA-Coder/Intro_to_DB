-- task_2.sql

-- Use the alx_book_store database
USE alx_book_store;

--
-- Table structure for table `Authors`
--
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

--
-- Table structure for table `Books`
--
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

--
-- Table structure for table `Customers`
--
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE, -- Email should be unique for each customer
    address TEXT
);

--
-- Table structure for table `Orders`
--
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

--
-- Table structure for table `Order_Details`
--
-- This table links orders to specific books and quantities
--
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

--
-- Create indexes for foreign keys to improve query performance
--
CREATE INDEX idx_books_author_id ON Books (author_id);
CREATE INDEX idx_orders_customer_id ON Orders (customer_id);
CREATE INDEX idx_order_details_order_id ON Order_Details (order_id);
CREATE INDEX idx_order_details_book_id ON Order_Details (book_id);