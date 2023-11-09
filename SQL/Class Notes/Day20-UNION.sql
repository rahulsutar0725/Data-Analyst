CREATE DATABASE day14;
USE day14;
CREATE TABLE t1(c1 INT);
CREATE TABLE t2(c2 INT);
INSERT INTO t1 VALUES(1),(2),(3),(4);
INSERT INTO t2 VALUES (3),(1),(5);

SELECT * FROM t1;
SELECT * FROM t2;

# UNION
/*
- combines the result set of two or more SELECT query into one.
- Removes the duplicate rows from both sets.
*/
SELECT * FROM t1
UNION
SELECT * FROM t2;

# UNION ALL
/*
- combines the result set of two or more SELECT query into one.
- Retains the duplicate rows from both sets.
*/
SELECT * FROM t1
UNION ALL
SELECT * FROM t2;
# INTERSECT
/*
- combine two result sets and return the data which are common in both the result set.
*/
SELECT * FROM t1
WHERE c1 IN (SELECT c2 FROM t2);

# Conditions to use UNION/ UNION ALL/ INTERSECT
/*
- both SELECT statements should have equal no. of fields 
- The data-types of these fields shouLd either be same or compatible with each other.
*/
-- Write a SQL query to find all salespeople and customers located in the city of London.

USE classicmodels;
SELECT customerNumber, customerName, 'customer' AS Category
FROM customers
WHERE city = 'London'
UNION
SELECT employeeNumber, CONCAT(firstName,' ',lastName) AS employeeName, 'employee' AS Category
FROM employees e join offices o ON e.officeCode = o.officeCode
WHERE o.city = 'London';





