select substr('Renu Nair',1,2) as name;
select substr('Renu Nair',2,3) as name;#enu
select substr('Renu Nair',7,3);#air 
select substr('Renu Nair',9,1);#r
select substr('Renu Nair',-1,1);
select substr('Renu Nair',-3,2);#ai
select substr('Renu Nair',1) as name;
select right('renu',1);
select right('renu',2);
select left('renu',1);
select left('renu',3);
use scott;
select concat(ename,sal,hiredate) as report from emp;
select concat('renu',null);
#renu |RENU -->Renu -->
select upper(left('renu',1)),lower(right('renu',length('renu')-1));
select ucase(left('renu',1)),lcase(substr('renu',2));#
select instr('canada','a') ;#find the value a -->4
select instr ('renu','e'); -- 2
select instr('renu','h') ;-- 0
select replace('renu','r','z');
select replace('renu','r','l');
select reverse('renu');
select length('   hello   ') ;#11
select trim('   hello   ');
select length(ltrim('   hello   '));
select rtrim('   hello   ');

#display those employees whos name start with a (without using like)

select ename from emp where left(ename,1)='a';

select ename from emp where right(ename,1)='a';
  
select ename from emp where instr(ename,'a')<>0; 

/*ht:
 1)display the name of that employee whos name end with s (use only instr)
 2)display the data of that employees whos name start  with a and end with n (using substr) 
 */
  
select ename,job,sal from emp where job=(select job from emp where ename='smith')
 and  sal>(select sal from emp where ename='smith')
 order by sal asc
 limit 1;
 
 select case 
 when hiredate=(select min(hiredate) from emp) then concat(ename,"*")
 else ename
 end as report
 from emp ;
 
 ################################################################################
select now();
select current_date();
select current_time();
select month(current_date());#no value for month
select monthname(current_date());#name of month
select year(current_date());  
select dayname(current_date());
select day(current_date());
select ename,hiredate from emp where month(hiredate)=12;
select date_add(now(),interval '1' month) ;
select date_add(now(),interval '1' year) ;
select date_add(now(),interval '1' day) ;
select now(),date_add(now(),interval '1' minute) ;
select now(),date_add(now(),interval '3' hour) ;
select date_sub(now(),interval '1' month) ;

insert into emp(empno,ename,hiredate) values (10,'alex',str_to_date('12-dec-2021','%d-%b-%Y'));#yyyy-mm-dd |dd-mon-yyyy
select * from emp;
select date_format(now(),'%m');#number value for month
select date_format(now(),'%M');#spelled month name
select date_format(now(),'%y');#
select date_format(now(),'%Y');#4 digits of year
select date_format(now(),'%d');
select date_format(now(),'%D');
select date_format(now(),'%b');# 3 letters for month
select date_format(now(),'%a');#3 letters for weekday name
select date_format(now(),'%W');
select date_format(now(),'%w');
select date_format(hiredate,'%d-%m-%Y') ,hiredate from emp;