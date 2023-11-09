CREATE DATABASE day16;
USE day16;

-- replacing multiple spaces between two words of a string by a single space
CREATE TABLE STABLE (
	_STR VARCHAR(30)
);
INSERT INTO STABLE VALUES ('    ABC     PRQ   ');

SELECT * FROM STABLE;

SELECT REPLACE(REPLACE(REPLACE(_STR, ' ', '<>'), '><', ''), '<>',' ') FROM STABLE;


-- POT
USE classicmodels;
SELECT
	country,
    COUNT(customerNumber) AS customerCount,
	COUNT(customerNumber)/(SELECT COUNT(customerNumber) FROM customers) * 100 AS `%oT`
FROM customers
GROUP BY country;

-- NTILE
SELECT *,
	NTILE(5) OVER (PARTITION BY `YEAR` ORDER BY payment DESC) _NTILE
FROM (SELECT
		YEAR(paymentDate) AS `YEAR`,
		customerNumber,
		SUM(amount) AS payment
	FROM payments
	GROUP BY `YEAR`, customerNumber) t1;
    
-- ENUM
USE day16;
CREATE TABLE tasks(
	tid INT PRIMARY KEY,
    tname VARCHAR(20),
    tpriority ENUM('LOW', 'MEDIUM', 'HIGH')
);
SELECT * FROM tasks;
INSERT INTO tasks 
VALUES 
(1, 'ABC', 'LOW'),
(2, 'PQR', 'HIGH'),
(3, 'XYZ', 'MEDIUM');

SELECT * FROM tasks ORDER BY tpriority;
SELECT * FROM tasks WHERE tpriority = 2;
    
-- ORDER OF EXECUTION OF SELECT CLAUSES
FROM (JOIN) --> WHERE --> GROUP BY --> HAVING --> SELECT --> ORDER BY --> LIMIT;











