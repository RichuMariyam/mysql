CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);

-- Insert 8 sample rows
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Johnson', 'Mathematics', 5, 50000),
('Bob Smith', 'Physics', 8, 60000),
('Charlie Brown', 'Chemistry', 12, 75000),
('David White', 'Biology', 15, 80000),
('Emma Williams', 'History', 3, 45000),
('Frank Taylor', 'English', 10, 55000),
('Grace Miller', 'Computer Science', 7, 62000),
('Henry Clark', 'Geography', 6, 48000);
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;
CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERTED', NOW());
END $$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END $$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETED', NOW());
END $$

DELIMITER ;
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('John Doe', 'Physics', 4, -5000);
-- Error: Salary cannot be negative
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Ivy Thompson', 'Music', 2, 40000);
SELECT * FROM teacher_log;
DELETE FROM teachers WHERE id = 3;
-- Error: Cannot delete a teacher with more than 10 years of experience

-- This should show an "INSERTED" log for the new teacher.

DELETE FROM teachers WHERE id = 5;
SELECT * FROM teacher_log;
-- This should show a "DELETED" log for the deleted teacher.





