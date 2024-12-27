-- create database named School

create database School;

-- use the database

use School;

-- create table student

create table STUDENT(
RollNo int auto_increment primary key,
Student_Name varchar(50) not null,
Marks int,
Grade char(1) check (Grade in('A','B','C'))
);

-- show the table student

desc STUDENT;

-- insert values into the table

insert into STUDENT(RollNo,Student_Name,Marks,Grade)
values
(1,'Alice',85,'A'),
(2,'Bini',78,'B'),
(3,'Riya',64,'C'),
(4,'Noel',72,'B'),
(5,'John',90,'A');

-- display table student

select * from STUDENT;

-- add another column named contact to student table
 
 Alter table student
 add Contact varchar(30);
 
 desc student;
 
 --  drop column grade from the table student
 
 alter table student
 drop column Grade;
 
 desc student;
 
 -- rename table 'student' to 'classten'
 
 alter table student
 rename to CLASSTEN;
 
 
 desc classten;
 
 select * from classten;
 
 -- delete all the rows of the table
 truncate table classten;
  -- show the table
  
  select * from classten;
  
  -- delete the database
  
  drop database School;
 
 


