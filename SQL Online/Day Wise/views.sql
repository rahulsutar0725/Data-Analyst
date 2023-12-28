/*index -->books --*/
use scott;
select * from emp where ename='scott'; 
create index idf on emp(ename);#non unique 
/*
primary key or unique 
create 
*/
show indexes from emp;
alter table emp add primary key(empno);
alter table emp drop index idf;
create unique index idf on emp(ename);#
insert into emp(empno,ename) values (101,'SCOTT');#
#create unique index idf2 on emp(ename,phone_no);  

################################################################
 
#sequence -->1,2...

create table sample_demo(sid int auto_increment primary key ,sname varchar(22));
insert into sample_demo(sname) values ('sample1');
select * from sample_demo;
insert into sample_demo(sname) values ('sample3');
delete from sample_demo where sid=1;
insert into sample_demo values (10,'sample4');#

create table sample_demo2(sid int auto_increment primary key ,sname varchar(22));
alter table sample_demo2 auto_increment=101;
insert into sample_demo2(sname) values ('sample1');
select * from sample_demo2;
#################################################################
/*
view -->reporting |data hidding
types of views:
group function,join,group by ,distinct -->COMPLEX VIEW -->DML'S not allowed
if there is a select statment without the above components then that type of view is simple view.
in simple view DML's are allowed

*/
create view dept_info as
select count(empno) as emp_cnt,ifnull(sum(Sal),0) as total ,dname
from emp e right outer join dept d on (e.deptno=d.deptno)
group by dname;

update emp set deptno=40 where ename='Renu';
create view emp_info as select empno,ename,deptno from emp where deptno=20;
select * from emp_info;
insert into emp_info values (101,'Alex',20);
insert into emp_info values (102,'Allena',30);#
select * from emp;
select * from dept_info;
/*
3	8750	ACCOUNTING
6	10875	RESEARCH
6	9400	SALES
0	0	OPERATIONS
*/

