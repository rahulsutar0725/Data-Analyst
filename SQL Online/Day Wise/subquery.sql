/*
types of subquery:
non correlated suquery
correlated subquery
*/
select * from emp;
select sal from emp where ename='scott';
#main query|outer query
select ename from emp where sal>(select sal from emp where ename='scott');#subquery|inner query|nested 
select * from dept where deptno not in(select deptno from emp);
#display the names of managers (without using job column) to whom other employees report
select ename as manager_name from emp where empno in (select mgr from emp);
#14-6=>8(simple employees)
select ename as not_a_manager from emp o where empno not in 
(select mgr from emp i where o.empno=i.mgr );

select ename from emp o where not exists(select mgr from emp i where o.empno=i.mgr );

/*ht:
1)display those employees who works in a job role same as smith but earns more than him
2)display an * in front of the name of that employee who was first hired.(select)
smith
allen
*miller
scott
king 
turner
*/
#123 not in(<>all)
select ename from emp where empno not in (133,144,888,null);
/*
single row subquery: >,<,<>,= (stmt 8)
multi row subquery :in,not  (stmt 11)
*/
select ename from emp;
/* joins subquery */



insert into emp(empno,ename) values (1,'Renu');
select * from emp;
select * from dept d where not exists (select deptno from emp e where d.deptno=e.deptno);
select * from dept d where  exists (select deptno from emp e where d.deptno=e.deptno);
######################################
/*
functions :string function,number,date function,analytical functions
*/

select lower('RENU');
select upper('renu');
select lower(ename) ,ename from emp;
SELECT LENGTH('RENU') ;
select length(length(length(length('renu'))));#nesting of function

select max(min(sal)) from emp;#800
select max(min(sal)) from emp group by deptno;#no mysql

select max(sal) from emp where sal in (select min(sal) from emp group by deptno);

select min(sal) from emp group by deptno;