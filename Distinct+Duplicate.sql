CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Email VARCHAR(50)
);
INSERT INTO Employees VALUES
(101,'Amit Kumar','IT','Delhi','amit@gmail.com'),
(102,'Rahul Sharma','HR','Mumbai','rahul@yahoo.com'),
(103,'Priya Singh','Finance','Pune','priya@gmail.com'),
(104,'Neha Verma','IT','Delhi','neha@outlook.com'),
(105,'Karan Patel','Sales','Ahmedabad','karan@gmail.com'),
(106,'Riya Gupta','Finance','Lucknow','riya@yahoo.com'),
(107,'Vikas Yadav','Marketing','Chennai','vikas@gmail.com'),
(108,'Sneha Joshi','HR','Jaipur','sneha@hotmail.com'),
(109,'Arjun Mehta','IT','Delhi','arjun@gmail.com'),
(110,'Pooja Sharma','Sales','Mumbai','pooja@yahoo.com');
select * from Employees;

--Display all unique departments.
select distinct(department)from Employees;

--Display all unique cities.
select distinct(city)from Employees;

--Display all unique combinations of Department and City.
select distinct department,city from Employees;

--Display the number of unique departments in the company.
select count(distinct department)from Employees;

--Find Duplicate Departments
select department,count(*)as Total
from Employees Group by department
Having count(*)>1;

--Find Departments That Are Not Duplicated
select department,count(*)as Total from Employees
Group by department Having count(*)=1;

--Find Duplicate Cities
select city,count(*)as city from Employees
Group by city Having count(*)>1;
