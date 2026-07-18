/*UPPER()
✅ LOWER()
✅ LENGTH()
✅ SUBSTRING()
✅ CONCAT()
✅ LEFT()
✅ RIGHT()
✅ REPLACE()
✅ POSITION()
*/
-----------------------------------------------------------------------

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

--Display the employee names in uppercase.
select name,upper(name)from Employees;

--Display the employee names in lowercase.
select name,lower(name)from Employees;

--Display the employee name along with the length of the name.
select name,length(name)from Employees;

--Display the first 5 characters of each employee's name.
select name,substring(name from 1 for 5)from Employees;

--Display the employee name and department in a single column in the format:
select name,department,concat(name,'-',department)from Employees;

--Display the last 4 characters of each employee's name.
select name,right(name,4)from Employees;

--Display the first 3 characters of each employee's city.
select name,left(name,3)from Employees;

--Replace the word "IT" with "Information Technology" in the Department column.
select department, Replace(Department,'IT','Information Technology')from Employees;

--Display the position of the first space in each employee's name.
select name,position(' ' in name)from Employees;

--Display the first name of every employee.
SELECT Name,
       SUBSTRING(Name FROM 1 FOR POSITION(' ' IN Name)-1) AS FirstName
FROM Employees;

--Reverse Name
select reverse(name)from Employees;
