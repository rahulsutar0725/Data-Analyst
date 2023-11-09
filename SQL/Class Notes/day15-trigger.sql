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
-- create trigger on update command
-- create trigger on insert command  
-- create trigger on delete command





