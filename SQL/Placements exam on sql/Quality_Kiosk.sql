CREATE DATABASE RUSHI;
USE RUSHI;
CREATE TABLE departments(
	dept_no VARCHAR(20),
    dept_name VARCHAR(25)
);
INSERT INTO departments VALUES('d001','Sales'),('d002','Engineering');
SELECT * FROM departments;

CREATE TABLE dept_emp(
	emp_no INT,
    dept_no VARCHAR(20),
    from_date DATE
);
INSERT INTO dept_emp VALUES
(1,'d001','1984-02-03'),
(2,'d001','1975-02-03'),
(3,'d001','1976-01-01'),
(4,'d002','1994-01-01');
SELECT * FROM dept_emp;

SELECT
	d.dept_name,
    COUNT(e.emp_no) AS 'employee_count'
FROM departments d
JOIN dept_emp e ON d.dept_no=e.dept_no
GROUP BY e.dept_no HAVING COUNT(e.emp_no)>=3
ORDER BY d.dept_name ASC;

use classicmodels;
select orderNumber,orderDate,requiredDate from orders where (YEAR(orderDate)>='2003' & YEAR(requiredDate)<='2004');

