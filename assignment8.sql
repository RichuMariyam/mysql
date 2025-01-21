use nation;
-- 1. Find the number of persons in each country.
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM persons
GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low.
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

-- 3. Find the average rating for persons in respective countries if the average is greater than 3.0.
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA (Use Subqueries).
SELECT Country_name
FROM persons
WHERE Rating = (
    SELECT AVG(Rating)
    FROM persons
    WHERE Country_name = 'USA'
);
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '90001', 'USA'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'San Francisco', 'California', '94101', 'USA'),
    (3, 'Robert', 'Brown', 'robert.brown@example.com', '1231231234', '789 Pine St', 'Seattle', 'Washington', '98101', 'USA'),
    (4, 'Emily', 'Davis', 'emily.davis@example.com', '4564564567', '321 Maple St', 'New York', 'New York', '10001', 'USA'),
    (5, 'Michael', 'Johnson', 'michael.johnson@example.com', '7897897890', '654 Birch St', 'Chicago', 'Illinois', '60601', 'USA'),
    (6, 'Sarah', 'Williams', 'sarah.williams@example.com', '1112223333', '987 Cedar St', 'Houston', 'Texas', '77001', 'USA'),
    (7, 'David', 'Jones', 'david.jones@example.com', '4445556666', '159 Spruce St', 'Dallas', 'Texas', '75201', 'USA'),
    (8, 'Linda', 'Taylor', 'linda.taylor@example.com', '7778889999', '753 Willow St', 'Austin', 'Texas', '73301', 'USA'),
    (9, 'Daniel', 'Moore', 'daniel.moore@example.com', '2223334444', '951 Palm St', 'Miami', 'Florida', '33101', 'USA'),
    (10, 'Jessica', 'White', 'jessica.white@example.com', '3334445555', '852 Elm St', 'Orlando', 'Florida', '32801', 'USA'),
    (11, 'William', 'Harris', 'william.harris@example.com', '5556667777', '753 Oak St', 'Atlanta', 'Georgia', '30301', 'USA'),
    (12, 'Sophia', 'Martin', 'sophia.martin@example.com', '6667778888', '951 Maple St', 'Phoenix', 'Arizona', '85001', 'USA'),
    (13, 'James', 'Lee', 'james.lee@example.com', '8889990000', '159 Birch St', 'Denver', 'Colorado', '80201', 'USA');

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

-- SELECT operation for customer_info view
SELECT * FROM customer_info;
UPDATE Customer
SET Phone_no = '5550001234'
WHERE State = 'California' AND Customer_Id IS NOT NULL;

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
SELECT *
FROM Customer
ORDER BY State ASC;


