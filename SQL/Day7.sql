# ISNULL function():

USE classicmodels;
select * from myemp;
SELECT
	customerNumber,
    customerName,
    state,
    ISNULL(state)
from customers;

# IfNULL function():

select * from myemp;
SELECT
	customerNumber,
    customerName,
    state,
    ISNULL(state),
    IFNULL(STATE, '--NOT REPORTED--')
from customers;


select * from myemp;
SELECT
	customerNumber,
    customerName,
    ISNULL(state),
    IFNULL(STATE, '--NOT REPORTED--') AS STATE
from customers;

-- Write a query o display emp_id, emp_name,email of employees from myemp table
-- replace the NULL values in the email column with the string '--Missing--'
USE DAY3;
SELECT
	EMP_ID,
    CONCAT(FIRST_NAME,' ',LAST_NAME) AS EMP_NAME,
    IFNULL(EMAIL,'--MISSING--') AS EMAIL
FROM MYEMP;

USE CLASSICMODELS;
SELECT
	officecode,
    IFNULL(state,country) AS LOCATION
FROM offices;

#COALESCE()  -- koh-uh-les
-- returns the first NOT NULL values from the list of values provided

SELECT COALESCE(1,2,NULL); -- O/P: 1
SELECT COALESCE(NULL,'EXCELR',1,2,NULL); -- O/P: EXCELR
SELECT COALESCE(NULL,NULL,123.78,'EXCELR',1,2,NULL);-- O/P: 123.78

SELECT
	officeCode,
    state,
    country,
    CONCAT(STATE,', ',COUNTRY),
    COALESCE(CONCAT(STATE,', ',COUNTRY),STATE,COUNTRY) AS LOCATION
FROM OFFICES;

-- ISNULL()	-0,1
-- IFNULL()		
-- COALESCE()
