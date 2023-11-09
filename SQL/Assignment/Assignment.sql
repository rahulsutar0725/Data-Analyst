/* 
Day 3:
1)	Show customer number, customer name, state and credit limit from customers table for below conditions.
 Sort the results by highest to lowest values of creditLimit.
●	State should not contain null values
●	credit limit should be between 50000 and 100000
*/

SELECT 
	customerNumber,
	customerName,
    state,
    creditLimit 
FROM customers 
WHERE state IS NOT NULL AND creditLimit BETWEEN 50000 AND 100000 
ORDER BY creditLimit DESC;

/* 
Day 3:
2)	Show the unique productline values containing the word cars at the end from products table.
*/

SELECT DISTINCT 
	productline 
FROM products 
WHERE productLine LIKE '%Cars';

/* 
Day 4:
1)	Show the orderNumber, status and comments from orders table for shipped status only. 
If some comments are having null values then show them as “-“.
*/
SELECT
	orderNumber,
    status,
    ifnull(comments,'-') 
FROM orders;

/*
Day 4:
2)	Select employee number, first name, job title and job title abbreviation from employees table based on following conditions.
If job title is one among the below conditions, then job title abbreviation column should show below forms.
●	President then “P”
●	Sales Manager / Sale Manager then “SM”
●	Sales Rep then “SR”
●	Containing VP word then “VP”*/

SELECT 
	employeeNumber,
    firstName,
    jobTitle,
    CASE
    WHEN jobTitle='President'THEN 'P'
    WHEN jobTitle LIKE 'Sales Manager%' OR 'Sale Manager%' THEN 'SM'
    WHEN jobTitle='Sales Rep'THEN 'SR'
    ELSE 'VP'
    END AS jobjobTitle_abbr
FROM employees;

/*
Day 5:
1)	For every year, find the minimum amount value from payments table.
*/

SELECT
	YEAR(paymentDate) AS `Year`,
    MIN(amount) AS `Min Amount`
FROM payments
GROUP BY `Year`
ORDER BY `Year`;

/*
Day 5:
2)	For every year and every quarter, find the unique customers and total orders from orders table. 
Make sure to show the quarter as Q1,Q2 etc.
*/

SELECT 
	Year(orderDate) AS `Year`,
    CONCAT('Q',QUARTER(orderDate)) AS `Quarter`,
    COUNT(DISTINCT customerNumber) AS `Unique Customers`,
    COUNT(orderNumber) AS `Total Orders`
FROM orders
GROUP BY `Year`,`Quarter`
ORDER BY `Year`,`Quarter`;

/*
Day 5:
3)	Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb etc.) 
with filter on total amount as 500000 to 1000000. 
Sort the output by total amount in descending mode. [ Refer. Payments Table]
*/

SELECT
	DATE_FORMAT(paymentDate,'%b') AS `Month`,
    CONCAT(ROUND(SUM(amount)/1000),"K") AS `Total Amount` 
FROM payments
GROUP BY `Month`
HAVING SUM(amount) BETWEEN 500000 AND 1000000
ORDER BY `Total Amount` DESC;

/*
Day 6:
1)	Create a journey table with following fields and constraints.

●	Bus_ID (No null values)
●	Bus_Name (No null values)
●	Source_Station (No null values)
●	Destination (No null values)
●	Email (must not contain any duplicates)
*/
CREATE DATABASE Day6_Assignment;
USE Day6_Assignment;

CREATE TABLE journey(
		Bus_ID INT NOT NULL,
        Bus_Name VARCHAR(25) NOT NULL,
        Source_Srarion VARCHAR(25) NOT NULL,
        Destination VARCHAR(25) NOT NULL,
        Email VARCHAR(30) UNIQUE
);

/*
Day 6 :
2)	Create vendor table with following fields and constraints.

●	Vendor_ID (Should not contain any duplicates and should not be null)
●	Name (No null values)
●	Email (must not contain any duplicates)
●	Country (If no data is available then it should be shown as “N/A”)
*/
CREATE TABLE vendor(
		Vender_ID INT NOT NULL UNIQUE,
        Name VARCHAR(25) NOT NULL,
        Email VARCHAR(30) UNIQUE,
        Country VARCHAR(25) DEFAULT 'N/A'
);

/*
Day 6 :
3)	Create movies table with following fields and constraints.

●	Movie_ID (Should not contain any duplicates and should not be null)
●	Name (No null values)
●	Release_Year (If no data is available then it should be shown as “-”)
●	Cast (No null values)
●	Gender (Either Male/Female)
●	No_of_shows (Must be a positive number)
*/
CREATE TABLE movies(
		Movie_ID INT PRIMARY KEY,
        Name VARCHAR(25) NOT NULL,
        Release_Year VARCHAR(25) DEFAULT '-',
        Cast VARCHAR(50) NOT NULL,
        Gender VARCHAR(6) CHECK (Gender='Male' or Gender='Female'),
        No_of_shows INT CHECK (No_of_shows>0)
);

/*
Day 6 :

4)	Create the following tables. Use auto increment wherever applicable

a. Product
✔	product_id - primary key
✔	product_name - cannot be null and only unique values are allowed
✔	description
✔	supplier_id - foreign key of supplier table

b. Suppliers
✔	supplier_id - primary key
✔	supplier_name
✔	location

c. Stock
✔	id - primary key
✔	product_id - foreign key of product table
✔	balance_stock
*/
-- b.Suppliers
CREATE TABLE Suppliers(
		supplier_id INT PRIMARY KEY AUTO_INCREMENT,
        supplier_name VARCHAR(25),
        location VARCHAR(25)
);
-- a. Product
CREATE TABLE Product(
		product_id INT PRIMARY KEY,
        product_name VARCHAR(25) NOT NULL UNIQUE,
        description VARCHAR(300),
        supplier_id INT,
        FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
); 
-- C. Stock
CREATE TABLE Stock(
		id INT PRIMARY KEY AUTO_INCREMENT,
        product_id INT,
        balance_stock INT,
        FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

/*
Day 7:

1)	Show employee number, Sales Person (combination of first and last names of employees), 
unique customers for each employee number and sort the data by highest to lowest unique customers.

Tables: Employees, Customers
*/

SELECT 
	e.employeeNumber,
    CONCAT(e.firstName,' ', e.lastname) AS `Sales Person`,
    COUNT(DISTINCT customerNumber) AS `Unique Customers`
FROM employees e 
INNER JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY `Unique Customers` DESC;

/*
Day 7:

2)	Show total quantities, total quantities in stock, left over quantities for each product and each customer. 
Sort the data by customer number.

Tables: Customers, Orders, Orderdetails, Products
*/
SELECT
	c.customerNumber,
    c.customerName,
    p.productCode,
    p.productName,
    d.quantityOrdered AS 'Ordered Qty',
    p.quantityInStock AS 'Total Inventory',
    p.quantityInStock - d.quantityOrdered AS 'Left Qty'
FROM customers c
INNER JOIN orders o ON c.customerNumber=o.customerNumber
INNER JOIN orderdetails d ON o.orderNumber=d.orderNumber
INNER JOIN products p ON d.productCode=p.productCode
GROUP BY p.productCode,c.customerNumber;
    
/*
Day 7:

3)	Create below tables and fields. (You can add the data as per your wish)

●	Laptop: (Laptop_Name)
●	Colours: (Colour_Name)
Perform cross join between the two tables and find number of rows.

*/
CREATE TABLE Laptop(
	Laptop_Name VARCHAR(20)
);
INSERT INTO Laptop VALUES ('Dell'),('HP'),('Lenovo');

CREATE TABLE Colours(
	Colour_Name VARCHAR(20)
);
INSERT INTO Colours VALUES ('White'),('Silver'),('Black');

SELECT
	l.Laptop_Name,
    c.Colour_Name
FROM Colours c
CROSS JOIN Laptop l;	


/*
Day 7:
4)	Create table project with below fields.

●	EmployeeID
●	FullName
●	Gender
●	ManagerID
Add below data into it.
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);
Find out the names of employees and their related managers.
*/

CREATE TABLE Project(
	EmployeeID INT,
    FullName VARCHAR(30),
    Gender VARCHAR(10),
    ManagerID INT
);

INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

SELECT
	t1.FullName AS 'ManagerName',
    t2.FullName AS 'EmployeeName'    
FROM Project t1
JOIN Project t2 ON t2.ManagerID = t1.EmployeeID
ORDER BY T1.FullName;

/*
Day 8:
Create table facility. Add the below fields into it.
●	Facility_ID
●	Name
●	State
●	Country

i) Alter the table by adding the primary key and auto increment to Facility_ID column.
ii) Add a new column city after name with data type as varchar which should not accept any null values.

*/

CREATE TABLE facility(
	Facility_ID INT,
    `Name` VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

ALTER TABLE facility
MODIFY COLUMN Facility_ID INT PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE facility
ADD COLUMN City VARCHAR(25) NOT NULL AFTER `Name`;

/*
Day 9:
Create table university with below fields.
●	ID
●	Name
Add the below data into it as it is.
INSERT INTO University
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");
Remove the spaces from everywhere and update the column like Pune University etc.
*/

CREATE TABLE University(
	ID INT,
    `Name` VARCHAR(100)
);

INSERT INTO University
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");
              
UPDATE University
SET `Name` = REPLACE(REPLACE(REPLACE(`Name`, ' ', '<>'), '><', ''), '<>',' ');
SELECT * FROM University;
/*
Day 10:
Create the view products status. Show year wise total products sold. 
Also find the percentage of total value for each year. 
The output should look as shown in below figure.
*/
CREATE VIEW products_status
AS
SELECT
	YEAR(o.orderDate) AS `Year`,
    CONCAT(COUNT(d.quantityOrdered),' (',ROUND((COUNT(d.quantityOrdered)/(SELECT COUNT(quantityOrdered) FROM orderdetails))*100),'%)') AS `Value`
FROM orders o
JOIN orderdetails d ON o.orderNumber=d.orderNumber
GROUP BY `Year`
ORDER BY COUNT(d.quantityOrdered) DESC;

SELECT * FROM products_status;

/*
Day 11:
1)	Create a stored procedure GetCustomerLevel which takes input as customer number and gives the output as either Platinum, 
Gold or Silver as per below criteria.

Table: Customers

●	Platinum: creditLimit > 100000
●	Gold: creditLimit is between 25000 to 100000
●	Silver: creditLimit < 25000
*/
DELIMITER //
CREATE PROCEDURE GetCustomerLevel(IN customer_Number INT)
BEGIN
	SELECT
		CASE
			WHEN creditLimit > 100000 THEN 'Platinum'
            WHEN creditLimit BETWEEN 25000 AND 100000 THEN 'Gold'
            ELSE 'Silver'
		END AS 'CustomerLevel'
	FROM customers
    WHERE customerNumber = customer_Number;
END //
DELIMITER ;

CALL getCustomerLevel(112);

/*
Day 11:
2)	Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, 
country wise total amount as an output. Format the total amount to nearest thousand unit (K)
Tables: Customers, Payments
*/

DELIMITER //
CREATE PROCEDURE Get_country_payments(IN ` Year` INT, IN Country VARCHAR(20))
BEGIN
	SELECT 
		YEAR(p.paymentDate) AS `Year`,
        c.Country,
        CONCAT(ROUND(SUM(p.amount)/1000),'K') AS 'TotalAmount'
	FROM payments p
    JOIN customers c ON p.customerNumber = c.customerNumber
    GROUP BY `Year`,c.Country
    HAVING `Year` = ` Year` AND c.Country = Country;
END //
DELIMITER ;

CALL Get_country_payments(2003,'France');

/*
Day 12:
1)	Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. 
Format the YoY values in no decimals and show in % sign.
Table: Orders
*/
SELECT
	DATE_FORMAT(orderDate,'%Y') AS `Year`,
    DATE_FORMAT(orderDate,'%M') AS `Month`,
	COUNT(orderNumber) AS 'Total Orders',
    CONCAT(ROUND(((COUNT(orderNumber)-LAG(COUNT(orderNumber)) OVER (ORDER BY YEAR(orderDate),MONTH(orderDate)))
    /LAG(COUNT(orderNumber)) OVER (ORDER BY YEAR(orderDate),MONTH(orderDate)))*100),'%') AS '% YoY Change'
FROM orders
GROUP BY `Year`,`Month`;

/*
Day 12:
2)	Create the table emp_udf with below fields.

●	Emp_ID
●	Name
●	DOB
Add the data as shown in below query.
INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");

Create a user defined function calculate_age which returns the age in years and months (e.g. 30 years 5 months) by accepting DOB column as a parameter
*/

CREATE TABLE emp_udf(
	Emp_ID INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(30),
    DOB DATE
);

INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");

DELIMITER //
CREATE FUNCTION calculate_age(DOB DATE)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE `Years` INT;
    DECLARE `Months` INT;
    DECLARE `Age` VARCHAR(100);
    SET `Years` = TIMESTAMPDIFF(YEAR,DOB,NOW());
    SET `Months` = MOD(TIMESTAMPDIFF(MONTH,DOB,NOW()),12);
    SET `Age` = CONCAT(`Years`,' years ',`Months`,' months');
	RETURN `Age`;
END //
DELIMITER ;

SELECT
	*,
    calculate_age(DOB) AS Age
FROM emp_udf;
    
/*
Day 13:
1)	Display the customer numbers and customer names from customers table who have not placed any orders using subquery

Table: Customers, Orders
*/
SELECT
	customerNumber,
    customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);
/*
Day 13:
2)	Write a full outer join between customers and orders using union and get the customer number, customer name, count of orders for every customer.
Table: Customers, Orders
*/
SELECT customerNumber,COUNT(orderNumber)
FROM orders
GROUP BY customerNumber;
SELECT
	c.customerNumber,
    c.customerName,
    COUNT(o.orderNumber) AS 'Total Orders'
FROM customers c
LEFT JOIN orders o ON c.customerNumber=o.customerNumber
GROUP BY c.customerNumber,c.customerName
UNION
SELECT
	c.customerNumber,
    c.customerName,
    COUNT(o.orderNumber) AS 'Total Orders'
FROM customers c
RIGHT JOIN orders o ON c.customerNumber=o.customerNumber
GROUP BY c.customerNumber,c.customerName;

/*
Day 13:
3)	Show the second highest quantity ordered value for each order number.
Table: Orderdetails
*/
SELECT 
	orderNumber,
    quantityOrdered
FROM (
	SELECT 
		orderNumber,
		quantityOrdered,
		DENSE_RANK() OVER (PARTITION BY orderNumber ORDER BY quantityOrdered DESC) _DRANK
	FROM orderdetails ) AS T1
WHERE _DRANK=2;

/*
Day 13:
4)	For each order number count the number of products and then find the min and max of the values among count of orders.
Table: Orderdetails
*/
SELECT 
	MAX(Total),
    MIN(Total)
FROM
	(SELECT 
		orderNumber,
		COUNT(productCode) AS Total
	FROM orderdetails
	GROUP BY orderNumber) AS T1;
    
/*
Day 13:
5)	Find out how many product lines are there for which the buy price value is greater than the average of buy price value. 
Show the output as product line and its count.
*/
SELECT * FROM products;

SELECT
	productLine,
    COUNT(productLine) AS Total
FROM products
WHERE buyPrice>(SELECT AVG(buyPrice) FROM products)
GROUP BY productLine
ORDER BY Total DESC;

/*
Day 14:
Create the table Emp_EH. Below are its fields.
●	EmpID (Primary Key)
●	EmpName
●	EmailAddress
Create a procedure to accept the values for the columns in Emp_EH. 
Handle the error using exception handling concept. 
Show the message as “Error occurred” in case of anything wrong
*/
CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    EmailAddress VARCHAR(100)
);

DELIMITER //
CREATE PROCEDURE Emp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(100),
    IN p_EmailAddress VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error occurred';
    END;
    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress) VALUES (p_EmpID, p_EmpName, p_EmailAddress);
END;
//
DELIMITER ;

CALL Emp_EH(1,'ABC','ABC@XYZ.com');
SELECT * FROM Emp_EH;
CALL Emp_EH(NULL,'ABC','ABC@XYZ.com');

/*
Day 15:
Create the table Emp_BIT. Add below fields in it.
●	Name
●	Occupation
●	Working_date
●	Working_hours

Insert the data as shown in below query.
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  
 
Create before insert trigger to make sure any new value of Working_hours, if it is negative, then it should be inserted as positive.
*/
CREATE TABLE Emp_BIT (
    Name VARCHAR(100),
    Occupation VARCHAR(100),
    Working_date DATE,
    Working_hours INT
);

DELIMITER //
CREATE TRIGGER Before_Insert
BEFORE INSERT ON Emp_BIT
FOR EACH ROW
BEGIN
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = -NEW.Working_hours;
    END IF;
END;
//
DELIMITER ;

INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),
('Warner', 'Engineer', '2020-10-04', 10),
('Peter', 'Actor', '2020-10-04', 13),
('Marco', 'Doctor', '2020-10-04', 14),
('Brayden', 'Teacher', '2020-10-04', -12),
('Antonio', 'Business', '2020-10-04', 11);

SELECT * FROM Emp_BIT;

