use scott;
/*
SELECT [DISTINCT]*,column_name | expressions [[as] alias]
[FROM table]
[WHERE CONDITION(S)];
[ORDER BY column_name,ALIAS,column position number {asc(default)| des}]
LIMIT [number of rows to be ignored], number of rows to be displayed;
1>0 TRUE(YES)
*/

select ename, sal from emp
order by sal asc;

select ename, sal from emp
order by sal desc;

select ename, sal from emp
order by ename asc;

select ename, sal from emp
order by ename desc;

select ename as name, sal as salary from emp
order by sal asc;

select ename,sal,hiredate from emp
order by 3;

select deptno,sal from emp order by deptno asc, sal desc;

select * from emp order by comm asc; -- nulls are at top
select ename,comm,isnull(comm) from emp order by 3 asc, comm asc; 
select ename,comm,isnull(comm) from emp order by isnull(comm) asc, comm asc; #no

-- CASE
/*
If ELSE
CLERK 100
SALESMAN 200
MANAGER  300
*/
SELECT ENAME, SAL AS OLD_SAL,
CASE JOB
WHEN 'clerk' then sal+100
WHEN 'salesman' then sal+200
WHEN 'manager' then sal+300
else sal
END as new_sal,job from emp;

/*
>=3000 Grade A
2000 2999 Grade B
<1999 Grade C
*/

select ename,sal,
case
when sal>= 3000 then 'Grade A'
when sal between 2000 and 2999 then 'Grade B'
when sal<=1999 then 'Grade C'
end as status from emp;

-- LIMIT [number of rows to be ignored], number of rows to be displayed;
select ename,sal from emp order by sal desc limit 1;

select ename, sal from emp order by sal desc limit 3;
select * from emp;


#first hired salesman
select ename,job,hiredate from emp where job='salesman' order by hiredate asc limit 1;

#second hired salesman
select ename,job,hiredate from emp where job='salesman' order by hiredate asc limit 1,1;

#display the 2nd highest paid employee
select ename,sal from emp order by sal desc limit 1,1;

/*
STRING FUNCTIONS 
DATE FUNCTIONS
NUMBER FUNCTIONS
AGGREGATE FUNCTIONS -- SUM,MIN,MAX,AVG,COUNT
WINDOW FUNCTION | ANALYTICAL FUNCTIONS --> RANK, DENSE_RANK
*/

-- AGGREGATE FUNCTIONS | GROUP FUNCTIONS --> ONE RESULT PER SET OF ROWS

SELECT MIN(SAL) FROM EMP;
SELECT MAX(SAL) FROM EMP;
SELECT MIN(ENAME),MAX(ENAME) FROM EMP;
SELECT MIN(HIREDATE),MAX(HIREDATE) FROM EMP;

select sum(sal) as total,avg(sal) from emp;
select min(sal) from emp;
select count(empno) from emp;
select count(comm) from emp;
select count(*) from emp;
select count(distinct deptno) from emp;
