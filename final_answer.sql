--create database bookstore_db
-- This SQL script creates a database for a bookstore_db with tables for authors, books, and customers.
-- It also includes foreign key constraints to maintain referential integrity.
CREATE DATABASE bookstore_db;

USE bookstore_db;

-- Table: book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    language_id INT,
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Table: book_author (junction table for many-to-many relationship)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
);

-- Table: author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE
);

-- Table: book_language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

-- Insert data into book_language table
INSERT INTO book_language (language_name) VALUES 
('English'),
('Spanish'),
('French');

-- Insert data into author table
INSERT INTO author (first_name, last_name, birth_date) VALUES 
('John', 'Doe', '1980-05-14'),
('Jane', 'Smith', '1975-10-22'),
('Albert', 'Camus', '1913-11-07');

-- Insert data into book table
INSERT INTO book (title, publication_year, language_id, isbn) VALUES 
('The Stranger', 1942, 3, '123-4567890123'),
('The Catcher in the Rye', 1951, 1, '456-1234567890'),
('Don Quixote', 1605, 2, '789-0123456789');

-- Insert data into book_author table
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 3), -- 'The Stranger' by Albert Camus
(2, 1), -- 'The Catcher in the Rye' by John Doe
(3, 2); -- 'Don Quixote' by Jane Smith


--Create publisher table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(50)
);

--Insert sample data into publisher table
INSERT INTO publisher (name, email, phone) VALUES
('TechBooks Publishing', 'contact@techbooks.com', '123-456-7890'),
('Global Media', 'info@globalmedia.com', '987-654-3210'),
('Future Reads', 'hello@futurereads.com', '222-333-4444'),
('Skyline Press', 'support@skylinepress.com', '333-444-5555'),
('Eagle Publications', 'contact@eaglepub.com', '444-555-6666'),
('Moonlight Media', 'info@moonlight.com', '555-666-7777'),
('Golden Ink', 'admin@goldenink.com', '666-777-8888'),
('Nova House', 'hello@novahouse.com', '777-888-9999'),
('Prime Pages', 'pages@prime.com', '888-999-0000'),
('UrbanText', 'info@urbantext.com', '999-000-1111'),
('LitWorld', 'connect@litworld.com', '000-111-2222'),
('Sunrise Press', 'support@sunrisepress.com', '111-222-3333'),
('Orbit Books', 'contact@orbitbooks.com', '222-333-4444'),
('Blue Horizon Media', 'hello@bluehorizon.com', '333-444-5555'),
('Starline Publishers', 'team@starline.com', '444-555-6666')
;


--Create Country table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

INSERT INTO country  VALUES
('United States'),
('Canada'),
('United Kingdom'),
('Germany'),
('France'),
('Australia'),
('India'),
('Brazil'),
('Japan'),
('South Korea'),
('Mexico'),
('South Africa'),
('Italy'),
('Spain'),
('Netherlands')
;


--Create Customer table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_id INT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(50),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

--Insert sample data into customer table
-Insert sample data into customer_address table
INSERT INTO customer (publisher_id, first_name, last_name, email, phone) VALUES
(1, 'Alice', 'Johnson', 'alice.j@example.com', '555-1001'),
(2, 'Bob', 'Smith', 'bob.s@example.com', '555-1002'),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', '555-1003'),
(4, 'Diana', 'Prince', 'diana.p@example.com', '555-1004'),
(5, 'Ethan', 'Hunt', 'ethan.h@example.com', '555-1005'),
(6, 'Fiona', 'Davis', 'fiona.d@example.com', '555-1006'),
(7, 'George', 'Clark', 'george.c@example.com', '555-1007'),
(8, 'Hannah', 'Lee', 'hannah.l@example.com', '555-1008'),
(9, 'Ian', 'Wright', 'ian.w@example.com', '555-1009'),
(10, 'Jane', 'Miller', 'jane.m@example.com', '555-1010'),
(11, 'Kevin', 'Hall', 'kevin.h@example.com', '555-1011'),
(12, 'Laura', 'Young', 'laura.y@example.com', '555-1012'),
(13, 'Mike', 'Turner', 'mike.t@example.com', '555-1013'),
(14, 'Nina', 'Scott', 'nina.s@example.com', '555-1014'),
(15, 'Oscar', 'Bennett', 'oscar.b@example.com', '555-1015')
;


--Create address_status table
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);
--Insert sample data into address_status table
INSERT INTO address_status (status_name) VALUES
('Delivered'),
('Shipped'),
('Billing'),
('Shipped'),
('In Transit'),
('Pending'),
('Pending Confirmation'),
('Shipped'),
('Delivered'),
('Pending'),
('Inactive'),
('Active'),
('Main Residence'),
('Dispatched'),
('Delivery Point')
;



--Create Address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

--Insert sample data into address table
INSERT INTO address (street, city, state, postal_code, country_id) VALUES
('123 Main St', 'New York', 'NY', '10001', 1),
('456 Elm St', 'Toronto', 'ON', 'M4B1B3', 2),
('789 Baker St', 'London', '', 'NW16XE', 3),
('101 Maple Ave', 'Berlin', '', '10115', 4),
('202 Oak St', 'Paris', '', '75001', 5),
('303 Pine Rd', 'Sydney', 'NSW', '2000', 6),
('404 Cedar Blvd', 'Mumbai', 'MH', '400001', 7),
('505 Birch Ln', 'São Paulo', '', '01000-000', 8),
('606 Walnut Dr', 'Tokyo', '', '100-0001', 9),
('707 Ash Ct', 'Seoul', '', '04524', 10),
('808 Spruce Way', 'Mexico City', '', '01000', 11),
('909 Chestnut St', 'Cape Town', '', '8001', 12),
('111 Redwood Trl', 'Rome', '', '00100', 13),
('222 Willow Blvd', 'Madrid', '', '28001', 14),
('333 Poplar Rd', 'Amsterdam', '', '1011AC', 15);


--Create Customer_address table
CREATE TABLE customer_address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 5),
(4, 4, 2),
(5, 5, 4),
(6, 6, 6),
(7, 7, 1),
(8, 8, 7),
(9, 9, 8),
(10, 10, 9),
(11, 11, 10),
(12, 12, 11),
(13, 13, 12),
(14, 14, 13),
(15, 15, 14)
;


--Define relationships between customers, addresses, and country
A customer can have multiple addresses and an address can belong to multiple customers.
many-to-many relationship between customer and address.
one-to-many relationship between customer and customer_address.
Each address belongs to a country.
One- to-one relationship between customer and country

Each customer can optionally belong to a publisher.
one-to-one relationship between customer and publisher.

customer_address uses address_status to define the role of that address.
one-to-one relationship between customer_address and address_status.    

-- Creating table cust_order

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

--inserting data into cust_order

INSERT INTO cust_order (customer_id, order_date, order_status_id)
VALUES 
    (1, '2025-04-10', 1),
    (2, '2025-04-11', 2),
    (3, '2025-04-12', 3);
    
--creating table order_line

    CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

--inserting data into order_line

INSERT INTO order_line (order_id, book_id, quantity, price_per_unit)
VALUES 
    (1, 101, 2, 15.99),
    (1, 102, 1, 22.50),
    (2, 103, 3, 8.75);

    --creating data into shipping_method
    
    CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL
);

--inserting data into shipping_method

INSERT INTO shipping_method (method_name, cost)
VALUES 
    ('Standard', 5.00),
    ('Express', 10.00),
    ('International', 15.00);
    
--creating table order_histoy

    CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_change_date DATE NOT NULL,
    order_status_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

--inserting data into order_history

INSERT INTO order_history (order_id, status_change_date, order_status_id)
VALUES 
    (1, '2025-04-11', 2),
    (1, '2025-04-12', 3),
    (2, '2025-04-13', 1);
    
--creating table order_status

    CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

--inserting data into order_status

INSERT INTO order_status (status_name)
VALUES 
    ('Pending'),
    ('Shipped'),
    ('Delivered'),
    ('Cancelled');
    
    --permissions for users
   CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'admin_user'@'localhost';

CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'manager_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO 'manager_user'@'localhost';
