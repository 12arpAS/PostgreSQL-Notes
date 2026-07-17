CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    Experience INT
);
INSERT INTO Employees VALUES
(101, 'Amit', 'HR', 45000, 2),
(102, 'Neha', 'HR', 60000, 5),
(103, 'Rahul', 'HR', 55000, 3),
(104, 'Raj', 'IT', 70000, 6),
(105, 'Simran', 'IT', 85000, 8),
(106, 'Rohit', 'IT', 70000, 4),
(107, 'Anjali', 'Finance', 50000, 3),
(108, 'Karan', 'Finance', 65000, 5),
(109, 'Priya', 'Finance', 80000, 7),
(110, 'Vikas', 'Sales', 55000, 4),
(111, 'Sneha', 'Sales', 60000, 5),
(112, 'Arjun', 'Sales', 75000, 6);
select * from Employees;

--Display each employee's Name, Salary, and assign a row number based on salary from highest to lowest.
select name,salary,ROW_NUMBER()
OVER(Order by Salary desc)as Total
from Employees;

--Display each employee's Name, Department, and a
--assign row numbers separately for each department based on salary from highest to lowest
select name,department,ROW_NUMBER()
OVER(Partition BY department Order by salary desc)as Total
from Employees;

--Display each employee's Name, Salary, and the average salary of their department.
select name,department,salary,AVG(salary)
OVER(Partition by Department)as Total
from Employees;

--Display each employee's Name, Salary, and the total salary of all employees.
select name,salary,SUM(Salary)
OVER()as Total from Employees;

--Display each employee's Name, Department, Salary, and the highest salary in their department.
select name,department,Salary,MAX(Salary)
OVER(Partition by Department)as Total from Employees; 

--Display each employee's Name, Department, Salary, and the lowest salary in their department.
select name,Salary,department,MIN(Salary)
OVER(Partition by Department)as Total from Employees;

--Display each employee's Name, Department, and the total number of employees in their department.
select name,department,COUNT(*)
OVER(Partition by Department)as Totals FROM Employees;

--Rank employees within each department based on salary (highest salary gets Rank 1).
select name,Department,RANK()
OVER(Partition by Department order by Salary desc)as total
FROM Employees;

--Display the dense rank of employees within each department based on salary (highest salary gets Rank 1).
select name,Department ,DENSE_RANK()
OVER(Partition by Department order by Salary desc) as total
from Employees;

--Display each employee's Name, Salary, and the running total of salaries ordered from the lowest salary to the highest salary.
select name,Salary,SUM(Salary)
OVER(Order by Salary asc)as Total
From Employees;















