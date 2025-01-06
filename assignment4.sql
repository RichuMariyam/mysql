-- create table country

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population BIGINT,
    Area FLOAT
);

-- create table persons

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- insert 10 rows to country

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67000000, 243610),
(4, 'India', 1390000000, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Italy', 60000000, 301340),
(9, 'Spain', 47000000, 505990),
(10, 'Brazil', 213000000, 8515767);

-- insert 10 rows to persons

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 500000, 4.2, 1, 'USA'),
(2, 'Alice', 'Smith', 600000, 3.8, 2, 'Canada'),
(3, 'Bob', 'Brown', 700000, 4.5, 3, 'UK'),
(4, 'Charlie', 'Davis', 800000, 4.0, 4, 'India'),
(5, 'Eve', 'Johnson', 900000, 4.7, 5, 'Australia'),
(6, 'Frank', 'Miller', 550000, 3.9, 6, 'Germany'),
(7, 'Grace', 'Williams', 650000, 4.8, 7, 'France'),
(8, 'Hank', 'Taylor', 750000, 3.7, NULL, NULL),
(9, 'Ivy', 'Wilson', 850000, 4.1, 8, 'Italy'),
(10, 'Jack', 'Martin', 950000, 4.3, 9, 'Spain');

-- list the country names from persons table

SELECT DISTINCT Country_name
FROM Persons;

-- select first and last name from persons table

SELECT Fname AS First_Name, Lname AS Last_Name
FROM Persons;

--  persons having rating greater than 4.0

SELECT *
FROM Persons
WHERE Rating > 4.0;

-- slect countries having population greater than 1000000

SELECT *
FROM Country
WHERE Population > 1000000;

-- Find persons who are from 'USA' or have a rating greater than 4.5

SELECT *
FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;

SELECT *
FROM Persons
WHERE Country_name IS NULL;


SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

SELECT *
FROM Country
WHERE Population BETWEEN 500000 AND 2000000;

SELECT *
FROM Country
WHERE Country_name NOT LIKE 'C%';









