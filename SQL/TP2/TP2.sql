CREATE DATABASE TP2;
USE TP2;

CREATE TABLE course(
	id INT,
    course_name VARCHAR(30),
	trainer VARCHAR(25)
);

INSERT INTO course VALUES(1,'Java','Mike'),
						(2,'Python','James'),
                        (3,'Android','Robin'),
                        (4,'Hadoop','Stephen'),
                        (5,'Testing','Micheal');
                        
CREATE TABLE contact(
		id INT,
        email VARCHAR(30),
        mobile BIGINT
);

INSERT INTO contact VALUES(1,'mike@xyz.com',8765678765),
						  (2,'james@xyz.com',4567876569),
						  (3,'robin@xyz.com',9876898323),
						  (4,'stephen@xyz.com',6789865674),
						  (5,'micheal@xyz.com',4567873453);


-- ------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM course; 
SELECT * FROM contact;

# Views :

# Commands
-- CREATE VIEW
CREATE VIEW Trainer       
AS 
SELECT 
	c.id,
	c.course_name, 
    c.trainer, 
    t.email       
FROM course c
JOIN contact t   
WHERE c.id = t.id; 

-- ACCESS DATA FROM THE VIEW
SELECT * FROM Trainer;
SELECT course_name,trainer FROM Trainer;

