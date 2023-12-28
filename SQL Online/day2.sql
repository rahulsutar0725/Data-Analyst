create database hr; # we created a databse called hr
create 
database 
student;
use hr;    #connect to hr database
/*
DDL (DATA DEFINATION LANGUAGE)
CREATE
ALTER
add
modify
rename
drop
RENAME
DROP
_______________ 
TRUNCATE

create a table 3 columns --> one alter to drop the the three columns (INTERVIEW QUESTION)

*/
#create a table 3 columns --> one alter to drop the the three columns (INTERVIEW QUESTION)  HOMEWORK

create table employees (empid int, name varchar(20),doj date);
alter table employees drop empid, drop name, drop doj;
drop table employees;
#drop database hr;

create table employees (empid int, name varchar(20),doj date); #max column 4096
alter table employees add phone_no char(10);
alter table employees add (mail_id varchar(33),salary int); #method 1
alter table employees add mail_id varchar(33), add salary int; #method 2
describe employees;   # metadata --> data about data


#change the data type
alter table employees modify phone_no int;

#write a query to change the datatype of name column to int and salary column to varchar(22) with one alter
alter table employees modify name int, modify salary varchar(22);

#change the name of column
alter table employees rename column empid to empno;
desc employees;

#remove the unwanted column
alter table employees drop name;
alter table employees drop column salary, drop column phone_no;

# rename the table name
rename table employees to emp_info;

#delete the table
DROP TABLE EMP_INFO;

show tables;
drop table employees;
varchar varchar2  --> ORACLE



9130503578  -->integer --> number ? (808)-123-2432

+91


rahul  --> char  | varchar (variable character)
			256  | 65535   --> 
					rahul123 --> string text -->varchar
                    
name char(40) --> rahul  --> RS123
name varchar(40)                  

123  -->int
05-july-2023 -->date 



