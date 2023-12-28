
/*
sum(),avg(),count(),min(),max()
*/
use scott;
select max(Sal),deptno from emp
group by deptno;

#find the total employees working in each job

/*select count(empno) as total,job 
from emp
where count(empno)>3
group by job; -->error
*/
select count(empno) as total,job 
from emp
group by job
having count(empno)>3;

#find the number of employees and total salary in department no 10 and 20 but display only that
#department were the total salary is more than 9600(do not use comm) 

select count(empno) ,sum(sal)  
from emp
where deptno in (10,20)
group by deptno
having  sum(sal)>9600;

########## JOINS ########
/* TYPE OD JOINS
INNER JOIN
LEFT JOIN
RIGHT JOIN
CROSS JOIN



SELF JOIN
*/
/*
INNER JOIN :COMMON DATA|rows that satisfies the given condition

OUTER JOIN:inner join+unmatched rows
LEFT OUTER JOIN |LEFT JOIN :inner join+unmatched rows from left table
RIGHT OUTER JOIN|RIGHT JOIN :inner join+unmatched rows from right table



FULL OUTER JOIN |FULL JOIN  :inner join+unmatched rows from both the table

CROSS JOIN
*/
#1)display the employees name and their department_name
#2)that city name were we do not have any departments

select ename as name,loc,e.deptno from emp as e inner join dept as d on(e.deptno=d.deptno);
SHOW TABLES;

#EMPLOYEES WHO DO NOT WORKING IN ANY DEPARTMENTS:
select ename as name,dname from dept as d right join emp as e on(e.deptno=d.deptno);
select ename as name,dname from emp as e left join dept as d on(e.deptno=d.deptno);

/*
SELECT COLUMN_NAME,COLUMN_NAME
FROM <TABLE1> JOIN <TABLE2>
ON(JOIN CONDITION);

Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 63
Server version: 8.0.33 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use scott;
Database changed
mysql> select * from emp;
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1980-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
14 rows in set (0.01 sec)

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.01 sec)

mysql> select ename,loc from emp join dept on(deptno=deptno);
ERROR 1052 (23000): Column 'deptno' in on clause is ambiguous
mysql>
mysql>
mysql> select ename as name,loc from emp as e join dept as d on(e.deptno=d.deptno);
+--------+----------+
| name   | loc      |
+--------+----------+
| SMITH  | DALLAS   |
| ALLEN  | CHICAGO  |
| WARD   | CHICAGO  |
| JONES  | DALLAS   |
| MARTIN | CHICAGO  |
| BLAKE  | CHICAGO  |
| CLARK  | NEW YORK |
| SCOTT  | DALLAS   |
| KING   | NEW YORK |
| TURNER | CHICAGO  |
| ADAMS  | DALLAS   |
| JAMES  | CHICAGO  |
| FORD   | DALLAS   |
| MILLER | NEW YORK |
+--------+----------+
14 rows in set (0.01 sec)

mysql> select ename as name,loc from emp as e inner join dept as d on(e.deptno=d.deptno);
+--------+----------+
| name   | loc      |
+--------+----------+
| SMITH  | DALLAS   |
| ALLEN  | CHICAGO  |
| WARD   | CHICAGO  |
| JONES  | DALLAS   |
| MARTIN | CHICAGO  |
| BLAKE  | CHICAGO  |
| CLARK  | NEW YORK |
| SCOTT  | DALLAS   |
| KING   | NEW YORK |
| TURNER | CHICAGO  |
| ADAMS  | DALLAS   |
| JAMES  | CHICAGO  |
| FORD   | DALLAS   |
| MILLER | NEW YORK |
+--------+----------+
14 rows in set (0.00 sec)

mysql> use world;
Database changed
mysql>
mysql> show tables;
+-----------------+
| Tables_in_world |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+
3 rows in set (0.02 sec)

mysql> desc country;
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | decimal(10,2)                                                                         | NO   |     | 0.00    |       |
| IndepYear      | smallint                                                                              | YES  |     | NULL    |       |
| Population     | int                                                                                   | NO   |     | 0       |       |
| LifeExpectancy | decimal(3,1)                                                                          | YES  |     | NULL    |       |
| GNP            | decimal(10,2)                                                                         | YES  |     | NULL    |       |
| GNPOld         | decimal(10,2)                                                                         | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int                                                                                   | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.01 sec)

mysql> desc countrylanguage;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| CountryCode | char(3)       | NO   | PRI |         |       |
| Language    | char(30)      | NO   | PRI |         |       |
| IsOfficial  | enum('T','F') | NO   |     | F       |       |
| Percentage  | decimal(4,1)  | NO   |     | 0.0     |       |
+-------------+---------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> select name,language from  country join countrylanguage on (code=countrycode) where name='india';
+-------+-----------+
| name  | language  |
+-------+-----------+
| India | Asami     |
| India | Bengali   |
| India | Gujarati  |
| India | Hindi     |
| India | Kannada   |
| India | Malajalam |
| India | Marathi   |
| India | Orija     |
| India | Punjabi   |
| India | Tamil     |
| India | Telugu    |
| India | Urdu      |
+-------+-----------+
12 rows in set (0.06 sec)

mysql> select c.name,cl.language from  country c inner join countrylanguage cl on (c.code=cl.countrycode) where c.name='india';
+-------+-----------+
| name  | language  |
+-------+-----------+
| India | Asami     |
| India | Bengali   |
| India | Gujarati  |
| India | Hindi     |
| India | Kannada   |
| India | Malajalam |
| India | Marathi   |
| India | Orija     |
| India | Punjabi   |
| India | Tamil     |
| India | Telugu    |
| India | Urdu      |
+-------+-----------+
12 rows in set (0.00 sec)

mysql> use scott;
Database changed
mysql> select * from emp;
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1980-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
14 rows in set (0.00 sec)

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.00 sec)

mysql> select dname,ename from emp e join dept on (e.deptno<>d.deptno);
ERROR 1054 (42S22): Unknown column 'd.deptno' in 'on clause'
mysql>
mysql>
mysql> select dname,ename from emp e join dept d on (e.deptno<>d.deptno);
+------------+--------+
| dname      | ename  |
+------------+--------+
| OPERATIONS | SMITH  |
| SALES      | SMITH  |
| ACCOUNTING | SMITH  |
| OPERATIONS | ALLEN  |
| RESEARCH   | ALLEN  |
| ACCOUNTING | ALLEN  |
| OPERATIONS | WARD   |
| RESEARCH   | WARD   |
| ACCOUNTING | WARD   |
| OPERATIONS | JONES  |
| SALES      | JONES  |
| ACCOUNTING | JONES  |
| OPERATIONS | MARTIN |
| RESEARCH   | MARTIN |
| ACCOUNTING | MARTIN |
| OPERATIONS | BLAKE  |
| RESEARCH   | BLAKE  |
| ACCOUNTING | BLAKE  |
| OPERATIONS | CLARK  |
| SALES      | CLARK  |
| RESEARCH   | CLARK  |
| OPERATIONS | SCOTT  |
| SALES      | SCOTT  |
| ACCOUNTING | SCOTT  |
| OPERATIONS | KING   |
| SALES      | KING   |
| RESEARCH   | KING   |
| OPERATIONS | TURNER |
| RESEARCH   | TURNER |
| ACCOUNTING | TURNER |
| OPERATIONS | ADAMS  |
| SALES      | ADAMS  |
| ACCOUNTING | ADAMS  |
| OPERATIONS | JAMES  |
| RESEARCH   | JAMES  |
| ACCOUNTING | JAMES  |
| OPERATIONS | FORD   |
| SALES      | FORD   |
| ACCOUNTING | FORD   |
| OPERATIONS | MILLER |
| SALES      | MILLER |
| RESEARCH   | MILLER |
+------------+--------+
42 rows in set (0.00 sec)

mysql> select dname,ename from emp e right outer join dept d on (e.deptno=d.deptno);
+------------+--------+
| dname      | ename  |
+------------+--------+
| ACCOUNTING | MILLER |
| ACCOUNTING | KING   |
| ACCOUNTING | CLARK  |
| RESEARCH   | FORD   |
| RESEARCH   | ADAMS  |
| RESEARCH   | SCOTT  |
| RESEARCH   | JONES  |
| RESEARCH   | SMITH  |
| SALES      | JAMES  |
| SALES      | TURNER |
| SALES      | BLAKE  |
| SALES      | MARTIN |
| SALES      | WARD   |
| SALES      | ALLEN  |
| OPERATIONS | NULL   |
+------------+--------+
15 rows in set (0.00 sec)

mysql> select dname,ename from emp e right join dept d on (e.deptno=d.deptno);
+------------+--------+
| dname      | ename  |
+------------+--------+
| ACCOUNTING | MILLER |
| ACCOUNTING | KING   |
| ACCOUNTING | CLARK  |
| RESEARCH   | FORD   |
| RESEARCH   | ADAMS  |
| RESEARCH   | SCOTT  |
| RESEARCH   | JONES  |
| RESEARCH   | SMITH  |
| SALES      | JAMES  |
| SALES      | TURNER |
| SALES      | BLAKE  |
| SALES      | MARTIN |
| SALES      | WARD   |
| SALES      | ALLEN  |
| OPERATIONS | NULL   |
+------------+--------+
15 rows in set (0.00 sec)

mysql> select dname,ename from emp e right join dept d on (e.deptno=d.deptno) where ename is null;
+------------+-------+
| dname      | ename |
+------------+-------+
| OPERATIONS | NULL  |
+------------+-------+
1 row in set (0.00 sec)

mysql> select dname,ename from emp e outer join dept d on (e.deptno=d.deptno);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'outer join dept d on (e.deptno=d.deptno)' at line 1
mysql>
mysql>
mysql> select dname,ename from emp e right outer join dept d on (e.deptno=d.deptno);
+------------+--------+
| dname      | ename  |
+------------+--------+
| ACCOUNTING | MILLER |
| ACCOUNTING | KING   |
| ACCOUNTING | CLARK  |
| RESEARCH   | FORD   |
| RESEARCH   | ADAMS  |
| RESEARCH   | SCOTT  |
| RESEARCH   | JONES  |
| RESEARCH   | SMITH  |
| SALES      | JAMES  |
| SALES      | TURNER |
| SALES      | BLAKE  |
| SALES      | MARTIN |
| SALES      | WARD   |
| SALES      | ALLEN  |
| OPERATIONS | NULL   |
+------------+--------+
15 rows in set (0.00 sec)

mysql> insert into emp(empno,ename) values (1,'Renu');
Query OK, 1 row affected (0.01 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1980-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
|     1 | Renu   | NULL      | NULL | NULL       | NULL | NULL |   NULL |
+-------+--------+-----------+------+------------+------+------+--------+
15 rows in set (0.00 sec)

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.00 sec)

mysql> select ename as name,dname from emp as e join dept as d on(e.deptno=d.deptno);
+--------+------------+
| name   | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
+--------+------------+
14 rows in set (0.00 sec)

mysql> select ename as name,dname from emp as e left outer join dept as d on(e.deptno=d.deptno);
+--------+------------+
| name   | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
| Renu   | NULL       |
+--------+------------+
15 rows in set (0.00 sec)

mysql> select ename as name,dname from emp as e left join dept as d on(e.deptno=d.deptno);
+--------+------------+
| name   | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
| Renu   | NULL       |
+--------+------------+
15 rows in set (0.00 sec)

mysql> select ename as name,dname from dept as d right join emp as e on(e.deptno=d.deptno);
+--------+------------+
| name   | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
| Renu   | NULL       |
+--------+------------+
15 rows in set (0.00 sec)

mysql>
*/






#alter user 'root'@'localhost' identified by 'root';

use world;
select name,language from  country inner join countrylanguage on (code=countrycode)
 where name='india';


use hr;
desc employees;