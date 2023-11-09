SHOW DATABASES;

-- SQL  is case insensetive

show databases;
Show Databases;

-- SQL is space insensetive

SHOW


DATABASES;

-- within a server no two databases can have same name
-- within a database no two tables can have same name
-- within a table no two columns can have same name


-- SQL commands are terminated by semincolon(;)

-- comments in mysql

-- single line comment
# single line comment

/*
	multiline
    comment
*/

-- single line comment
SHOW DATABASES; -- single line comment
-- single line comment

-- creating a database in SQL

CREATE DATABASE day2;   -- (ctrl+enter)

-- select database
USE day2; -- electing the database

CREATE TABLE products(
	product_id INT,
    product_name VARCHAR(20),
    price DECIMAL(7,2),
    release_date DATE
);

USE day2; -- selecting the database

INSERT INTO products values(1,'T-shirt',5.00,'2023-05-01'); -- inserting record into the table
INSERT INTO products values(2,'BookShelf',19.34,'2023-05-02');

SELECT * FROM products; -- fetch/display all the data from the table specified

CREATE TABLE websiteVisits(
	visitor_id INT,
    visitor_name varchar(25),
    visited_page varchar(30),
    visit_time datetime
);

INSERT INTO websiteVisits values (1, 'ABC', 'HomePage',now());
INSERT INTO websiteVisits values (2, 'PQR', 'ProductPage',now());

select * from websiteVisits;
