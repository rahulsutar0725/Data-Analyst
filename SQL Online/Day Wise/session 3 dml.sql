use hr;
create table employees (empid int ,name varchar(20),doj date);
/*
DML (DATA MANIPULATION LANGUAGE)
INSERT
UPDATE
DELETE
*/
#drop table employees
insert into employees values (1,'Renu','2023-07-06');#yyyy-mm-dd
insert into employees(name,doj,empid) values ('Alex',current_date(),2);
insert into employees(name,empid,doj) values ('Sam',3,'2012-09-10');
insert into employees(empid,name) values (4,'Suraj');#null empty *
insert into employees values (5,'Scott',null);#
insert into employees values (6,'Allen','2014-09-08'),(7,'Dev',current_date());
select * from employees; 
update employees set name='priya' where empid=1;
update employees set name='Nair' where empid>3;#multiple rows
update employees set doj='2023-01-23',name='Alexa' where empid=2;
update employees set name='Allen';#*

delete from employees where empid=2;#1 row
delete from employees where empid>4;#multiple rows
delete from employees;#all rows 

/*

*/
select * from employees;
/*
TCL (TRANSACTION CONTROL LANGUAGE) -->DML'S (I U D)
COMMIT -->ctrl+s
ROLLBACK -->undo
SAVEPOINT
*/ 

rollback;
select * from employees;


rollback;
set autocommit=0;# 0 is disable 1 for enable 
insert into employees values (1,'Renu','2023-07-06');#yyyy-mm-dd
commit;
insert into employees(name,doj,empid) values ('Alex',current_date(),2);
select * from employees;
rollback;#till last commit time of the session

set sql_safe_updates=0;#0 means disable 1 means enable




select * from employees;#select command is used to display | * is used to display all the columns of the table only once

describe employees;
select name,doj from employees;


