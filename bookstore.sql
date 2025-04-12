--create database bookstore_db
-- This SQL script creates a database for a bookstore_db with tables for authors, books, and customers.
-- It also includes foreign key constraints to maintain referential integrity.
CREATE DATABASE bookstore_db;

USE bookstore_db;

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

