# Functions
/*
- Stored program that returns a single value.
- Accepts i/p value 	--> perform computations/ data manipulations 	--> returns a single value
- Can be
	1. DETERMINISTIC		--> returns same result for the same set of input parameters
    2. NON-DETERMINISTIC	--> returns different result for the same set of input parameters
*/

# Syntax
/*
DELIMITER //
CREATE FUNCTION fun_name(par1 d_type, ...)
RETURNS data_type
[NOT] DETERMINISTIC----------------------YOUTUBE PE DEKHANA HAI!!!!!!!!!!!!! WHAT IS DETERMINISTIC
BEGIN
		-- SQL statements
END //
DELIMITER ;
*/

-- 1. Create a function that takes credit limit of a customer and returns the customer level. 
-- Credit Limit > 50000  --> 'PLATINUM'
-- Credit Limit > 10000  --> 'GOLD'
-- OTHERWISE  --> 'SILVER'
-- call the function in select query

DELIMITER //
CREATE FUNCTION getCustomerLevel(c_limit DECIMAL(10, 2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
	DECLARE customer_level VARCHAR(20);
    SET customer_level = (
		CASE
			WHEN c_limit > 50000 THEN 'PLATINUM'
			WHEN c_limit > 10000 THEN 'GOLD'
			ELSE 'SILVER'
		END);
	RETURN(customer_level);
END//
DELIMITER ;

SELECT
	customerNumber,
    creditlimit,
    getCustomerLevel(creditLimit) AS customer_level
FROM customers;

-- 2. creating function to get employee name

DELIMITER //
CREATE FUNCTION getEmployeeName(fname VARCHAR(20), lname VARCHAR(20))
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
	DECLARE EMP_NAME VARCHAR(40);
    SET EMP_NAME = CONCAT(fname,' ',lname);
	RETURN(EMP_NAME);
END //
DELIMITER ;

SELECT
	employeeNumber,
    getEmployeeName(firstname,lastname) as EMP_NAME
FROM employees;


