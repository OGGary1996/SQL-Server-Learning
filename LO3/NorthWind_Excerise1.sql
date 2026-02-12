-- Query 1: select only the DISTINCT values from the "City" column in the "Customers" table
SELECT DISTINCT City FROM Customers;

-- Query 2: selects all the customers from the City "Paris", in the "Customers" table
SELECT * FROM Customers WHERE City = 'Paris';

-- Query 3: selects the columns ('CustomerID', 'City', 'ContactName') of all customers from the "Customers" table, sorted by the "City" column
SELECT CustomerID, City, ContactName FROM Customers ORDER BY City;

-- Query 4: Select all customers from London that 'ContactName' starts with the letter 'A'
SELECT * FROM Customers WHERE City = 'London' AND ContactName LIKE 'A%';

-- Query 5: insert a new record, but only insert data in the "CustomerID", "CompanyName", and "Country" columns
INSERT INTO Customers (CustomerID, CompanyName, Country) VALUES ('abc', 'New Company', 'New Country');

-- Query 6: lists ( CustomerID, CompanyName, Address) of all customers with a NULL value in the "Address" field
SELECT CustomerID, CompanyName, Address FROM Customers WHERE Address IS NULL;

-- Query 7: updates the customer (CustomerID = 'abc') with a new 'contactName' and a new 'address'
UPDATE Customers SET ContactName = 'New Contact', Address = 'New Address' WHERE CustomerID = 'abc';

-- Query 8: select the customer that customerID ='abc'
SELECT * FROM Customers WHERE CustomerID = 'abc';

-- Query 9: Find the lowest and highest 'unitprice' as 'Lowest Price' and 'Highest Price' respectively, from table [Order Details]
SELECT MIN(unitprice) AS 'Lowest Price', MAX(unitprice) AS 'Highest Price' FROM [Order Details];

-- Query 10: Find the number of orders (orderID) where 'unitPrice' is higher than 20 from table [Order Details]
SELECT COUNT(orderID) FROM [Order Details] WHERE unitprice > 20;

-- Query 11: select the columns ( CustomerID, CompanyName, Address, City) from the table 'customers' that 'CompanyName' contains the pattern 'on'
SELECT CustomerID, CompanyName, Address, City FROM Customers WHERE CompanyName LIKE '%on%';

-- Query 12: select all orders with a unitprice between 10 and 20 from table [Order details]
SELECT * FROM [Order Details] WHERE unitprice BETWEEN 10 AND 20;

