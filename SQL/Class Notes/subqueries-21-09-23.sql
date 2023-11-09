# Subquery
/*
-- A query nested within another query or subquery
-- Must be enclosed in parenthesis
-- Inner query: Subquery 	Outer query: Containing query
*/

# Independent Subqueries: 
/*
- executed as standlone subquery.
- inner query is executed first and then outer query
*/

# with WHERE Clause
-- > MySQL subquery with comparison operators
-- 		1.The customer who has the highest payment.
-- > MySQL subquery with IN and NOT IN operators
-- 		2. Find the customers who have not placed any orders as follows
# with FROM clause
-- 		4. Find top 3 paid employees from every department
--      5. Find top 3 selling products from each productline

# Coorelated Subqueries: 
/*
-  A correlated subquery is a subquery that uses the data from the outer query.
-  A correlated subquery is evaluated once for each row in the outer query.
*/
-- 		6. Select products whose buy prices are greater than the average buy price of all products in each product line.
-- 		7. find customers who placed at least one sales order with the total value greater than 60K.










