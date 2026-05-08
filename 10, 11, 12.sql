-- Q10. Window functions - Rank, dense_rank, lead and lag
-- a) Using customers and orders tables, rank the customers based on their order frequency
USE classicmodels;
SELECT c.customerName, COUNT(o.orderNumber) AS Order_count,
DENSE_RANK() OVER (ORDER BY COUNT(o.orderNumber) DESC) AS order_frequency_rnk
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerName;
-- b) Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. Format the YoY values in no decimals and show in % sign.
-- Table: Orders
WITH MonthlyOrders AS (
    SELECT 
        YEAR(orderDate) AS Year,
        MONTHNAME(orderDate) AS Month,
        MONTH(orderDate) AS MonthNum,
        COUNT(orderNumber) AS Total_Orders
    FROM orders
    GROUP BY Year, Month, MonthNum
)
SELECT 
    Year, 
    Month, 
    Total_Orders,
    CONCAT(ROUND(((Total_Orders - LAG(Total_Orders) OVER (ORDER BY Year, MonthNum)) / LAG(Total_Orders) OVER (ORDER BY Year, MonthNum)) * 100, 0), '%') AS '% YoY Change'
FROM MonthlyOrders;

-- Q11.Subqueries and their applications
-- a) Find out how many product lines are there for which the buy price value is greater than the average of buy price value. Show the output as product line and its count.
SELECT productLine, COUNT(*) AS Total
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products)
GROUP BY productLine
ORDER BY Total DESC;

-- Q12. ERROR HANDLING in SQL. Create the table Emp_EH. Below are its fields.
-- 		EmpID (Primary Key)
-- 		EmpName
-- 		EmailAddress
-- Create a procedure to accept the values for the columns in Emp_EH. 
-- Handle the error using exception handling concept. Show the message as “Error occurred” in case of anything wrong.
CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    EmailAddress VARCHAR(255)
);
CALL InsertEmp_EH()

