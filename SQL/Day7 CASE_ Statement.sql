
#CASE Statement : implement the conditional logic in the sql commands

USE day3;

select * from myemp;

select
	emp_id,
	job_id,
	salary,
	salary * 1.1 as Revised_Salary
from myemp;


# Problem Statements
/*
- increase salary by 10% for JOB_ID = 'AD_PRES'
- increase salary by 20% for JOB_ID = 'IT_PROG'
- keep salary for other JOB_IDs as it is.
*/

SELECT
	EMP_ID,
    JOB_ID,
	CASE
		WHEN JOB_ID = 'AD_PRES' THEN SALARY * 1.1
        WHEN JOB_ID = 'IT_PROG' THEN SALARY * 1.2
        ELSE SALARY
	END 
FROM MYEMP;    


SELECT
	EMP_ID,
    JOB_ID,
    SALARY,
	CASE
		WHEN JOB_ID = 'AD_PRES' THEN SALARY * 1.1
        WHEN JOB_ID = 'IT_PROG' THEN SALARY * 1.2
        ELSE SALARY
	END AS REVISED_SALARY
FROM MYEMP;    


/*
- increase salary by 10% for JOB_ID = 'AD_PRES'
- increase salary by 20% for EMP_ID = 104
- keep other salaries as it is.
*/

SELECT
	EMP_ID,
    JOB_ID,
    SALARY,
	CASE
		WHEN JOB_ID = 'AD_PRES' THEN SALARY * 1.1
        WHEN EMP_ID = 104 THEN SALARY * 1.2
        ELSE SALARY
	END AS REVISED_SALARY
FROM MYEMP; 

/*
- display PAY_LEVEL for every employee as
- 'LOW'		: when SALARY is less than 10000
- 'MEDIUM'	: when SALARY is less than 20000
- 'HIGH'	: when SALARY is greater than or equals to 20000
*/

SELECT * FROM MYEMP;
SELECT
	EMP_ID,
    JOB_ID,
    SALARY,
    CASE
		WHEN SALARY<10000 THEN 'LOW'
        WHEN SALARY<20000 THEN 'MEDIUM'
		ELSE 'HIGH'
    END AS PAY_LEVEL
FROM MYEMP;

/*
- Get details of employees from myemp table
- display the results in 
		1. Descending order of COMMISION_PCT for sales employees
		2. Descending order of SALARY for other employees
*/

SELECT * FROM MYEMP;

SELECT distinct * FROM MYEMP
ORDER BY ( 
	CASE
		WHEN JOB_ID LIKE 'SA%' THEN COMMISSION_PCT
        ELSE SALARY
	END) DESC;
    
    
#LAB 4:
USE CLASSICMODELS;
SELECT * FROM customers;

SELECT
	CUSTOMERNUMBER,
    CREDITLIMIT,
    CASE
		WHEN CREDITLIMIT >100000 THEN 'High'
		WHEN CREDITLIMIT between 25000 and 100000 THEN 'Medium'
        ELSE 'LOW'
	END AS Customer_Type
FROM customers;