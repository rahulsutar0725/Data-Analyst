# Filter groups by HAVING clause
-- 14. Write a query to find total no. of customers from Norway and Sweden.
-- 15. Write a query to get the average salary for each job ID excluding programmer.
SELECT 
	JOB_ID,
    AVG(SALARY) AS AVG_SALARY
FROM MYEMP
GROUP BY JOB_ID
HAVING JOB_ID != 'IT_PROG';
-- 16. Write a query to get the job ID and maximum salary of the employees 
-- where maximum salary is greater than or equal to $4000.
SELECT
	JOB_ID,
    MAX(SALARY) AS Max_Salary
FROM MYEMP
GROUP BY JOB_ID
HAVING Max_Salary>=4000;
-- 17. Write a query to get the average salary for all departments employing more than 10 employees.
SELECT
	DEP_ID,
    AVG(SALARY) AS AVG_SALARY
FROM MYEMP
GROUP BY DEP_ID
HAVING COUNT(EMP_ID) >10;    

-- 18. calculate average credit limit of customers in each country
--    and display only those records where the where the average credit limit is greater than 50000
USE CLASSICMODELS;
SELECT 
	COUNTRY,
    AVG(CREDITLIMIT) AS AVG_CreditLimit
FROM CUSTOMERS
GROUP BY COUNTRY
HAVING AVG_CreditLimit>50000;

-- 19. calculate average credit limit of customers in each country
--    who has letter 'a' in their names
--    and display only those records where the where the average credit limit is greater than 50000

SELECT 
	COUNTRY,
    CustomerName,
    AVG(CREDITLIMIT) AS AVG_CreditLimit
FROM CUSTOMERS
WHERE CustomerName LIKE '%A%'
GROUP BY COUNTRY
HAVING AVG_CreditLimit>50000;

-- STEPS:
-- 1. If it is required to use aggregate functions in the SELECT query
-- 2, If it is required to apply aggregate functions to entire set of records or groups of records
-- 3. In the SELECT statement with group by clause only two types of columns can be selected
-- 			a. Groups By column(s)
--          b. aggregated column(s) -- column(s) having aggregate functions applied to them
-- 4. When to use HAVING or WHERE?
-- TRICK: If filter column is -- 1. GROUP BY column or 2. Aggregated column, Then use --> HAVING
--         ELSE USE  --> WHERE


# ORDER groups by ORDER BY clause
-- 19. Find total credit limit and highest credit limit for each sales representative,
--    and sort the results in descending order of the highest credit limit.
SELECT 
	IFNULL(SalesRepEmployeeNumber,'--MISSING--') AS Sales_Rep,
	SUM(CREDITLIMIT) AS Total_CreditLimit,
    MAX(CREDITLIMIT) AS Highest_CreditLimit
FROM CUSTOMERS
GROUP BY Sales_Rep
ORDER BY Highest_CreditLimit DESC;


# Advanced
-- 20. Write a query to find top 3 sales representatives with highest no. of customers
-- ANS:-
-- Step 1. GROUP BY - salesRepEmployeeNumber
-- Step 2. Count the no. of customers for every sales representeative
-- Step 3. order by - total no of customers for each sale representative
-- Step 4. Limit the result to 3 groups

SELECT
	IFNULL(SalesRepEmployeeNumber,'-- UNIDENTIFIED --') AS Sales_Rep,
    COUNT(CustomerNumber) AS Customer_count
FROM CUSTOMERS
GROUP BY Sales_Rep
ORDER BY Customer_count DESC 
Limit 3;

# Homework
-- 1. Write a query to find average salary and total no. of employees working in the department - 50 and 80
-- 2. Write a query to find top 3 job profiles with highest salary