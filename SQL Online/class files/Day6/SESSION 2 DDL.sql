create database hr;# we created a database called hr
create 
database 
student;
use hr; #connect to hr database
/*
DDL (DATA DEFINITION LANGUAGE)
CREATE 
ALTER
add
modify
rename
drop
RENAME
DROP
TRUNCATE



3 COLUMNS -->ONE ALTER TO DROP ALL THE THREE COLUMNS(INTERVIEW QUESTION) *
*/

create table employees (empid int ,name varchar(20),doj date);#4096 
alter table employees add phone_no char(10);
alter table employees add (mail_id varchar(33),salary int);#method 1
alter table employees add mail_id varchar(33), add salary int;#method 2*
describe employees;# metadata -->data about data
alter table employees modify phone_no int;
#write a query to change the datatype of name column to int and salary column to varchar(22) with one alter
alter table employees modify name int,modify salary varchar(22);
desc employees;
alter table employees rename column empid to empno;
alter table employees drop column empno;
alter table employees drop name;
alter table employees drop column salary,drop column phone_no;
rename table employees to emp_info;
DROP TABLE EMP_INFO;
show tables;         





#drop database hr;