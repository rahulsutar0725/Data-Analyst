use hr;
show tables;
select * from employees;
insert into employees values (2,'Alex',current_date());
insert into employees values (3,'Ankita',current_date());
/*
TCL (TRANSACTION CONTROL LANGUAGE) -->DML'S (I U D)

COMMIT; -->save
ROLLBACK; -->
savepoint -->logical markers |controls the scope of rollback
*/
ROLLBACK;
set autocommit=0; 
delete from employees;-- undo this -->rewind it
rollback
insert into employees values (4,'Sam',null);
commit;
select * from employees;# 4
delete from employees where empid=1;# 3
savepoint a1;
delete from employees where empid=2;#1
savepoint a2;
delete from employees where empid=3;#1 row with id 4  #2
savepoint a3;
delete from employees where empid=4;
savepoint a4;

select * from employees;
rollback to savepoint a4;#zero rows
rollback to savepoint a3;#1
rollback to savepoint a1;#3
rollback to savepoint a2;#error--savepoint does not exist 
 ###############################################################################
select * from employees;
delete from employees;#all
rollback;
truncate table employees;#(DDL WHY?) DROP CREATE 
rollback;

#####################################################################
/*
RULES ON DATA -->CONSTRAINTS
UNIQUE
NOT NULL
PRIMARY KEY (U+NN)
CHECK (CONDITION)
FOERIGN KEY|REFERENCE KEY 

DELETE 
on delete set null -->whenever a parent row is deleted the associated child values is setted to NULL.
on delete cascade -->whenever a parent row is deleted the associated child rows are also deleted.

UPDATE
on update cascade -->whenever a parent row is updated the associated child values are also updated with the new
on update set null -->whenever a parent row is updated the associated child rows are setted to null

*/



