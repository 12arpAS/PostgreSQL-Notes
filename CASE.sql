--The CASE expression in SQL is used to apply conditional logic inside a query. It works like an if-else statement in programming languages.
--There are two types of CASE expressions:
--1. Simple CASE Expression
--Compares one expression against multiple values.
--EXample->  SELECT Name,
       DepartmentID,
       CASE DepartmentID
           WHEN 101 THEN 'HR'
           WHEN 102 THEN 'IT'
           WHEN 103 THEN 'Sales'
           ELSE 'Unknown'
       END AS Department
FROM Employees;

--2-Searched CASE Expression
--Checks multiple conditions using comparison operators.
--Example-> SELECT Name,
       Salary,
       CASE
           WHEN Salary >= 70000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Category
FROM Employees;

-------------------------------------------------------------------------------------------------
CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(30),
    Experience INT
);
INSERT INTO Employees VALUES
(101,'John','HR',65000,'Delhi',5),
(102,'Alex','IT',45000,'Mumbai',2),
(103,'Mike','Sales',80000,'Delhi',8),
(104,'Sara','Finance',55000,'Pune',4),
(105,'David','IT',72000,'Chennai',6),
(106,'Emma','HR',38000,'Delhi',1),
(107,'Chris','Sales',90000,'Mumbai',10),
(108,'Sophia','Finance',48000,'Pune',3),
(109,'Daniel','IT',62000,'Delhi',5),
(110,'Olivia','Marketing',35000,'Jaipur',1);
select * from Employees;

--Display Name, Salary, and a new column Salary_Category.
--Rules:
--Salary ≥ 70000 → High
--Salary between 50000 and 69999 → Medium
--Otherwise → Low

select name,Salary,
CASE
  WHEN Salary>=70000 THEN 'HIGH'
  WHEN Salary Between 50000 AND 69999 THEN 'Medium'
ELSE 'Low'
END AS Salary_Category
FROM Employees;

--Display Name, Experience, and a new column Employee_Level.
--Rules:
--Experience ≥ 8 → Senior
--Experience between 4 and 7 → Mid Level
--Otherwise → Fresher

select name,Experience,
CASE
  WHEN Experience>=8 THEN 'Senior'
  WHEN Experience Between 4 AND 7 THEN 'Mid Level'
ELSE 'Fresher'
END AS Employee_Level
FROM Employees;

--Display Name, Department, and a new column Bonus.
--Rules:
--IT → 10000
--HR → 7000
--Finance → 8000
--Sales → 12000
--Others → 5000

select name,Department,
CASE 
  WHEN Department='IT' THEN 10000
  WHEN Department='HR' THEN 7000
  WHEN Department='Finance' THEN 8000
  WHEN Department='Sales' THEN 12000
ELSE 5000
END AS Bonus
FROM Employees;




















