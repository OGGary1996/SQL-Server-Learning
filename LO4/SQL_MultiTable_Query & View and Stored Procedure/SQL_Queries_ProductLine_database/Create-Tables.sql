CREATE TABLE ProductLine(
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TextDescription nvarchar(250) NOT NULL,
	HTMLDescription nvarchar(500) NOT NULL,
	Image nvarchar(250) NOT NULL
);


CREATE TABLE Product(
	Code int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ProductLineID int NOT NULL,
	Name nvarchar(50) NOT NULL,
	Vendor nvarchar(75) NOT NULL,
	Description nvarchar(250),
	Quantity int NOT NULL,
	BuyPrice money NOT NULL,
	MSRP money NOT NULL,
	CONSTRAINT FK_ProductLineID_Product FOREIGN KEY (ProductLineID) REFERENCES ProductLine (ID)
);

CREATE TABLE Office(
	OfficeCode int IDENTITY(1000,1) PRIMARY KEY,
	Address1 nvarchar(250) NOT NULL,
	Address2 nvarchar(250),
	City nvarchar(250) NOT NULL,
	PostalCode char(7) NOT NULL,
	Phone nvarchar(20)
);


CREATE TABLE Employee(
	SalesRepEmpNo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	OfficeCode int NOT NULL,
	ReportsTo int NULL,
	FirstName nvarchar(75) NOT NULL,
	LastName nvarchar(75) NOT NULL,
	Email nvarchar(75) NOT NULL,
	Title nvarchar(75) NOT NULL,
	DeskPhoneNo nvarchar(20),
	CellPhoneNo nvarchar(20),
	CONSTRAINT FK_OfficeCode_Office FOREIGN KEY (OfficeCode) REFERENCES Office (OfficeCode),
	CONSTRAINT FK_ReportsTo_Emp FOREIGN KEY (ReportsTo) REFERENCES Employee(SalesRepEmpNo)
);


CREATE TABLE Customer(
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SalesRepEmpNo int NOT NULL,
	FirstName nvarchar(75) NOT NULL,
	LastName nvarchar(75) NOT NULL,
	Phone nvarchar(75) NOT NULL,
	Address1 nvarchar(250) NOT NULL,
	Address2 nvarchar(250),
	City nvarchar(250) NOT NULL,
	Province char(2) NOT NULL,
	PostalCode char(7) NOT NULL,
	CreditLimit money,
	CONSTRAINT FK_SalesRepEmpNo_Emp FOREIGN KEY (SalesRepEmpNo) REFERENCES Employee (SalesRepEmpNo)
);


CREATE TABLE Payment(
	ChequeNo nvarchar(50) NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL,
	PaymentDate date NOT NULL,
	Amount money,
	CONSTRAINT FK_CustomerID_Cust FOREIGN KEY (CustomerID) REFERENCES Customer (ID)
);

CREATE TABLE Orders(
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL,
	OrderDate date NOT NULL,
	RequiredDate date,
	Shipped date NOT NULL,
	Status int,
	Comments nvarchar(250),
	CONSTRAINT FK_CustomerID_Ord FOREIGN KEY (CustomerID) REFERENCES Customer (ID)
);


CREATE TABLE Order_Product(
	ID int IDENTITY(1,1) NOT NULL,
	OrderID int NOT NULL,
	ProductCode int NOT NULL,
	Quantity int NOT NULL,
	PriceEach money NOT NULL,
	PRIMARY KEY (ID, OrderID, ProductCode),
	CONSTRAINT FK_Order_ID_OrdProd FOREIGN KEY (OrderID) REFERENCES Orders(ID),
	CONSTRAINT FK_ProductCode_OrdProd FOREIGN KEY (ProductCode) REFERENCES Product (Code)
);