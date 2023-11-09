# Triggers
/*
- A stored procedure program that is invoked automatically in response to an event associated with a table.
- Each trigger is associated with a table
- A trigger can be activated on any DML statement - INSERT, UPDATE, DELETE
*/

# Syntax
/*
						CREATE TRIGGER trigger_name
						{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
						ON table_name FOR EACH ROW
						trigger_body;
        
- Trigger action time:
	1. BEFORE: the trigger is invoked beforE each row is modified.
    2. AFTER: the trigger is invoked after each row is modified.
- Modifiers:
    1. OLD: the value of the columns BEFORE the DML has fired
    2. NEW: the value of the columns AFTER the DML has fired
*/

USE day15;
SHOW TABLES;

SELECT * FROM employee;
SELECT * FROM employee_log;
-- log - record/entries for every activity

-- create trigger on update command
CREATE TRIGGER employee_update
BEFORE UPDATE ON employee
FOR EACH ROW
	INSERT INTO employee_log
    SET _action = 'update',
    eid = OLD.eid,
    prev_ename = OLD.ename,
    current_ename = NEW.ename,
    prev_job_title = NEW.job_title,
    current_job_title = NEW.job_title,
    prev_salary = OLD.salary,
    current_salary = NEW.salary,
    _change_date = NOW();

-- update on employee
UPDATE employee
SET ename = 'AMAN'
WHERE eid=1;

SELECT * FROM employee;
SELECT * FROM employee_log;

UPDATE employee
SET job_title = 'Data Engineer', salary = 75000
WHERE eid=3;

SELECT * FROM employee;
SELECT * FROM employee_log;

-- create trigger on insert command  
CREATE TRIGGER employee_insert
AFTER INSERT ON employee
FOR EACH ROW 
	INSERT INTO employee_log
    SET _action = 'insert',
    eid = NEW.eid,
    current_ename = NEW.ename,
    current_job_title = NEW.job_title,
    current_salary = NEW.salary,
    _change_date = NOW();

-- inserting record into employee
INSERT INTO employee VALUES (5,'AMAN','AMAN@SAMPLE.COM','DATA ANALYST',60000);

SELECT * FROM employee;
SELECT * FROM employee_log;

-- create trigger on delete command
CREATE TRIGGER employee_delete
BEFORE DELETE ON employee
FOR EACH ROW
	INSERT INTO employee_log
    SET _action = 'delete',
    eid=OLD.eid,
    prev_ename = OLD.ename,
    prev_job_title = OLD.job_title,
    prev_salary = OLD.salary,
    _change_date = NOW();

-- delete operation on employee
DELETE FROM employee
WHERE eid = 2;

SELECT * FROM employee;
SELECT * FROM employee_log;


