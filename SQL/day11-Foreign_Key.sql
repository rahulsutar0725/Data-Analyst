USE DAY6;

SELECT * FROM departments;
SELECT * FROM employees_fk1;
SELECT * FROM employees_fk2;
SELECT * FROM employees_fk3;
-- operations on parent table
-- ---------------------------------------------------------------------------------------------
-- CASCADE
-- 1. UPDATE
UPDATE departments SET dept_id=105 WHERE dept_id = 101;

-- 2. DELETE
DELETE FROM departments WHERE dept_id =102;

-- 3. INSERT
INSERT INTO departments
VALUES
(101, 'A', 'Pune', 100),
(102, 'B', 'Mumbai', 150);

-- ------------------------------------------------------------------------------------------------
-- SET NULL
-- 1. UPDATE
UPDATE departments SET dept_id=105 WHERE dept_id = 101;

-- 2. DELETE
DELETE FROM departments WHERE dept_id =102;

-- 3. INSERT
INSERT INTO departments
VALUES
(101, 'A', 'Pune', 100),
(102, 'B', 'Mumbai', 150);

-- ----------------------------------------------------------------------------------------------------
-- RESTRICT:
-- operations on parent table
-- 1. UPDATE
UPDATE departments SET dept_id=105 WHERE dept_id = 101;
-- Error Code: 1451. Cannot delete or update a parent row: 
-- a foreign key constraint fails (`day6`.`employees_fk3`, CONSTRAINT `employees_fk3_ibfk_1` 
-- FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)

-- 2. DELETE
DELETE FROM departments WHERE dept_id =102;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`day6`.`employees_fk3`, CONSTRAINT `employees_fk3_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)

-- 3. INSERT
INSERT INTO departments
VALUES
(101, 'A', 'Pune', 100),
(102, 'B', 'Mumbai', 150);