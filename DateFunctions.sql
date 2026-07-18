/* (1)- Current_date
It is used to display the current date of the system.
SELECT CURRENT_DATE;

(2)- Current_Timestamp
It is used to display the current date and time of the system.
SELECT CURRENT_TIMESTAMP;

(3)-EXTRACT(YEAR FROM date)
It is used to get year from a complete date
SELECT EXTRACT(YEAR FROM JoiningDate)
FROM Employees;

(4)- EXTRACT(MONTH FROM date)
It is used to get month from a complete date
SELECT EXTRACT(MONTH FROM JoiningDate)
FROM Employees;

(5)-EXTRACT(DAY FROM date)
It is used to get day from a complete date
SELECT EXTRACT(DAY FROM JoiningDate)
FROM Employees;

(6)-AGE()
It is used to find the difference between two dates
SELECT AGE(CURRENT_DATE,'2022-01-10');

(7)DATEADD()
Add Days/Months/Years to a date
date_column + INTERVAL 'number unit'

Add 1 year=	JoiningDate+ INTERVAL '1 year'
Add 6 months=	JoiningDate+ INTERVAL '6 months'
Add 15 days=	JoiningDate+ INTERVAL '15 days'
*/
--------------------------------------------------------------------------------------------------------------
CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    JoiningDate DATE
);
INSERT INTO Employees VALUES
(101,'Amit','IT',60000,'2022-01-10'),
(102,'Rahul','HR',45000,'2021-03-15'),
(103,'Priya','Finance',70000,'2020-07-20'),
(104,'Neha','IT',55000,'2023-05-18'),
(105,'Karan','Sales',40000,'2024-02-25'),
(106,'Riya','Finance',80000,'2022-11-08'),
(107,'Vikas','Marketing',52000,'2025-01-30'),
(108,'Sneha','HR',48000,'2021-09-12'),
(109,'Arjun','IT',75000,'2020-12-05'),
(110,'Pooja','Sales',65000,'2023-08-21');
select * from Employees;

--Display the names of employees who joined in 2022.
select name from Employees
Where Extract(Year From JoiningDate)=2022;

--Display the names of employees who joined in the month of March.
select name from Employees
where Extract(Month from JoiningDate)=3;

--Display the names of employees who joined on the 10th day of any month.
select name from Employees
where Extract(day from JoiningDate)=10;

--Display the current date
select current_date;

--Display the current date and time.
select current_timestamp;

--Display each employee's name and years of experience.
select name, AGE(current_date,JoiningDate)as experience
from Employees;

--Display each employee's name and years of experience in years
select name,Extract(Year from AGE(current_date,JoiningDate))as experience from Employees;

--Display each employee's name and their joining date after adding 1 year.
select name,JoiningDate+Interval '1 year' as Total from Employees;

--Display each employee's name and their joining date after adding 6 months.
select name,JoiningDate+Interval '6 Months'as Total From Employees;

--Display the names of employees who joined before the current date.
select name from Employees
where JoiningDate<current_date;

--Display each employee's name and their joining date after adding 15 days.
select name,JoiningDate+Interval '15 days' AS Total from Employees;











































