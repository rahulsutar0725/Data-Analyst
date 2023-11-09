--
-- Data Types:	The type of data database can hold/store
-- Specifies the range of values and operations that can be performed on data.
-- Data Types Majorly categorized into-
/* 		1. Numeric  - age: 28, quanity: 1000, price: 18.34
			-
            1.1 ---- Integer numbers 
            -
            +-------------+----------------------+-------------------------+----------------------+
			| Data Type   | Storage Size (bytes) | Range (signed)          | Range (unsigned)     |
			+=============+======================+=========================+======================+
			| TINYINT     | 1                    | -128 to 127             | 0 to 255  			  |
			+-------------+----------------------+-------------------------+----------------------+
			| SMALLINT    | 2                    | -32,768 to 32,767       | 0 to 65,535          |
			+-------------+----------------------+-------------------------+----------------------+
			| MEDIUMINT   | 3                    | -8,388,608 to 8,388,607 | 0 to 16,777,215      |
			+-------------+----------------------+-------------------------+----------------------+
			| INT         | 4                    | -2^31 to 2^31 - 1       | 2^32 -1              |
			+-------------+----------------------+-------------------------+----------------------+
			| BIGINT      | 8                    | -2^63 to 2^63 - 1       | 2^64 -1			  |
			+-------------+----------------------+-------------------------+----------------------+
            -
            1.2 ---- Decimal numbers -- 123.45, 18.77, 
            -
			+-------------------+----------------------+
			| Data Type         | Storage Size (bytes) |
			+===================+======================+         
			| FLOAT             | 4                    |
			+-------------------+----------------------+
			| DOUBLE            | 8                    |
			+-------------------+----------------------+
			| DECIMAL/NUMERIC   | Variable             |
			+-------------------+----------------------+
            number : 123.45, 77777.7
            FLOAT:	123.45  -- 24 DIGITS OF PRECISION
            DOUBLE:	123.45  -- 53 DIGITS OF PERECISION
            
            DECIMAL(5,2) -- 123.45
            12.34
            DECIMAL(5,2) -- 12.34
            123.456								
            DECIMAL(5,2) -- 123.45/ 123.46			
            1234.45
            DECIMAL(5,2) -- 1234.4 (< 5 -- REMAINS THE SAME)
*/
/* 		2. String  - sequence of characters --> a-z, 0-9, @&$ 
--> name: 'abc', email: "abc@xyz.com", adhar no, pan no, phone no --. '+91-1234567899'            
			+------------------------------+-----------------------------------+
			| Data Type                    | Description		               | 'EXCELR'
			+==============================+===================================+
			| CHAR(length) - 255    	   | fixed-length character strings    |  CHAR(10)   : _ _ _ _ E X C E L R       
			+------------------------------+-----------------------------------+
			| VARCHAR(max. length) - 65,535| variable length character strings |  VARCHAR(10): E X C E L R               
			+------------------------------+-----------------------------------+
*/
/* 		3. Date and Time  -

		+-------------+-----------------------+--------------------------------------------------------------+
		| Data Type   | Format				  | Range 				                                         |
		+=============+=======================+==============================================================+
		| DATE	      | ‘YYYY-MM-DD’ 		  | '1000-01-01' to '9999-12-31'								 |
        +-------------+-----------------------+--------------------------------------------------------------+
		| TIME	      | 'hh:mm:ss[.fraction]' | '-838:59:59.000000' to '838:59:59.000000'					 |
        +-------------+-----------------------+--------------------------------------------------------------+
		| DATETIME    | ‘YYYY-MM-DD HH:MM:SS’ | '1000-01-01 00:00:00.000000' to '9999-12-31 23:59:59.999999' |
        +-------------+-----------------------+--------------------------------------------------------------+
		| TIMESTAMP   | ‘YYYY-MM-DD HH:MM:SS’ | '1970-01-01 00:00:01.000000' to '2038-01-19 03:14:07.999999  |
        +-------------+-----------------------+--------------------------------------------------------------+
        | YEAR		  | 'YYYY'				  | 1901 to 2155 (numbers or string)							 |
        +-------------+-----------------------+--------------------------------------------------------------+
*/


/*  Examples 1: 
Table: products
Columns:
-- product_id 
-- product_name 
-- price 
-- release_date 
					Data:
					+-----------+---------------+---------+--------------+
					|product_id | product_name  | price   | release_date |
					+-----------+---------------+---------+--------------+
					| 1         | T-shirt       | 5.00    | 2023-05-01   |
					| 2         | BookShelf     | 19.34   | 2023-05-02   |
					+-----------+---------------+---------+--------------+
*/
CREATE TABLE products (
	product_id 		INT,
    product_name 	VARCHAR(20),
    price 			DECIMAL(7,2),
    release_date 	DATE
);


USE day2; -- selecting the database
INSERT INTO products VALUES (1, 'T-shirt', 5.00, "2023-05-01");       -- inserting record into the table
INSERT INTO products VALUES (2, 'BookShelf', 19.34, "2023-05-02");

SELECT * FROM products; -- fetch/display all the data from the table specified

/*  Examples 2: 
Table: WebsiteVisits
Columns:
-- visitor_id 
-- visitor_name 
-- visited_page 
-- visit_time 

				    Table: WebsiteVisits          Data:
					+------------+-----------------+---------------------+---------------------+
					| visitor_id | visitor_name    | visited_page        | visit_time          |
					+------------+-----------------+---------------------+---------------------+
					| 1          | John Doe        | Homepage            | 2023-05-01 09:15:00 |
					| 2          | Jane Smith      | Products Page       | 2023-05-02 14:30:00 |
					| 3          | Michael Johnson | About Us            | 2023-05-03 11:45:00 |
					| 4          | Emily Brown     | Contact Page        | 2023-05-04 16:20:00 |
					| 5          | David Wilson    | Blog Post           | 2023-05-05 10:00:00 |
					+-----------+-----------------+---------------------+----------------------+
*/

CREATE TABLE websiteVisits (
	visitor_id 		INT,
    visitor_name	VARCHAR(25),
    visited_page	VARCHAR(25),
    visit_time		DATETIME
);

INSERT INTO websiteVisits VALUES (1, 'ABC', 'HomePage', NOW());
INSERT INTO websiteVisits VALUES (2, 'PQR', 'Products Page', NOW());

SELECT * FROM websiteVisits;





















