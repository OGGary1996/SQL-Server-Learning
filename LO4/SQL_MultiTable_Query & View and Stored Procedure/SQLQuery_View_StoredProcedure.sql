


/*  Views
The view is a virtual table. It does not physically exist.
It is created by a query joining one or more tables.
A view contains rows and columns, just like a real table.
The fields in a view are fields from one or more real tables in the database
-----
Views can subset data in a table
Views can provide security and decrease complexity
They save space because only their definition is stored.

-----------
Efficiency: 
You can display data from multiple tables and not write the same queries over and over again.
Views can be used to reduce the complexity of the database schema.

Performance: You can cache the query a view uses, and you can even create something called an indexed view, which further improves speed.
Security: You can limit the amount of data certain users can see.
Less coding: Views reduce the amount of code you need to write and can be referenced in other queries using joins.


--------------

The syntax for dropping a VIEW:
DROP view view_name;
--------
Questions: Can you update the data in an view?
A view is created by joining one or more tables. When you update records in a view, it updates the records in the underlying tables that make up the View.

You can update the data in View providing you have the proper privileges to the underlying tables.

Question: Does the SQL View exist if the table is dropped from the database?
Yes, View continues to exist even after one of the tables is dropped from the database. However, if you try to query the View after the table has been dropped, you will receive a message indicating that the View has errors. 

Question:  What are the differences between a table and a view? When compared with a table we have the following differences between a table and view.

1. The table is physical and the view is logical.
2. A table is an independent object whereas view is a dependent object that is a view depends on a table or tables from which it is loading the data.
3. When a new table is created from an existing table the new and old tables are independent themselves that is the changes of one table will not be reflected into the other table whereas if a view is created based on a table any changes that are performed on the table reflects into the view and any changes performed on the view reflected in the table also.

Question:  Can we drop a table that has dependent views on it?

Yes, we can drop a table even if any dependent views are associated with it, but the views that are associated with it will not be dropped. They will still execute in the database only with the status as inactive object and all those views become active and start functioning provided the table is recreated.

Q: Can we create a view based on other views?
Yes, we can create a view based on other views. Usually, we create views based on tables, but it is also possible to create views based on views.

*/

Create view view_customer
As
select * from Customers

select  * from view_customer


Alter view view_customer
as 
select customerid, companyname
from Customers



/*
Q: Why do we need Views in SQL Server?

To protect the data. If we have a table containing sensitive data in certain columns, we might wish to hide those columns from certain groups of users. 
For instance, customer names, addresses, and social security numbers might all be stored in the same table; however, for lower-level employees like shipping clerks, you can create a view that only displays customer name and address. You can grant permissions to a view without allowing users to query the original tables.

A view is a logical table but what it stores internally is a select statement that is used for creating the view. So that whenever a user performs an operation on the view like select, insert, update or delete internally the view performs those operations on a table.

Simply we can say that view will act as an interface between the data provider (Table) and the User.

A view is created based on a table any changes that are performed on the table reflect into the view any changes performed on the view reflected in the table also.


*/
/*
What is a Stored Procedure?
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.
*/

CREATE PROCEDURE SelectAllCustomers1
AS
SELECT * FROM Customers


EXEC SelectAllCustomers1;


-- The following SQL statement creates a stored procedure that selects Customers from a particular City with a particular PostalCode from the "Customers" table:
CREATE PROCEDURE SelectAllCustomers2 
@City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers 
WHERE City = @City AND PostalCode = @PostalCode

-- Execute the stored procedure above as follows:
EXEC SelectAllCustomers2 @City = 'London',
@PostalCode = 'WA1 1DP';


/*
Stored Procedure and View are both database objects used in database management systems like SQL Server, Oracle, MySQL, and others. However, they serve different purposes and have distinct characteristics:

1. Purpose:
   - Stored Procedure: A stored procedure is a precompiled and pre-stored SQL code that can be executed on demand. It allows you to group multiple SQL statements into a single, reusable unit of work. 
   
     Stored procedures are typically used for complex data manipulation, business logic, and data validation. 
	 
	 They can also accept input parameters and return result sets or output parameters.

   - View: A view is a virtual table created by defining a SQL query. 
       Views are primarily used for simplifying complex queries, enforcing security, and providing a consistent interface to the data.

2. Data Storage:
   - Stored Procedure: Stores procedural logic and can perform operations on data, but it doesn't store data itself.

   - View: Does not store data; it presents data from one or more underlying tables in a readable format.


In summary, stored procedures are used for encapsulating and executing complex logic, while views are used for simplifying data access and ensuring data security. Both are valuable tools in database design and development, and their usage depends on the specific requirements of a given application.

*/

--- Stored Procedure with Parameters
USE Northwind;
GO

-- Create a stored procedure with parameters
CREATE PROCEDURE GetProductsByCategoryAndPrice1
    @CategoryName NVARCHAR(255),
    @MinPrice MONEY
AS
BEGIN
    SELECT Products.ProductName, Categories.CategoryName, Products.UnitPrice
    FROM Products
    INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
    WHERE Categories.CategoryName = @CategoryName
    AND Products.UnitPrice >= @MinPrice;
END;
GO


----

-- Execute the stored procedure with parameter values
EXEC GetProductsByCategoryAndPrice1 @CategoryName = 'Beverages', @MinPrice = 50.00;


/*
Defining Variables (Parameters):

To define variables (parameters) in a SQL Server stored procedure, you use the @ symbol followed by the variable name, followed by the data type.

In this case, 
  @CategoryName:  is defined as an NVARCHAR(255) 
  @MinPrice as MONEY. 
  
  These data types specify the type of data that the variables can hold. 
  NVARCHAR(255) is used for text (variable-length Unicode character string), 
  MONEY is used for representing currency values.
*/

--- Variables (parameters) in stored procedures are used to make the procedures more flexible and reusable because they allow you to pass values into the procedure when you call it, making it adaptable to various situations without having to modify the procedure's code.



-- Modify the stored procedure to include @MaxPrice parameter
ALTER PROCEDURE GetProductsByCategoryAndPrice1
    @CategoryName NVARCHAR(255),
    @MinPrice MONEY,
    @MaxPrice MONEY
AS
BEGIN
    -- SET NOCOUNT ON;

    SELECT Products.ProductName, Categories.CategoryName, Products.UnitPrice
    FROM Products
    INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
    WHERE Categories.CategoryName = @CategoryName
    AND Products.UnitPrice >= @MinPrice
    AND Products.UnitPrice <= @MaxPrice;
END;

-- Execute the modified stored procedure with three parameters
EXEC GetProductsByCategoryAndPrice1 @CategoryName = 'Beverages', @MinPrice = 10.00, @MaxPrice = 20.00;

