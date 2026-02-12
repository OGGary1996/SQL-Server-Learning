/* 
Exercise 
-------------------
1. Write a SQL query to retrieve a list of all products with their associated categories and suppliers.
--- output: Products.ProductName, Categories.CategoryName, Suppliers.CompanyName
*/


-- 2. Create a query that lists customers who have placed orders in a specific country. Include customer details and order details.
-- output: Customers.CompanyName, Customers.ContactName, Orders.OrderID, Orders.OrderDate
-- condition: Country = 'Norway'


/*  
3. Create a view named ProductSummary that displays the product name, category name, supplier name, and unit price for all products.


*/


-- 4. Write a query to retrieve the top 10 most expensive products from the ProductSummary view.



-- 5. Create a stored procedure named GetOrdersByEmployee that takes an @EmployeeID parameter and returns a list of orders placed by that employee, including order details.
-- output: Orders.OrderID, Orders.OrderDate, Customers.CompanyName



---6. execute the GetOrdersByEmployee stored procedure with a specific employee ID


-- 7. Modify the GetProductsByCategoryAndPrice stored procedure to include an additional @MaxPrice parameter, allowing users to filter products by a price range.








