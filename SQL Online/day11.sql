use scott;
/*
Types of subquery:
non correlated subquery
correlated subquery
*/

select * from emp;
select sal from emp where ename='scott';
#main query | outer query
select ename from emp where sal>(select sal from emp where ename='scott'); #subuery | inner query | nested query
select * from dept where deptno not in(select deptno from emp);
# display the name of managers (without using job column) to whom other employees report
select ename as manager_name from emp where empno in (select mgr from emp);
#14-6=8(simple employees)
select ename as not_a_manager from emp o where empno not in (select mgr from emp i where o.empno=i.mgr);

select ename from emp o where not exists(select mgr from emp i where o.empno=i.mgr);



/*
single row subquery: >,<,<>,=(stmt 10)
multi row subqery : in, not (stmt 13)
*/

insert into emp(empno,ename) values (1,'Rahul');
select * from emp;
select * from dept d where not exists ( select deptno from emp e where d.deptno=e.deptno);
select * from dept d where exists (select deptno from emp e where d.deptno=e.deptno);


/*ht:
1)display those employees who works in a job role same as smith but earns more than him
2) display an * in front of the name of that employee who was hired first.(select)
simth
allen
*miller
scott
king
turner
*/
select ename,job,sal from emp where job=(select job from emp where ename='smith') and
sal>(select sal from emp where ename='smith');

select case
when hiredate=(select min(hiredate) from emp) then concat("*",ename)
else ename
end as report
from emp;