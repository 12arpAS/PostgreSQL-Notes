CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT,
    Experience INT,
    DepartmentID INT
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Marketing');
INSERT INTO Employees VALUES
(101, 'Amit', 50000, 3, 1),
(102, 'Rahul', 65000, 5, 2),
(103, 'Priya', 45000, 2, 3),
(104, 'Neha', 70000, 6, 2),
(105, 'Rohit', 55000, 4, 1),
(106, 'Simran', 80000, 7, 3),
(107, 'Karan', 40000, 1, 4),
(108, 'Anjali', 60000, 5, 4);
select * from Employees;
select * from Departments;

--Display employees whose salary is greater than the average salary of all employees.
select name,salary from Employees
where salary>(select Avg(salary) from Employees);

--Display employees whose salary is less than the average salary.
select name,salary from Employees
where salary<(select AVG(salary)from Employees);

--Display the employee(s) who earn the highest salary.
select name,salary from Employees
where salary=(select MAX(salary)from Employees);

--Display the employee(s) who earn the lowest salary.
select name,salary from Employees where
salary=(select MIN(salary)from Employees);

--Display employees whose experience is greater than the average experience.
select name,experience from Employees where Experience>
(select AVG(Experience)from Employees);

--Display employees who work in the Sales department.
select name from Employees where
DepartmentID=(select DepartmentID from Departments where DepartmentName='Sales');

--Display employees who work in the IT department
select name from Employees where 
DepartmentID=(select DepartmentID from Departments where DepartmentName='IT');

--Display employees who work in the HR department.
select name from Employees where DepartmentID=
(select DepartmentID from Departments where DepartmentName='HR');

--Display employees whose salary is greater than Rohit's salary.
select name from Employees where salary>
(select salary from Employees where EmployeeID=105);

--Display employees whose salary is less than Neha's salary.
select name from Employees where salary<
(select salary from Employees where EmployeeID=104);

--Display employees who work in the same department as Amit.
select name from Employees where DepartmentID=
(select DepartmentID from Employees where name='Amit');

--Display employees who work in the same department as Simran.
select name from Employees where DepartmentID=
(select DepartmentID from Employees where name ='Simran');

--Display employees whose DepartmentID is equal to the highest DepartmentID.
select name,DepartmentID from Employees where DepartmentID=
(select MAX(DepartmentID) from Employees);

--Display the employee(s) who earn the second-highest salary.
select name,salary from Employees
where salary=
(select MAX(salary)from Employees
where salary<(select MAX(salary)from Employees));

--Display employees whose salary is equal to the average salary.
select name from Employees where salary=
(select AVG(salary)from Employees);

--Display employees whose experience is greater than Rahul's experience.
select name from Employees where Experience>
(select Experience from Employees where name ='Rahul');

--Display employees whose salary is greater than the salary of the employee with EmployeeID = 103.
select name from Employees where salary>
(select salary from Employees where EmployeeID=103);

--Display employees working in the department named Marketing.
select name from Employees where DepartmentID=
(select DepartmentID from Departments where DepartmentName='Marketing');

--Display employees whose salary is greater than the minimum salary.
select name from Employees where salary>
(select MIN(salary) from Employees);

--Display employees whose salary is greater than the average salary and who work in the department named IT.(MVIP)
select name from Employees where salary>
(select AVG(salary) from Employees)AND DepartmentID=
(select DepartmentID from Departments where DepartmentName='IT');


--Third Highest Salary
select name from Employees where salary=
(select MAX(salary)from Employees where salary <
(select MAX(salary)from Employees where salary <
(select MAX(salary)from Employees)));
















