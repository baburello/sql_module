--Basic LEVEL
CREATE DATABASE HOMEWORK_LESSON_2
USE HOMEWORK_LESSON_2
--1
CREATE TABLE Employees(EmpID INT, [Name] VARCHAR(50), Salary DECIMAL(10,2))
--2
INSERT INTO Employees(EmpID, [Name], Salary)
VALUES(1,'Jon', 2000)
SELECT * FROM Employees
INSERT INTO Employees(EmpID, [Name], Salary)
VALUES(2,'Bob', 900),(3,'Sarah',1200)
--3
UPDATE Employees
SET Salary = 1800
WHERE EmpID = 1
--4
DELETE FROM Employees
WHERE EmpID = 2
--5) The DELETE statement is used to delete existing records in a table.
CREATE TABLE Test(ID INT, UserName VARCHAR(20), Score DECIMAL(2,1))
INSERT INTO Test(ID, UserName, Score)
VALUES(1,'dragon', 7.6),(2,'scorpion', 6.4),(3,'butterfly', 3.3)
SELECT * FROM Test

DELETE FROM Test
WHERE ID = 1
SELECT * FROM Test

--The TRUNCATE TABLE command deletes the data inside a table, but not the table itself.
TRUNCATE TABLE Test
SELECT * FROM Test

--The DROP TABLE command deletes a table in the database.
DROP TABLE Test

--6
ALTER TABLE Employees
ALTER COLUMN [Name] VARCHAR(100)

--7
ALTER TABLE Employees
ADD Department VARCHAR(50)
SELECT * FROM Employees

--8
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT

--9
CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
	)
--10
TRUNCATE TABLE Employees

--Intermediate level

--11
CREATE TABLE TempDep(ID INT, DepName VARCHAR(50))
INSERT INTO TempDep(ID, DepName)
VALUES	(1,'HR'),
		(2,'Marketing'),
		(3,'Accounting'),
		(4, 'Finance'),
		(5,'Developers')

Select * from TempDep



INSERT INTO Departments(DepartmentID, DepartmentName)
SELECT ID, DepName FROM TempDep

SELECT * FROM Employees

--12
INSERT INTO Employees(EmpID,[Name],Salary,Department)
VALUES
	(1, 'Alice', 7000, 'HR'),
	(2, 'Bob',10000, 'Developers'),
	(3, 'Nick', 3000, 'Accounting'),
	(4, 'Diana', 5500, 'Marketing'),
	(5, 'Robert',6000, 'RD'),
	(6, 'Chris', 2000, 'Service')
	
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000

select * from Employees

--13
TRUNCATE TABLE Employees

--14
ALTER TABLE Employees
DROP COLUMN Department

--15
EXEC sp_rename 'dbo.Employees','StaffMembers'

--16
DROP TABLE Departments

--Advanced level
--17, 18
CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
	[Product Name] VARCHAR(50),
	Category VARCHAR(50),
	Price DECIMAL(10,2) CHECK (Price > 0),
	Quantity INT
	)
	

--19
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50

--20
exec sp_rename 'dbo.Products.Category', 'ProductCategory', 'column'
	Select * from Products


--21
INSERT INTO Products(ProductID,[Product Name],ProductCategory,Price,Quantity)
VALUES (1,'Lenovo', 'Laptops', 899,10),
		(2,'iWatch', 'Watches', 500,10),
		(3,'iPhone 16', 'Smartphones', 1100,10),
		(4,'Headphone', 'Accessories', 190,10),
		(5,'Mouse', 'Accessories', 50,10)
--22
SELECT * INTO Products_Backup 
FROM Products
Select * from Products_Backup

--23
exec sp_rename 'dbo.Products','Inventory'
Select * from Inventory
--24
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT

--25
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5)

