# Subquery
/*
-- A query nested within another query or subquery
-- Must be enclosed in parenthesis
-- Inner query: Subquery 	Outer query: Containing query
*/


# Independent Subqueries: 
/*
- executed as standlone subquery.
- inner query is executed first and then outer query
*/

SELECT * FROM customers;
# with WHERE Clause
-- > MySQL subquery with comparison operators
-- 		1.The customer who has the highest payment.
SELECT
	c.customerNumber,
    c.customerName,
    p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.amount = (SELECT MAX(amount) FROM payments);

-- 2. The customer (customerNumber, name) who has done payments greater than the average payment
SELECT
	c.customerNumber,
    c.customerName,
    p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.amount > (SELECT AVG(amount) FROM payments);


-- 3. The customer (customerNumber, name) who has done payments Less than the average payment
SELECT
	c.customerNumber,
    c.customerName,
    p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.amount < (SELECT AVG(amount) FROM payments);

-- > MySQL subquery with IN and NOT IN operators
-- 		2. Find the customers who have not placed any orders as follows
SELECT 
	customerNumber,
    customerName
FROM customers 
WHERE customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);

USE day3;
SELECT * FROM myemp;
SELECT EMP_ID,SALARY FROM MYEMP
ORDER BY SALARY DESC LIMIT 3;

# with FROM clause
-- 		4. Find top 3 paid employees from every department
SELECT *
FROM (SELECT 
		DEP_ID,
		EMP_ID,
		SALARY,
		DENSE_RANK() OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC) _DRANK
	FROM MYEMP) AS T1
WHERE _DRANK <=3;

--      5. Find top 3 selling products from each productline
USE classicmodels;
SELECT productLine,productCode,productName FROM products ORDER BY productLine;


SELECT *
FROM(SELECT *,
		DENSE_RANK() OVER (PARTITION BY productLine ORDER BY total_quantity_sold DESC) _DRANK
	FROM (SELECT 
			p.productLine,
			p.productCode,
			p.productName,
			SUM(d.quantityOrdered) AS total_quantity_sold 
		FROM products p
		JOIN orderdetails d ON p.productCode = d.productCode
		GROUP BY p.productLine,p.productCode,p.productName) T1) T2
WHERE _DRANK<=3;

# Coorelated Subqueries: 
/*
-  A correlated subquery is a subquery that uses the data from the outer query.
-  A correlated subquery is evaluated once for each row in the outer query.
*/
-- 		6. Select products whose buy prices are greater than the average buy price of all products in that product line.
SELECT productCode,productName,productLine,buyPrice FROM products ORDER BY productLine;

SELECT 
	productCode,
    productName,
    productLine,
    buyPrice 
FROM products p
WHERE buyPrice > (SELECT AVG(buyPrice) 
				FROM products 
                GROUP BY productLine
                HAVING productLine = p.productLine);

-- 		7. find customers who placed at least one sales order with the total value greater than 60K.
-- total_sales_value = quantityOrdered * priceEach

SELECT * FROM orders;
SELECT * FROM orderdetails;

SELECT
	c.customerNumber,
    c.customerName
FROM customers c
WHERE EXISTS (SELECT
    o.orderNumber,
    SUM(d.quantityOrdered * d.priceEach) AS total_sales_value
FROM orders o
JOIN orderdetails d ON o.orderNumber = d.orderNumber
WHERE o.customerNumber = c.customerNumber
GROUP BY o.orderNumber
HAVING total_sales_value > 60000);




