-- (1) Perform INNER JOIN, LEFT JOIN, and RIGHT JOIN on the Country and Persons tables

-- INNER JOIN: Matches records with the same Country_Id in both tables
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Country.Country_name AS Country_Name, 
    Persons.Rating
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

-- LEFT JOIN: Returns all records from the Persons table, and matching records from the Country table
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Country.Country_name AS Country_Name, 
    Persons.Rating
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

-- RIGHT JOIN: Returns all records from the Country table, and matching records from the Persons table
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Country.Country_name AS Country_Name, 
    Persons.Rating
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

-- (2) List all distinct country names from both the Country and Persons tables
SELECT DISTINCT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS All_Countries;

-- (3) List all country names from both the Country and Persons tables, including duplicates
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;

-- (4) Round the ratings of all persons to the nearest integer in the Persons table
SELECT Id, Fname, Lname, Country_name, ROUND(Rating) AS Rounded_Rating
FROM Persons;
