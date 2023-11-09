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

# Window Functions:
-- 1. ROW_NUMBER() 
-- :Assigns a sequential integer to every row within its partition


-- 2. RANK()
-- :Assigns a rank to every row within its partition
-- :Assigns the same rank to the rows with equal values
-- :There is a gap in the sequence of ranked values for every repeated value in the ordered sequence

-- 3. DENSE_RANK()
-- :Assigns a rank to every row within its partition
-- :Assigns the same rank to the rows with equal values
-- :There is no gap in the sequence of ranked values 

-- 4. LEAD()
-- :Returns the value of the Nth row after the current row in a partition. 
-- :It returns NULL if no subsequent row exists.

-- 5. LAG()
-- :Returns the value of the Nth row before the current row in a partition. 
-- :It returns NULL if no preceding row exists.


-- 6. FIRST_VALUE()
-- :Returns the value of the specified expression with respect to the first row in the window frame.

-- 7. LAST_VALUE()
-- :Returns the value of the specified expression with respect to the last row in the window frame.























