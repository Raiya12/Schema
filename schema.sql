use [ Schema]

CREATE TABLE Employee ( 
EmployeeID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Position VARCHAR(50), 
HireDate DATE 
); 
CREATE TABLE Trainer ( 
    TrainerID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Specialization VARCHAR(100) 
); 
 
CREATE TABLE Attendance ( 
    AttendanceID INT PRIMARY KEY, 
    EmployeeID INT, 
    Date DATE, 
    Status VARCHAR(20) 
); 
CREATE TABLE Course ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(100), 
    DurationWeeks INT 
); 
 
CREATE TABLE Batch ( 
    BatchID INT PRIMARY KEY, 
    CourseID INT, 
    StartDate DATE, 
    EndDate DATE 
); 

CREATE TABLE Exam ( 
    ExamID INT PRIMARY KEY, 
    CourseID INT, 
    ExamDate DATE 
); 
 
CREATE TABLE Result ( 
    ResultID INT PRIMARY KEY, 
    ExamID INT, 
    EmployeeID INT, 
    Score INT 
); 
CREATE TABLE Client ( 
    ClientID INT PRIMARY KEY, 
    ClientName VARCHAR(100), 
    ContactPerson VARCHAR(100) 
); 
CREATE TABLE Contract ( 
    ContractID INT PRIMARY KEY, 
    ClientID INT, 
    StartDate DATE, 
    EndDate DATE, 
    TotalValue DECIMAL(10,2) 
); 
 
CREATE TABLE Payment ( 
PaymentID INT PRIMARY KEY, 
ContractID INT, 
PaymentDate DATE, 
Amount DECIMAL(10,2) 
); 

INSERT INTO dbo.Employee VALUES (1, 'Ali Al-Harthy', 'Admin', '2022-01-15'); 
INSERT INTO dbo.Trainer VALUES (101, 'Salim Al-Nabhani', 'Databases'); 
INSERT INTO dbo.Attendance VALUES (1001, 1, '2024-12-10', 'Present'); ------------------------------------------------------------------------------------------------------------------- 
INSERT INTO dbo.Course VALUES (201, 'SQL Fundamentals', 4); 
INSERT INTO dbo.Batch VALUES (301, 201, '2025-01-10', '2025-02-07'); 
INSERT INTO dbo.Exam VALUES (401, 201, '2025-02-10'); 
INSERT INTO dbo.Result VALUES (501, 401, 1, 87); ------------------------------------------------------------------------------------------------------------------ 
INSERT INTO dbo.Client VALUES (601, 'TechCorp LLC', 'Hassan Said'); 
INSERT INTO dbo.Contract VALUES (701, 601, '2025-01-01', '2025-12-31', 10000.00); 
INSERT INTO dbo.Payment VALUES (801, 701, '2025-02-01', 2000.00);

-----------------------------------Part 1:
--Q1: What is a schema in SQL Server?
	--A schema in SQL Server is a logical container that holds database objects like tables, views, procedures, etc. It helps organize objects and manage permissions efficiently.

--Q2: How is a schema different from a database?
	--A database is a complete collection of data and objects.
	--A schema is a subset within a database used to logically group related objects.

--Q3: List at least two benefits of using schemas in real applications.
	--Organizational Clarity: Schemas group related objects, making it easier to understand and manage large databases.
	--Security Management: Permissions can be granted at the schema level, simplifying access control.

--Q4: Can different schemas have the same table name?
	--Yes. Tables in different schemas can have the same name since schema + table name makes the object name unique (e.g., HR.Employee vs Sales.Employee).

-----------------------------------Part 2:

--| Department       | Schema      | Tables Managed                      |
--| ---------------- | ----------- | ----------------------------------- |
--| Human Resources  | `HR`        | `Employee`, `Trainer`, `Attendance` |
--| Academic Affairs | `Academics` | `Course`, `Batch`, `Exam`, `Result` |
--| Business/Sales   | `Sales`     | `Client`, `Contract`, `Payment`     |

-----------------------------------Part 3:
CREATE SCHEMA HR;
CREATE SCHEMA Academics;
CREATE SCHEMA Sales;

-----------------------------------Part 4 & 5:
-- HR Schema
ALTER SCHEMA HR TRANSFER dbo.Employee;
ALTER SCHEMA HR TRANSFER dbo.Trainer;
ALTER SCHEMA HR TRANSFER dbo.Attendance;

-- Academics Schema
ALTER SCHEMA Academics TRANSFER dbo.Course;
ALTER SCHEMA Academics TRANSFER dbo.Batch;
ALTER SCHEMA Academics TRANSFER dbo.Exam;
ALTER SCHEMA Academics TRANSFER dbo.Result;

-- Sales Schema
ALTER SCHEMA Sales TRANSFER dbo.Client;
ALTER SCHEMA Sales TRANSFER dbo.Contract;
ALTER SCHEMA Sales TRANSFER dbo.Payment;



