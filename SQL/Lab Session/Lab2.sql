CREATE DATABASE ExcelR;
use ExcelR;
CREATE TABLE Employee(
	Emp_ID INT,
    Emp_Name VARCHAR(100),
    Age INT,
    Company VARCHAR(100),
    DOJ DATE
);
INSERT INTO Employee
values
	(1, "A", 26, "TCS", "2020-05-17"),
    (2, "B", 33, "Infosys", "2010-02-13"),
    (3, "C", 35, "IBM", "2015-08-26");

select * from Employee;