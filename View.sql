use [View]

CREATE TABLE Customer ( 
CustomerID INT PRIMARY KEY, 
FullName NVARCHAR(100), 
Email NVARCHAR(100), 
Phone NVARCHAR(15), 
SSN CHAR(9) 
); 
CREATE TABLE Account ( 
    AccountID INT PRIMARY KEY, 
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), 
    Balance DECIMAL(10, 2), 
    AccountType VARCHAR(50), 
    Status VARCHAR(20) 
); 
 
CREATE TABLE [Transaction] ( 
    TransactionID INT PRIMARY KEY, 
    AccountID INT FOREIGN KEY REFERENCES Account(AccountID), 
    Amount DECIMAL(10, 2), 
    Type VARCHAR(10), -- Deposit, Withdraw 
    TransactionDate DATETIME 
); 
 
CREATE TABLE Loan ( 
    LoanID INT PRIMARY KEY, 
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), 
    LoanAmount DECIMAL(12, 2), 
    LoanType VARCHAR(50), 
    Status VARCHAR(20) 
); 

------------------------------------------------------------Part 1: Research & Documentation
--1.1 Standard View
	--What is it?
		--A standard view is a virtual table based on the result set of a SELECT query. It does not store data physically but retrieves data dynamically from the base tables when queried.

	--Key Differences:
		--1-No data storage — purely virtual.
		--2-Does not improve performance directly.

	--Use Case (Banking):
		--A Customer Service View showing CustomerName, Phone, and AccountStatus while hiding sensitive fields like SSN.

	--Limitations & Performance:
		--Can't have ORDER BY unless used with TOP.
		--No indexing — slower with large base tables.

--1.2 Indexed View (Materialized View)
	--What is it?
		--A view that is physically stored on disk with a unique clustered index. Also known as materialized view.

	--Key Differences:
		--1.Stores data physically.
		--2.Improves performance for complex aggregations or joins.
		--3.Requires SCHEMABINDING.

	--Use Case (E-commerce):
		--A precomputed view for product sales summaries to improve dashboard performance.

	--Limitations & Performance:
		--1.High storage overhead.
		--2.Must follow strict rules (e.g., no outer joins, no TOP, DISTINCT, etc.).
		--2.Slower write operations due to view maintenance.

--1.3 Partitioned View (Union View)
	--What is it?
		--A view that combines rows from multiple tables (typically across partitions) using UNION ALL.

	--Key Differences:
		--Used for horizontal partitioning.
		--Can support distributed databases.

	--Use Case (University):
		--A view combining student records from multiple campuses or academic years.
		--Limitations & Performance:
		--Manual partitioning needed.
		--Can affect performance if improperly used without check constraints.


------------------------------------------------------------Part 2: Real-Life Implementation Task (Banking System) 
-- Insert into Customer
INSERT INTO Customer VALUES (1, 'John Doe', 'john@example.com', '555-1234', '123456789');

-- Insert into Account
INSERT INTO Account VALUES (1001, 1, 5000.00, 'Savings', 'Active');

-- Insert into [Transaction]
INSERT INTO [Transaction] VALUES (2001, 1001, 250.00, 'Deposit', GETDATE());

-- Insert into Loan
INSERT INTO Loan VALUES (3001, 1, 10000.00, 'Personal', 'Approved');

