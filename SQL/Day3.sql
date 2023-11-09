USE day3;
SELECT EMP_ID FROM myemp; 							-- selecting data from a single column
SELECT EMP_ID, FIRST_NAME, LAST_NAME FROM myemp;	-- selecting data from a multiple column
SELECT * FROM myemp;								-- selecting data from a all column

#Unique results with: DISTINCT Clause -- to get unique results from the tables

#1. What are the different department in employee table

SELECT DISTINCT DEP_ID FROM myemp;

#2. Get the unique JOB_IDs from emp table

SELECT DISTINCT JOB_ID FROM myemp;

#3. Get the unique DEP_IDs  and managerss (MGR_ID) working for each department

SELECT DISTINCT DEP_ID, MGR_ID FROM myemp;

#3. LIMIT Clause
-- 1. Get first 10 records from the employee table

SELECT * FROM myemp LIMIT 10;


#4. ORDER BY Clause:
-- 1. Get EMP_ID, SALARY and Order the results by salary.

SELECT EMP_ID, SALARY FROM myemp ORDER BY SALARY DESC;

SELECT EMP_ID, SALARY 
FROM myemp
ORDER BY SALARY ASC;

#2. TOP 5 HIGHEST Paid employees (EMP_ID, SALARY)

SELECT EMP_ID, SALARY
FROM myemp
ORDER BY SALARY DESC LIMIT 5;

#3. TOP 5 LOWEST Paid employees (EMP_ID, SALARY)

SELECT EMP_ID, SALARY
FROM myemp
ORDER BY SALARY ASC LIMIT 5;


#4. TOP 5 SALARIES FROM myemp table

SELECT DISTINCT SALARY
FROM myemp
order by salary DESC 
limit 5;

#5. GET DEP_ID, FIRST_NAME, LAST_NAME OF EMPLOYEE ORDERED BY DEPT_ID AND FIRST_NAME

SELECT DEP_ID, FIRST_NAME, LAST_NAME
FROM myemp
ORDER BY DEP_ID, FIRST_NAME;

#6. get DEP_ID, HIRE_DATE, EMP_ID OF EMPLOYEE ORDERED BY DEPT_ID AND HIRE_DATE

SELECT DEP_ID, HIRE_DATE, EMP_ID 
FROM myemp
ORDER BY DEP_ID ASC, HIRE_DATE DESC;

#7. Write a query to find the 3rd highest salary from a table.

SELECT DISTINCT SALARY
FROM myemp
ORDER BY SALARY DESC
LIMIT 2,1;


#8. Write a query to find the 2rd highest salary from a table.

SELECT DISTINCT SALARY
FROM myemp
ORDER BY SALARY DESC
LIMIT 1,1;

#8. Write a query to find the 5th highest salary from a table.

SELECT DISTINCT SALARY
FROM myemp
ORDER BY SALARY DESC
LIMIT 4,1;

#9. Write a query to find the 4th and 5th highest salary from a table.

SELECT DISTINCT SALARY
FROM myemp
ORDER BY SALARY DESC
LIMIT 3,2;

# Alias

-- 1. Get EMP_ID, JOB_ID AS Designation from myemp

SELECT EMP_ID, JOB_ID AS Designation from myemp;

# Selecting derived columns: Using Alias
-- 1. Write a query to fetch the yearly package of each employee (EMP_ID)
-- YEARLY_PACKAGE =SALARY*12

SELECT 
	EMP_ID, 
    SALARY AS MONTHLY_SALARY,
    SALARY*12 as YEARLY_PACKAGE
FROM myemp;

#2. Write a query to get the EMP_ID, JOB_ID, SALARY and 15% BONUS of each employee. (BONUS = SALARY*0.15)

SELECT
	EMP_ID,JOB_ID,SALARY,
    SALARY*0.15 AS BOUNS
FROM myemp;    
    
SELECT DISTINCT SALARY
FROM myemp
ORDER BY SALARY DESC
LIMIT 5;
SELECT * FROM myemp;
SELECT DEP_ID FROM myemp;
