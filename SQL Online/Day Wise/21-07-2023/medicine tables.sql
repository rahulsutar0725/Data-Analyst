use scott;
create table medicines (med_id int,name char(22),qty int);
insert into medicines values (101,'CROSIN',100);
insert into medicines values (102,'DOLO 650',100);
create table orders (med_id int,order_date datetime);

desc medicines;
desc orders;
select * from medicines ;
select * from orders;



use scott;
create table customers (cust_id int,cust_name char(12),city char(12));
insert into customers values (101,'King','Boston');
insert into customers values (102,'Alex','seattle');
insert into customers values (103,'Ben','Boston');
insert into customers values (102,'Alex','seattle');
select * from customers;
#name of that city from were we have two different customers.NO

#############################################################################################################
