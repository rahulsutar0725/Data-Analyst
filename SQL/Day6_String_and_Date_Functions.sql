
-- String Function

use day3;
SELECT * FROM MYEMP LIMIT 5;
-- CONCAT(): used to combine/concat strings
SELECT 
	EMP_ID,
    CONCAT(FIRST_NAME," ",LAST_NAME) AS EMP_NAME,
    EMAIL
FROM MYEMP;
-- UPPER(): used to convert the strings/column values to uppwer case
SELECT
	EMP_ID,
    UPPER(FIRST_NAME) AS FIRST_NAME,
    UPPER(LAST_NAME) AS LAST_NAME
FROM myemp;

-- LOWER(): used to convert the strings/column values to lower case
SELECT
	EMP_ID,
    LOWER(FIRST_NAME) AS first_name,
    LOWER(LAST_NAME) AS last_name
FROM myemp;

SELECT 
	EMP_ID,
    CONCAT(UPPER(FIRST_NAME)," ",lower(LAST_NAME)) AS EMP_NAME,
    EMAIL
FROM MYEMP;

SELECT 
	EMP_ID,
    UPPER(CONCAT(FIRST_NAME," ",LAST_NAME)) AS EMP_NAME,
    EMAIL
FROM MYEMP;

-- Date Functions: operate on Date values

SELECT NOW();

SELECT YEAR(NOW());
SELECT YEAR('2022-12-22');

SELECT MONTH(NOW());
SELECT MONTH('2022-12-22');

SELECT MONTHNAME(NOW());
SELECT MONTHNAME('2022-12-22');

SELECT QUARTER(NOW());

SELECT DATE(NOW());

SELECT TIME(NOW());

SELECT WEEKDAY(NOW());
SELECT DAYNAME(NOW());
SELECT DAYNAME('2022-12-22');


SELECT * FROM MYEMP;

SELECT
	HIRE_DATE,
	YEAR(HIRE_DATE) AS YEAR,
    MONTH(HIRE_DATE) AS MONTH,
    MONTHNAME(HIRE_DATE) AS MonthName,
    DAYNAME(HIRE_DATE) AS DayName
from myemp;


-- Write a query to get details of employees hired before year 2000 (DB: DAY3 TABLE: MYEMP)

SELECT *
FROM MYEMP
WHERE YEAR(HIRE_DATE)<2000;

SELECT *
FROM MYEMP
WHERE YEAR(HIRE_DATE)>2000;

SELECT *
FROM MYEMP
WHERE YEAR(HIRE_DATE)>=2000;

SELECT *
FROM MYEMP
WHERE YEAR(HIRE_DATE)>=2000
ORDER BY YEAR(HIRE_DATE) DESC;


-- Write a query to get details of employees hired between the year 1998 and 2001

SELECT * 
FROM MYEMP
WHERE YEAR(HIRE_DATE) BETWEEN 1998 AND 2001;

-- Write a query to get details of employees hired after '01-01-2001'

SELECT * 
FROM MYEMP
WHERE HIRE_DATE>'2001-01-01';

-- Write a query to get details of employees and order by month

SELECT *
FROM MYEMP
ORDER BY MONTH(HIRE_DATE) DESC;

-- Write a query to get the days difference between order date and shipped date in days (DB: classicmodels Table: Orders)

USE CLASSICMODELS;

SELECT * 
FROM ORDERS;

SELECT 
	ORDERNUMBER,
    ORDERDATE,
    SHIPPEDDATE,
    DATEDIFF(SHIPPEDDATE,ORDERDATE) AS DAYSCOUNT
FROM ORDERS;


-- NULL : absent and not known 
SELECT * FROM CUSTOMERS;

# IS NULL/NOT NULL operator
-- Find the customers where state is NULL
SELECT *
FROM CUSTOMERS
WHERE STATE IS NULL;

-- Find the customers where state is NOT NULL
SELECT *
FROM CUSTOMERS
WHERE STATE IS NOT NULL;


#LAB 3
SELECT DISTINCT COUNTRY
FROM customers
WHERE country LIKE "A%" OR country LIKE "B%" OR country LIKE "C%";