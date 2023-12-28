/*
JOINS -->
INNER JOIN :common data |row that satisfies the condition
OUTER JOIN:inner+unmatched row
LEFT OUTER JOIN
RIGHT OUTER JOIN
FULL OUTER JOIN *
CROSS JOIN 



*/
select d.loc,d.dname ,e.ename from emp e full outer join dept d 
on (e.deptno=d.deptno) ;

/*

set operators:rows
union
A={1,2,3,4,5}
B={2,4,6}
AUB={1,2,3,4,5,6}
union all
A UNION ALL B={1,2,3,4,5,2,4,6}
*/
use scott;
select deptno from emp
union 
select deptno from dept;
select deptno from emp
union all
select deptno from dept;

select dname,ename from emp e left outer join dept d on (e.deptno=d.deptno)
union
select dname,ename from emp e right outer join dept d on (e.deptno=d.deptno);

select ename,dname from emp cross join dept;

create table sales (cust_id int,name varchar(12),city varchar(12));
insert into sales values (101,'King','Boston');
insert into sales values (102,'Alex','seattle');
insert into sales values (103,'Ben','Boston');
insert into sales values (102,'Alex','seattle');
select * from sales;

select c1.city,c1.name from sales c1 join sales c2 
on (c1.city=c2.city) and c1.cust_id<>c2.cust_id;

select w.ename as "worker",m.ename as "report_to" from emp w join emp m on (w.mgr=m.empno);


##################################################################
/*
INDEX -->BOOKS -->
*/
SELECT * FROM EMP WHERE ENAME='SCOTT';











