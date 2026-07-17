CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(30),
    Salary INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Sales'),
(4,'Marketing'),
(5,'Finance');
INSERT INTO Employees VALUES
(101,'Arpit',50000,1),
(102,'Rahul',65000,2),
(103,'Amit',45000,1),
(104,'Priya',70000,2),
(105,'Neha',55000,3),
(106,'Rohan',80000,2),
(107,'Sneha',48000,4),
(108,'Karan',60000,3),
(109,'Anjali',52000,4);
select * from Employees;
select * from Departments;

--Display the names of employees working in HR or IT.
select name from Employees where DepartmentID IN 
(select DepartmentID from Departments where DepartmentName IN('HR','IT'));

--Display employees not working in Sales or Marketing.
select name from Employees where DepartmentID NOT IN 
(select DepartmentID from Departments where DepartmentName NOT IN('Sales','Marketing'));

--Display employees working in Finance or HR.
select name from Employees where DepartmentID IN 
(select DepartmentID from Departments where DepartmentName IN('Finance','HR'));

--Display employees whose salary is greater than ANY salary of HR employees.
select name,salary from Employees where salary > ANY
(select salary from Employees where DepartmentID=1 );

--Display employees whose salary is greater than ALL salaries of Sales employees
select name,salary from Employees where salary> ALL
(select salary from Employees where DepartmentID=3);

--Display employee names working in departments whose name starts with 'M'
select name from Employees where DepartmentID IN
(select DepartmentID from Departments where DepartmentName 
LIKE 'M%');

--
--Display employee names working in departments whose name ends with 'M'
select name from Employees where DepartmentID IN 
(select DepartmentID from Departments where DepartmentName LIKE '%M');























