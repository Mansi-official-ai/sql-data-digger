# PR.1 DATA DIGGER

## 📌 Project Overview

**Data Digger** is a MySQL database management project designed to demonstrate basic and advanced SQL operations.

This project manages information about:

* Customers
* Orders
* Products
* Order Details

The project demonstrates how to create databases and tables, insert data, update records, delete records, retrieve data, perform calculations, use subqueries, and combine data using JOIN operations.

---

## 🎯 Objectives

The main objectives of this project are:

* Create and manage a MySQL database.
* Create tables using SQL.
* Insert records into tables.
* Retrieve data using `SELECT`.
* Update existing records using `UPDATE`.
* Delete records using `DELETE`.
* Filter data using `WHERE`.
* Sort data using `ORDER BY`.
* Calculate values using aggregate functions.
* Group data using `GROUP BY`.
* Use subqueries.
* Use `JOIN` to combine information from different tables.
* Work with primary keys and foreign keys.

---

## 🗄️ Database Name

```sql
DataDigger2
```

The project starts by creating the database:

```sql
CREATE DATABASE DataDigger2;
USE DataDigger2;
```

---

## 📊 Database Tables

The project contains four main tables:

### 1. Customers

The `Customers` table stores customer information.

| Column     | Data Type    | Description           |
| ---------- | ------------ | --------------------- |
| CustomerID | INT          | Unique ID of customer |
| Name       | VARCHAR(50)  | Customer name         |
| Email      | VARCHAR(100) | Customer email        |
| Address    | VARCHAR(100) | Customer address      |

Example:

```text
1 | Alice | alice@gmail.com | Delhi
2 | Rahul | rahul@gmail.com | Mumbai
3 | Priya | priya@gmail.com | Surat
4 | Alice | alice2@gmail.com | Pune
```

---

### 2. Orders

The `Orders` table stores customer order information.

| Column      | Data Type | Description        |
| ----------- | --------- | ------------------ |
| OrderID     | INT       | Unique order ID    |
| CustomerID  | INT       | ID of customer     |
| OrderDate   | DATE      | Date of order      |
| TotalAmount | DECIMAL   | Total order amount |

`CustomerID` is connected with the `Customers` table using a foreign key.

---

### 3. Products

The `Products` table stores product information.

| Column      | Data Type    | Description       |
| ----------- | ------------ | ----------------- |
| ProductID   | INT          | Unique product ID |
| ProductName | VARCHAR(100) | Name of product   |
| Price       | DECIMAL      | Product price     |
| Stock       | INT          | Available stock   |

Example products include:

* Laptop
* Mobile
* Headphones
* Keyboard
* Mouse

---

### 4. OrderDetails

The `OrderDetails` table stores detailed information about products included in orders.

| Column        | Data Type | Description            |
| ------------- | --------- | ---------------------- |
| OrderDetailID | INT       | Unique order detail ID |
| OrderID       | INT       | Related order ID       |
| ProductID     | INT       | Related product ID     |
| Quantity      | INT       | Product quantity       |
| SubTotal      | DECIMAL   | Product subtotal       |

This table uses foreign keys to connect with both `Orders` and `Products`.

---

## 🔑 Keys and Relationships

The database uses **Primary Keys** and **Foreign Keys**.

### Primary Keys

* `Customers.CustomerID`
* `Orders.OrderID`
* `Products.ProductID`
* `OrderDetails.OrderDetailID`

### Foreign Keys

```text
Orders.CustomerID
        ↓
Customers.CustomerID
```

```text
OrderDetails.OrderID
        ↓
Orders.OrderID
```

```text
OrderDetails.ProductID
        ↓
Products.ProductID
```

These relationships help maintain consistency between the tables.

---

## 🛠️ SQL Operations Used

### CREATE

Used to create the database and tables.

```sql
CREATE DATABASE DataDigger2;
```

```sql
CREATE TABLE Customers (...);
```

---

### INSERT

Used to add records.

```sql
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@gmail.com', 'Delhi');
```

---

### SELECT

Used to display records.

```sql
SELECT * FROM Customers;
```

---

### UPDATE

Used to modify existing data.

```sql
UPDATE Customers
SET Address = 'Jaipur'
WHERE CustomerID = 1;
```

---

### DELETE

Used to remove records.

```sql
DELETE FROM Customers
WHERE CustomerID = 5;
```

---

## 🔍 Filtering Data

The project uses the `WHERE` clause to filter records.

Example:

```sql
SELECT *
FROM Customers
WHERE Name = 'Alice';
```

Another example:

```sql
SELECT *
FROM Orders
WHERE CustomerID = 1;
```

---

## 📅 Date Operations

The project finds orders placed within the last 30 days.

```sql
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```

---

## 📈 Aggregate Functions

The project uses aggregate functions to calculate order statistics.

### MAX

Finds the highest order amount.

```sql
MAX(TotalAmount)
```

### MIN

Finds the lowest order amount.

```sql
MIN(TotalAmount)
```

### AVG

Finds the average order amount.

```sql
AVG(TotalAmount)
```

Example:

```sql
SELECT
MAX(TotalAmount) AS HighestAmount,
MIN(TotalAmount) AS LowestAmount,
AVG(TotalAmount) AS AverageAmount
FROM Orders;
```

---

## 💰 Revenue Calculation

Total revenue is calculated using the `SUM()` function.

```sql
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
```

---

## 📦 Product Analysis

The project calculates the total quantity of products sold.

```sql
SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
```

This query displays the top 3 products according to quantity.

---

## 🔎 Subqueries

The project uses subqueries to find the most expensive and cheapest products.

### Most Expensive Product

```sql
SELECT *
FROM Products
WHERE Price = (
    SELECT MAX(Price)
    FROM Products
);
```

### Cheapest Product

```sql
SELECT *
FROM Products
WHERE Price = (
    SELECT MIN(Price)
    FROM Products
);
```

---

## 🔗 JOIN Operations

JOINs are used to retrieve information from multiple tables.

### Customer and Order Details

```sql
SELECT
    Customers.Name,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

### Order Details and Products

```sql
SELECT
    OrderDetails.OrderID,
    Products.ProductName,
    OrderDetails.Quantity,
    OrderDetails.SubTotal
FROM OrderDetails
JOIN Products
ON OrderDetails.ProductID = Products.ProductID;
```

---

## 📋 Sample Data

### Customers

```text
CustomerID | Name  | Email              | Address
---------------------------------------------------
1          | Alice | alice@gmail.com    | Delhi
2          | Rahul | rahul@gmail.com    | Mumbai
3          | Priya | priya@gmail.com    | Surat
4          | Alice | alice2@gmail.com   | Pune
```

### Products

```text
ProductID | ProductName | Price    | Stock
-------------------------------------------
201       | Laptop      | 55000.00 | 10
202       | Mobile      | 20000.00 | 15
203       | Headphones  | 1500.00  | 25
204       | Keyboard    | 900.00   | 0
205       | Mouse       | 700.00   | 20
```

---

## 💻 Requirements

To run this project, you need:

* MySQL Server
* MySQL Workbench or another MySQL client
* Basic knowledge of SQL

---

## ▶️ How to Run

### Step 1

Open **MySQL Workbench**.

### Step 2

Open a new SQL query.

### Step 3

Copy the complete Data Digger SQL code.

### Step 4

Paste the code into the SQL editor.

### Step 5

Run the complete script.

### Step 6

Check the database:

```sql
USE DataDigger2;
```

You can then check the tables using:

```sql
SHOW TABLES;
```

---

## 📌 Expected Tables

After successfully running the project, the following tables will be created:

```text
Customers
Orders
Products
OrderDetails
```

---

## 📚 SQL Concepts Covered

This project covers the following SQL concepts:

* Database Creation
* Database Selection
* Table Creation
* Primary Key
* Foreign Key
* INSERT
* SELECT
* UPDATE
* DELETE
* WHERE
* ORDER BY
* BETWEEN
* GROUP BY
* LIMIT
* COUNT()
* SUM()
* MAX()
* MIN()
* AVG()
* Subqueries
* INNER JOIN
* Date Functions
* Table Relationships

---

## 🎓 Conclusion

The **Data Digger** project provides practical experience with MySQL and demonstrates how relational databases can be used to store, manage, retrieve, and analyze data.

By working with Customers, Orders, Products, and Order Details, this project demonstrates important SQL concepts such as CRUD operations, relationships, aggregate functions, subqueries, grouping, filtering, and JOIN operations.

---

## 👩‍💻 Project

**Project Name:** PR.1 DATA DIGGER
**Database:** DataDigger2
**Technology:** MySQL
**Language:** SQL
