# Northwind Database Exercise Soluations

Consider the Northwind database whose schema is given in Figure 1. This database contains information of orders placed by customerS. For every order the detail is given of what products were sold, for what unit price and in what quantity. The employee that secured the order is recorded as well as the date in which the order was inserted. For customers the city they live in etC. is recorded, and for employees their salesdistrict. For this database, create queries to generate the following reports:


1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
```sql
SELECT category_name, description FROM categories ORDER BY category_name;
```

2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
```sql
SELECT contact_name, company_name, contact_title, phone From customers ORDER BY phone;
```

3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.
```sql
SELECT UPPER(first_name) AS first_name, UPPER( last_name) AS last_name, hire_date FROM employees ORDER BY hire_date;
```

4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
```sql
SELECT order_id, order_date, shipped_date, customer_id, freight FROM orders ORDER BY freight Desc LIMIT 10;
```
5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
```sql
SELECT lower(customer_id) AS ID FROM customers;
```
6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
```sql
SELECT company_name, fax, phone,country, homepage FROM suppliers ORDER BY country DESC, company_name ;
```
7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
```sql
SELECT company_name,contact_name FROM customers WHERE city = 'Buenos Aires';
```
8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
```sql
SELECT product_name, unit_price, quantity_per_unit FROM products WHERE discontinued = 1;
```
9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
```sql
SELECT contact_name, Address, city FROM customers WHERE country NOT IN ('Germany','Mexico', 'Spain');
```
10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
```sql
SELECT order_date, shipped_date, customer_id, freight FROM orders WHERE order_date = '1996-05-21 ';
```
11. Create a report showing FirstName, LastName, Country from the employees not from United States.
```sql
SELECT first_name,last_name,country FROM employees WHERE country <> 'USA';
```
12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
```sql
SELECT employee_id,order_id,customer_id,required_date,shipped_date FROM orders WHERE shipped_date > required_date;
```
13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
```sql
SELECT city,company_name,contact_name FROM customers WHERE city LIKE 'A%' OR city LIKE 'B%';
```
14. Create a report showing all the even numbers of OrderID from the orders table.
```sql
SELECT order_id FROM orders WHERE mod(order_id,2)=0;
```
15. Create a report that shows all the orders where the freight cost more than $500.
```sql
SELECT * FROM orders WHERE freight > 500;
```
16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
```sql
SELECT product_name, units_in_stock,units_on_order,reorder_level FROM products WHERE reorder_level = 0;
```
17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
```sql
SELECT company_name,contact_name,fax FROM customers WHERE fax IS NOT NULL;
```
18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
```sql
SELECT first_name, last_name FROM employees WHERE reports_to IS NULL;
```
19. Create a report showing all the odd numbers of OrderID from the orders table.
```sql
SELECT order_id FROM orders WHERE mod(order_id,2)=1;
```
20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
```sql
SELECT company_name,contact_name,fax FROM customers WHERE fax IS NOT NULL ORDER BY contact_name;
```
21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
```sql
SELECT city,company_name,contact_name,city FROM customers WHERE city LIKE '%L%' ORDER BY contact_name;
```
22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
```sql
SELECT first_name, last_name,birth_date FROM employees where birth_date >= '1950-01-01' AND birth_date < '1960-01-01';
OR

SELECT first_name, last_name,birth_date FROM employees where birth_date Between '1950-01-01' AND '1959-12-31';
```
23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
 ```sql
SELECT last_name, first_name, extract(year from birth_date) AS birth_year FROM employees;
```
24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in   descending order. 
-- HINT: you will need to use a Groupby statement.
 ```sql
SELECT order_id, count(order_id) as number_of_orders FROM northwind.`order details` GROUP BY order_id ORDER BY number_of_orders DESC ;
```
25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
```sql
SELECT s.supplier_id, p.product_name, S.company_name FROM suppliers s JOIN products p ON s.supplier_id = p.supplier_id WHERE s.company_name IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux') ORDER BY s.supplier_id;
```
26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
```sql
SELECT ship_postal_code, order_id, order_date, required_date, shipped_date,ship_address FROM orders WHERE ship_postal_code = '98124';
```
27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
```sql
SELECT contact_name, contact_title, company_name FROM customers WHERE contact_title NOT LIKE '%Sales%';
```
28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";
```sql
SELECT last_name, first_name, city FROM employees WHERE city != 'Seattle';
```
29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
```sql
SELECT company_name, contact_title, city, country FROM customers WHERE country IN ('Mexico','Spain') AND city <> 'Madrid';
```
30. Create a 
SELECT statement that outputs the following:

|stringoutput|
|-------------|
|"first_name last_name can be reached at x extension"  |

```sql
SELECT CONCAT( first_name,' ', last_name ,' can be reached at ', 'x',extension ) AS contact_info FROM employees;
```
31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
```sql
SELECT contact_name FROM customers where contact_name NOT like '_A%';
```
32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
```sql
SELECT round (avg (unit_price),0) AS average_price, SUM(units_in_stock) AS total_stock, max(units_on_order) as max_order FROM products;
```
33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.
```sql
SELECT s.supplier_id, s.company_name, c.category_name, p.product_name, p.unit_price FROM products p JOIN suppliers s ON s.supplier_id = p.supplier_id JOIN categories C On c.category_id = p.category_id;
```
34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. 
-- HINT: you will need to use a Groupby and a Having statement.

```sql
SELECT customer_id, sum(freight) 
FROM orders 
GROUP BY customer_id 
HAVING sum(freight) > '200';
```
35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on  every purchase.

```sql
SELECT od.order_id, c.contact_name,od.unit_price,od.quantity,od.Discount FROM order_details od JOIN orders o ON od.order_id = o.order_id 
JOIN customers c ON c.customer_id = o.customer_id 
WHERE od.Discount != '0';
```
36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the  employees table sorted by Employee ID. 
-- HINT: This is a SelfJoin.


```sql
SELECT a.employee_id
, CONCAT (a.last_name, ' ' ,a.first_name ) as employee
, CONCAT (b.last_name,' ' , b.first_name ) as manager 
FROM employees a LEFT JOIN employees b ON b.employee_id = a.reports_to 
ORDER BY a.employee_id;
```
37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.

```sql
SELECT product_name
, avg(unit_price)::NUMERIC(5,2) AS average_price
, min(unit_price)AS minimum_price
, max(unit_price)AS MaximumPrice
FROM products
GROUP BY products.product_name
HAVING unit_price > ;
```
38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate,  ShippedDate from the customers and orders table. 
-- HINT: Create a View.


```sql
CREATE VIEW customer_info AS 
SELECT c.customer_id, c.company_name, c.contact_name, c.contact_title, c.Address, c.city,c.country,c.phone,o.order_date, o.required_date, o.shipped_date FROM customers c JOIN orders o ON c.customer_id = o.customer_id;
```
39. Change the name of the view you created from customerinfo to customer details.
```sql
ALTER VIEW customer_info RENAME TO  customer_details;
```
40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock,  UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. 
-- HINT: Create a View
```sql
CREATE VIEW product_details AS 
SELECT p.product_id,S.company_name, p.product_name,c.category_name, c.description, quantity_per_unit, p.unit_price, p.units_in_stock, p.units_on_order, p.reorder_level, p.discontinued 
FROM suppliers s JOIN products p ON s.supplier_id = p.supplier_id JOIN categories c ON c.category_id = p.category_id;
```
41. Drop the customer details view.
```sql
DROP VIEW IF EXISTS customer_details;

42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
```sql
SELECT substring(category_name,1,5) as Short_info FROM categories;
```
43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table 
-- HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.
```sql
DROP table IF exists shippers_dup;

CREATE TABLE shippers_dup (LIKE shippers);
INSERT INTO shippers_dup ```sql
SELECT * FROM shippers;
```
44. Create a 

SELECT statement that outputs the following from the shippers_duplicate Table: Create a report that shows the CompanyName and ProductName from all  product in the Seafood category.

|"shipper_id" | "company_name"	         |"phone"	                 |"email"                       |
|-------------|-------------|----|---|
|1	         |"Speedy Express"	         |"(503) 555-9831"	         |"speedyexpress@gmail.com"     |
|2	         |"United Package"	         |"(503) 555-3199"	         |"unitedpackage@gmail.com"     |
|3	         |"Federal Shipping"	     |"(503) 555-9931"	         |"federalshipping@gmail.com"   |


```sql
ALTER TABLE shippers_dup ADD column email VARCHAR(50);
UPDATE shippers_dup SET email ='speedyexpress@gmail.com' WHERE shipper_id = '1';
UPDATE shippers_dup SET email ='unitedpackage@gmail.com' WHERE shipper_id = '2';
UPDATE shippers_dup SET email ='federalshipping@gmail.com' WHERE shipper_id = '3';
```
45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
```sql
SELECT s.company_name,p.product_name FROM categories c JOIN products p ON c.category_id = p.category_id JOIN suppliers s ON s.supplier_id = p.supplier_id WHERE category_name = 'Seafood';
```
46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
```sql
SELECT c.category_id, s.company_name, p.product_name FROM categories c JOIN products p ON c.category_id = p.category_id JOIN suppliers s ON s.supplier_id = p.supplier_id WHERE c.category_id = '5';
```
47. Delete the shippers_duplicate table.
```sql
DROP table IF exists shippers_dup;
```
48. Create a 

SELECT statement that ouputs the following from the employees table.

 | last_name | first_name | title | age |
 |----|----|----|----|
 
 > NB: The age might differ depending on the year you are attempting this query.

```sql
SELECT last_name, first_name, Title, birth_date, DATE_PART('YEAR',CURRENT_DATE)- DATE_PART('YEAR', birth_date) AS Age
AGE(birth_date) AS Age,
AGE(CURRENT_DATE, birth_date) AS Age 
FROM employees;
```
49. Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
```sql
SELECT c.company_name, count(c.customer_id) AS number_of_orders FROM customers c JOIN orders o ON o.customer_id = c.customer_id WHERE o.order_date >= '1994-12-31' GROUP BY c.customer_id having count(c.customer_id) > 10;
```
50. Create a 

SELECT statement that ouputs the following from the product table
|                            "productinfo"                                |
|-------------------------------------------------------------------------|
| "Chai weighs/is 10 boxes x 30 bags and cost $18"                        |
| "Chang weighs/is 24 - 12 oz bottles and cost $19"                       |
| "Aniseed Syrup weighs/is 12 - 550 ml bottles and cost $10"              |

```sql
SELECT CONCAT( product_name,' ', 'weighs/is' ,' ', quantity_per_unit, ' ', 'and cost ','$',ROUND(unit_price) ) AS ProductInfo FROM products;

```