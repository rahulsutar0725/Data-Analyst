
-- DDL - Data Defination Language

CREATE DATABASE day8;
USE day8;
-- 1. CREATE
-- Creating tables

CREATE TABLE courses(
		c_id CHAR(3) PRIMARY KEY,
        `course name` VARCHAR(30),
        credits INT CHECK (credits > 0)
);

CREATE TABLE students(
		s_id INT PRIMARY KEY AUTO_INCREMENT,
        s_name VARCHAR(25),
        age INT CHECK (age > 13) DEFAULT 18,
        course_id VARCHAR(25),
        FOREIGN KEY (course_id) REFERENCES courses(c_id)
);

-- inserting data into tables
-- inserting multiple records using one insert statement
INSERT INTO courses
VALUES
('10A','MySQL',5),
('10B','Power BI',4),
('10C','Excel',4);

SELECT * FROM courses;
SELECT * FROM students;
-- inserting single records using one insert statement

INSERT INTO students VALUES (1,'ABC',23,'10D'); 
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`day8`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`c_id`))
INSERT INTO students VALUES (1,'ABC',23,'10A');

-- inserting record with specified column values
INSERT INTO students(s_id,s_name,course_id) VALUES (2,'XYZ','10B'); -- For age default value will be taken


# 2. DROP Command
CREATE DATABASE dummy;
USE dummy;

CREATE TABLE t1(col1 INT, col2 INT);
CREATE TABLE t2(col1 INT, col2 INT);
CREATE TABLE t3(col1 INT, col2 INT);

-- display the list of tables in the database
SHOW TABLES;

-- drop tables in the database
DROP TABLE t1;
DROP TABLE t2,t3;

-- list the databases
SHOW DATABASES;

-- droping database
DROP DATABASE dummy;

-- # 3. ALTER Command
-- adding a new column to the existing table
ALTER TABLE students
ADD COLUMN marks INT CHECK(marks>0); -- column defination

ALTER TABLE students
ADD COLUMN grade CHAR(1) AFTER age; -- AFTER AGE COLUMN POSITION OF THE GRADE COLUMN IN THE TABLE 

ALTER TABLE students
ADD COLUMN remarks VARCHAR(25) FIRST; -- 1ST POSITION COLUMN INT THE TABLE 

-- remove a column from the table
ALTER TABLE students
DROP COLUMN grade;

ALTER TABLE students
DROP COLUMN remarks;

-- change the data type of an existing column
ALTER TABLE students
MODIFY COLUMN s_name VARCHAR(30) NOT NULL;

-- change name of an existing column
ALTER TABLE students
CHANGE COLUMN s_name `students name` VARCHAR(30);

-- change name of a table
ALTER TABLE students RENAME TO students_data;
RENAME TABLE students_data TO students;

SELECT * FROM students;

-- 4. TRUNCATE command
-- empty the table (remove all) the records from the table)
-- DROP Command
-- DROP COMMAND + CREATE command
TRUNCATE TABLE students;


