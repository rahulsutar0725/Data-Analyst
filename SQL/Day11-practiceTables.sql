-- CREATE DATABASE day6;
USE day6;
-- ----------------------------------------------------------
CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(25),
    location VARCHAR(50),
    emp_count INT
);
INSERT INTO departments 
VALUES 
(101, 'A', 'Pune', 100),
(102, 'B', 'Mumbai', 150);
-- ----------------------------------------------------------

-- CASCADE
CREATE TABLE employees_fk1 (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(25),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
INSERT INTO employees_fk1 
VALUES 
(1, 'John Doe', '2023-05-01', 101),
(2, 'Jane Smith', '2023-05-02', 102),
(3, 'Michael Johnson', '2023-05-03', 102),
(4, 'Emily Brown', '2023-05-04', 101),
(5, 'David Wilson', '2023-05-05', 102);
-- -----------------------------------------------------------

-- SET NULL
CREATE TABLE employees_fk2 (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(25),
	hire_date DATE,
	dept_id INT,
	FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
    ON UPDATE  SET NULL
    ON DELETE  SET NULL
);
INSERT INTO employees_fk2 
VALUES 
(1, 'John Doe', '2023-05-01', 101),
(2, 'Jane Smith', '2023-05-02', 102),
(3, 'Michael Johnson', '2023-05-03', 102),
(4, 'Emily Brown', '2023-05-04', 101),
(5, 'David Wilson', '2023-05-05', 102);
-- -------------------------------------------------------------

-- RESTRICT:
CREATE TABLE employees_fk3 (
	employee_id INT PRIMARY KEY, 
    employee_name VARCHAR(25),
    hire_date DATE,
    dept_id INT,
	FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
    ON UPDATE  RESTRICT
    ON DELETE  RESTRICT
);
INSERT INTO employees_fk3 
VALUES 
(1, 'John Doe', '2023-05-01', 101),
(2, 'Jane Smith', '2023-05-02', 102),
(3, 'Michael Johnson', '2023-05-03', 102),
(4, 'Emily Brown', '2023-05-04', 101),
(5, 'David Wilson', '2023-05-05', 102);

