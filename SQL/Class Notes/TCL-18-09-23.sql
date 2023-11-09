# TCL : Transaction Control Langugae
/*
-- A single unit of work in a database is formed after 
   the consecutive execution of commands is known as a transaction
-- TCL commands help to manage the transactions that take place 
   in a database.
-- Ensure the database never contains the result of partial operations.
*/

# TCL Commands:
-- TRANSACTION
-- COMMIT  
-- ROLLBACK 
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































