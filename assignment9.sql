-- Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Create Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,  -- Removed (15)
    JoiningDate DATETIME,
    Department CHAR(25)
);


-- Stored Procedure to Insert a New Record
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT, 
    IN p_FirstName CHAR(25), 
    IN p_LastName CHAR(25), 
    IN p_Salary INT, 
    IN p_JoiningDate DATETIME, 
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Call the Insert Procedure

CALL AddWorker(101, 'John', 'Doe', 50000, '2024-01-30 10:00:00', 'IT');
CALL AddWorker(102, 'Alice', 'Smith', 60000, '2023-06-15 09:30:00', 'HR');
CALL AddWorker(103, 'Bob', 'Brown', 55000, '2022-08-22 11:00:00', 'IT');

-- Stored Procedure to Retrieve Salary by Worker ID
DELIMITER $$

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT, 
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Call the GetSalary Procedure
CALL GetSalary(101, @salary);
SELECT @salary AS Salary;

-- Stored Procedure to Update Department by Worker ID
DELIMITER $$

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT, 
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Call the UpdateDepartment Procedure
CALL UpdateDepartment(101, 'HR');

-- Stored Procedure to Count Workers in a Department
DELIMITER $$

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25), 
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount FROM Worker WHERE Department = p_Department;
END $$

DELIMITER ;

-- Call the GetWorkerCount Procedure
CALL GetWorkerCount('IT', @workerCount);
SELECT @workerCount AS WorkerCount;

-- Stored Procedure to Get Average Salary in a Department
DELIMITER $$

CREATE PROCEDURE GetAvgSalary(
    IN p_Department CHAR(25), 
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary FROM Worker WHERE Department = p_Department;
END $$

DELIMITER ;

-- Call the GetAvgSalary Procedure
CALL GetAvgSalary('IT', @avgSalary);
SELECT @avgSalary AS AvgSalary;
