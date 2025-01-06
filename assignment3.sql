CREATE DATABASE management;
use management;
 -- Create the Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 0 AND Age <= 100),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Smith', '1985-03-15', 39, 'M', 'IT', 30000),
(2, 'Aaliya', 'Khan', '1990-07-20', 34, 'F', 'HR', 25000),
(3, 'Raj', 'Sharma', '1987-05-10', 37, 'M', 'Finance', 40000),
(4, 'Priya', 'Verma', '1995-11-25', 29, 'F', 'IT', 32000),
(5, 'Karan', 'Mehta', '1980-09-12', 44, 'M', 'Operations', 28000),
(6, 'Nina', 'Gupta', '1992-04-18', 32, 'F', 'Marketing', 22000),
(7, 'Arjun', 'Reddy', '1983-06-30', 41, 'M', 'IT', 35000),
(8, 'Simran', 'Gill', '1998-01-14', 26, 'F', 'HR', 20000),
(9, 'Manoj', 'Tiwari', '1986-12-09', 38, 'M', 'Finance', 45000),
(10, 'Riya', 'Sharma', '1993-02-27', 31, 'F', 'IT', 15000);
-- Query to retrieve the name and date of birth of the manager with Manager_Id = 1 sql
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;
 -- Query to display the annual income of all managers
SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;
-- Query to display records of all managers except ‘Aaliya’
SELECT *FROM Managers
WHERE First_name != 'Aaliya';
-- Query to display details of managers whose department is 'IT' and earns more than 25000 per month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;
-- Query to display details of managers whose salary is between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;

