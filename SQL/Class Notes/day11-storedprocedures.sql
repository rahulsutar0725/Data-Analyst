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

# Examples:
-- 1. Create an procedure that displays the employee details employee number
-- 2. Create a procedure to get the employee details for a given employee number.
-- 1088, 1166, 1165, 1370, 1702
-- 3. Create a procedure that returns employeecount for a given office location


































