CREATE DEFINER=`root`@`localhost` PROCEDURE `stock_ck`()
BEGIN
declare v_med_id,v_qty int;
declare mycur cursor for select med_id,qty from medicines;
declare exit handler for not found
select 'stock checked' as report;
open mycur;
myloop:loop
fetch mycur into v_med_id,v_qty;
if v_qty<20 then
insert into orders values (v_med_id,now());
end if;
end loop;
close mycur;
END