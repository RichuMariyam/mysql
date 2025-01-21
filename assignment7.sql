use nation;
ALTER TABLE Persons
ADD DOB DATE;
DELIMITER //

CREATE FUNCTION CalculateAge (DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    IF DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(DOB, '%m-%d') THEN
        SET age = age - 1;
    END IF;
    RETURN age;
    END;
//

DELIMITER ;
SELECT CalculateAge('2000-01-21') AS Age;
SELECT 
    Id, 
    Fname, 
    Lname, 
    CalculateAge(DOB) AS Age
FROM persons;

SELECT 
    Id, 
    Country_name, 
    CHAR_LENGTH(Country_name) AS NameLength
FROM country;
SELECT 
    Id, 
    Country_name, 
    LEFT(Country_name, 3) AS FirstThreeCharacters
FROM country;



SELECT 
    Id, 
   Country_name, 
    UPPER(Country_name) AS UppercaseName, 
    LOWER(Country_name) AS LowercaseName
FROM country;

