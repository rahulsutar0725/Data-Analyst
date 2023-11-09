USE day9;
SHOW TABLES;
SELECT * FROM students;

-- INSERT: 
-- Inserting one row 
INSERT INTO students VALUES (1, 'AB', 23, 'MySQL','M');

SELECT * FROM students;

-- Inserting vlues by column name
INSERT INTO students(id,name,age) values(2,'xyz',23);

SELECT * FROM students;

-- Inserting Multiple rows into table 
INSERT INTO students VALUES (3, 'XY', 27, 'Power BI', 'F'),
							(4, 'PQ', NULL, 'MySQL', 'F');
                            
SELECT * FROM students;

-- UPDATE:
-- update a single record in a table 
-- update a single column_value
UPDATE students
SET age = 30
WHERE id = 3;

SELECT * FROM students;

-- update a MULTIPLE column values
UPDATE students
SET name='ABC', age=22
WHERE id=1;

SELECT * FROM students;

-- update multiple records
UPDATE students
SET name='GIRL'
WHERE gender='F';

SELECT * FROM students;

-- update all records with same value if we not used the where clause
UPDATE students
SET course='DA';

SELECT * FROM students;

-- DELETE:
-- This command is used to delete the rows in a table
DELETE FROM students
WHERE id = 1;

SELECT * FROM students;

DELETE FROM students
WHERE gender='F';

SELECT * FROM students;
