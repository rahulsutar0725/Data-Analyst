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

