
/*  
An SQL JOIN clause is used to combine rows from two or more tables, 
based on a common field between them.
----------------
INNER JOIN
Returns all rows when there is at least one match in Both tables
----------------
LEFT JOIN
Returns all rows from the left table, and the matched rows from the right table
----------------
RIGHT JOIN
Returns all rows from the right table, and the matched rows from the left table
----------------
FULL JOIN
Returns all rows when there is a match in ONE of the tables

----------------
UNION operator

The UNION operator is used to combine the result-set of two or more select statements.


*/

-- 1.  INNer Join

select orders.orderid, customers.CompanyName, orders.OrderDate
from orders
inner join customers
on orders.CustomerID=customers.CustomerID


-- 2.  Left Join

select customers.ContactName, orders.OrderID
from Customers
left join orders
on Customers.CustomerID = Orders.CustomerID
order by customers.ContactName

-- 3.  right join
-- The result is NULL in the left side when there is no match.

select orders.OrderID, customers.ContactName
from orders
right join customers
on orders.CustomerID = customers.CustomerID
order by orders.OrderID
-- To select only the rows where the 'orderID' is null. 
-- Use a where clause to filter the results. 
select orders.OrderID, customers.ContactName
from orders
right join customers
on orders.CustomerID = customers.CustomerID
where orders.orderid is null

-- 4.  Full join
-- combines the result of both left and right joins

select customers.ContactName, orders.OrderID
from customers
full outer join orders
on customers.CustomerID = orders.CustomerID
order by Customers.ContactName


SELECT customers.ContactName, orders.OrderID
FROM customers
FULL OUTER JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE customers.ContactName IS NULL OR orders.OrderID IS NULL
ORDER BY customers.ContactName;


--- 5.  Union
select city from Customers

select city from customers
union all
select city from Suppliers
order by city
--- Note:  this will list all the city names includes duplicate from both the tables.

/*  Group by 
The SQL GROUP BY Statement
The GROUP BY statement groups rows that have the same values into summary rows, 
like "find the number of customers in each country".

The GROUP BY statement is often used with aggregate functions
(COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

*/

SELECT COUNT(CustomerID) as [Number Of Customers], Country
FROM Customers
GROUP BY Country;

select CustomerID, Country from Customers

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;


/* Having 
The SQL HAVING Clause
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
*/
-- The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

/* 

The SQL EXISTS Operator
The EXISTS operator is used to test for the existence of any record in a subquery.

The EXISTS operator returns TRUE if the subquery returns one or more records.
*/

-- The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:
SELECT suppliers.CompanyName
FROM Suppliers
WHERE EXISTS 
	(SELECT ProductName 
	FROM Products 
	WHERE Products.SupplierID = Suppliers.supplierID AND Products.UnitPrice< 20);

	 

/* select into 

The SELECT INTO statement copies data from one table into a new table.
*/
-- -- The following SQL statement creates a backup copy of Customers:

SELECT * INTO CustomersBackup2017
FROM Customers;


