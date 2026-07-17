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

--Display each employee's Name, Salary, and the previous employee's salary.
select name,Salary,LAG(Salary)
OVER(order by Salary)as Previous from Employees;

--Display each employee's Name, Department, Salary, and the previous salary within the same department.
select name,Department,Salary,LAG(salary)
OVER(Partition BY Department Order by Salary)as Prevoius 
FROM Employees;

--Display each employee's Name, Department, Salary, and the previous employee's name within the same department.
select name,Department,Salary,LAG(name)
OVER(Partition by Department order by Salary)as Previous
FROM Employees;

--Display each employee's Name, Department, Salary, and the previous department salary ordered from highest to lowest.
select name,Department,Salary,LAG(Salary)
OVER(Partition by Department order by Salary desc)as Previous
From Employees;

--Display each employee's Name, Department, Salary, and the highest salary in their department using FIRST_VALUE().
select name,Department,Salary,FIRST_VALUE(Salary)
OVER(Partition by Department Order by Salary desc)as T 
From Employees;

--Display each employee's Name, Department, Salary, and the lowest salary in their department using FIRST_VALUE().
select name,Department,Salary,FIRST_VALUE(Salary)
OVER(Partition by Department Order by Salary asc)as p 
from Employees;

--Display each employee's Name, Department, Salary, and the highest salary in their department using LAST_VALUE().
select name,Department,Salary,LAST_VALUE(Salary)
OVER(Partition by Department Order by Salary asc
ROWS Between Unbounded Preceding AND Unbounded Following)as r 
FROM Employees;

--Display each employee's Name, Department, Salary, and the lowest salary in their department using LAST_VALUE().
select name,Department,Salary,LAST_VALUE(Salary)
OVER(Partition by Department Order by Salary desc
ROWS Between Unbounded Preceding AND Unbounded Following)as f 
FROM Employees;

--Display each employee's Name, Department, Salary, and the name of the highest-paid employee in their department using FIRST_VALUE().
select name,Department,Salary,FIRST_VALUE(name)
OVER(Partition by Department Order by Salary desc)as d 
FROM Employees;







