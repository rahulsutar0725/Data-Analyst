/*
functions : string function,number,date function, analytical functions
*/

select lower("RAHUL");
select upper('rahul');
select lower(ename),ename from emp;
select length(length('rahul')); # nesting of function

select max(min(sal)) from emp;
select max(min(sal)) from emp group by deptno; #oracle

select max(sal) from emp where sal in (select min(sal) from emp group by deptno);



