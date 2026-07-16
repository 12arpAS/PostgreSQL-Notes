--# Joins advanced Practice Problems
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

-- Practice Problems on JOINS

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

--Display the city and the number of students enrolled from each city. 
--Show only those cities where more than one student is enrolled

select s.City,Count(*) as counts from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id
GROUP BY s.City 
Having Count(*)>1;

--Display the course name and the average marks of students enrolled in each course. 
--Show only courses whose average marks are greater than 80.

select e.course,AVG(marks)as average_marks from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id
GROUP BY e.course 
HAVING AVG(marks)>80;

--Display the student name, city, and course of students who scored between 70 and 90 marks.
select s.name,s.City,e.course from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id 
where e.marks between 70 and 90;

--Display the city and the highest marks scored by any student from that city. 
--Show only cities where the highest marks are greater than 85.

select s.City,MAX(marks) as Max_Marks from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id 
GROUP BY City 
HAVING MAX(marks)>85;

--Display the course name and the number of students enrolled in each course. 
--Show only courses having at least 2 students, 
--and display the results in descending order of the number of students.

select e.course,count(*)as counts from Student as s 
INNER JOIN enrollment as e 
ON s.id=e.id
GROUP BY course
HAVING count(*)>=2
order by counts desc;























