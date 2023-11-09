CREATE DATABASE day9;
USE day9;
CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20),
    age INT,
    course VARCHAR(10),
    gender CHAR(1)
);
INSERT INTO students VALUES (1, 'AB', 23, 'MySQL', 'M');
INSERT INTO students VALUES (2, 'XY', 27, 'Power BI', 'F');
INSERT INTO students VALUES (3, 'PQ', NULL, 'MySQL', 'F');
