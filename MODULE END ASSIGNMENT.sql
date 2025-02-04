-- Create database
CREATE DATABASE library;
USE library;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert values into Branch
INSERT INTO Branch VALUES (1, 101, '123 Library St', '9876543210');
INSERT INTO Branch VALUES (2, 102, '456 Book Rd', '8765432109');

-- Insert values into Employeebooks
INSERT INTO Employee VALUES (101, 'Alice Johnson', 'Manager', 60000, 1);
INSERT INTO Employee VALUES (102, 'Bob Smith', 'Librarian', 45000, 1);
INSERT INTO Employee VALUES (103, 'Charlie Brown', 'Assistant', 30000, 2);
INSERT INTO Employee VALUES (104, 'David Wilson', 'Manager', 70000, 2);
INSERT INTO Employee VALUES (105, 'Eve Adams', 'Librarian', 40000, 1);
INSERT INTO Employee VALUES (106, 'Frank White', 'Assistant', 35000, 1);
INSERT INTO Employee VALUES (107, 'Grace Hall', 'Assistant', 32000, 1);
INSERT INTO Employee VALUES (108, 'Henry King', 'Assistant', 31000, 1);

-- Insert values into Books
INSERT INTO Books VALUES ('978-3-16-148410-0', 'History of Time', 'History', 30, 'yes', 'Stephen Hawking', 'Penguin');
INSERT INTO Books VALUES ('978-1-40-289462-6', 'Learn SQL', 'Education', 20, 'no', 'John Doe', 'O Reilly');
INSERT INTO Books VALUES ('978-0-13-110362-7', 'Computer Science Basics', 'Education', 50, 'yes', 'Alan Turing', 'Pearson');
INSERT INTO Books VALUES ('978-0-123456-78-9', 'World History', 'History', 40, 'yes', 'Jane Doe', 'Harvard Press');

-- Insert values into Customer
INSERT INTO Customer VALUES (201, 'Emma Watson', '12 Oxford St', '2021-12-15');
INSERT INTO Customer VALUES (202, 'Daniel Radcliffe', '34 Main St', '2023-05-10');
INSERT INTO Customer VALUES (203, 'Rupert Grint', '56 Baker St', '2020-07-21');

-- Insert values into IssueStatus
INSERT INTO IssueStatus VALUES (301, 202, 'Learn SQL', '2023-06-05', '978-1-40-289462-6');
INSERT INTO IssueStatus VALUES (302, 203, 'History of Time', '2023-06-15', '978-3-16-148410-0');
INSERT INTO IssueStatus VALUES (303, 201, 'World History', '2023-06-20', '978-0-123456-78-9');

-- Insert values into ReturnStatus
INSERT INTO ReturnStatus VALUES (401, 202, 'Learn SQL', '2023-07-05', '978-1-40-289462-6');

-- Queries:

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer
WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT Customer.Customer_name FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE LOWER(Book_title) LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Employee.Emp_name, Branch.Branch_address FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;
