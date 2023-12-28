use hr;
create table employees (empid int, name varchar(20), doj date);
/*
DML (DATA MANIPULATION LANGUAGE)
INSERT
UPDATE
DELETE
*/

insert into employees values(1,'Rahul','2023-07-06');#yyyy-mm-dd
insert into employees(name,doj,empid) values('Alex',current_date(),2);
insert into employees(name,empid,doj) values('Rohan',3,'2012-09-10');
insert into employees (empid, name) values(4,'Rohit'); # null empty
insert into employees values(5,'shivraj',null);#
insert into employees values(6,'Allen','2014-08-09'),(7,'Dev',current_date());
select * from employees;

update employees set name='Shiva' where empid=1;
update employees set name='Nair' where empid>3;#multiple rows
update employees set doj='2023-01-23', name='Alexa' where empid=2;
update employees set name='Alean'; # it affects all the rows of name
select * from employees;

delete from employees where empid=2; # 1 row
delete from employees where empid>4; #multiple row
delete from employees; #all rows

/*
drop     vs     delete
ddl             dml
which of the above can be easily undone? -->delete

*/

select * from employees;

/*
TCL (TRANSACTION CONTROL LANGUAGE) -->DML's (I U D)
COMMIT   --> ctrl+s
ROLLBACK --> ctrl+z
SAVEPOINT -->
*/

rollback;
select * from employees;

rollback;
set autocommit=0; # 0 is disable 1 for enable
insert into employees values(1,'Rahul','2023-07-06');#yyyy-mm-dd
commit;
insert into employees(name,doj,empid) values('Alex',current_date(),2);
rollback; # till last commit time of the session



set sql_safe_updates=0; # 0 means disable 1 means enable


select * from employees; #select cpmmand is used to display | * is used to display all the columns of the table only once

describe employees;

select name,doj from employees;

show tables;
/*
home work
sample

sid        name        loc
1		  'rahul'      locA
2         'rohit'      loc a
3         'rohan'      loc d

delete all the rows from the name column

*/