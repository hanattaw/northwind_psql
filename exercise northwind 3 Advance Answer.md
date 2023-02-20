 # Northwind Database Exercise Soluations

Consider the Northwind database whose schema is given in Figure 1. This database contains information of orders placed by customerS. For every order the detail is given of what products were sold, for what unit price and in what quantity. The employee that secured the order is recorded as well as the date in which the order was inserted. For customers the city they live in etC. is recorded, and for employees their salesdistrict. For this database, create queries to generate the following reports:




# How to Calculate Totals, Subtotals and Grand Total

Asking about totals, subtotals and grand total is a popular ad hoc or regular request by sales or accounting department. 


1. Calculating Totals

Suppose we need to find out the number of orders and products sold for each date in June 1997 and also the total number of orders and products sold for the entire month in June 1997


```sql
-- Query 1
SELECT date(t2.order_date) AS order_date,
	count(DISTINCT t1.order_id) AS numoforders,
	count(t1.product_id) AS numofproducts
FROM order_details AS t1
JOIN orders AS t2 ON t1.order_id = t2.order_id
JOIN products AS t3 ON t1.product_id = t3.product_id
WHERE EXTRACT (YEAR FROM t2.order_date) = 1997
	AND EXTRACT (MONTH FROM t2.order_date) = 6
GROUP BY t2.order_date
;

-- Query 2
SELECT 'Total',
	count(DISTINCT t1.order_id) AS numoforders,
	count(t1.product_id) AS numofproducts
FROM order_details AS t1
JOIN orders AS t2 ON t1.order_id = t2.order_id
JOIN products AS t3 ON t1.product_id = t3.product_id
WHERE EXTRACT (YEAR FROM t2.order_date) = 1997
	AND EXTRACT (MONTH FROM t2.order_date) = 6
;

-- Query1 Union Query2
SELECT date(t2.order_date)::TEXT AS order_date,
	count(DISTINCT t1.order_id) AS numoforders,
	count(t1.product_id) AS numofproducts
FROM order_details AS t1
JOIN orders AS t2 ON t1.order_id = t2.order_id
JOIN products AS t3 ON t1.product_id = t3.product_id
WHERE EXTRACT (YEAR FROM t2.order_date) = 1997
	AND EXTRACT (MONTH FROM t2.order_date) = 6
GROUP BY t2.order_date

Union
SELECT 'Total',
	count(DISTINCT t1.order_id) AS numoforders,
	count(t1.product_id) AS numofproducts
FROM order_details AS t1
JOIN orders AS t2 ON t1.order_id = t2.order_id
JOIN products AS t3 ON t1.product_id = t3.product_id
WHERE EXTRACT (YEAR FROM t2.order_date) = 1997
	AND EXTRACT (MONTH FROM t2.order_date) = 6
;

-- Query 4: ROLLUP

SELECT date(t2.order_date) AS orderdate,
	count(DISTINCT t1.order_id) AS numoforders,
	count(t1.product_id) AS numofproducts
FROM order_details AS t1
JOIN orders AS t2 ON t1.order_id = t2.order_id
JOIN products AS t3 ON t1.product_id = t3.product_id
WHERE EXTRACT (YEAR FROM t2.order_date) = 1997
	AND EXTRACT (MONTH FROM t2.order_date) = 6
GROUP BY ROLLUP(t2.order_date);

-- Query 5: Grouping
-- ref: https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-grouping-sets/
SELECT
	GROUPING(orders.order_date) grouping_order_date,
	orders.order_date,
	count(DISTINCT orders.order_id) AS numberoforders,
	count(order_details.product_id) AS numberofproducts
FROM
	orders JOIN order_details ON orders.order_id=order_details.order_id
WHERE EXTRACT (YEAR FROM orders.order_date) = 1997
	AND EXTRACT (MONTH FROM orders.order_date) = 6
GROUP BY
	GROUPING SETS (
		(orders.order_date),
		()
	)
HAVING GROUPING(orders.order_date) = 1
ORDER BY
	orders.order_date
;
```

