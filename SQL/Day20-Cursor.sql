# LOOP statement: to run a block of code repeatedly based on a condition.
/*
lebel: LOOP

	IF condition_
    THEN LEAVE label

END LOOP;
*/

USE classicmodels;
SELECT * FROM customer_summary;

SELECT customerNumber FROM customers;

-- STEP1 : feaching customerNumber
-- STEP2 : calculating total purchase amount
-- STEP3 : update the customer summary table


# Cursor
/* 
- A cursor allows you to iterate a set of rows returned by a query and process each row individually.
- MySQL cursor is read-only, non-scrollable and asensitive.
*/

DELIMITER //
CREATE PROCEDURE updateCustomerSummary()
BEGIN
-- declaring variables
	DECLARE done INT DEFAULT 0;
    DECLARE cus_id INT;
    DECLARE total_amount DECIMAL(10,2);
-- 1. declaring a cursor
	DECLARE customer_cursor CURSOR FOR
		SELECT DISTINCT customerNumber FROM orders;
	-- declare handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done =1;
-- 2. Opening a cursor
	OPEN customer_cursor;
    read_loop: LOOP
		-- STEP1 : feaching customerNumber
		FETCH customer_cursor INTO cus_id; -- ,second vareable;
        IF done = 1
        THEN LEAVE read_loop;
        END IF;
		-- STEP2 : calculating total purchase amount
        SELECT
			SUM(d.quantityOrdered * d.priceEach) INTO total_amount
		FROM orders o
        JOIN orderdetails d ON o.orderNumber = d.orderNumber
        WHERE o.customerNumber = cus_id;
		-- STEP3 : update the customer summery table
        UPDATE customer_summary
        SET totalPurchaseAmount = total_amount
        WHERE customerNumber = cus_id;
    END LOOP;
	CLOSE customer_cursor; -- 3. closing the cursor
END // 
DELIMITER ; 

SELECT DISTINCT customerNumber FROM ORDERS;

SELECT * FROM customer_summary;

CALL updateCustomerSummary();
