/*
DQL (DATA QUERY LANGUAGE)
SELECT -->TO DISPLAY
COLUMN alias
*/
USE scott;
show tables;
select * from emp; # all the columns of the table only once
select ename,sal from emp;
desc emp;

select ename,hiredate,sal, sal-100 from emp; # expression

#display the name job and annual salary of all employees

select ename,job,sal*12 from emp;

#display the name job and annual salary of all employees after a deduction of 100 only once

select ename,job,(sal*12)-100 from emp;

#display the name job and annual salary of all employees after a deduction of 100 only every month
select ename,job,(sal-100)*12 from emp;

select ename as name,job,sal*12 as Annual_Income from emp;#changing the colmun name
select ename as name, job, sal as Monthly$Salary from emp; # only $ and _ is used to space
select ename as name, job, sal as "Monthly Salary" from emp;

select 'Rahul' as name;

select 23*23;

#name salary amt_paid balance_amt

select ename as name, sal as monthly_salary,100 as amt_paid, sal-100 as balance_amt from emp;