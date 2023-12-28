show tables;
use hr;
 select first_name,city 
 from employees e inner join departments d on (e.department_id=d.department_id) 
right outer join locations l on (l.location_id=d.location_id) where first_name is null;


SELECT COLUMN FROM TABLE1 JOIN TABLE2 ON () JOIN TABLE3 ON ();