# Index
/*
Index is a data structure created using one or more columns to speed up the query execution
Practically is a table with PRIMARY KEY or INDEX KEY and a pointer to each record in the actual table
There are two types of Index:
	1. Clustered Index 		--> Should be Unique and NOT NULL (PRIMARY KEY - default)
							--> Can define only one Clustered Index per table
	2. Non-Clustered index	--> Can contain duplicate or NULL values	
							--> Can define one or more non-clustered indexes on a table
*/


SELECT * FROM customers;
-- Creating index on a table
-- 		1. Creating Index on one column
CREATE INDEX index_country ON customers(country);
SHOW INDEXES FROM customers;

-- 		2. Creating Index on multiple columns
CREATE INDEX index_location ON customers(city,postalCode);
SHOW INDEXES FROM customers;

-- 		3. Creating Unique Index
CREATE UNIQUE INDEX index_contact ON customers(addressLine1,phone);
SHOW INDEXES FROM customers;

-- Listing indexes defined on a table
SHOW INDEXES FROM customers;

-- Deleting existing indexes on a table
DROP INDEX index_contact ON customers;


-- Hw
-- write a query to get top 3 recent customers from evry country
-- write a query to get top 3 most frequent customers from evry country
-- write a query to get top 3 with highest purches customers from evry country