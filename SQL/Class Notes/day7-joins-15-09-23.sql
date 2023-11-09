# Joins: Retrieve data from two more more table

-- Steps:
-- 1. Specify the joining tables in the FROM Clause, and JOIN type -
-- 2. Specify the JOIN condition - common column / conditional expression
-- 3. Filter rows/ Specify columns/ Order the rows/ LIMIT the resulting rows. 
-- ----------------------------------------------------------------------------------
# Types of Joins
-- 1. Inner Join: Returns records that have matching values in both tables
-- 2. Left Outer Join/ Left Join: Returns all records from the left table, and the matched records from the right table
-- 3. Right Outer Join/ Right Join: Returns all records from the right table, and the matched records from the left table
-- 4. Full Outer join: returns all records from both the tables matching or not
-- 5. Cross Join: multiplies/ matches every record from left table to every record from right table
-- 6. Self Join:

/**/
-- 1. Query Customers whose orders are Disputed or On Hold.
select 
		c.customerNumber,
        c.customerName,
        o.orderNumber,
        o.status
from customers c inner join orders o on c.customerNumber = o.customerNumber
where o.status in ('Disputed','On Hold');


select * from customers;
-- 2. Calculate the total quantity sold and the revenue generated for each product.
SELECT 
		d.productCode,
        SUM(d.quantityOrdered) AS total_quantity_sold,
        SUM(d.quantityOrdered * d.priceEach) AS total_revenue
FROM orderdetails d
group by d.productcode;

select * from products;
select * from orderdetails;
-- 3. Write a query that returns total payment done each customer with their sales employee, 
--    returns NULL if the customer has no payment.
SELECT 
		c.customerNumber,
        sum(p.amount) as `Total Payment`
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY customerNumber;

-- 4. Query Country names and their respective average sales amount truncated to 2 decimal places

# Self Join
-- 5. Retrieve all employees and their respective managers, if any.
-- 6. Find names and salaries of employees who earn more than their managers

# HomeWork
-- 1. Retrieve the top 5 customers who made the highest total purchases from the orders table.
-- 2. Display the list of customers with no orders placed.

# Home Work Views
-- 1. write a query to list the employees (employeeNumber, employeeName) along with their work location (state, city)
-- 2. Write a query to get total orders of each productline for year and quarter











