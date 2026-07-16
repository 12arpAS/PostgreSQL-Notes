--#1- Creating a Table
------------------------------------------------
Create table Employee(
  Emp_ID Int Primary Key,
  Emp_Name Varchar(50) Not NULL,
  Emp_Salary Numeric Not NULL,
  Emp_Email Varchar(100) Unique
);

--#2- Inserting data into Table
-------------------------------------------------
Insert into Employee(Emp_ID, Emp_Name, Emp_Salary, Emp_Email)
Values(1,'Arpit',82000,'ak82123@gamil.com'),
      (2,'Akash',75000,'akash123@gmail.com'),
      (3,'Pramod',90000,'pkp123@gmail.com');

--#3- Retrive Data Informatio
-------------------------------------------------
Select * from Employee;

--#4- Update Command in Table
--------------------------------------------------
Update Employee Set Emp_Name='Priyanka'
where Emp_ID=2;

Update Employee Set Emp_Salary=1000000
where Emp_Name='Pramod';

--#5- Delete Command in Table
----------------------------------------------------
Delete from Employee where Emp_ID=3;
Delete from Employee where Emp_Name='Arpit';

--#6- Alter Commands in Table
----------------------------------------------------
ALTER TABLE Employee  -- Add columns
ADD COLUMN Age INT;

ALTER TABLE Employee -- Drop Columns
DROP COLUMN Age;

ALTER TABLE Employee -- Change datatype of columns
ALTER COLUMN Age TYPE VARCHAR(100);

ALTER TABLE Employee -- Rename Column names
RENAME COLUMN Age TO Email;

--#7- Foreign Key Creation
-----------------------------------------------------
create table student(      --Parent Table
  st_id int primary key,
  st_name varchar(50),
  st_age int Not Null
);

create table School(       --Child Table
  sch_id int primary key,
  sch_name varchar(100),
  st_id int,
  foreign key(st_id) references student(st_id)
);

--#8- Insert data into Foreign Key Table
------------------------------------------------------
create table student(  -- Parent Table
  st_id int primary key,
  st_name varchar(50),
  st_age int Not Null
);

create table School(  --Child Table
  sch_id int primary key,
  sch_name varchar(100),
  st_id int,
  foreign key(st_id) references student(st_id)
);

Insert into student(st_id,st_name,st_age)  --Parent table datas
values(1,'A',20),
      (2,'B',25),
      (3,'C',18);

Insert into School(sch_id,sch_name,st_id)  --Child table datas
values(101,'abc',1),
      (102,'pkp',2),
      (103,'sjs',3);

select * from student;

select * from School;

--Notes- Every record of foreign key column from child table must be present into the Parent table.
--Notes- Every record of Parent table can be or not present in child table on for that column on which foreign key applied.

--#9- SQL Practice Questions on Where Clause Easy Level
----------------------------------------------------------------------
CREATE TABLE Student_Info (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10),
    Course VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Student_Info
(Student_ID, Student_Name, Age, Gender, Course, City, Email)
VALUES
(101, 'Arpit', 20, 'Male', 'B.Tech CSE', 'Maharajganj', 'arpit@gmail.com'),
(102, 'Akash', 21, 'Male', 'B.Tech IT', 'Lucknow', 'akash@gmail.com'),
(103, 'Priyanka', 19, 'Female', 'BCA', 'Kanpur', 'priyanka@gmail.com'),
(104, 'Rahul', 22, 'Male', 'B.Tech CSE', 'Noida', 'rahul@gmail.com'),
(105, 'Neha', 20, 'Female', 'B.Sc', 'Delhi', 'neha@gmail.com');

- Display all records
SELECT * FROM Student_Info;

--Display all details of the student whose Student_ID is 101.
select * from Student_Info where Student_ID=101;

--Display the details of the student whose name is 'Rahul'.
select * from Student_Info where Student_Name='Rahul';

--Display all students whose Age is 20.
select * from Student_Info where Age=20;

--Display all Female students.
select * from Student_Info where Gender='Female';

--Display all students who belong to B.Tech CSE.
select * from Student_Info where Course='B.Tech CSE';

---- Write your query here
select * from Student_Info where City='Delhi';

---- Display the Student_Name and Course of the student whose Student_ID is 103.
Select Student_Name,Course from Student_Info where Student_ID=103;

--Display the details of the student whose Email is 'akash@gmail.com'.
Select * from Student_Info where Email='akash@gmail.com';

--Display all students whose Age is greater than 20.
Select * from Student_Info where Age>20;

--Display all students whose Age is less than or equal to 20.
select * from Student_Info where age<=20;

--#10- SQL Practice Questions of AND,OR,IN,BETWEEN,LIKE,NOT,IS NULL
--------------------------------------------------------------------------------
--Display all Male students whose Age is greater than 20.
select * from Student_Info where Gender='Male' and Age>20;

--Display students who are studying B.Tech CSE and belong to Maharajganj.
select * from Student_Info where Course='B.Tech CSE' and City='Maharajganj';

--Display students whose City is Delhi OR Lucknow.
select * from Student_Info where City='Delhi' or City='Lucknow';

--Display students whose Age is 19 OR 22.
select * from Student_Info where Age=19 OR Age=22;

--Display students whose City is Kanpur, Delhi, or Noida.
select * from Student_Info where City IN('Kanpur','Delhi','Noida');

--Display students whose Age is between 20 and 22.
select * from Student_Info where Age between 20 and 22;

--Display students whose name starts with 'A'.
select * from Student_Info where Student_Name LIKE 'A%';

--Display students whose email ends with 'gmail.com'.
select * from Student_Info where Email LIKE '%gmail.com';

--Display students whose Course is NOT 'BCA'.
select * from Student_Info where Course !='BCA';

--Display students with Null Emails
select * from Student_Info where Email is NUll;

--Display the details of students whose Course is 'B.Tech CSE', 'BCA', or 'B.Sc'.
select * from Student_Info where Course IN('B.Tech CSE','BCA','B.Sc');

--Display the Student_Name, City, and Age of students whose Age is 19, 20, or 22.
select Student_Name,City,Age from Student_Info where Age IN(19,20,22);

--#11-Practice Questions on Order By Clause
-----------------------------------------------------
--Display all student records in ascending order of Age.
select * from Student_Info order by Age asc;

--Display all student records in descending order of Age
select * from Student_Info order by age desc;

--Display all student records in ascending order of Student_Name.
select * from Student_Info order by Student_Name asc;

--Display only Student_Name and City, sorted by City in ascending order.
select Student_Name,City from Student_Info order by City asc;

--Display all student records sorted by Course in ascending order.
select * from Student_Info order by Course asc;

--Display all student records sorted by Age in ascending order. 
--If two students have the same age, sort them by Student_Name in ascending order.
select * from Student_Info order by Age,Student_Name;

--Display all student records sorted by Gender in ascending order and then by Age in descending order.
select * from Student_Info order by Gender asc,Age desc;

--Display only Student_Name, Age, and Course, sorted by Course in descending order.
select Student_Name,Age,Course from Student_Info order by Course desc;

--Display all students whose Age is greater than or equal to 20, sorted by Student_Name in descending order.
select * from Student_Info where Age>=20 order by Student_Name desc;

--Display all Female students sorted by Age in ascending order.
select *from Student_Info where Gender ='Female' order by Age asc;

--Display all student records sorted by Course in ascending order. 
--If two students belong to the same course, sort them by Age in descending order.
select * from Student_Info order by course asc,Age desc;

--Display all student records sorted by City in ascending order. 
--If two students belong to the same city, sort them by Student_Name in ascending order.
select * from Student_Info order by City asc,Student_Name asc;

--Display all student records sorted by Gender in ascending order. 
--If two students have the same gender, sort them by Course in ascending order. 
--If the course is also the same, sort them by Age in descending order

select * from Student_Info order by Gender asc,Course asc,Age desc;

--#12- Aggregate Fucntions with Where Clause
----------------------------------------------------------------
--Find the total number of students.
select count(*) As Total_Students from Student_Info;

--Find the total number of female students
select count(*) As Female_Students from Student_Info where Gender='Female';

--Find the sum of all students' ages.
select SUM(Age) AS SUM_AGE from Student_Info;

--Find the average age of all students.
select AVG(Age) as Avg_Age from Student_Info;

--Find the youngest student's age.
select MIN(Age) as Youngest_Student from Student_Info;

--Find the oldest student's age.
select MAX(Age) as oldest_Student from Student_Info;

--Find the average age of male students only.
select AVG(Age) as Avg_Age from Student_Info where Gender='Male';

--Find the total age of female students.
select SUM(Age) as Total_Female_Age from Student_Info where Gender='Female';

--Find the number of students whose age is greater than 20.
select count(Age) as Total_Age from Student_Info where Age>20;

--Find the maximum age among female students.
select MAX(Age) as Max_Female_Age from Student_Info where Gender='Female';

--#13- Group BY Practice Question with Agrregate Fucntions
---------------------------------------------------------------------
--Display the number of students in each City.
select City,Count(*) as T_S from Student_Info Group By City;

--Display the number of students in each Course.
select Course,Count(*) AS T_S from Student_Info Group by Course;

--Display the average Age of students in each Course.
select Course,AVG(Age) as average_age from Student_Info Group BY Course;

--Display the maximum Age of students in each City.
select City,MAX(Age) as Max_Age from Student_Info Group BY City;

--Display the minimum Age of students in each Gender
select Gender,MIN(Age) as minimum_age from Student_Info Group By Gender;

--Display the total Age of students in each City.
select City,SUM(Age) as Total_Age from Student_Info Group By City;

--Display the average Age of students in each Gender.
select Gender,AVG(Age) as average_age from Student_Info Group by Gender;

--Display the total number of students in each Age.
select Age,Count(*)as Total_Students from Student_Info Group by Age;

--Display the maximum age in each Course.
select Course,MAX(Age) as maximum_age from Student_Info Group by Course;

--Display the minimum age in each City.
select City,MIN(Age) from Student_Info Group by City;

--NOTES- The order of SQL Queries is Select, Aggreate_fucn, From, Group BY, Having, Order BY.

--#14- Group BY + Having Problems
----------------------------------------------------------------

--Display the cities having more than 1 student.
select City,Count(*) as total from Student_Info Group by City Having Count(*)>1;

--Display the courses having more than 1 student.
select Course,count(*) as Total from Student_Info Group By Course having Count(*)>1;

--Display the cities whose average age is greater than 20.
select City,Avg(Age)as Total from Student_Info Group By City Having Avg(Age)>20;

--Display the genders whose total age is greater than 40.
select Gender,SUM(Age) as Total From Student_Info Group BY Gender Having SUM(Age)>40;

--Display the courses whose maximum age is greater than or equal to 21.
select Course,MAX(Age) as Total From Student_Info Group by Course Having Max(Age)>=21;

--Display the cities whose minimum age is less than 20.
select City,MIN(Age)as Total From Student_Info Group By City Having MIN(Age)<20;

--Display the ages that occur more than once.
select Age,Count(*)as Total from Student_Info Group by Age having Count(*)>1;

--Display the genders whose average age is greater than or equal to 20.
select Gender,Avg(Age) as total from Student_Info Group by Gender Having Avg(Age)>=20;

--Display the cities where the sum of ages is greater than 40.
select City,SUM(Age) as Total From Student_Info Group By City Having SUM(Age)>40;

--Display the number of students in each city only for students whose age is at least 20, 
--and show only those cities having more than one such student.

select City,count(*) as Total from Student_Info where Age>=20 Group By City Having count(*)>1;

--#15- Medium Level Group By + Having Problems
-----------------------------------------------------------------------
--Display the Course and the number of students in each course, 
--but show only those courses that have at least 2 students.

select course,Count(*) as total from Student_Info group by Course Having Count(*)>=2;

--Display the City and the average age of students in each city. 
--Show only those cities where the average age is greater than or equal to 20. 
--Sort the result by average age in descending order.

select City,Avg(Age) as total From Student_Info group by City Having Avg(Age)>=20
order By total desc;

--Display the Gender, the total number of students, and the maximum age in each gender. 
--Show only those genders where the maximum age is greater than 20.

Select Gender,Count(*) as total,Max(Age) as totals from Student_Info group by Gender Having Max(Age)>20;

--Display the Course and the sum of ages of students in each course. 
--Show only those courses where the sum of ages is greater than 40. 
--Sort the result by the sum of ages in descending order.

Select Course,sum(Age) as totals from Student_Info group by course Having SUM(Age)>40
order by totals desc;

--Display the City and the number of students in each city only for female students. 
--Show only those cities that have at least 2 female students, 
--and sort the results by the number of students in descending order.

select City,Count(*) as totals from Student_Info where Gender='Female' group by City Having
Count(*)>=2 order by totals desc;

--#16- JOINS Practice 
--------------------------------------------------------------------
--Display the student's name and school name using INNER JOIN.
select s.st_name,sc.sch_name from Student as s
INNER JOIN School as sc 
ON s.st_id=sc.st_id;

--Display all students and their school names using LEFT JOIN.
select s.st_name,sc.sch_name from Student as s
LEFT JOIN School as sc 
on s.st_id=sc.st_id;

--Display all schools and their student names using RIGHT JOIN.

select s.st_name,sc.sch_name from Student as s 
RIGHT JOIN School as sc 
ON s.st_id=sc.st_id;

--Display all students and schools using FULL OUTER JOIN

select s.st_name,sc.sch_name from Student as s
FULL OUTER JOIN School as sc
ON s.st_id=sc.st_id;

--Display Student ID, Student Name, and School Name using INNER JOIN.
select s.st_id,s.st_name,sc.sch_name from Student as s 
INNER JOIN School as sc 
ON s.st_id=sc.st_id;

--Cross JOIN

select * from Student CROSS JOIN School;

-- Self JOIN

select * from Student as s1
JOIN Student as s2
ON s1.st_name=s2.st_id;


--#17- Joins Practice Problems
---------------------------------------------------------------------------------------
create table Student(
  id int primary key,
  name varchar(100),
  City char(50)
);

create table enrollment(
  id int,
  course varchar(10),
  marks int,
  foreign key(id) references Student(id)
);

insert into Student(id,name,City)
values(1,'Arpit','Delhi'),
      (2,'Rahul','Mumbai'),
      (3,'Aman','Delhi'),
      (4,'Riya','Pune');

insert into enrollment(id,course,marks)
values(1,'SQL',85),
      (2,'Python',78),
      (3,'Java',90);

select * from Student;
select * from enrollment;

--Display the student name and the course they enrolled in.
 select s.name,e.course from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id;

--Display all students along with the course they enrolled in
select s.name,e.course from Student as s 
LEFT JOIN enrollment as e 
ON s.id=e.id;

--Display all enrollments along with the student name.
select s.name,e.course from Student as s 
RIGHT JOIN enrollment as e 
ON s.id=e.id;

--Display the student name and marks of students who scored more than 80.
select s.name,e.marks from Student as s
INNER JOIN enrollment as e
ON s.id=e.id where e.marks>80;

--Display every student with every course.
select s.name,e.course from Student as s 
CROSS JOIN enrollment as e;

--Display all students, including those who have not enrolled, along with their marks.
select s.name,e.marks from Student as s 
LEFT JOIN enrollment as e 
ON s.id=e.id;

--Display the names of students who have not enrolled in any course.
select s.name from Student as s 
FULL OUTER JOIN enrollment as e 
ON s.id=e.id Where e.course IS NULL;

--Display the course and the student name for every enrollment.
 select s.name,e.course from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id;

--Display the city and the total number of students enrolled from each city.
select s.City,count(*) from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id 
GROUP BY City;

--Display the average marks of students from each city.
select s.City,AVG(marks) from Student as s 
LEFT JOIN enrollment as e 
ON s.id=e.id 
GROUP by s.City;

