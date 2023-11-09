		
--      SQL Commands																
        |																			
/*		├── 1. Data Definition Language (DDL) 		-- Deals with the structure of database & objects (table etc.)	
		│   ├── CREATE																
		│   ├── ALTER																
		│   ├── DROP																	
		│   └── TRUNCATE 			                   */													
/*		├── 2. Data Manipulation Language (DML) 	-- Deals with the data within the tables			
		│   ├── INSERT	                                                    																	
		│   ├── UPDATE	
		│   └── DELETE									*/
/*		├── 3. Data Query Language (DQL)			-- Retrive the data from the database 														*/																
/*		|  └──  SELECT	
		        FROM
				WHERE
                ORDER BY 
                LIMIT 																															*/
/*		├── 4. Data Control Language (DCL)			-- Used by DBA: database administrator										 
		│   ├── GRANT
		│   ├── REVOKE
		│   └── DENY																															*/
/*		└── 5. Transaction Control Language (TCL) 	-- Create transactions in SQL
			├── TRANSACTION
			├── COMMIT 
			├── ROLLBACK 
			└── SAVEPOINT								*/

# Syntax
/*   +--------------------------------+
	 |	SELECT column1[, column2…]	  |   		 --> SELECT: Specify the columns to retrieve.
	 |	FROM table_name 			  |		     --> FROM: Specify the table(s) to query.
	 |	WHERE filter_condition		  |			 --> WHERE: Apply conditions to filter the rows.
     |  GROUP BY column(s)			  |			 --> GROUP BY: group the records by common column values
     |  HAVING filter_condition		  |			 --> HAVING: Apply conditions to filter the groups.
	 |	ORDER BY column1 [ASC|DESC]	  |	 	   	 --> ORDER BY: Sort the result set based on one or more columns.
	 |	LIMIT [offset,] limit_value;  |			 --> LIMIT: Restrict the number of rows returned.
     +--------------------------------+
	 
*/
    
# Selecting All Data 
# Selecting Specific Columns
# Unique results with: 		 - DISTINCT clause
# Selecting Specific Columns:- Using Alias 
# Selecting derived Columns  - Formulas, String Functions, Date Functions, NULL Functions, etc
# Limiting results with: 	 - LIMIT clause
# Sorting Rows with:  	 	 - ORDER BY [ASC|DESC] Operator 
# Selecting Specific Rows/Filtering: WHERE clause
-- 1. Comparision Operators  - =, <, <=, >, >= , !=, <>
-- 2. BETWEEN Operator		 - NOT BETWEEN Operator 
-- 3. LIKE Operator			 - NOT LIKE Operator
-- 4. IN Operator			 - NOT IN Operator
-- 5. IS NULL Operator		 - IS NOT NULL Operator
# Combining conditions using AND/ OR Operator	

# String Functions
-- 1. CONCAT()		2. UPPER()		3. LOWER()		

# Date Functions
-- 1. DATE()		2. TIME()		3. YEAR()		4. MONTH()		5. DAY()
-- 6. WEEKDAY()		2. DAYNAME()	3. MONTHNAME()

# NULL Functions
-- 1. IS NULL/ IS NOT NULL			2. IFNULL()		3. COALESCE()

# CASE Statement
# Syntax:
/*
	CASE 
		WHEN condition1 THEN expression/category
        WHEN condition2 THEN expression/category
        ...
        ELSE expression/category
	END AS alias
*/		

/*
	CASE column_name 
		WHEN value1 THEN expression/category
        WHEN value2 THEN expression/category
        ...
        ELSE expression/category
	END AS alias
*/

Table: customers  
+----------------------------------------+
| CustomerID | CustomerName | City       |   
+----------------------------------------+   
| 1          | John Smith   | New York   |   
| 2          | Emma Johnson | London     |
| 3          | Alex Brown   | Paris      |   
+----------------------------------------+
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    -- specifying account numbers
    -- specify the amount
    -- verification of account numbers
    -- amount deducted from senders account
    -- amount credited to the receivers account
    -- transaction is sucessfull!
    
    -- put the product into basket/cart
    -- bill is initiated
    -- payment is done
    -- order id placed
    
    
    
    
    
    
    
    
    
    
    
    
    
    

