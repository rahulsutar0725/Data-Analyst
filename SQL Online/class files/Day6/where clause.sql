use scott;
select distinct deptno from emp;

select distinct job from emp;
select distinct deptno,job from emp;
select ename,sal,comm,sal+ifnull(comm,0) as total_income from emp;
select ename,sal,comm from emp; 
select comm,ifnull(comm,0) from emp;
select * from emp;

/*
SELECT [DISTINCT] *,column_name|expressions [[as] alias]
[FROM table]
[WHERE CONDITION(S)];
comparision operator =,>,<,<> !=,>=,<=


1>0 TRUE(YES)
*/

SELECT * FROM EMP WHERE ENAME='SCOTT';
SELECT * FROM EMP WHERE sal=1250;
SELECT * FROM EMP WHERE sal>2000;
select * from emp where job ='clerk';
select * from emp where deptno<>30;

#display those employees whos name starts with an S
select * from emp where ename like 's%';

#display those employees whos name ends with s
select * from emp where ename like '%s';

#contain s
select * from emp where ename like '%s%';

#display those employees whos name contain atleast two a
#ankita priyanka adams aana

select * from emp where ename like '%a%a%';

#display that employees name who has an I in the third position

select * from emp where ename like '__i%';

#display that employees whos name contain e in the second last position

/*
like 
% -->zero or more characters
_ -->only one character

IS NULL
IN(SET)
between  and 
*/
select * from emp where ename like '%e_';

select ename,sal,comm from emp where comm is null;

select * from emp where ename IN ('smith','scott','Allen','Renu');

#display those employees who are working as clerk and salesman

select * from emp where job in ('clerk','salesman');

#1250 3000 -->between and -->Range of values 

select * from emp where sal between 1250 and 3000;


/*
1)display the name of that employee whos name start with j and ends with s
2)display the details of those employees who were hired in December(functions not allowed)
3)employees who gets commission
*/
#---------------- IN NOT ALLOWED
/*
LOGICAL OPERATOR
AND -- BOTH THE CONDITION MUST BE TRUE
OR -->ANYONE CONDITION IS TRUE
not *
*/
select * from emp where job='clerk' AND deptno=20;

#DISPLAY THOSE EMPLOYEES WHO ARE WORKING AS CLERK AND SALESMAN
select * from emp where job='clerk' or job='salesman';


#DISPLAY THOSE EMPLOYEES WHO ARE WORKING AS CLERK AND SALESMAN but display only those who's salary
#is more than 1000

select * from emp where (job='clerk'  or job='salesman') and  sal>1000;#

select * from emp where sal >1000 and (job='clerk' or  job='salesman');#


select * from emp where (job='clerk' and sal >1000)  or (job='salesman' and sal>1000);#







create table sample(sid int,sname varchar(22),loc varchar(12));
insert into sample values (1,'sample A','loc a');
insert into sample values (2,'sample b','loc b');
insert into sample values (3,'sample c','loc c');
select * from sample;
update sample set sname=null;










