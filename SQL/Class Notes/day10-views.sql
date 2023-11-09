# Views
/*
Virtual table created by the named query
Operated similar to base table but does not contain any data of its own
*/

# Commands
-- CREATE VIEW
CREATE VIEW view1
AS
SELECT
	e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
    c.customerNUmber,
    SUM(p.amount) AS total_payment
FROM employees e
INNER JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p ON C.customerNumber = p.customerNumber
GROUP BY e.employeeNumber, employeeName, c.customerNUmber;

-- ACCESS DATA FROM THE VIEW
SELECT * FROM view1;
SELECT employeeNumber, total_payment FROM view1;
SELECT SUM(total_payment) FROM view1;

-- ALTER VIEW
ALTER VIEW view1
AS
SELECT
	e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS employee_Name,
    c.customerNUmber,
    SUM(p.amount) AS total_payment
FROM employees e
INNER JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p ON C.customerNumber = p.customerNumber
GROUP BY e.employeeNumber, employee_Name, c.customerNUmber;

-- DROP VIEW
DROP VIEW view1;















