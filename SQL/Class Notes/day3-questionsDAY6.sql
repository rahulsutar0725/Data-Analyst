 # DQL: Data Query Language - SELECT 
-- 1. Subset of SQL that focuses on retrieving /reading data from database
-- 2. Crucial for Data Analysis, Reporting , or Database Management 

SELECT EMP_ID FROM myemp;							-- selecting data from a single column
SELECT EMP_ID, FIRST_NAME, LAST_NAME FROM myemp;	-- selecting data from a multiple column
SELECT * FROM myemp;								-- selecting data from a all columns

# Selecting Specific Columns
-- Problem Statement: 
-- 1. Write a query to fetch the EMP_ID, FIRST_NAME,LAST_NAME and JOB_ID of employees.
-- 2. Write a query to fetch joining dates and job id of employees.

# Selecting All Data
-- Problem Statement: 
-- 1. Get all the employees details.

# Unique results with: DISTINCT clause -- to get unique results from the table
-- Problem Statement: 
-- 1. What are the different Departments in employee table?
-- 2. Get the unique JOB_IDs from employees table.
-- 3. Get the unique DEP_IDs and managers(mgr_id) working for each department.

# Limiting results with: LIMIT clause -- LIMIT THE NO. RECORDS FETCHED FROM THE TABLE
-- Problem Statement: 
-- 1. Get first 10 records from the employee table.

# Sorting Rows with:  ORDER BY [ASC|DESC] Operator 
-- Problem Statement:
-- 1. Get EMP_ID, SALARY and order THE RESULTS by SALARY
-- 2. Top 5 HIGHEST Paid employees (EMP_ID, SALARY) 
-- 3. Top 5 LOWEST Paid employees
-- 4. Top 5 salaries from the myemp table
-- 5. get DEP_ID, FIRST_NAME, LAST_NAME OF EMPLOYEE ordered by dept_id and first name

-- NUMERIC  --> ASC (lowest - highest)		-- DESC (highest - lowest)
-- CHAR		--> ASC (A - Z)					-- DESC (Z - A)
-- DATE		--> ASC (oldest - newest) 		-- DESC (newest - oldest)

-- 6. get DEP_ID, HIRE_DATE, EMP_ID OF EMPLOYEE ordered by dept_id and HIRE_DATE
-- 7. Write a query to find the 3rd highest salary from a table.
-- 7. Write a query to find the 2nd highest salary from a table.
-- 7. Write a query to find the 4th  & 5th highest salary from a table.

# Selecting Specific Columns: Using Alias --> TEMPORARY/DISPLAY NAME GIVEN TO COLUMN OR A TABLE
-- Problem Statement: 
-- 1. Get EMP_ID, JOB_ID  as designation for all employees

# Selecting derived Columns: Using Alias
-- Problem Statement: 
-- 1. Write a query to fetch the yearly package of each employee(EMP_ID) (YEARLY_PACKAGE = SALARY * 12)
-- 2. Write a query to get the EMP_ID, JOB_ID, SALARY and 15% bonus for each employee.(BONUS = SALARY * 0.15)
  
#  Selecting Specific Rows/Filtering: WHERE clause
-- Problem Statement: 
-- 1. Get EMP_ID, FIRST_NAME, LAST_NAME and EMAIL of employees from department with DEP_ID 50.
-- 2. Get salaries of IT professionals from the employee table. (JOB_ID = IT_PROG)
-- 3. Get EMP_ID and HIRE_DATE of employees having salary LESS than 15000. 		(Operator: <)
-- 4. Get EMP_ID and HIRE_DATE of employees having salary greater than 15000. 	(Operator: >)
-- 5. Get EMP_ID and HIRE_DATE of employees having salary ATLEAST 15000. 		(Operator: >=)
-- 6. Get EMP_ID and HIRE_DATE of employees having salary ATMOST 15000. 		(Operator: <=)


# WHERE clause: BETWEEN Operator
-- Problem Statement: 
-- 1. Get EMP_ID and HIRE_DATE of employees having salary from 10000 to 20000.


# WHERE clause:  LIKE Operator/NOT LIKE Operator
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ 
-- 2. Get the employees whose name ends with ‘a’ 
-- 3. Get the employees whose name does not end with ‘a’
-- 4. Get the employees whose name does not begin with ‘a’
-- 5. Get the employees whose name has ‘a’ at the second position 
-- 5. Get the employees whose name has ‘a’ at the third position 


# WHERE clause: AND Operator > select rows that satisfy two conditions
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ and COMMISSION_PCT greater than 0.
-- 2. Get the EMP_ID and email of employees whose name has second character ‘a’ and minimum salary 10000.


# WHERE clause: OR Operator > select rows that satisfy either of two conditions
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ or COMMISSION_PCT greater than 0.
-- 2. Get EMP_ID and email of employees from the departments with IDs 40, 110 and 80.
-- 3. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan. (DB : CLASSICMODELS, TABLE: offices) 


# WHERE clause: IN Operator/NOT IN Operator
-- checks 1. same column 	2. comparison is '='
-- Problem Statement: 
-- 1. Get EMP_ID and email of employees from the departments with IDs 40, 110 and 80.
-- 2. Get EMP_ID and email of employees not in the departments with IDs 40, 110 and 80.


# Home Work
-- 1. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan(using or) (DB : CLASSICMODELS, TABLE: offices) 
-- 2. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan (using in)(DB : CLASSICMODELS, TABLE: offices) 
-- 3. Get the orders which are On hold, disputed or in process (DB : CLASSICMODELS, TABLE: orders)













