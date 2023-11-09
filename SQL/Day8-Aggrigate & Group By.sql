# Aggregate Functions
-- Summarize multiple rows into a single value for the entire group, column, or table

#COUNT(column) 			--> returns total no. of NOT NULL rows in the result set
#SUM(numerical_column) 	--> returns addition of values in the column
#AVG(numerical_column)	--> returns average value
#MIN(column)			--> returns minimum value
#MAX(column)			--> returns maximum value


USE day3;
SELECT * FROM myemp;

SELECT COUNT(SALARY) FROM myemp;
SELECT COUNT(*) FROM myemp; 	-- total no. of NOT NULL rows in the table
SELECT COUNT(JOB_ID) FROM MYEMP;
SELECT COUNT(DISTINCT JOB_ID) FROM MYEMP;

SELECT 
	COUNT(JOB_ID),
	COUNT(DISTINCT JOB_ID) 
FROM MYEMP;

SELECT
	COUNT(SALARY),
	SUM(SALARY),
    AVG(SALARY),
    MIN(SALARY),
    MAX(SALARY)
FROM MYEMP;

SELECT
	COUNT(EMP_ID),
	SUM(SALARY),
    AVG(SALARY),
    MIN(SALARY),
    MAX(SALARY)
FROM MYEMP
WHERE JOB_ID='IT_PROG';


# Aggregate Functions
USE classicmodels;
SELECT * FROM customers;
-- 1. Write a query to find total no. customers(DB: classicmodels Table: customers)
SELECT COUNT(CUSTOMERNUMBER) FROM customers;

-- 2. Write a query to list the number of jobs available in the employees table.
USE day3;
SELECT COUNT(DISTINCT JOB_ID) FROM MYEMP;

-- 3. Write a query to get the total salary payable to employees.
SELECT SUM(SALARY) FROM MYEMP;

-- 4. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(SALARY) FROM MYEMP WHERE JOB_ID = 'IT_PROG';

-- 5. Write a query to get the average salary and number of employees working in the department 90.
SELECT AVG(SALARY),COUNT(EMP_ID) FROM MYEMP WHERE DEP_ID=90;

-- 6. Write queries to find max/min/avg credit limit from the customers table
SELECT MAX(CREDITLIMIT),MIN(CREDITLIMIT),AVG(CREDITLIMIT)
FROM CUSTOMERS;

#Group BY: - 
		
USE DAY3;

SELECT
	JOB_ID,
    COUNT(EMP_ID),
    MAX(SALARY),
    MIN(SALARY),
    SUM(SALARY),
    AVG(SALARY)
FROM myemp
GROUP BY JOB_ID;

# Group By single column
-- 7. Write a query to get the number of employees with the same job.
SELECT JOB_ID, COUNT(EMP_ID) AS EMP_COUNT FROM MYEMP
GROUP BY JOB_ID;

-- 8. Write a query to get the difference between the highest and lowest salaries.
SELECT 
	MAX(SALARY) AS MAX_SALARY,
	MIN(SALARY) AS MIN_SALARY,
	MAX(SALARY)-MIN(SALARY) AS SALARY_DIFF 
FROM MYEMP;

-- 9. Write a query to get the department ID and the total salary payable in each department.
SELECT 
	DEP_ID,SUM(SALARY) AS TOTAL_SALARY_PAYABLE 
FROM MYEMP
GROUP BY DEP_ID
ORDER BY DEP_ID;

-- 10. Write a query to find EMPLOYEE_COUNT and MANAGER_COUNT of employees working in each department
SELECT
	DEP_ID,
    COUNT(DISTINCT EMP_ID) AS EMPLOYEE_COUNT,
    COUNT(DISTINCT MGR_ID) AS MANAGER_COUNT
FROM MYEMP
GROUP BY DEP_ID
ORDER BY EMPLOYEE_COUNT DESC;

-- 11. Write queries to find min, max and average salary of employees, GROUP BY HIRE_YEAR

SELECT 
	YEAR(HIRE_DATE) AS HIRE_YEAR,
    MIN(SALARY),
    MAX(SALARY),
    AVG(SALARY)
FROM MYEMP
GROUP BY HIRE_YEAR;

# Group By multiple columns
-- 12. Write a query to find total no. of customers and their maximum credit limit from each country, state
SELECT 
	COUNTRY,
    IFNULL(STATE,'--MISSING--') AS STATE,
    COUNT(CUSTOMERNUMBER) AS CUSTPMER_COUNT,
    MAX(CREDITLIMIT) AS MAX_CREDITLIMIT 
FROM customers
GROUP BY COUNTRY,STATE;
-- 13. Write queries to find average and highest salary of employees per year and month (DB: day3 Table: myemp)

SELECT
	YEAR(HIRE_DATE) AS 	`YEAR`,
    MONTH(HIRE_DATE) AS `MONTH`,
    AVG(SALARY) AS AVG_SALARY,
    MAX(SALARY) AS MAX_SALARY
FROM MYEMP
GROUP BY `YEAR`,`MONTH`;

# Filter groups by HAVING clause
-- 14. Write a query to find total no. of customers from Norway and Sweden.
USE CLASSICMODELS;
SELECT 
	COUNTRY,
    COUNT(CustomerNumber) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY COUNTRY
HAVING COUNTRY IN('NORWAY','SWEDEN');


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
    MAX(SALARY) AS MAX_SALARY
FROM MYEMP
GROUP BY JOB_ID
HAVING MAX_SALARY >= 4000;
-- 17. Write a query to get the average salary for all departments employing more than 10 employees.
SELECT
	DEP_ID,
    AVG(SALARY) AS AVG_SALARY
FROM MYEMP
GROUP BY DEP_ID
HAVING COUNT(EMP_ID) >10;

SELECT 
	DEP_ID,
    COUNT(EMP_ID) AS COUNT_EMP,
    AVG(SALARY) AS AVG_SALARY
FROM MYEMP
GROUP BY DEP_ID
HAVING COUNT_EMP>10;

-- 18. calculate average credit limit of customers in each country
--    and display only those records where the average credit limit is greater than 50000
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
SELECT
	IFNULL(SalesRepEmployeeNumber,'--MISSING--') AS Sales_Rep,
    COUNT(CustomerNumber) AS Customer_count
FROM CUSTOMERS
GROUP BY Sales_Rep
ORDER BY Customer_count DESC 
Limit 3;


# Homework
-- 1. Write a query to find average salary and total no. of employees working in the department - 50 and 80
SELECT 
	DEP_ID,
    AVG(SALARY) AS AVG_SALARY,
    COUNT(EMP_ID) AS TOTAL_EMPLOYEE
FROM MYEMP
GROUP BY DEP_ID
HAVING DEP_ID IN(50,80);

-- 2. Write a query to find top 3 job profiles with highest salary
SELECT 
	JOB_ID AS Job_Profile,
    MAX(SALARY) AS Max_Salary
FROM MYEMP
GROUP BY Job_Profile
ORDER BY Max_Salary DESC
LIMIT 3;
