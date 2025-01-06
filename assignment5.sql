create database nation;
use nation;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area DECIMAL(10, 2)
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 38000000, 9984670),
(3, 'India', 1400000000, 3287263),
(4, 'UK', 67000000, 243610),
(5, 'Australia', 25000000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Japan', 126000000, 377975),
(9, 'Brazil', 212000000, 8515767),
(10, 'South Africa', 60000000, 1221037);

-- Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Aaliya', 'Khan', 1400000000, 3.8, 3, 'India'),
(3, 'Raj', 'Sharma', 1400000000, 4.6, 3, 'India'),
(4, 'Emily', 'Brown', 38000000, 4.2, 2, 'Canada'),
(5, 'Oliver', 'Smith', 67000000, 3.9, 4, 'UK'),
(6, 'Liam', 'Davis', 25000000, 4.1, 5, 'Australia'),
(7, 'Sophia', 'Wilson', 212000000, 4.8, 9, 'Brazil'),
(8, 'Lucas', 'Miller', NULL, 4.3, NULL, NULL),
(9, 'Emma', 'Moore', 126000000, 4.7, 8, 'Japan'),
(10, 'Mia', 'Taylor', 60000000, 3.6, 10, 'South Africa');

-- Print the first three characters of Country_name
SELECT LEFT(Country_name, 3) AS First_Three_Characters
FROM Country;

-- Concatenate first name and last name from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- Count the number of unique country names from the Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count
FROM Persons;

-- Print the maximum population from the Country table
SELECT MAX(Population) AS Max_Population
FROM Country;

-- Print the minimum population from the Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;

-- Insert 2 new rows into the Persons table with Lname as NULL
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(11, 'Jake', NULL, 150000, 4.5, 1, 'USA'),
(12, 'Lara', NULL, 80000, 3.9, 2, 'Canada');

-- Count Lname from the Persons table
SELECT COUNT(Lname) AS Count_Lname
FROM Persons;

-- Find the number of rows in the Persons table
SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- Show the population of the Country table for the first 3 rows
SELECT Population
FROM Country
LIMIT 3;

-- Print 3 random rows of countries
SELECT *
FROM Country
ORDER BY RAND()
LIMIT 3;

-- List all persons ordered by their rating in descending order
SELECT *
FROM Persons
ORDER BY Rating DESC;

-- Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

-- Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- List the total number of persons and average rating for each country
-- Only for countries with more than 2 persons, ordered by average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;

