use hr;
drop table employees;
############################## on delete set null/on update cascade ############################
create table departments(deptno int primary key,dname varchar(22) not null);
create table employees
(
empno int primary key,
name varchar(22) not null,
salary int check(salary>0),
deptid int,
foreign key (deptid) references departments(deptno) on delete set null on update cascade);

insert into departments values(10,'sales');
insert into departments values(20,'Hr');

insert into employees values(101,'Renu',1000,20);
insert into employees values(102,'Alex',4000,10);
insert into employees values(103,'Allen',3400,20);
select * from employees;
delete from departments where deptno=10;
update departments set deptno=33 where deptno=20;

################################# on delete cascade/on update set null #######################
drop table employees;
drop table departments;
create table departments(deptno int primary key,dname varchar(22) not null);
create table employees
(
empno int primary key,
name varchar(22) not null,
salary int check(salary>0),
deptid int,
foreign key (deptid) references departments(deptno) on delete cascade on update set null);
insert into departments values(10,'sales');
insert into departments values(20,'Hr');

insert into employees values(101,'Renu',1000,20);
insert into employees values(102,'Alex',4000,10);
insert into employees values(103,'Allen',3400,20);
select * from employees;

delete from departments where deptno=10;
update departments set deptno=33 where deptno=20;


# col unique ---> 1 null , 2 null --> 
