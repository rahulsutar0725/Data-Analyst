# Stored Procedure
/* 
Predefined, reusable sequence of SQL statements stored and executed as a single unit
Consist of a 
	1. Name - to refer for reuse 
	2. Parameter list -  to pass values and get results back
	3. Body - having SQL statements separated by semicolons(;)
Implements business logic, performs database operations, automates tasks
Use:
-- Reusability 
-- Abstraction 
*/

# Types of Stored Procedures
-- 1. Simple Stored Procedure
-- 2. Procedure with IN parameter
-- 3. Procedure with OUT parameter
-- 4. Procedure with INOUT parameter

# Variables
-- Named data object that store data values are used to pass values from one statement to another.
-- Value of an user-defined varibale can be changed during procedure execution.
-- Steps to use Variables inside stored procedure
	-- 1. Declaring Variables 	--> DECLARE variable_name data-type DEFAULT default_value;
    -- 2. Assigning Values	  	--> SET variable_name = value;
    
  -- SET @VAR.NAME = 2;		SET @.VAR = 2;		SET @VAR. = 2;
  -- SET @VAR_NAME = 2;		SET @_VAR = 2;		SET @VAR_ = 2;
  -- SET @VAR$NAME = 2;		SET @$VAR = 2;		SET @VAR$ = 2;
  
# Parameters
-- temporary variables that holds the arguement passed and/or return value
-- Modes of parameter
	-- 1. IN	-> to pass an arguement to stored procedure
	-- 2. OUT	-> to return back value from the stored procedure to the calling program
    -- 3. INOUT	-> combination of IN and OUT parameter
USE day3;
# Examples:
-- 0. Create an procedure that displays the employee details
DELIMITER //
CREATE PROCEDURE getEmployeesDetails()
BEGIN
		SELECT * FROM myemp;
END //
DELIMITER ;

CALL getEmployeesDetails();

-- 1. Create an procedure that displays the employee details employee number
-- 108
DELIMITER //
CREATE PROCEDURE getEmployeeDetails()
BEGIN
		SELECT * FROM myemp WHERE EMP_ID=108;
END //
DELIMITER ;

CALL getEmployeeDetails();

-- 2. Create a procedure to get the employee details for a given employee number.
-- 1088, 1166, 1165, 1370, 1702
USE classicmodels;
DELIMITER //
CREATE PROCEDURE getEmpdetails(IN eid INT)
BEGIN
	SELECT * FROM employees 
    WHERE employeeNumber = eid;
END //
DELIMITER ;

CALL getEmpdetails(1166);

DELIMITER //
CREATE PROCEDURE getEmpdetails1(IN eid1 INT,IN eid2 INT,IN eid3 INT,IN eid4 INT,IN eid5 INT)
BEGIN
	SELECT * FROM employees 
    WHERE employeeNumber IN (eid1,eid2,eid3,eid4,eid5);
END //
DELIMITER ;

CALL getEmpdetails1(1088, 1166, 1165, 1370, 1702);

-- 25-09-2023 -----------------------------------------------------------------------------------------------

-- 3. Create a procedure that returns employeecount for a given office location
USE classicmodels;

DELIMITER //
CREATE PROCEDURE getEmployeeCount(IN _country VARCHAR(50), OUT ecount INT)
BEGIN
		SELECT
            COUNT(e.employeeNumber) INTO ecount
		FROM employees e
		JOIN offices o ON e.officeCode = o.officeCode
        GROUP BY o.country
        HAVING O.country=_country;
END //
DELIMITER ;


CALL getEmployeeCount('USA',@ecount);

SELECT @ecount;

SELECT* FROM employees;
SELECT * FROM offices;

-- VARIABLE 
SET @X =123;
SELECT @X;

SET @count=0;  -- Creating variable out the procedure
SELECT @count;

DELIMITER //
CREATE PROCEDURE _increment(INOUT c INT)
BEGIN
	DECLARE counting INT;
    SET counting = c;
    SET counting = counting + 1;
	SET c = counting;
    
END //
DELIMITER ;

CALL _increment(@count);
SELECT @count;

-- write a procedure that will aatch string 'called' to the input string value

DELIMITER //
CREATE PROCEDURE _p1(INOUT _str VARCHAR(100))
BEGIN
	SET _str = CONCAT(_str,'Called!');   
END //
DELIMITER ;

SET @str = 'procedure1';
CALL _p1(@str);
SELECT @str;
