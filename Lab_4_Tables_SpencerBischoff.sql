CREATE DATABASE Lab_4_SpencerBischoff

USE Lab_4_SpencerBischoff;


CREATE TABLE Customers 
(CustomerID			SMALLINT NOT NULL IDENTITY(1,1),
FirstName			VARCHAR(25) NOT NULL,
MiddleName			VARCHAR(25) DEFAULT NULL,
LastName			VARCHAR(25) NOT NULL,
StreetAddress		VARCHAR(35) NOT NULL,
City				VARCHAR(25) NOT NULL,
[State]				CHAR(2) NOT NULL,
ZipCode				VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Customers_CustomerID PRIMARY KEY (CustomerID)
);

DROP TABLE IF EXISTS CustomerEmails;
CREATE TABLE CustomerEmails
( CustomerID			SMALLINT NOT NULL,
  EmailAddress			VARCHAR(254) NOT NULL,
  PrimaryEmailFlag		CHAR(1) NOT NULL DEFAULT 'Y',
	 CONSTRAINT PK_CustomerEmails_CustomerID_EmailAddress PRIMARY KEY ( CustomerID, EmailAddress ),
	 CONSTRAINT FK_CustomerEmails_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID ),
	 CONSTRAINT CHECK_CustomerEmails_PrimaryEmailFlag CHECK ( PrimaryEmailFlag IN ( 'Y', 'N' ) ),
);

-- Create the Employees table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(EmployeeID		SMALLINT NOT NULL IDENTITY (1,1),
[SSN]				SMALLINT NOT NULL,
FirstName			VARCHAR(30) NOT NULL,
MiddleName			VARCHAR(30) DEFAULT NULL,
LastName			VARCHAR(30) NOT NULL,
StreetAddress		VARCHAR(35) NOT NULL,
City				VARCHAR(30) NOT NULL,
[State]				CHAR(2) NOT NULL,
ZipCode				VARCHAR(10) NOT NULL,
Title				VARCHAR(25) NOT NULL,
Salary				DECIMAL(8,2) NOT NULL,
	CONSTRAINT PK_EmployeeID PRIMARY KEY ( EmployeeID )
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(OrderID			INT NOT NULL IDENTITY (1,1),
EmployeeID			SMALLINT NOT NULL,
CustomerID			SMALLINT NOT NULL,
OrderDate			DATE NOT NULL,
OrderTime			TIME NOT NULL,
	CONSTRAINT PK_Orders_OrderID PRIMARY KEY ( OrderID ),
	CONSTRAINT FK_Orders_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employees ( EmployeeID ),
	CONSTRAINT FK_Orders_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID )
);

DROP TABLE IF EXISTS Statuses;
CREATE TABLE Statuses
( StatusID			TINYINT NOT NULL IDENTITY (1,1),
StatusName			VARCHAR(25) NOT NULL,
StatusDescription	VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Statuses_StatusID PRIMARY KEY ( StatusID )
);

DROP TABLE IF EXISTS OrderStatuses;
CREATE TABLE OrderStatuses
( OrderID			INT NOT NULL,
StatusID			TINYINT NOT NULL,
StatusDate			DATE NOT NULL,
StatusTime			TIME NOT NULL,
	CONSTRAINT PK_OrderStatuses_OrderID_StatusID PRIMARY KEY ( OrderID, StatusID ),
	CONSTRAINT FK_OrderStatuses_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID ),
	CONSTRAINT FK_OrderStatuses_StatusID FOREIGN KEY ( StatusID ) REFERENCES Statuses ( StatusID )
);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(EmployeeID			SMALLINT NOT NULL IDENTITY(1,1), 
SSN					SMALLINT NOT NULL,
FirstName			VARCHAR(25) NOT NULL,
MiddleName			VARCHAR(25) DEFAULT NULL,
LastName			VARCHAR(25) NOT NULL,
StreetAddress		VARCHAR(35) NOT NULL,
City				VARCHAR(25) NOT NULL,
[State]				CHAR(2) NOT NULL,
ZipCode				VARCHAR(10) NOT NULL,
Title				VARCHAR(35) NOT NULL,
Salary				VARCHAR(7) NOT NULL,
	CONSTRAINT PK_Employees_EmployeeID_SSN PRIMARY KEY ( EmployeeID, SSN )
);

DROP TABLE IF EXISTS Dependents;
CREATE TABLE Dependents
(EmployeeID			SMALLINT NOT NULL IDENTITY(1,1),
DependentNumber		SMALLINT NOT NULL,
FirstName			VARCHAR(25) NOT NULL,
LastName			VARCHAR(25) NOT NULL,
BirthDate			DATE NOT NULL,
SSN					SMALLINT NOT NULL,
	CONSTRAINT PK_Dependents_EmployeeID_DependentNumber PRIMARY KEY ( EmployeeID, DependentNumber ),
	CONSTRAINT FK_Dependents_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employees ( EmployeeID )
);

DROP TABLE IF EXISTS OrderLines;
CREATE TABLE OrderLines
(OrderID			INT NOT NULL,
ProductID			INT NOT NULL,
Price				INT NOT NULL,
Quantity			INT NOT NULL,
	CONSTRAINT PK_OrderLines_OrderID_ProductID PRIMARY KEY ( OrderID, ProductID ),
	CONSTRAINT FK_OrderLines_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID ) 
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products 
(ProductID			INT NOT NULL,
ProductName			VARCHAR(25) NOT NULL,
ProductDescription	VARCHAR(100) NOT NULL,
SalesPrice			INT NOT NULL,
InventoryOnHand		INT NOT NULL,
	CONSTRAINT PK_Products_ProductID PRIMARY KEY ( ProductID )
);

DROP TABLE IF EXISTS ProductPriceHistory;
CREATE TABLE ProductPriceHistory
(ProductID			INT NOT NULL,
PriceChangeDate		DATE NOT NULL,
SalesPrice			INT NOT NULL,
	CONSTRAINT PK_ProductPriceHistory_ProductID_PriceChangeDate PRIMARY KEY ( ProductID, PriceChangeDate ),
	CONSTRAINT FK_ProductPriceHistory_ProductID FOREIGN KEY ( ProductID ) REFERENCES Products ( ProductID )
);

DROP TABLE IF EXISTS Vendor;
CREATE TABLE Vendor
(VendorID			INT NOT NULL,
VendorName			VARCHAR(50) NOT NULL,
VendorDescription	VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Vendor_VendorID PRIMARY KEY ( VendorID )
);

DROP TABLE IF EXISTS ProductVendors;
CREATE TABLE ProductVendors
(ProductID			INT NOT NULL,
VendorID			INT NOT NULL,
UnitCost			INT NOT NULL,
	CONSTRAINT PK_ProductVendors_ProductID_VendorID PRIMARY KEY ( ProductID, VendorID),
	CONSTRAINT FK_ProductVendors_ProductID FOREIGN KEY (ProductID) REFERENCES Products ( ProductID ),
	CONSTRAINT FK_ProductVendors_VendorID FOREIGN KEY ( VendorID ) REFERENCES Vendor ( VendorID )
);
