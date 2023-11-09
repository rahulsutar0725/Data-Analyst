use day3;
select * from myemp;

# WHERE clause:  LIKE Operator/NOT LIKE Operator
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ 
SELECT 
	EMP_ID,
    FIRST_NAME,
	LAST_NAME,
    JOB_ID
FROM MYEMP
WHERE FIRST_NAME LIKE 'A%'; 
-- 2. Get the employees whose name ends with ‘a’
SELECT 
	EMP_ID,
    FIRST_NAME,
	LAST_NAME,
    JOB_ID
FROM MYEMP
WHERE FIRST_NAME LIKE '%A'; 
-- 3. Get the employees whose name does not end with ‘a’
SELECT * FROM MYEMP
WHERE FIRST_NAME NOT LIKE '%A';
-- 4. Get the employees whose name does not begin with ‘a’
SELECT * FROM MYEMP
WHERE FIRST_NAME NOT LIKE 'A%';
-- 5. Get the employees whose name has ‘a’ at the second position
SELECT 
	EMP_ID,
    FIRST_NAME,
	LAST_NAME,
    JOB_ID
FROM MYEMP
WHERE FIRST_NAME LIKE '_A%';  
-- 5. Get the employees whose name has ‘a’ at the third position 
SELECT 
	EMP_ID,
    FIRST_NAME,
	LAST_NAME,
    JOB_ID
FROM MYEMP
WHERE FIRST_NAME LIKE '__A%';
-- 6. Get the employees whose name has ‘a’ at the 2ND LAST position 
SELECT 
	EMP_ID,
    FIRST_NAME,
	LAST_NAME,
    JOB_ID
FROM MYEMP
WHERE FIRST_NAME LIKE '%A_';

-- 7. Get the employees whose JOB_ID has is starting with "SA"
SELECT * FROM MYEMP WHERE JOB_ID LIKE "SA%";

-- 8. Get the employees whose JOB_ID has is starting with "SA"
-- and the order the result by the descending order of commission_pct;
SELECT * FROM MYEMP 
WHERE JOB_ID LIKE "SA%"
ORDER BY COMMISSION_PCT DESC;

-- Get all employee details where length of first_name is 5
SELECT * FROM MYEMP
WHERE FIRST_NAME LIKE "_____";

-- Get all employee details where the FIRST letter is 'J' AND LENGTH of first_name is 5

select * from myemp
where first_name like "J____";



# WHERE clause: AND Operator > select rows that satisfy two conditions
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ and COMMISSION_PCT greater than 0.
SELECT * FROM MYEMP
WHERE FIRST_NAME LIKE "A%" AND COMMISSION_PCT > 0;

-- 2. Get the EMP_ID and email of employees whose name has second character ‘a’ and minimum salary 10000.
SELECT EMP_ID,EMAIL FROM MYEMP
WHERE FIRST_NAME LIKE "_A%" AND SALARY >= 10000;

# WHERE clause: OR Operator > select rows that satisfy either of two conditions
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ or COMMISSION_PCT greater than 0.
SELECT * FROM MYEMP
WHERE FIRST_NAME LIKE "A%" OR COMMISSION_PCT > 0;

-- 2. Get EMP_ID and email of employees from the departments with IDs 40, 110 and 80.
SELECT EMP_ID, EMAIL,DEP_ID FROM MYEMP
WHERE DEP_ID = 40 OR DEP_ID = 110 OR DEP_ID = 80;

-- 3. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan. (DB : CLASSICMODELS, TABLE: offices) 
USE CLASSICMODELS;
SELECT  PHONE, ADDRESSLINE1, ADDRESSLINE2 FROM OFFICES
WHERE COUNTRY="UK" OR COUNTRY="JAPAN";

SELECT  PHONE, ADDRESSLINE1, ADDRESSLINE2 FROM OFFICES
WHERE COUNTRY IN ("UK","JAPAN");

# WHERE clause: IN Operator/NOT IN Operator
-- checks 1. same column 	2. comparison is '='
-- Problem Statement: 
-- 1. Get EMP_ID and email of employees from the departments with IDs 40, 110 and 80.
USE DAY3;
SELECT EMP_ID, EMAIL,DEP_ID FROM MYEMP
WHERE DEP_ID IN (40,110,80);

-- 2. Get EMP_ID and email of employees not in the departments with IDs 40, 110 and 80.

SELECT EMP_ID, EMAIL,DEP_ID FROM MYEMP
WHERE DEP_ID NOT IN (40,110,80);

# Home Work
-- 1. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan(using or) (DB : CLASSICMODELS, TABLE: offices) 
SELECT  PHONE, ADDRESSLINE1, ADDRESSLINE2 FROM OFFICES
WHERE COUNTRY="UK" OR COUNTRY="JAPAN";
-- 2. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan (using in)(DB : CLASSICMODELS, TABLE: offices) 
SELECT  PHONE, ADDRESSLINE1, ADDRESSLINE2 FROM OFFICES
WHERE COUNTRY IN ("UK","JAPAN");
-- 3. Get the orders which are On hold, disputed or in process (DB : CLASSICMODELS, TABLE: orders)
SELECT * FROM ORDERS LIMIT 5;

SELECT distinct STATUS FROM ORDERS;

SELECT * FROM ORDERS 
WHERE STATUS IN('ON HOLD','DISPUTED','IN PROCESS');

SELECT * FROM ORDERS 
WHERE `STATUS` IN('ON HOLD','DISPUTED','IN PROCESS');

SELECT * FROM ORDERS 
WHERE `STATUS`='ON HOLD'OR `STATUS`='DISPUTED'OR`STATUS`='IN PROCESS'
ORDER BY ORDERDATE DESC
LIMIT 5;








