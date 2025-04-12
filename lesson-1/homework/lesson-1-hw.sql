--1.Define the following terms: data, database, relational database, and table.

--1)Data is a collection of facts, figures, or symbols that can be processed and interpreted to convey information
--2)Database is an organized collection of data that is stored and accessed electronically. It allows for efficient storage, retrieval, and management of data.
--3)Relational Database is a type of database that organizes data into one or more tables (or "relations") with rows and columns. Each table has a unique identifier (primary key), and tables can be linked using relationships (foreign keys)
--4)Table is a a structured format within a relational database that stores data in rows and columns. Each row is a record (or entry), and each column represents a field (or attribute) of the data.


--2.List five key features of SQL Server.
--1)SQL Server Database Engine
--2)SQL Server Database Engine
--3)Reporting Services
--4)Integration Services
--5)Master Data Services

--3.What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
--1) Windows authentication mode
--2) SQL server authentication
--3) Microsoft Entra MFA
--4) Microsoft Entra Password
--5) Microsoft Entra Integrated
--6) Microsoft Entra Service Principal
--7) Microsoft Entra Managed Identity
--8) Microsoft Entra Default

--4.Create a new database in SSMS named SchoolDB.
create database SchoolDB

--5.Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
use SchoolDB
create table Students(StudentID int Primary key, Name varchar(50), Age INT)
select * from Students

--6.Describe the differences between SQL Server, SSMS, and SQL.
/*
	SQL Server is a relational database management system developed by Microsoft. It is used to store, retrieve, and manage data in a structured way.
	It is the actual database engine that handles data storage, security, and processing queries.

	SSMS is an Integrated Development Environment (IDE) used to manage SQL Server instances. It provides a graphical interface for working with SQL Server.
	It allows to run SQL queries, create and manage databases, and perform administrative tasks like backups and security management.

	SQL is a programming language specifically designed for managing and querying relational databases.
	It allows you to create, read, update, and delete data in the database. It is also used for defining and modifying the structure of the data

	Thus, differences are SQL Server is a database engine that stores and process data, SSMS is a tool for interacting with SQL Server, while SQL is the language used 
	to communicate with relational databases including SQL Server.

*/

--7.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
/*
	In SQL, there are five main types of commands that serve different purposes in database management. These are categorized into DQL, DML, DDL, DCL, and TCL.

	DQL is used to query the database and retrieve data. It is focused on selecting and viewing the data from a database. Key Command: SELECT. For example:
	SELECT * FROM Students
	This command retrieves all records from the Students table.

	DML commands are used to manipulate the data in the database. These commands allow you to insert, update, and delete records.
	Key Commands: INSERT, UPDATE, DELETE. Example: 

	INSERT INTO Students (StudentID, Name, Age) 
	VALUES (1, 'Bobur', 20);

	DDL is used to define and manage the structure of the database. This includes creating, altering, and dropping tables and other database objects like indexes and schemas.
	Key Commands: CREATE, ALTER, DROP, TRUNCATE. Example:

	CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

	DCL commands are used to control access to data within the database. They are focused on granting or revoking permissions.Key Commands: GRANT, REVOKE Example:
	GRANT SELECT, INSERT ON Students TO User1;

	TCL commands manage the transactions in a database, ensuring that operations are performed in a safe and consistent manner. It is used to manage changes made by DML commands.
	Key Commands: COMMIT, ROLLBACK, SAVEPOINT. Example:
	COMMIT;
	
*/
--8.Write a query to insert three records into the Students table.
select * from Students
insert into Students values(1,'Bobur', 27)
insert into Students values(2,'Aziz', 30)
insert into Students values(3,'Bunyod', 22)

--9.Create a backup of your SchoolDB database and restore it. (write its steps to submit)
/*
	In order to backup the SchoolDB file it is required to do the following steps:
	1)Right-click on the SchoolDB database in Object Explorer.
	2)Choose Tasks → Back Up....
	3)Choose the backup destination and click ok
	Then we can go into chosen backup folder and look for SchoolDB.bak file

	For restoring file we need to
	1) Right-click on Databases in Object Explorer
	2)Choose restore database
	3)Choose file to be restored and click ok for further actions
*/
