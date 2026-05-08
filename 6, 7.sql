-- Q6. SELF JOIN
-- a) Create a table project with below fields.
-- 		EmployeeID : integer set as the PRIMARY KEY and AUTO_INCREMENT.
-- 		FullName: varchar(50) with no null values
-- 		Gender : Values should be only ‘Male’  or ‘Female’
-- 		ManagerID: integer 
-- Add below data into it.
use classicmodels;
-- Find out the names of employees and their related managers.
CREATE TABLE project(EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FullName varchar(50) NOT NULL, 
Gender ENUM("Male","Female"),
ManagerID INT);

INSERT INTO project (EmployeeID, FullName, Gender, ManagerID) VALUES
(1, 'Pranaya', 'Male', 3),
(2, 'Priyanka', 'Female', 1),
(3, 'Preety', 'Female', NULL),
(4, 'Anurag', 'Male', 1),
(5, 'Sambit', 'Male', 1),
(6, 'Rajesh', 'Male', 3),
(7, 'Hina', 'Female', 3);

SELECT* FROM project;

select m.fullname as "Manager Name", e.fullname as "Emp name" from project e 
JOIN project m on e.ManagerID = m.EmployeeID;

-- Q7. DDL Commands: Create, Alter, Rename
-- a) Create table facility. Add the below fields into it.
-- 		Facility_ID
-- 		Name
-- 		State
-- 		Country
-- i) Alter the table by adding the primary key and auto increment to Facility_ID column.
-- ii) Add a new column city after name with data type as varchar which should not accept any null values.
CREATE TABLE facility( Facility_ID INT,
 Name varchar(50),
 State varchar(50),
 Country varchar(50));
 
 ALTER TABLE facility
 MODIFY column Facility_ID INT PRIMARY KEY AUTO_INCREMENT;
 
 ALTER TABLE facility 
ADD City VARCHAR(100) NOT NULL AFTER Name;

DESCRIBE facility;
 

