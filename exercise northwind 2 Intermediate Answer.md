# Northwind Database Exercise Soluations
Consider the Northwind database whose schema is given in Figure 1. This database contains information of orders placed by customerS. For every order the detail is given of what products were sold, for what unit price and in what quantity. The employee that secured the order is recorded as well as the date in which the order was inserted. For customers the city they live in etC. is recorded, and for employees their salesdistrict. For this database, create queries to generate the following reports:


51. Select the number of product sales per category and country.



```sql
SELECT category_name,
	country,
	COUNT(*) AS COUNT
FROM order_details O,
	products P,
	categories C,
	suppliers S
WHERE O.product_id = P.product_id
	AND P.category_id = C.category_id
	AND P.supplier_id = S.supplier_id
GROUP BY category_name,
	country
ORDER BY category_name,
	COUNT(*) DESC, country
; 
```
 52. Create a report that shows the product name AND supplier id for all products supplied by Exotic Liquids, Grandma Kelly's Homestead, AND Tokyo TraderS.
 
```sql
SELECT S.supplier_id,
       S.company_name, 
       P.product_id, 
       P.product_name 
FROM suppliers S 
JOIN products P ON(S.supplier_id = P.supplier_id) 
AND S.company_name IN ('Grandma Kelly''s Homestead','Tokyo Traders', 'Exotic Liquids') 
;
```
53. Create a report that shows all products by name that are in the "Seafood" category. 







```sql
SELECT P.product_id, 
       P.product_name, 
       C.category_id, 
       C.category_name
FROM products P
JOIN categories C ON (P.category_id = C.category_id) 
WHERE C.category_name LIKE '%Seafood%'
;
```
54. Create a report that shows all companies by name that sell products in Category ID 8.
```sql
SELECT COUNT(company_name), 
       P.category_id, 
       S.company_name 
FROM products P JOIN suppliers S ON (P.supplier_id = S.supplier_id)
AND category_id = 8 
GROUP BY S.company_name,
	P.category_id
;
```
55. Create a report that shows all companies by name that sell products in the Seafood category.

```sql
SELECT S.company_name 
FROM suppliers S 
WHERE supplier_id IN 
		(SELECT P.supplier_id
			FROM products P
			JOIN categories C ON (C.category_id = P.category_id) AND C.category_name = 'Seafood')
;
```
56. Create a report showing the Order ID, the name of the company that placed the order, and the first AND last name of the associated employeE. Only show orders placed after January 1, 1998 that shipped after they were required. Sort by Company NamE.
 
```sql
SELECT O.order_id, 
       C.customer_id, 
       C.company_name,
	   E.first_name ||' ' || E.last_name
FROM orders O
JOIN customers C ON (C.customer_id = O.customer_id)
JOIN employees E ON (O.employee_id = E.employee_id)
WHERE O.order_date > '1-jan-1998' AND O.shipped_date > '1-jan-1998' AND O.required_date > '1-jan-1998' 
ORDER BY C.company_name 
;

57. Which products are provided by which supplierS.
```sql
SELECT P.product_name,
	S.company_name 
FROM products P
JOIN suppliers S ON (P.supplier_id = S.supplier_id)
;



```
58. Create a report that shows the order ids AND the associated employee names for orders that shipped after the required datE.
```sql
SELECT E.employee_id, 
       E.first_name, 
       O.order_id 
FROM employees E
JOIN orders O ON (O.employee_id = E.employee_id) 
WHERE O.shipped_date > O.required_date
;
```
59. Create a report that shows the total quantity of products (FROM the Order_Details table) ordered. Only show records for products for which the quantity ordered is fewer than 200.



```sql
SELECT P.product_name, 
       SUM(O.quantity) 
FROM products P
JOIN order_details O ON (P.product_id = O.product_id) 
GROUP BY P.product_name
HAVING SUM(O.quantity) < 200
;
```
60. Create a report that shows the total number of orders by Customer since December 31, 1996. The report should only return rows for which the number orders is greater than 15. The report should return the following 5 rowS.


```sql
SELECT C.company_name, 
       COUNT(O.order_id) 
FROM orders O
JOIN customers C ON(O.customer_id = C.customer_id) 
WHERE O.order_date >= '31-dec-1996' 
GROUP BY C.company_name
HAVING COUNT(O.order_id) > 15
ORDER BY COUNT(O.order_id)
;
```
61. Create a report that shows the company name, order id, AND total price of all products of which Northwind has sold more than $10,000 worth. There is no need for a GROUP BY clause in this report.


```sql
SELECT C.company_name, 
       O.order_id,
	   ORD.quantity,
	   (((unit_price) - (unit_price * discount)) * (quantity)) AS total1,
	(((unit_price) - (unit_price * discount)) * (quantity))::NUMERIC::MONEY AS total,
	to_char((((unit_price) - (unit_price * discount)) * (quantity)), 'L999G999D99') AS total_tochar
FROM customers C
JOIN orders O ON (O.customer_id = C.customer_id) 
JOIN order_details ORD ON (ORD.order_id = O.order_id) 
WHERE (((unit_price) - (unit_price * discount)) * (quantity)) > 10000
;
```
62. Create a report that shows the number of employees AND customers FROM each city that has employees in it. 


```sql
SELECT COUNT(distinct(E.employee_id))AS numemp,
       COUNT(distinct(C.customer_id)) AS numcus,
       E.city,
       C.city 
FROM employees E
JOIN customers C ON (E.city = C.city) 
GROUP BY E.city,
	C.city 
ORDER BY numemp
;
```
63. Create a report that shows the company names AND faxes for all customerS. If the customer doesn't have a fax, the report should show "No Fax" in that field


```sql
SELECT customer_id,
	company_name,
	(CASE WHEN fax IS NULL THEN 'No Fax' ELSE fax END) fax
FROM customers
;
```
64. Select the 3 top-selling categories overall
-- (hint: use “LIMIT” construction).


```sql
SELECT category_name,
	country,
	COUNT(*) AS COUNT
FROM order_details O,
	products P,
	categories C,
	suppliers S
WHERE O.product_id = P.product_id
	AND P.category_id = C.category_id
	AND P.supplier_id = S.supplier_id
GROUP BY category_name,
	country
ORDER BY COUNT(*) DESC, category_name
LIMIT 3
;
```
65. List total amount of sales by employee and year (discount in OrderDetails is at unit_price level). Which employees have an increase in sales over the three reported years?

```sql
SELECT first_name
	, last_name
	, DATE_PART('YEAR',order_date) AS YEAR
	--, EXTRACT(YEAR FROM order_date) AS YEAR
	, (SUM((1 - discount) * OD.unit_price * quantity))::NUMERIC::MONEY AS totalamount
FROM orders O,
	order_details OD,
	employees E
WHERE O.order_id = OD.order_id
	AND O.employee_id = E.employee_id
GROUP BY first_name,
	last_name,
	DATE_PART('YEAR', order_date)--,
	--order_date
ORDER BY first_name,
	last_name,
	DATE_PART('YEAR', order_date)
;
```
66. Get an individual sales report by month for employee 9 (Dodsworth) in 1997.


```sql
SELECT DATE_PART('MONTH', order_date) AS MONTH
		--, EXTRACT(MONTH FROM order_date) AS MONTH
		--, TO_CHAR(order_date, 'Mon') AS MONTH
		, (SUM((1 - discount) * OD.unit_price * quantity))::NUMERIC(10,2) AS totalamount
FROM orders O,
	order_details OD
WHERE O.order_id = OD.order_id
	AND O.employee_id = 9
	AND DATE_PART('YEAR',order_date) = 1997
GROUP BY DATE_PART('MONTH', order_date)
	--, order_date
ORDER BY DATE_PART('MONTH', order_date)
;
```
68. Get a sales report by country and month.
```sql
SELECT country
,	DATE_PART('YEAR', order_date) AS YEAR
,	DATE_PART('MONTH', order_date) AS MONTH
,	(SUM((1 - discount) * OD.unit_price * quantity)) AS totalamount
FROM orders O,
	order_details OD,
	products P,
	suppliers S
WHERE O.order_id = OD.order_id
	AND OD.product_id = P.product_id
	AND P.supplier_id = S.supplier_id
GROUP BY country,
	DATE_PART('YEAR', order_date)
	,DATE_PART('MONTH', order_date)
ORDER BY country,
	DATE_PART('YEAR', order_date)
	,DATE_PART('MONTH', order_date)
;

```
69. Order Details Extended, calculates sales price for each order after discount is applied.

```sql
SELECT DISTINCT y.order_id, 
    y.product_id, 
    x.product_name, 
    y.unit_price, 
    y.quantity, 
    y.discount, 
    ROUND((y.Unit_Price * y.Quantity * (1 - y.Discount))::NUMERIC, 2) AS ExtendedPrice
FROM products x
INNER JOIN order_details y ON x.product_id = y.product_id
ORDER BY y.order_id;
```
70. Ten Most Expensive Products

```sql 
-- Query 2

SELECT * FROM
(
    SELECT DISTINCT product_name as ten_most_expensive_products, 
           unit_price
    FROM products
    ORDER BY unit_price DESC
) as a
LIMIT 10;

-- Query 1

SELECT DISTINCT product_name AS ten_most_expensive_products, 
         unit_price
FROM products AS a
WHERE 10 >= (select count(DISTINCT unit_price)
                    FROM products as b
                    WHERE b.unit_price >= a.unit_price)
ORDER BY unit_price DESC;
```
71. Products Above Average Price, shows how to use sub-query to get a single value (average unit price) that can be used in the outer-query.
```sql
SELECT DISTINCT product_name,
	unit_price
FROM products
WHERE unit_price >
		(SELECT avg(unit_price)
			FROM products)
ORDER BY unit_price;
```
72. Quarterly Orders by Product, shows how to convert order dates to the corresponding quarters. 
-- It also demonstrates how SUM function is used together with CASE statement to get sales for each quarter, where quarters are converted from OrderDate column.
```sql
SELECT a.product_name,
	d.company_name,
	extract(YEAR FROM order_date) AS orderyear,
	(sum(CASE extract(QUARTER FROM c.order_date)
										WHEN '1' THEN b.unit_price * b.quantity * (1 - b.discount) ELSE 0 END)) "Qtr 1",
	(sum(CASE extract(QUARTER FROM c.order_date)
										WHEN '2' THEN b.unit_price * b.quantity * (1 - b.discount) ELSE 0 END)) "Qtr 2",
	(sum(CASE extract(QUARTER FROM c.order_date)
										WHEN '3' THEN b.unit_price * b.quantity * (1 - b.discount) ELSE 0 END)) "Qtr 3",
	(sum(CASE extract(QUARTER FROM c.order_date)
										WHEN '4' THEN b.unit_price * b.quantity * (1 - b.discount) ELSE 0 END)) "Qtr 4"
FROM products a
INNER JOIN order_details b ON a.product_id = b.product_id
INNER JOIN orders c ON c.order_id = b.order_id
INNER JOIN customers d ON d.customer_id = c.customer_id
WHERE c.order_date BETWEEN date('1997-01-01') AND date('1997-12-31')
GROUP BY a.product_name,
	d.company_name,
	extract(YEAR FROM order_date)
ORDER BY a.product_name,
	d.company_name;
```
73. Let’s say that data analyst is preparing a presentation and interested in how many orders were placed by every particular employee during each year of operation.

| last_name | first_name | year | count 
|-----------|------------|------|-------
| Buchanan  | Steven     | 1996 |    11
| Buchanan  | Steven     | 1997 |    18
| Buchanan  | Steven     | 1998 |    13
| Callahan  | Laura      | 1996 |    19
| Callahan  | Laura      | 1997 |    54
| Callahan  | Laura      | 1998 |    31


|  last_name | first_name | y1996 | y1997 | y1998 
|-----------|------------|-------|-------|-------
| Peacock   | Margaret   |    31 |    81 |    44
| King      | Robert     |    11 |    36 |    25
| Davolio   | Nancy      |    26 |    55 |    42
| Callahan  | Laura      |    19 |    54 |    31
| Fuller    | Andrew     |    16 |    41 |    39
| Suyama    | Michael    |    15 |    33 |    19
| Buchanan  | Steven     |    11 |    18 |    13
| Dodsworth | Anne       |     5 |    19 |    19
| Leverling | Janet      |    18 |    71 |    38


```sql
SELECT e.last_name
	, e.first_name
	, EXTRACT(YEAR FROM order_date) AS Year
	, COUNT(*)
FROM employees e, orders o
WHERE e.employee_id = o.employee_id
GROUP BY e.last_name, e.first_name, EXTRACT(YEAR FROM order_date)
ORDER BY last_name, first_name, Year, COUNT(*)
;

SELECT e.last_name
, first_name
, SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 1996 THEN 1 ELSE 0 END) AS Y1996
, SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 1997 THEN 1 ELSE 0 END) AS Y1997
, SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 1998 THEN 1 ELSE 0 END) AS Y1998
FROM employees e, orders o
WHERE e.employee_id = o.employee_id
GROUP BY e.last_name, e.first_name
;
```