#19-07-2023
select substr('Rahul Sutar',1,2) as name; #Ra
select substr('Rahul Sutar',2,3) as name; #ahu
select substr('Rahul Sutar',7,3); #Sut
select substr('Rahul Sutar',11,1); #r
select substr('Rahul Sutar',-1,1); #r
select substr('Rahul Sutar',-3,2); #ta
select substr('Rahul Sutar',1) as name;
select right('Rahul',1);
select right('Rahul',2);
select left('Rahul',1);
select left('Rahul',3);
use scott;
select concat(ename,sal,hiredate) as report from emp;
select concat('renu',null);
#renu | RENU --> Renu --> 

select upper(left('renu',1)),lower(right('renu',length('renu')-1));
select ucase(left('renu',1)),lcase(substr('renu',2));
select concat(upper(left('rahul',1)),lower(right('rahul',length('rahul')-1))) as name;

select instr('canada','a'); #oracle
select replace('renu','r','z');
select replace('renu','r','l');
select reverse('renu');
select length('    hello     '); #all
select trim('    hello      ');
select length(ltrim('      hello      '));
select rtrim('      hello     ');

#display those employees whos name start with a (witout using like)
select ename from emp where left(ename,1)='a';

#display those employees whos name ends with a (witout using like)
select ename from emp where right(ename,1)='a';

select ename from emp where instr(ename,'a')<>0;

/*
ht:
1) display the name of that employee whos name end with a(use only instr)
2) display the data of that employees whos name start with a and end with n (using substr)
*/

####################################################################################################
select now();
select current_date();
select current_time();
select month(current_date()); #no value for month
select monthname(current_date()); #name of month
select year(current_date());
select dayname(current_date());
select day(current_date());
select ename,hiredate from emp where month(hiredate)=12;
select date_add(now(),interval '1' month);
select date_add(now(),interval '1' year);
select now(),date_add(now(),interval '1' day);
select now(),date_add(now(),interval '1' minute);
select now(),date_add(now(),interval '3' hour);
select date_sub(now(),interval '1' month);

insert into emp(empno,ename,hiredate) values(10,'alex',str_to_date('12-dec-2021','%d-%b-%Y'));#yyyy-mm-dd  |dd-mon-yyyy
select * from emp;
select date_format(now(),'%m'); # number value for month
select date_format(now(),'%M'); # spelled month name
select date_format(now(),'%y'); # 
select date_format(now(),'%Y'); # 4 digits of year
select date_format(now(),'%d');
select date_format(now(),'%D');
select date_format(now(),'%b'); # 3 letters for month
select date_format(now(),'%a'); # 3 letters for weekday name
select date_format(now(),'%W');
select date_format(now(),'%w');

