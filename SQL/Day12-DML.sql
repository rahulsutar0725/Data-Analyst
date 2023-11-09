CREATE DATABASE day9;
USE day9;

SET SQL_SAFE_UPDATES = 0; -- UPDATE 

SELECT * FROM students;

-- update a single record in a table -- update a single column_value
UPDATE students
SET age = 30
WHERE id = 3;


-- update a MULTIPLE column values
UPDATE students
SET name='ABC', age=22
WHERE id=1;

-- update multiple records
UPDATE students
SET name='GIRL'
WHERE gender='F';

-- update all records with same value if we not used the where clause
UPDATE students
SET course='DA';

SELECT * FROM students;


-- DELETE
DELETE FROM students
WHERE id = 1;

DELETE FROM students
WHERE gender='F';

