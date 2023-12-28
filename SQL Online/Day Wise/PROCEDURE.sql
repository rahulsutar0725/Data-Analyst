CREATE DEFINER=`root`@`localhost` PROCEDURE `emp_details`()
BEGIN
declare v_sal int;
declare v_name char(12);
select ename,sal into v_name,v_sal from emp ;
if v_sal>4000 then
select concat(v_name," has a good salary") as status;
elseif v_sal is null then 
select concat("invalid empid,please try with valid one") as mgs;
else 
select concat(v_name," has a bad salary") as status;
end if;
END



