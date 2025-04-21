CREATE DATABASE HOMEWORK_LESSON_3
USE HOMEWORK_LESSON_3

/*
	Easy-Level Tasks (10)
1.Define and explain the purpose of BULK INSERT in SQL Server.
2.List four file formats that can be imported into SQL Server.
3.Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
4.Insert three records into the Products table using INSERT INTO.
5.Explain the difference between NULL and NOT NULL with examples.
6.Add a UNIQUE constraint to the ProductName column in the Products table.
7.Write a comment in a SQL query explaining its purpose.
8.Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
9.Explain the purpose of the IDENTITY column in SQL Server.
*/

--1
/*
	BULK INSERT is a Transact-SQL (T-SQL) command in SQL Server that allows to import large volumes of data quickly and efficiently from a data file (like a .txt, .csv, or .dat file) into a SQL Server table or view.
Purpose of BULK INSERT:
The main purpose of BULK INSERT is to:
Load large datasets efficiently – It's optimized for performance, significantly faster than inserting rows one at a time using INSERT INTO.
Import data from external files – This is commonly used for loading data exported from other systems (like logs, spreadsheets, or other databases).
Support ETL operations – It's often used in data warehousing or integration scenarios where you need to extract data from a source, transform it, and then load it into SQL Server.
Syntax:

BULK INSERT Products
FROM 'C:\Users\Bobur Mirzo\OneDrive\Desktop'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
)
*/

--2
/*
	The list of four file formats that can be imported to SQL Server are: CVS, TXT, XML, JSON
*/

--3,6

CREATE TABLE Products(
[Product ID] INT PRIMARY KEY,
[Product Name] VARCHAR(50) UNIQUE,
Price DECIMAL(10,2)
)


--4
INSERT INTO Products(
	[Product ID],[Product Name],Price
)
VALUES	(1,'Laptop',399),
		(2,'Smartphone',250),
		(3,'Headphone',59)

SELECT*FROM Products

--5
/*
	In SQL, NULL and NOT NULL are used to define whether a column can store missing (unknown or undefined) values.
	NULL means the column can have no value, represent missing or undefined data.
	
	CREATE TABLE Employees (
    EmployeeID INT,
    MiddleName VARCHAR(50) NULL
);
	In this table, the MiddleName column can be left blank when inserting data:

	
	INSERT INTO Employees (EmployeeID, MiddleName)
	VALUES (1, NULL);  -- This is valid

	NOT NULL means the column must always have a vaulue

	CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50) NOT NULL
);
	Now, trying to insert a row without a FirstName will fail:

	INSERT INTO Employees (EmployeeID)
	VALUES (2);  --  Error: FirstName cannot be NULL
*/
--7
/*
	In SQL, comments start with -- for single-line comments and we use /* ... */ for multi-line comments. The purpose of comments is that it improves readability and understanding,
	help collaborators, explain complex logic, debugging and testing. For example:
	/*
		This query selects all products
		that have a price greater than 100
		from the Products table.
		*/
		SELECT [Product ID], [Product Name], Price
		FROM Products
		WHERE Price > 100;
*/

--8
CREATE TABLE Categories(
	[Category ID] INT PRIMARY KEY,
	[Category Name] VARCHAR(50) UNIQUE
)

--9
/*
	The IDENTITY column in SQL Server is used to automatically generate unique numeric values for a column. We mostly use them:
	To auto-increment values (like 1, 2, 3…)
	To avoid manual value insertion
	To ensure uniqueness (especially for primary key columns)
	Great for tracking records or creating surrogate keys

	For example:
	CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100)
);
*/
--10
BULK INSERT Products
FROM 'C:\Users\Bobur Mirzo\Documents\hw_sql_3.txt'
WITH(
	FIRSTROW = 1,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'

)

select * from Categories

--11

use HOMEWORK_LESSON_3

select * from Products
select * from Categories ORDER BY [Category ID]


INSERT INTO Categories([Category ID],[Category Name])
VALUES (1,'Working stations'),
		(2, 'Mobile phones'),
		(3,'Accessories')


ALTER TABLE Products
ADD [Category Id] INT FOREIGN KEY REFERENCES Categories([Category ID])

UPDATE Products SET [Category ID] = 1 WHERE [Product Name] = 'Laptop';
UPDATE Products SET [Category ID] = 2 WHERE [Product Name] = 'Smartphone';
UPDATE Products SET [Category ID] = 3 WHERE [Product Name] = 'Headphone';


--12

/*
A PRIMARY KEY is used to uniquely identify each record in a table. It has two main rules:
It must be unique.
It cannot be NULL.
There can be only one primary key per table.
Example:

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);
StudentID must be unique and not null.
No two students can have the same StudentID.

A UNIQUE constraint also ensures uniqueness, but:
It can accept a single NULL.
A table can have multiple UNIQUE keys.

Example:

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);
StudentID is the primary identifier.
Email must also be unique, but it can be NULL (unless restricted).
You can have other UNIQUE fields in the same table.

*/

--13
ALTER TABLE Products
ADD CHECK (Price>0);

--14
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0

--15
SELECT 
    [Product ID],
    [Product Name],
    Price,
    ISNULL(Stock, 0) AS Stock
FROM Products;

--16
/*
	A FOREIGN KEY is a constraint used to link two tables together.
It ensures that the value in a column (or group of columns) in one table must match the value in a column in another table — usually a PRIMARY KEY.
Purpose of FOREIGN KEY Constraints
Enforce data integrity
Prevents invalid data from being entered.
You can't insert a value into a child table that doesn’t exist in the parent table.
Create relationships between tables
Like linking Orders to Customers, or Products to Categories.
Control cascading actions

Basic Usage 

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);
This means:
The Orders table must only use CustomerIDs that exist in the Customers table.
Example
parent table:
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);
child table with foreign key:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
Now:
You can only insert a Product if its CategoryID exists in the Categories table.
If you try to insert a CategoryID = 999 and that doesn't exist in Categories, SQL Server will throw an error.
*/

--17
CREATE TABLE Customers(ID INT, [Name] VARCHAR(20), Age INT CHECK(Age>=18))
INSERT INTO Customers VALUES(1,'ALEX', 18)
select * from Customers

--18
CREATE TABLE Points(ID INT, Team VARCHAR(20), Score INT IDENTITY(100,10))
INSERT INTO Points(ID, Team) VALUES (1,'Eagles'),(2,'Dolphins'),(3,'Bears'),(4,'Tigers')
SELECT * FROM Points

--19
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);

--20
/*
ISNULL Function
The ISNULL function replaces NULL with a specified replacement value. It takes two arguments: the expression to check and the replacement value.

Syntax:

ISNULL(expression, replacement_value)
Example:

SELECT ISNULL(NULL, 'No Value') AS Result;
Output:

Result
No Value

The COALESCE function returns the first non-NULL value from a list of expressions. It can take two or more arguments.

Syntax:
COALESCE(expression1, expression2, ..., expressionN)
Example:

SELECT COALESCE(NULL, NULL, 'Backup Value', 'Another') AS Result;
*/

--21

CREATE TABLE Employees(EmpID INT PRIMARY KEY, email VARCHAR(30) UNIQUE)

--22
/*parent table*/
CREATE TABLE Clients(
ID INT PRIMARY KEY,
[Client Name] VARCHAR(50)
)

/*child table*/
CREATE TABLE Orders(
ID INT PRIMARY KEY,
Date DATE,
[Client ID] INT,
CONSTRAINT FK_Orders_Clients
FOREIGN KEY ([Client ID])
REFERENCES Clients(ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)

SELECT * FROM Clients
SELECT * FROM OrderDetails

