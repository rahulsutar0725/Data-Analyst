USE DAY7;
-- Table and Column Alias -> display/ temporary name for a column or table

SELECT 
	Column1 AS `COL 1`,
    Column2 AS COL2
FROM table1 AS t1;

-- AS is optional

SELECT 
	Column1  `COL 1`,
    Column2  COL2
FROM table1  t1;

# Joins: Retrieve data from two or more table

-- Steps:
-- 1. Specify the joining tables in the FROM Clause, and JOIN type -
-- 2. Specify the JOIN condition - common column / conditional expression
-- 3. Filter rows/ Specify columns/ Order the rows/ LIMIT the resulting rows. 
-- ----------------------------------------------------------------------------------

/*
			table1					table2					table3
			col1	col2		col1     col3  				col4	col5
			A		AA			A		 AAA				AAA		AAAA
			B		BB			B		 BBB				EEE		EEEE
			C		CC			D		 DDD
*/


# Types of Joins
-- 1. Inner Join: Returns records that have matching values in both tables
SELECT * 
FROM table1
INNER JOIN table2 ON table1.column1 = table2.column1;

#Using Alias
SELECT * 
FROM table1 AS t1
INNER JOIN table2 AS t2 ON t1.column1 = t2.column1;

/* OUTPUT: 
1	2	1	3
A	AA	A	AAA
B	BB	B	BBB	
*/

SELECT * 
FROM table1 t1
INNER JOIN table2 t2 ON t1.column1 = t2.column1; -- all statements are displays the all records

SELECT 
		t1.column1,
        t1.column2,
        t2.column3
FROM table1 t1
INNER JOIN table2 t2 ON t1.column1 = t2.column1;

SELECT 
		t1.*,
        t2.column3
FROM table1 t1
INNER JOIN table2 t2 ON t1.column1 = t2.column1;

#OUTER JOIN:

-- 2. Left Outer Join/ Left Join: Returns all records from the left table, and the matched records from the right table

SELECT * 
FROM table1 t1
LEFT JOIN table2 t2 ON t1.column1 = t2.column1;

/* OUTPUT:
1	2	1	3
A	AA	A	AAA
B	BB	B	BBB
C	CC NULL NULL	
*/

-- 3. Right Outer Join/ Right Join: Returns all records from the right table, and the matched records from the left table

SELECT * 
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.column1 = t2.column1;

/* OUTPUT:
1		2		1	3
A		AA		A	AAA
B		BB		B	BBB
NULL	NULL	D	DDD
*/

-- 4. Full Outer join: returns all records from both the tables matching or not
SELECT * 
FROM table1 t1
LEFT JOIN table2 t2 ON t1.column1 = t2.column1 
UNION
SELECT * 
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.column1 = t2.column1;

/* OUTPUT:
1		2	   1	3
A		AA	   A	AAA
B		BB	   B	BBB
C		CC 	   NULL NULL
NULL	NULL   D	DDD
*/

-- 5. Cross Join: multiplies/ matches every record from left table to every record from right table

SELECT * FROM table1 JOIN table2;

SELECT * FROM table1 , table2;
/*
	C	CC	A	AAA
	B	BB	A	AAA
	A	AA	A	AAA
	C	CC	B	BBB
	B	BB	B	BBB
	A	AA	B	BBB
	C	CC	D	DDD
	B	BB	D	DDD
	A	AA	D	DDD
*/

-- 6. Self Join: a Table joined to itself

SELECT * 
FROM table1 t1
JOIN table1 t2 ON t1.column1 = t2.column1;

/*
	A	AA	A	AA
	B	BB	B	BB
	C	CC	C	CC
*/

-- Joining multiple tables
-- INNER JOIN:
SELECT *
FROM table1 t1 
JOIN table2 t2 ON t1.column1 = t2.column1
join table3 t3 ON t2.column3 = t3.column4;

-- LEFT JOIN:
SELECT *
FROM table1 t1 
LEFT JOIN table2 t2 ON t1.column1 = t2.column1
LEFT join table3 t3 ON t2.column3 = t3.column4;

-- T1 INNER JOIN T2 LEFT JOIN T3:
SELECT *
FROM table1 t1 
JOIN table2 t2 ON t1.column1 = t2.column1
LEFT join table3 t3 ON t2.column3 = t3.column4;

-- RIGHT JOIN:
SELECT *
FROM table1 t1 
RIGHT JOIN table2 t2 ON t1.column1 = t2.column1
RIGHT join table3 t3 ON t2.column3 = t3.column4;

-- OUTER JOIN:
SELECT *
FROM table1 t1 
LEFT JOIN table2 t2 ON t1.column1 = t2.column1
LEFT join table3 t3 ON t2.column3 = t3.column4
UNION
SELECT *
FROM table1 t1 
RIGHT JOIN table2 t2 ON t1.column1 = t2.column1
RIGHT join table3 t3 ON t2.column3 = t3.column4;


/**/
USE classicmodels;
-- 1. Query Customers whose orders are Disputed or On Hold.

/*
cutomers  --> customerNumber,customerName
 | INNER JOIN - common column - customerNumber
orders    --> orderNumber,status

*/

SELECT 
	c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.`status`
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.`status` IN ('Disputed','On Hold');


-- 2. Calculate the total quantity sold and the revenue generated for each product.
/*
	revenue = quantityOrdered * priceEach
    products --> productCode
    | INNER JOIN - Common Column productCode
	orderdetails --> quantityOrdered,priceEach    
*/

SELECT 
		p.productCode,
        p.productName,
        SUM(d.quantityOrdered) AS total_quantity_sold,
        SUM(d.quantityOrdered * d.priceEach) AS total_revenue
FROM products p
INNER JOIN orderdetails d ON p.productCode = d.productCode
GROUP BY p.productCode,p.productName;

-- 3. Write a query that returns total payment done each customer with their sales employee, 
--    returns NULL if the customer has no payment.
/*
	employees
    | INNER JOIN - common column (salesRepEmployeeNumber, employeeNumber)
	customers - customerNumber
    | LEFT JOIN - common column - customersNumber 
	payments - amount
*/
SELECT 
		e.employeeNumber,
        CONCAT(e.firstName,' ',e.lastName) AS employeeName,
        e.jobTitle,
        c.customerNumber,
        sum(p.amount) as `Total Payment`
FROM employees e
INNER JOIN customers c ON e.employeeNumber = C.salesRepEmployeeNumber
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY e.employeeNumber,employeeName,c.customerNumber;


select * from customers;
select * from employees;
select * from payments;

-- 4. Query Country names and their respective average sales amount truncated to 2 decimal places
/*
customers   -> country
|  INNER JOIN - common column - customerNumber
orders
| INNER JOIN - common column - orderNumber
orderdetails -> quantityOrdered * priceEach
*/
-- TRUNCATE(column name, no. of digits)

SELECT
	c.country,
    TRUNCATE(AVG(d.quantityOrdered * d.priceEach),2) AS T_AVG_Sales,
	ROUND(AVG(d.quantityOrdered * d.priceEach),2) AS R_AVG_Sales
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails d ON o.orderNumber = d.orderNumber
GROUP BY c.country;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;



# Self Join
-- 5. Retrieve all employees and their respective managers, if any.
-- (EMP_ID,EMP_NAME) 
USE day3;
SELECT 
	e1.EMP_ID,
    CONCAT(e1.FIRST_NAME,' ',e1.LAST_NAME) AS EMP_NAME,
    e1.MGR_ID,
    CONCAT(e2.FIRST_NAME,' ',e2.LAST_NAME) AS MGR_NAME
FROM MYEMP e1
LEFT JOIN MYEMP e2 ON e1.MGR_ID=e2.EMP_ID;


-- 6. Find names and salaries of employees who earn more than their managers
SELECT 
	e1.EMP_ID,
    CONCAT(e1.FIRST_NAME,' ',e1.LAST_NAME) AS EMP_NAME,
    e1.salary AS E_SALARY,
    e1.MGR_ID,
    CONCAT(e2.FIRST_NAME,' ',e2.LAST_NAME) AS MGR_NAME,
    e2.salary AS M_SALARY
FROM MYEMP e1
LEFT JOIN MYEMP e2 ON e1.MGR_ID=e2.EMP_ID
WHERE e1.salary>e2.salary;

SELECT 
	e1.EMP_ID,
    CONCAT(e1.FIRST_NAME,' ',e1.LAST_NAME) AS EMP_NAME,
    e1.salary AS E_SALARY,
    e1.MGR_ID,
    CONCAT(e2.FIRST_NAME,' ',e2.LAST_NAME) AS MGR_NAME,
    e2.salary AS M_SALARY
FROM MYEMP e1
JOIN MYEMP e2 ON e1.MGR_ID=e2.EMP_ID AND e1.salary>e2.salary;

# HomeWork
-- 1. Retrieve the top 5 customers who made the highest total purchases from the orders table.
SELECT 
	o.customerNumber,
    SUM(d.quantityOrdered * d.priceEach) as `Total Purchases`
FROM orders o
INNER JOIN orderdetails d ON o.orderNumber = d.orderNumber
GROUP BY o.customerNumber
ORDER BY `Total Purchases` DESC
LIMIT 5;

-- 2. Display the list of customers with no orders placed.
SELECT 
	c.customerNumber,
    c.customerName,
    o.orderNumber
FROM customers c
LEFT JOIN orders o ON c.customerNumber=o.customerNumber
WHERE o.orderNumber IS NULL;

# Home Work Views
-- 1. write a query to list the employees (employeeNumber, employeeName) along with their work location (state, city)
CREATE VIEW list_of_employees
AS
SELECT  
	e.employeeNumber,
    CONCAT(e.firstName,' ',e.lastName) AS employeeName,
    o.state,
    o.city
FROM employees e
INNER JOIN offices o ON e.officeCode=o.officeCode;

-- 2. Write a query to get total orders of each productline for year and quarter

CREATE VIEW Total_Orders
AS
SELECT
	p.productLine,
    YEAR(o.orderDate) AS `Year`,
    CONCAT('Q',QUARTER(o.orderDate)) AS `Quarter`,
    SUM(d.quantityOrdered) AS `Total Orders`
FROM products p
INNER JOIN orderdetails d ON p.productCode=d.productCode
INNER JOIN orders o ON d.orderNumber=o.orderNumber
GROUP BY p.productLine,`Year`,`Quarter`;

