# SQL Constraints - RULES/LIMITATIONS
-- Specifies rules for the data that goes into table.
-- Can be Column level or Table level.


# Types of Constraints
-- 1. Entity Intigrity Constraints     	: NOT NULL 				-->
-- 2. Domain Integrity Constraints		: CHECK | DEFAULT		-->
-- 3. Key Intigrity Constraints			: UNIQUE| PRIMARY KEY	-->
-- 4. Refrential Integrity Constraints	: FOREIGN KEY			-->

CREATE TABLE sample(
		col_name data_type NOT NULL,
        age INT CHECK (age > 18),
        col2 data_type DEFAULT 0 | '--MISSING--' | '2023-01-01',
        ID INT PRIMARY KEY
        
);
-- NOT NULL		--> Ensures No NULL values in column
-- UNIQUE		--> Ensures no duplicate column values 		-->phone_no, adhar_no, email, voter_id, pan_no
-- CHECK		--> Specifies conditon for input values
-- DEAFULT		--> Default value of the specified column
-- PRIMARY KEY	--> Uniquely identifies each record			(PRIMARY KEY = NOT NULL + UNIQUE)
-- FOREIGN KEY	--> Ensures data consistency in database tables

-- ----------------------day10------------------------------------------------------------
CREATE DATABASE day6;
USE day6;

-- create a table without constraints
CREATE TABLE user0 (
	uid		INT,
    uname	VARCHAR(25),
    age		INT,
    isAdmin VARCHAR(5)
);
-- inserting values into the table without constraints
INSERT INTO user0 VALUES (101, 'ABC', 34, 'NO');
INSERT INTO user0 VALUES (101, 'PQR', 23, 'NO');  		-- accepting duplicate values 
INSERT INTO user0 VALUES (102, NULL, 20, 'YES');		-- accepting NULL values
INSERT INTO user0 VALUES (103, 'XYZ', -5, 'NO');		-- accepting INVALID values	
INSERT INTO user0(uid, uname, age) VALUES (104, 'HJK', 23);			-- default value is NULL

SELECT * FROM user0;

-- create a table with constraints
CREATE TABLE user1 (
	uid		INT	UNIQUE,
    uname	VARCHAR(25) NOT NULL,
    age		INT CHECK(age >= 13),
    isAdmin VARCHAR(5) DEFAULT 'NO'
);
-- inserting values into the table with constraints
INSERT INTO user1 VALUES (101, 'ABC', 34, 'NO');
INSERT INTO user1 VALUES (101, 'PQR', 23, 'NO');  		-- NOT accepting duplicate values 
INSERT INTO user1 VALUES (102, NULL, 20, 'YES');		-- NOT accepting NULL values
INSERT INTO user1 VALUES (103, 'XYZ', -5, 'NO');		-- NOT accepting INVALID values	
INSERT INTO user1(uid, uname, age) VALUES (104, 'HJK', 23);	   -- default value is custom

SELECT * FROM user1;

-- ------------------------------------------------------------------------------
# PRIMARY KEY   -- STUDENT ID, adahar no, product id, sale id, orders id
-- A column or combination of columns that uniquely identifies reach record in a table
-- UNIQUE + NOT NULL
-- There could be only one primary key for a table
-- primary key could be made of of one or more columns

CREATE TABLE students (
	sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(25) NOT NULL
);
INSERT INTO students VALUES (1, 'ABC');
INSERT INTO students VALUES (2, 'ABC');
INSERT INTO students VALUES (2, 'PQR');			-- Error Code: 1062. Duplicate entry '2' for key 'students.PRIMARY'
INSERT INTO students VALUES (NULL, 'XYZ');		-- sid is AUTO INCREMENTED 
INSERT INTO students(sname) VALUES ('AAA');		-- sid is AUTO INCREMENTED 
INSERT INTO students VALUES (NULL, 'AMAN');
INSERT INTO students(sname) VALUES ('AKASH');
INSERT INTO students VALUES (20, 'NAINA');		
INSERT INTO students(sname) VALUES ('RAHUL');		-- sid is AUTO INCREMENTED 
SELECT * FROM students;

CREATE TABLE students1 (
	sid INT PRIMARY KEY,
    sname VARCHAR(25) NOT NULL
);
INSERT INTO students1 VALUES (1, 'ABC');
INSERT INTO students1 VALUES (2, 'ABC');
INSERT INTO students1 VALUES (2, 'PQR');			-- Error Code: 1062. Duplicate entry '2' for key 'students1.PRIMARY'
INSERT INTO students1 VALUES (NULL, 'XYZ');			-- Error Code: 1048. Column 'sid' cannot be null
INSERT INTO students1(sname) VALUES ('AAA');		-- Error Code: 1364. Field 'sid' doesn't have a default value

SELECT * FROM students1;

-- STUDENTS
-- SECTIONS : 101, 102

CREATE TABLE students2 (
	section INT,
	sid INT,
    sname VARCHAR(25) NOT NULL,
    PRIMARY KEY (section, sid)   -- table level definition of primary key
);
INSERT INTO students2 VALUES (101, 1, 'ABC');
INSERT INTO students2 VALUES (101, 2, 'PQR');
INSERT INTO students2 VALUES (101, 2, 'XYZ'); 		-- Error Code: 1062. Duplicate entry '101-2' for key 'students2.PRIMARY'
INSERT INTO students2 VALUES (102, 1, 'XYZ'); 
SELECT * FROM students2;

CREATE TABLE students3 (
	section INT PRIMARY KEY,			-- Error Code: 1068. Multiple primary key defined
	sid INT PRIMARY KEY,
    sname VARCHAR(25) NOT NULL
);

-- -----------------------------------------Day11------------------------------------------------


