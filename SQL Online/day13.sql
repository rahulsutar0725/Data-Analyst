use scott;

/*
66.5 -->67, 66.3 --> 66 66.5 -->67
range
5-9 --->+1
0-4 --->+0
*/

select round(1234.546,2); #1234.55
select round(1234.546,1); #1234.5
select round(1234.546,0); #1235
select round(1234.546); #Default 0
select truncate(1234.546,2);#1234.54
select truncate(1234.546,1);#1234.5
select truncate(1234.546,0);#1234
select truncate(1234.546);#error  |trunc()
select mod(2,2),2%2,2/2;#0 0 1.0000
select * from emp;
#analytical function | window functions
select rank() over(order by sal desc),ename,sal from emp;
select rank() over(partition by deptno order by sal desc),ename,sal,deptno from emp;
#highest paid employee from each department
select dense_rank() over(partition by deptno order by sal desc),ename,sal,deptno from emp;

#inline view
select * from
(
select dense_rank() over(partition by deptno order by sal desc) as rank_value
,ename,sal,deptno from emp
)t1 where rank_value=1;

select lead(sal,1,0) over(order by sal) as next_value,ename,sal from emp;

select lag(sal,1,0) over(order by sal) as previous_value,ename,sal from emp where sal is not null;

delete from emp where sal is null;
select min(sal) from emp group by deptno;

select * from emp where deptno=10;

select lower(ename) from emp;

select min(sal) over(partition by deptno) as dept_min_sal,ename,sal,deptno from emp;

select row_number() over()as "row_id",ename,sal from emp;