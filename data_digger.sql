-- PR.1 DATA DIGGER
DROP DATABASE DataDigger2;
CREATE DATABASE DataDigger2;
USE DataDigger2;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(100)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'alice@gmail.com', 'Delhi'),
(2, 'Rahul', 'rahul@gmail.com', 'Mumbai'),
(3, 'Priya', 'priya@gmail.com', 'Surat'),
(4, 'Alice', 'alice2@gmail.com', 'Pune'),
(5, 'Aman', 'aman@gmail.com', 'Ahmedabad');

SELECT * FROM Customers;

UPDATE Customers
SET Address = 'Jaipur'
WHERE CustomerID = 1;

DELETE FROM Customers
WHERE CustomerID = 5;

SELECT * FROM Customers
WHERE Name = 'Alice';

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(101, 1, '2026-09-20', 1200.00),
(102, 2, '2026-09-18', 2500.00),
(103, 3, '2026-09-15', 1800.00),
(104, 4, '2026-09-10', 3500.00),
(105, 1, '2026-08-20', 900.00);

SELECT * FROM Orders;

SELECT *
FROM Orders
WHERE CustomerID = 1;

UPDATE Orders
SET TotalAmount = 1500.00
WHERE OrderID = 101;


DELETE FROM Orders
WHERE OrderID = 105;

SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

SELECT
MAX(TotalAmount) AS HighestAmount,
MIN(TotalAmount) AS LowestAmount,
AVG(TotalAmount) AS AverageAmount
FROM Orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products VALUES
(201, 'Laptop', 55000.00, 10),
(202, 'Mobile', 20000.00, 15),
(203, 'Headphones', 1500.00, 25),
(204, 'Keyboard', 900.00, 0),
(205, 'Mouse', 700.00, 20);

SELECT * FROM Products;

SELECT *
FROM Products
ORDER BY Price DESC;

UPDATE Products
SET Price = 1700.00
WHERE ProductID = 203;

DELETE FROM Products
WHERE Stock = 0;

SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;

SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails VALUES
(301, 101, 202, 1, 20000.00),
(302, 101, 203, 2, 3000.00),
(303, 102, 205, 3, 2100.00),
(304, 103, 202, 1, 20000.00),
(305, 104, 203, 4, 6800.00);

SELECT * FROM OrderDetails;

SELECT *
FROM OrderDetails
WHERE OrderDetailID = 301;

SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;

SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;

SELECT
    ProductID,
    COUNT(*) AS NumberOfOrders
FROM OrderDetails
WHERE ProductID = 202
GROUP BY ProductID;

SELECT
    Customers.Name,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

SELECT
    OrderDetails.OrderID,
    Products.ProductName,
    OrderDetails.Quantity,
    OrderDetails.SubTotal
FROM OrderDetails
JOIN Products
ON OrderDetails.ProductID = Products.ProductID;

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM OrderDetails;