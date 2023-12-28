/*
triggers --> evoked when event happens (dml)

old-->old value
new--> new value

timing
before
afterbonus
*/
select * from emp;
create table job_history(empno int, job char(22),sal int, deptno int);
select * from job_history;
update emp set job='salesman',sal=2000 where empno=7369;
use scott;
set sql_safe_updates=0;
select * from medicines;
select * from orders;
update medicines set qty=100;
/*
whenever the qty goes below 20 then order
qty<20

update medicines
*/
update medicines set qty=40 where med_id=101;
select * from medicines;
select * from orders;
update medicines set qty=19 where med_id=101;

/*
audit

emp -->audit_table(username,action_name,action_time,old_sal_value,new_sal_value);
*/
select * from emp;

create table audit_table(username char(33),action_name char(12), action_time datetime,
							old_sal_value int, new_sl_value int);
select user();
SELECT * FROM AUDIT_TABLE;
DELETE FROM EMP WHERE EMPNO=7369;
UPDATE EMP SET SAL=3400 WHERE ENAME='SCOTT';

/*
Functions
*/

select cube_no(3);
select cube_no(sal) from emp;
select * from emp;
select proper(ename),ename from emp;