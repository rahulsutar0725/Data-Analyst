# TCL : Transaction Control Langugae
/*
-- A single unit of work in a database is formed after 
   the consecutive execution of commands is known as a transaction
-- TCL commands help to manage the transactions that take place 
   in a database.
-- Ensure the database never contains the result of partial operations.
-- DML --> INSERT, UPDATE, DELETE
*/

# TCL Commands:
-- TRANSACTION : start the transaction
-- COMMIT  : save the changes permanently to the database
-- ROLLBACK : undo the changes made by DML commands
-- SAVEPOINT

CREATE DATABASE IF NOT EXISTS day9;
USE day9;
CREATE TABLE IF NOT EXISTS students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20),
    age INT,
    course VARCHAR(10),
    gender CHAR(1)
);
INSERT INTO students VALUES (1, 'AB', 23, 'MySQL', 'M');
INSERT INTO students VALUES (2, 'XY', 27, 'Power BI', 'F');
INSERT INTO students VALUES (3, 'PQ', NULL, 'MySQL', 'F');

SELECT * FROM students;

-- SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;    -- starts transaction
SELECT * FROM students;
UPDATE students SET age=30 WHERE id=3;			-- DML 1
DELETE FROM students WHERE course='Power BI';	-- DML 2
INSERT INTO students VALUES (4,'ABC',24,'DA','M'); -- DML 3
ROLLBACK;			-- ENDS THE TRANSACTION

SELECT * FROM students;

START TRANSACTION;    -- starts transaction
SELECT * FROM students;
UPDATE students SET age=30 WHERE id=3;			-- DML 1
DELETE FROM students WHERE course='Power BI';	-- DML 2
INSERT INTO students VALUES (4,'ABC',24,'DA','M'); -- DML 3
COMMIT;			-- ENDS THE TRANSACTION


START TRANSACTION;		-- start transtaction
SELECT * FROM students;
INSERT INTO students VALUES (5,'GH3',33,'MYSQL','F');
SAVEPOINT s1;
INSERT INTO students VALUES (6,'df3',23,'MYSQL','F');
INSERT INTO students VALUES (7,'GH3',26,'MYSQL','M');
SELECT * FROM students;
ROLLBACK TO s1;
SELECT * FROM students;

START TRANSACTION;		-- start transtaction
SELECT * FROM students;
INSERT INTO students VALUES (6,'GH3',33,'MYSQL','F');
SAVEPOINT s1;
INSERT INTO students VALUES (7,'df3',23,'MYSQL','F');
SAVEPOINT s2;
INSERT INTO students VALUES (8,'GH3',26,'MYSQL','M');
SELECT * FROM students;
ROLLBACK TO s2;
ROLLBACK TO s1;

SELECT * FROM students;

