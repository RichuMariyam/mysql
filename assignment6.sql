
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Persons.Rating, 
    Country.Country_name, 
    Country.Population 
FROM Persons
INNER JOIN Country
ON Persons.Country_Id = Country.Id;

-- left join

SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Persons.Rating, 
    Country.Country_name, 
    Country.Population 
FROM Persons
LEFT JOIN Country
ON Persons.Country_Id = Country.Id;

-- right join

SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Persons.Rating, 
    Country.Country_name, 
    Country.Population 
FROM Persons
RIGHT JOIN Country
ON Persons.Country_Id = Country.Id;

SELECT DISTINCT Country_name
FROM Country
UNION
SELECT DISTINCT Country_name
FROM Persons;

SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;


SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;


