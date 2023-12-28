/*
triggers-->evoked when event happens (dml) (i u d)

old  -->old value
new  -->new value

timming
before
after 
*/
select * from emp;#u
create table job_history(empno int,job char(22),sal int,deptno int);#i
select * from job_history;
update emp set job='salesman' ,sal=2000 where empno=7369;
CREATE DEFINER=`root`@`localhost` TRIGGER `emp_BEFORE_UPDATE` BEFORE UPDATE ON `emp` FOR EACH ROW BEGIN
insert into job_history values (old.empno,old.job,old.sal,old.deptno);
END
