-- Q4. CONSTRAINTS: Primary, key, foreign key, Unique, check, not null, default
-- Create a new database named and Customers_Orders and add the following tables as per the description
-- a)Create a table named Customers to store customer information. Include the following columns:
-- 		customer_id: This should be an integer set as the PRIMARY KEY and AUTO_INCREMENT.
-- 		first_name: This should be a VARCHAR(50) to store the customer's first name.
-- 		last_name: This should be a VARCHAR(50) to store the customer's last name.
-- 		email: This should be a VARCHAR(255) set as UNIQUE to ensure no duplicate email addresses exist.
-- 		phone_number: This can be a VARCHAR(20) to allow for different phone number formats.
-- Add a NOT NULL constraint to the first_name and last_name columns to ensure they always have a value.

CREATE DATABASE Customers_Orders;
USE Customers_Orders;
CREATE TABLE Customers(customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL, 
email VARCHAR(255) UNIQUE,
phone_number VARCHAR(20)
);
-- b) Create a table named Orders to store information about customer orders. Include the following columns:
-- 		order_id: This should be an integer set as the PRIMARY KEY and AUTO_INCREMENT.
-- 		customer_id: This should be an integer referencing the customer_id in the Customers table  (FOREIGN KEY).
-- 		order_date: This should be a DATE data type to store the order date.
-- 		total_amount: This should be a DECIMAL(10,2) to store the total order amount.
-- Constraints:
-- I)	Set a FOREIGN KEY constraint on customer_id to reference the Customers table.
-- II)	Add a CHECK constraint to ensure the total_amount is always a positive value.
CREATE TABLE Orders (order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE, 
total_amount DECIMAL(10,2), 
FOREIGN KEY(customer_id) references Customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
CHECK (total_amount >0)); 

