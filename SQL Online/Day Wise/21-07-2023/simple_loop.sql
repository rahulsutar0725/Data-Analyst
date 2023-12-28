declare cnt int default 0;
myloop:loop
set cnt=cnt+1;
select concat("hello",cnt) as msg; 
if cnt=3 then 
leave myloop;
end if;call scott.simple_loop();
