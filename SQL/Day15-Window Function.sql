# Window Functions
/*
1. divide the result set into subsets/partitions and 
2. apply window functions to each partition 
*/

# Syntax
/*
	SELECT 
		column1, column2,
		function(aggregation) OVER (PARTITION BY ... ORDER BY...)
	FROM table1
    	WHERE condition;
*/
USE day3;
SELECT * FROM myemp;

# Window Functions:
-- 1. ROW_NUMBER() 
-- :Assigns a sequential integer to every row within its partition
SELECT
	EMP_ID,
    DEP_ID,
    JOB_ID,
    SALARY,
    ROW_NUMBER() OVER (PARTITION BY DEP_ID)
FROM myemp;

-- 2. RANK()
-- :Assigns a rank to every row within its partition
-- :Assigns the same rank to the rows with equal values
-- :There is a gap in the sequence of ranked values for every repeated value in the ordered sequence
SELECT 
	EMP_ID, JOB_ID, SALARY, DEP_ID,
    ROW_NUMBER() OVER (PARTITION BY DEP_ID) _ROW_NUMBER,
    RANK() OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC) _RANK
FROM myemp;

-- 3. DENSE_RANK()
-- :Assigns a rank to every row within its partition
-- :Assigns the same rank to the rows with equal values
-- :There is no gap in the sequence of ranked values 

SELECT 
	EMP_ID, JOB_ID, SALARY, DEP_ID,
    ROW_NUMBER() OVER (PARTITION BY DEP_ID) _ROW_NUMBER,
    RANK() OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC) _RANK,
    DENSE_RANK() OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC) _DENSE_RANK
FROM myemp;


USE classicmodels;
SELECT * FROM orders;
-- 4. LEAD()
-- :Returns the value of the Nth row after the current row in a partition. 
-- :It returns NULL if no subsequent row exists.
SELECT 
	customerNumber,
	orderNumber,
    orderdate,
    LAG(orderdate,1,'-- first order--') OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS previous_orderdate,
    IFNULL(DATEDIFF(orderdate, LAG(orderDate,1) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC)),0) days_from_po,
    LEAD(orderdate,1,'-- last order --') OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS next_orderdate,
    IFNULL(DATEDIFF(LEAD(orderDate,1) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC),orderdate),0) days_from_no
FROM orders;

-- 5. LAG()
-- :Returns the value of the Nth row before the current row in a partition. 
-- :It returns NULL if no preceding row exists.
SELECT 
	customerNumber,
	orderNumber,
    orderdate,
    LEAD(orderdate,2) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS next_orderdate,
    LAG(orderdate,2) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS previous_orderdate
FROM orders;

-- 6. FIRST_VALUE()
-- :Returns the value of the specified expression with respect to the first row in the window frame.

SELECT 
	customerNumber,
	orderNumber,
    orderdate,
    LAG(orderdate,1,'-- first order--') OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS previous_orderdate,
    IFNULL(DATEDIFF(orderdate, LAG(orderDate,1) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC)),0) days_from_po,
    LEAD(orderdate,1,'-- last order --') OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS next_orderdate,
    IFNULL(DATEDIFF(LEAD(orderDate,1) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC),orderdate),0) days_from_no,
	FIRST_VALUE(orderdate) OVER ( PARTITION BY customerNumber ORDER BY orderdate ASC) first_order_date,
    LAST_VALUE(orderdate) OVER ( PARTITION BY customerNumber) last_order_date
FROM orders;
-- 7. LAST_VALUE()
-- :Returns the value of the specified expression with respect to the last row in the window frame.
SELECT 
	customerNumber,
	orderNumber,
    orderdate,
    LAG(orderdate,1,'-- first order--') OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS previous_orderdate,
    IFNULL(DATEDIFF(orderdate, LAG(orderDate,1) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC)),0) days_from_po,
    LEAD(orderdate,1,'-- last order --') OVER (PARTITION BY customerNumber ORDER BY orderDate ASC) AS next_orderdate,
    IFNULL(DATEDIFF(LEAD(orderDate,1) OVER (PARTITION BY customerNumber ORDER BY orderDate ASC),orderdate),0) days_from_no,
	FIRST_VALUE(orderdate) OVER ( PARTITION BY customerNumber ORDER BY orderdate ASC) first_order_date,
    LAST_VALUE(orderdate) OVER ( PARTITION BY customerNumber) last_order_date
FROM orders;
