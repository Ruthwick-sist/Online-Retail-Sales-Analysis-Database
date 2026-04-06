-- Create Database
CREATE DATABASE RetailStore;
GO
USE RetailStore;
GO

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Arun', 'Chennai'),
(2, 'Aakash', 'Chennai'),
(3, 'Ajay', 'Chennai'),
(4, 'Avin', 'Bangalore'),
(5, 'Adi', 'Bangalore'),
(6, 'Ameesh', 'Bangalore'),
(7, 'Aaron', 'Hyderabad'),
(8, 'Advait', 'Hyderabad'),
(9, 'Aarush', 'Kerala'),
(10, 'Aaraav', 'Kerala');  -- for Key- task 5 , this customer remains inactive
GO

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Laptop', 'Electronics', 65000),
(103, 'Laptop', 'Electronics', 75000),
(104, 'Laptop', 'Electronics', 85000),
(105, 'Shirt', 'Fashion', 1200),
(106, 'Shirt', 'Fashion', 1500),
(107, 'Shirt', 'Fashion', 1800),
(108, 'Washing Machine', 'Home Appliance', 25000),
(109, 'Washing Machine', 'Home Appliance', 28000),
(110, 'Washing Machine', 'Home Appliance', 30000);
GO

-- Orders Table
CREATE TABLE Orders (
    order_id VARCHAR(5) PRIMARY KEY,
    customer_id INT,
    date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
('A1', 1, '2026-04-01'),
('A2', 2, '2026-04-01'),
('A3', 3, '2026-04-02'),
('A4', 4, '2026-04-02'),
('A5', 5, '2026-04-02'),
('A6', 6, '2026-04-03'),
('A7', 7, '2026-04-03'),
('A8', 8, '2026-04-03'),
('A9', 9, '2026-04-04'); 
GO

-- Order_Items Table
CREATE TABLE Order_Items (
    order_id VARCHAR(5),
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
('A1', 101, 1),
('A1', 105, 2),
('A2', 102, 1),
('A2', 106, 3),
('A3', 103, 1),
('A3', 107, 2),
('A4', 104, 1),
('A4', 108, 1),
('A5', 105, 2),
('A5', 109, 1),
('A6', 101, 1),
('A6', 110, 1),
('A7', 102, 2),
('A7', 105, 1),
('A8', 103, 1),
('A8', 106, 2),
('A9', 104, 1),
('A9', 107, 2);
GO

-- Key Task 1: Top-Selling Products
PRINT 'Top-Selling Products';
SELECT p.name, SUM(oi.quantity) AS totalsold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY totalsold DESC;
GO

-- Key Task 2: Most Valuable Customers
PRINT 'Most Valuable Customers';
SELECT c.name, SUM(p.price * oi.quantity) AS totalspent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY totalspent DESC;
GO

-- Key Task 3: Monthly Revenue Calculation
PRINT 'Monthly Revenue';
SELECT MONTH(o.date) AS month, YEAR(o.date) AS year, SUM(p.price * oi.quantity) AS revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY YEAR(o.date), MONTH(o.date)
ORDER BY year, month;
GO

-- Key Task 4: Category-Wise Sales Analysis
PRINT 'Category-Wise Sales';
SELECT p.category, SUM(oi.quantity * p.price) AS categorysales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY categorysales DESC;
GO

-- Key Task 5: Detect Inactive Customers
PRINT 'Inactive Customers';
SELECT c.name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
GO
