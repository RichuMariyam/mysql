-- Step 1: Create the "Sales" database
CREATE DATABASE Sales;

-- Step 2: Use the "Sales" database
USE Sales;

-- Step 3: Create the "Orders" table
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

-- Step 4: Add a new column named "order_quantity"
ALTER TABLE Orders ADD order_quantity INT;

-- Step 5: Rename the "Orders" table to "sales_orders"
alter table Orders
 rename to sales_orders;

-- Step 6: Insert 10 rows into the "sales_orders" table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
(1, 'Alice Johnson', 'Electronics', 'Laptop', '1234567890', 1),
(2, 'Bob Smith', 'Clothing', 'T-Shirt', '0987654321', 3),
(3, 'Charlie Brown', 'Electronics', 'Smartphone', '1122334455', 2),
(4, 'David Wilson', 'Groceries', 'Rice', '2233445566', 5),
(5, 'Eve Davis', 'Electronics', 'Headphones', '3344556677', 1),
(6, 'Fiona White', 'Books', 'Novel', '4455667788', 4),
(7, 'George Miller', 'Clothing', 'Jeans', '5566778899', 2),
(8, 'Hannah Adams', 'Furniture', 'Chair', '6677889900', 6),
(9, 'Ivy Scott', 'Groceries', 'Milk', '7788990011', 3),
(10, 'Jack Thomas', 'Books', 'Notebook', '8899001122', 8);

-- Step 7: Retrieve customer_name and Ordered_item from the "sales_orders" table
SELECT Customer_name, Ordered_item FROM sales_orders;

-- Step 8: Update the name of the product for any row
UPDATE sales_orders
SET Ordered_item = 'Tablet'
WHERE Order_Id = 1;

desc sales_orders;
-- Step 9: Delete the "sales_orders" table
DROP TABLE sales_orders;
