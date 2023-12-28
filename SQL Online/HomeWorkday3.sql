/*home work
sample

sid        name        loc
1		  'rahul'      locA
2         'rohit'      loc a
3         'rohan'      loc d

delete all the rows from the name column

*/

create database homeworkday3;
use homeworkday3;
create table sample (sid int, name varchar(20), loc varchar(30));
describe sample;
insert into sample (sid,name,loc) values(1,'Rahul','locA');
insert into sample values(2,'Rohit','loc a'),(3,'Rohan','loc d');
select * from sample;

update sample set name=null;
select * from sample;
