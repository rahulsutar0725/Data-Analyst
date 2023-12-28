use hr;
show tables;
select * from employees;
insert into employees values(2,'Rohit',current_date());
insert into employees values(3,'Rohan',current_date());
/*
TCL (TRANSACTION CONTROL LANGUGE) -->DML's(I U D)

COMMIT; -->SAVE
ROLLBACK; --> UNDO
SAVEPOINT; --> logical markers | controls the scope of rollback
*/
ROLLBACK; 
set autocommit=0;
ROLLBACK;
delete from employees;
ROLLBACK;
insert into employees values(4,'sam',null);
rollback;
insert into employees values(4,'sam',null);
commit;
rollback;

select * from employees;
#4 rows
delete from employees where empid=1; #3 rows remaining after this line
savepoint a1;
delete from employees where empid=2; #2rows remaining after this line
savepoint a2;
delete from employees where empid=3; #1 rows remaining after this line
savepoint a3;
delete from employees where empid=4; #0 rows remaining after this line
savepoint a4;

select * from employees;
rollback to savepoint a4; #0 rows
rollback to savepoint a3; #1 rows
rollback to savepoint a1; #3 rows
rollback to savepoint a1; #error --> savepoint does not exist
#########################################################################
select * from employees;
delete from employees;#all
rollback;
truncate table employees; #(DDL WHY?) DROP CREATE | TRUNCATE is used to delete all the rows from the table
rollback;

###############################################################################
/*
RULES ON DATA -->CONSTRAINTS
UNIQUE
NOT NULL
PRIMARY KEY (U+NN)
CHECK (CONDITION)
FOERIGN KEY | REFERENCE KEY

DELETE
on delete set null --> whenever a parent row is deleted the associated child values is setted to NULL.

on delete cascade --> whenever a parent row is deleted the associated child rows are also deleted.

UPDATE
on update cascade --> whenever a parent row is updated the associated child values are also updated with the new
on update set null --> whenever a parent row is updated the associated child rows are setted to null

*/