# Northwind Company Analysis

> The Northwind database contains the sales data for a fictitious company called **Northwind Traders**, which imports and exports specialty foods from around the world.

## 📂 Dataset

The dataset is composed of 13 tables:

<details>
<summary>
Show summary
</summary>

| Table               | Rows |
|---------------------|------|
| Categories          | 8    |
| Customers           | 91   |
| Employees           | 9    |
| EmployeeTerritories | 49   |
| Order Details       | 2155 |
| Orders              | 830  |
| Region              | 4    |
| Products            | 77   |
| Shippers            | 6    |
| Suppliers           | 29   |
| Territories         | 53   |
| USstates            | 51   |

</details>


## 🔎 Data Dictionary

<details>
<summary>
Categories Table
</summary>

| Primary Key | Foreign Key | Index | Name         | Data type | Length | Nullable | Default | Description                                        |
|-------------|-------------|-------|--------------|-----------|--------|----------|---------|----------------------------------------------------|
| PK          |             | IX    | category_id   | int       |        |          |         | Categories of Northwind products.                  |
|             |             | IX    | category_name | varchar   |  15    |          |         | Name of food category.                             |
|             |             |       | description  | text      |        | Yes      |         | Full description of the category. Provide samples. |
|             |             |       | picture      | image     |        | Yes      |         | A picture representing the food category.          |


</details>


<details>
<summary>
CustomerCustomerDemo Table
</summary>

| Primary Key | Foreign Key | Index | Name           | Data type | Length | Nullable | Default | Description |
|-------------|-------------|-------|----------------|-----------|--------|----------|---------|-------------|
| PK          | FK          | IX    | customer_id     | varchar   |  5     |          |         |             |
| PK          | FK          | IX    | customerc_type_id | varchar   |  10    |          |         |             |


</details>

<details>
<summary>
CustomerDemographics Table
</summary>


| Primary Key | Foreign Key | Index | Name           | Data type | Length | Nullable | Default | Description |
|-------------|-------------|-------|----------------|-----------|--------|----------|---------|-------------|
| PK          |             | IX    | customerc_type_id | varchar   |  10    |          |         |             |
|             |             |       | customer_desc   | ntext     |        | Yes      |         |             |

</details>

<details>
<summary>
Customers Table     
</summary>

| Primary Key | Foreign Key | Index | Name         | Data type | Length | Nullable | Default | Description                                        |
|-------------|-------------|-------|--------------|-----------|--------|----------|---------|----------------------------------------------------|
| PK          |             | IX    | customer_id   | varchar   |  5     |          |         | Unique five-character code based on customer name. |
|             |             | IX    | company_name  | varchar   |  40    |          |         |                                                    |
|             |             |       | contact_name  | varchar   |  30    | Yes      |         |                                                    |
|             |             |       | contact_title | varchar   |  30    | Yes      |         |                                                    |
|             |             |       | address      | varchar   |  60    | Yes      |         | Street or post-office box.                         |
|             |             | IX    | city         | varchar   |  15    | Yes      |         |                                                    |
|             |             | IX    | region       | varchar   |  15    | Yes      |         | State or province.                                 |
|             |             | IX    | postal_code   | varchar   |  10    | Yes      |         |                                                    |
|             |             |       | country      | varchar   |  15    | Yes      |         |                                                    |
|             |             |       | phone        | varchar   |  24    | Yes      |         | Phone number includes country code or area code.   |
|             |             |       | fax          | varchar   |  24    | Yes      |         | Phone number includes country code or area code.   |

</details>

<details>
<summary>
Employees Table
</summary>

| Primary Key | Foreign Key | Index | Name            | Data type | Length | Nullable | Default | Description                                      |
|-------------|-------------|-------|-----------------|-----------|--------|----------|---------|--------------------------------------------------|
| PK          |             | IX    | employee_id      | int       |        |          |         | Number automatically assigned to new employee.   |
|             |             | IX    | last_name        | varchar   |  20    |          |         |                                                  |
|             |             |       | first_name       | varchar   |  10    |          |         |                                                  |
|             |             |       | title           | varchar   |  30    | Yes      |         | Employee's title.                                |
|             |             |       | title_of_courtesy | varchar   |  25    | Yes      |         |                                                  |
|             |             |       | birth_date       | datetime  |        | Yes      |         |                                                  |
|             |             |       | hire_date        | datetime  |        | Yes      |         |                                                  |
|             |             |       | address         | varchar   |  60    | Yes      |         | Street or post-office box.                       |
|             |             |       | city            | varchar   |  15    | Yes      |         |                                                  |
|             |             |       | region          | varchar   |  15    | Yes      |         | Street or post-office box.                       |
|             |             | IX    | postal_code      | varchar   |  10    | Yes      |         |                                                  |
|             |             |       | country         | varchar   |  15    | Yes      |         |                                                  |
|             |             |       | home_phone       | varchar   |  24    | Yes      |         | Phone number includes country code or area code. |
|             |             |       | extension       | varchar   |  4     | Yes      |         | Internal telephone extension number.             |
|             |             |       | photo           | image     |        | Yes      |         | Picture of employee.                             |
|             |             |       | notes           | text      |        | Yes      |         | General information about employee's background. |
|             | FK          |       | reports_to       | int       |        | Yes      |         | Employee's supervisor.                           |
|             |             |       | photo_path       | varchar   |  255   | Yes      |         |                                                  |


</details>



<details>
<summary>
EmployeeTerritories Table
</summary>

| Primary Key | Foreign Key | Index | Name        | Data type | Length | Nullable | Default | Description |
|-------------|-------------|-------|-------------|-----------|--------|----------|---------|-------------|
| PK          | FK          | IX    | employee_id  | int       |        |          |         |             |
| PK          | FK          | IX    | territory_id | varchar   |  20    |          |         |             |


</details>

<details>
<summary>
OrderDetails Table
</summary>

| Primary Key | Foreign Key | Index | Name      | Data type | Length | Nullable | Default | Description                           |
|-------------|-------------|-------|-----------|-----------|--------|----------|---------|---------------------------------------|
| PK          | FK          | IX    | order_id   | int       |        |          |         | Same as Order ID in Orders table.     |
| PK          | FK          | IX    | product_id | int       |        |          |         | Same as Product ID in Products table. |
|             |             |       | unit_price | decimal   |        |          |         |                                       |
|             |             |       | quantity  | smallint  |        |          |         |                                       |
|             |             |       | discount  | decimal   |        |          |         |                                       |


</details>

<details>
<summary>
Orders Table
</summary>

| Primary Key | Foreign Key | Index | Name           | Data type | Length | Nullable | Default | Description                                        |
|-------------|-------------|-------|----------------|-----------|--------|----------|---------|----------------------------------------------------|
| PK          |             | IX    | order_id        | int       |        |          |         |                                                    |
|             | FK          | IX    | customer_id     | varchar   |  5     | Yes      |         |                                                    |
|             | FK          | IX    | employee_id     | int       |        | Yes      |         | Same entry as in Employees table.                  |
|             |             | IX    | order_date      | datetime  |        | Yes      |         |                                                    |
|             |             |       | required_date   | datetime  |        | Yes      |         |                                                    |
|             |             | IX    | shipped_date    | datetime  |        | Yes      |         |                                                    |
|             | FK          | IX    | ship_via        | int       |        | Yes      |         | Same as Shipper ID in Shippers table.              |
|             |             |       | freight        | decimal   |        | Yes      |         |                                                    |
|             |             |       | ship_name       | varchar   |  40    | Yes      |         | Name of person or company to receive the shipment. |
|             |             |       | ship_address    | varchar   |  60    | Yes      |         | Street address only -- no post-office box allowed. |
|             |             |       | ship_city       | varchar   |  15    | Yes      |         |                                                    |
|             |             |       | ship_region     | varchar   |  15    | Yes      |         | State or province.                                 |
|             |             | IX    | ship_postal_code | varchar   |  10    | Yes      |         |                                                    |
|             |             |       | ship_country    | varchar   |  15    | Yes      |         |                                                    |


</details>

<details>
<summary>
Products Table
</summary>

| Primary Key | Foreign Key | Index | Name            | Data type | Length | Nullable | Default | Description                                   |
|-------------|-------------|-------|-----------------|-----------|--------|----------|---------|-----------------------------------------------|
| PK          |             | IX    | product_id       | int       |        |          |         | Number automatically assigned to new product. |
|             |             | IX    | product_name     | nvarchar  |  40    |          |         |                                               |
|             | FK          | IX    | supplier_id      | int       |        | Yes      |         | Same entry as in Suppliers table.             |
|             | FK          | IX    | category_id      | int       |        | Yes      |         | Same entry as in Categories table.            |
|             |             |       | quantity_per_unit | nvarchar  |  20    | Yes      |         | (e.g., 24-count case, 1-liter bottle).      |
|             |             |       | unit_price       | money     |        | Yes      |         |                                               |
|             |             |       | units_instock    | smallint  |        | Yes      |         |                                               |
|             |             |       | units_on_order    | smallint  |        | Yes      |         |                                               |
|             |             |       | reorder_level    | smallint  |        | Yes      |         | Minimum units to maintain in stock.           |
|             |             |       | discontinued    | bit       |        |          |    1    | 1   means item is no longer available.        |


</details>

<details>
<summary>
Region Table
</summary>

| Primary Key | Foreign Key | Index | Name              | Data type | Length | Nullable | Default | Description |
|-------------|-------------|-------|-------------------|-----------|--------|----------|---------|-------------|
| PK          |             | IX    | region_id          | int       |        |          |         |             |
|             |             |       | region_description | varchar   |  50    |          |         |             |


</details>

<details>
<summary>
Shippers Table
</summary>

| Primary Key | Foreign Key | Index | Name        | Data type | Length | Nullable | Default | Description                                      |
|-------------|-------------|-------|-------------|-----------|--------|----------|---------|--------------------------------------------------|
| PK          |             | IX    | shipper_id   | int       |        |          |         | Number automatically assigned to new shipper.    |
|             |             |       | company_name | varchar   |  40    |          |         | Name of shipping company.                        |
|             |             |       | phone       | varchar   |  24    | Yes      |         | Phone number includes country code or area code. |


</details>

<details>
<summary>
Suppliers Table
</summary>

| Primary Key | Foreign Key | Index | Name         | Data type | Length | Nullable | Default | Description                                      |
|-------------|-------------|-------|--------------|-----------|--------|----------|---------|--------------------------------------------------|
| PK          |             | IX    | supplier_id   | int       |        |          |         | Number automatically assigned to new supplier.   |
|             |             | IX    | company_name  | varchar   |  40    |          |         |                                                  |
|             |             |       | contact_name  | varchar   |  30    | Yes      |         |                                                  |
|             |             |       | contact_title | varchar   |  30    | Yes      |         |                                                  |
|             |             |       | address      | varchar   |  60    | Yes      |         | Street or post-office box.                       |
|             |             |       | city         | varchar   |  15    | Yes      |         |                                                  |
|             |             |       | region       | varchar   |  15    | Yes      |         | State or province.                               |
|             |             | IX    | postal_code   | varchar   |  10    | Yes      |         |                                                  |
|             |             |       | country      | varchar   |  15    | Yes      |         |                                                  |
|             |             |       | phone        | varchar   |  24    | Yes      |         | Phone number includes country code or area code. |
|             |             |       | fax          | varchar   |  24    | Yes      |         | Phone number includes country code or area code. |
|             |             |       | homepage     | ntext     |        | Yes      |         | Supplier's home page on World Wide Web.          |


</details>

<details>
<summary>
Territories Table
</summary>

| Primary Key | Foreign Key | Index | Name                 | Data type | Length | Nullable | Default | Description |
|-------------|-------------|-------|----------------------|-----------|--------|----------|---------|-------------|
| PK          |             | IX    | territory_id          | varchar   |  20    |          |         |             |
|             |             |       | territory_description | varchar   |  50    |          |         |             |
|             | FK          |       | region_id             | int       |        |          |         |             |


</details>

## Postgresql login

>machine # psql -U postgres northwind  
>northwind=#

# Business Question

## Question1: Product Team
---

**Product Team** - products that are currently being offered.

***All products***

```sql
SELECT * FROM products; 
```
<details>
<summary>Output</summary>

| product_id |           product_name           | supplier_id | category_id |  quantity_per_unit   | unit_price | units_in_stock | units_on_order | reorder_level | discontinued|
| -----------|----------------------------------|-------------|-------------|----------------------|------------|----------------|----------------|---------------|-------------|
|          1 | Chai                             |           8 |           1 | 10 boxes x 30 bags   |         18 |            39  |              0 |            10 |            1|
|          2 | Chang                            |           1 |           1 | 24 - 12 oz bottles   |         19 |             17 |             40 |            25 |            1|

</details>

***All Products with not discontinued with order by unit_price***

```sql
SELECT product_name,quantity_per_unit, unit_price, discontinued  FROM products WHERE discontinued=0 ORDER BY unit_price DESC;
```
<details>
<summary>Output</summary>

|           product_name           |  quantity_per_unit   | unit_price | discontinued| 
|----------------------------------|----------------------|------------|-------------|
| Côte de Blaye                    | 12 - 75 cl bottles   |      263.5 |            0|
| Sir Rodney's Marmalade           | 30 gift boxes        |         81 |            0|
| Carnarvon Tigers                 | 16 kg pkg.           |       62.5 |            0|
| Raclette Courdavault             | 5 kg pkg.            |         55 |            0|
| Manjimup Dried Apples            | 50 - 300 g pkgs.     |         53 |            0|

</details>

## Question2: The Logistics Team
---

**The Logistics Team** - wants to do a retrospection of their performances for the year 1998, in order to identify for which countries they didn’t perform well. They asked you to provide them a list of countries with the following information:
1. **Average** days between the order date and shipping date (formatted to have only **2 decimals**).
2. **Total** number of orders (based on the order date) Filtered on the following conditions
3. Year of order date is **1998**
4. **Average** days between the order date and the shipping date is greater or equal 5 days
5. **Total** number of orders is greater than 10 orders

**HINT:**

- [PostgreSQL ROUND Function URL: (https://www.postgresqltutorial.com/postgresql-math-functions/postgresql-round/)](https://www.postgresqltutorial.com/postgresql-math-functions/postgresql-round/)
- [PostgreSQL EXTRACT Function URL: (https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/)](https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/)

<details>
<summary>Traditional Solution</summary>

***Traditional sql***

```sql
SELECT  ship_country,
		ROUND( -- round function
            AVG(EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY'))::NUMERIC, -- average then cast to NUMERIC
        2)  -- 2 decimal 
        AS average_days_between_order_shipping,
		COUNT(*) AS total_number_orders
	FROM orders
	WHERE EXTRACT(YEAR FROM order_date) = 1998 -- extract YEAR to compare
	GROUP BY ship_country
    HAVING COUNT(*) > 10 
        AND ROUND(AVG( EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY'))::NUMERIC, 2) > 5
	ORDER BY ship_country;
```
</details>

<details>
<summary> Output</summary>

| ship_country | average_days_between_order_shipping | total_number_orders |
|--------------|-------------------------------------|---------------------|
| Austria      |                                5.89 |                  11|
| Brazil       |                                8.12 |                  28|
| France       |                                9.43 |                  23|
| Germany      |                                5.38 |                  34|
| Spain        |                                7.83 |                  12|
| Sweden       |                               13.29 |                  14|
| UK           |                                6.25 |                  16|
| USA          |                                7.89 |                  39|
| Venezuela    |                                8.73 |                  18|
(9 rows)

</details>

<details>
<summary>WITH Statement Solution</summary>
***With statement SQL***

```sql
WITH cte_avg_days AS (          -- create pre statement
	SELECT
		ship_country,
		ROUND(AVG(
			EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY')
			)::NUMERIC,
		2) AS average_days_between_order_shipping,
		COUNT(*) AS total_number_orders
	FROM orders
	WHERE EXTRACT(YEAR FROM order_date) = 1998
	GROUP BY 
		ship_country
	ORDER BY ship_country
	)
SELECT * FROM cte_avg_days
WHERE average_days_between_order_shipping >= 5
AND total_number_orders > 10;
```
</details>
<details>
<summary> Output</summary>

| ship_country | average_days_between_order_shipping | total_number_orders |
|--------------|-------------------------------------|---------------------|
| Austria      |                                5.89 |                  11|
| Brazil       |                                8.12 |                  28|
| France       |                                9.43 |                  23|
| Germany      |                                5.38 |                  34|
| Spain        |                                7.83 |                  12|
| Sweden       |                               13.29 |                  14|
| UK           |                                6.25 |                  16|
| USA          |                                7.89 |                  39|
| Venezuela    |                                8.73 |                  18|
(9 rows)

</details>


## Question3: HR Team
---

The HR Team wants to know for each employee what was their age on the date they joined the company and who they currently report to. Provide them with a list of every employees with the following information:

1. manager full name (**first name and last name combined in a single field**)
2. manager **job title**
3. manager city they live
3. employee full name (**first name and last name combined in a single field**)
4. employee **job title**
5. employee city they live
6. employee *age at the time they were hired*

Finally **order** the results by **manager full name** and **employee_age** in an **ascending order** (lowest first).

**HINT**
- [PostgreSQL CONCAT Function URL: (https://www.postgresqltutorial.com/postgresql-string-functions/postgresql-concat-function/)](https://www.postgresqltutorial.com/postgresql-string-functions/postgresql-concat-function/)

<details>
<summary>Solution</summary>

```sql
-- Solution Query
SELECT
    CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name,
	m.title AS manager_title,
    m.city AS manager_city,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
    e.city AS employee_city,
	EXTRACT(YEAR FROM AGE(e.hire_date, e.birth_date))::INT AS employee_age
FROM
    employees AS e
INNER JOIN employees AS m 
ON m.employee_id = e.reports_to
ORDER BY
	manager_full_name,
    employee_age;
```
</details>
<details>
<summary>Output Example</summary>

| manager_full_name |     manager_title     | manager_city | employee_full_name |      employee_title      | employee_city | employee_age|
|-------------------|-----------------------|--------------|--------------------|--------------------------|---------------|-------------|
| Andrew Fuller     | Vice President, Sales | Tacoma       | Janet Leverling    | Sales Representative     | Kirkland      |           28|
| Andrew Fuller     | Vice President, Sales | Tacoma       | Laura Callahan     | Inside Sales Coordinator | Seattle       |           36|
| Andrew Fuller     | Vice President, Sales | Tacoma       | Steven Buchanan    | Sales Manager            | London        |           38|
| Andrew Fuller     | Vice President, Sales | Tacoma       | Nancy Davolio      | Sales Representative     | Seattle       |           43|
| Andrew Fuller     | Vice President, Sales | Tacoma       | Margaret Peacock   | Sales Representative     | Redmond       |           55|
| Steven Buchanan   | Sales Manager         | London       | Anne Dodsworth     | Sales Representative     | London        |           28|
| Steven Buchanan   | Sales Manager         | London       | Michael Suyama     | Sales Representative     | London        |           30|
| Steven Buchanan   | Sales Manager         | London       | Robert King        | Sales Representative     | London        |           33|
(8 rows)

</details>

**Question**

>On the other hand, to show the employee who reports to the manager. with the following results:

<details>
<summary>Question Output</summary>

| employee_full_name | employee_title           | employee_age | manager_full_name | manager_title         |
|----------------------|----------------------------|----------------|---------------------|-------------------------|
| Anne Dodsworth     | Sales Representative     | 28             | Steven Buchanan   | Sales Manager         |
| Janet Leverling    | Sales Representative     | 28             | Andrew Fuller     | Vice President, Sales |
| Michael Suyama     | Sales Representative     | 30             | Steven Buchanan   | Sales Manager         |
| Robert King        | Sales Representative     | 33             | Steven Buchanan   | Sales Manager         |
| Laura Callahan     | Inside Sales Coordinator | 36             | Andrew Fuller     | Vice President, Sales |
| Steven Buchanan    | Sales Manager            | 38             | Andrew Fuller     | Vice President, Sales |
| Nancy Davolio      | Sales Representative     | 43             | Andrew Fuller     | Vice President, Sales |
| Margaret Peacock   | Sales Representative     | 55             | Andrew Fuller     | Vice President, Sales |


</details>

## Question4: Logistics Team
---

The Logistics Team wants to do a retrospection of their global performances over 1997-1998, in order to identify for which month they perform well. They asked you to provide them a list with:

1. their **year/month as single field** in a date format (e.g. “1996-01-01” January 1996)
2. their total number of orders
3. their total freight (formatted to have no decimals)

**Filtered** on the following conditions:

1. the **order date is between 1997 and 1998**
2. their **total number of orders** is greater than 35 orders

Finally **order** the results by total freight (**descending** order).

<details>
<summary>Solution</summary>

```sql
-- Solution Query
WITH cte_freight AS (
	SELECT
		CONCAT(EXTRACT(YEAR FROM order_date), -- get YEAR
			   '-', 
			   EXTRACT(MONTH FROM order_date), -- get MONTH
			   '-01'                            -- default day to 01
			  ) AS year_month,
		COUNT(*) AS total_number_orders,    -- count row of orders
		ROUND(
			SUM(freight)
			)::INT AS total_freight
	FROM orders
	WHERE order_date >= '1997-01-01' AND order_date < '1998-01-31'
	GROUP BY 
		CONCAT(EXTRACT(YEAR FROM order_date), 
			   '-', 
			   EXTRACT(MONTH FROM order_date), 
			   '-01'
			  )
)
SELECT * FROM cte_freight
WHERE total_number_orders > 35
ORDER BY total_freight DESC;
```
</details>

<details>
<summary>
Output
</summary>

| year_month | total_number_orders | total_freight |
|--------------|-----------------------|-----------------|
| 1998-4-01  | 74                    | 6394            |
| 1998-1-01  | 55                    | 5463            |
| 1998-3-01  | 73                    | 5379            |
| 1998-2-01  | 54                    | 4273            |
| 1997-10-01 | 38                    | 3946            |
| 1997-12-01 | 48                    | 3758            |
| 1997-9-01  | 37                    | 3237            |



</details>

## Question5: Pricing Team
---

The Pricing Team wants to know which products had an **unit price increase** and the **percentage increase was not between 20% and 30%**. In order to help them they asked you to provide them a list of products with:

1. their product name
2. their **previous unit price** (formatted to have only 2 decimals)
3. their **current unit price** (formatted to have only 2 decimals)
4. their **percentage increase** as: 

***(New Number -  Original Number) ÷ Original Number × 100*** (with the result formatted to an integer, e.g 50 for 50%)

Filtered on the following conditions:

1. their percentage increase **is not between 20% and 30%**
2. their total number of **orders is greater than 10 orders**

Finally order the results by percentage increase (ascending order).

**HINT**
- [PostgreSQL LEAD Function URL: (https://www.postgresqltutorial.com/postgresql-window-function/postgresql-lead-function/)](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-lead-function/)
- [PostgreSQL LAG Function URL: (https://www.postgresqltutorial.com/postgresql-window-function/postgresql-lag-function/)](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-lag-function/)

<details>
<summary>Solution</summary>

```sql
-- Solution Query
WITH cte_price AS (
SELECT
	d.product_id,
	p.product_name,
	ROUND(LAG(d.unit_price) OVER (PARTITION BY p.product_name ORDER BY o.order_date)::NUMERIC,2) AS previous_unit_price,
	ROUND(LEAD(d.unit_price) OVER (PARTITION BY p.product_name ORDER BY o.order_date)::NUMERIC,2) AS current_price
FROM products AS p
INNER JOIN order_details AS d
ON p.product_id = d.product_id
INNER JOIN orders AS o
ON d.order_id = o.order_id
)
SELECT
	c.product_name,
	c.previous_unit_price,
	c.current_price,
	ROUND(100*(c.current_price - c.previous_unit_price)/c.previous_unit_price) AS percentage_increase
FROM cte_price AS c
INNER JOIN order_details AS d
ON c.product_id = d.product_id
WHERE c.current_price != c.previous_unit_price
GROUP BY 
	c.product_name,
	c.current_price,
	c.previous_unit_price
HAVING COUNT(DISTINCT d.order_id) > 10
AND ROUND(100*(c.current_price - c.previous_unit_price)/c.previous_unit_price) NOT BETWEEN 20 AND 30;
```
</details>
<details>
<summary>Output</summary>

```sql
|         product_name          | current_price | previous_unit_price | percentage_increase 
|-------------------------------|---------------|---------------------|---------------------
| Mozzarella di Giovanni        |         27.80 |               34.80 |                 -20
| Singaporean Hokkien Fried Mee |         11.20 |                9.80 |                  14
(2 rows)
```
</details>

## Question6: Pricing Team
---

The Pricing Team want to know how each product performs according to their discount range. In order to help then
they asked you to provide them a list of products with.

1. product name
2. order discount range as
    * 1. No
    * 2. Less 5%
    * 3. 5% - 10%
    * 4. Over 10%
3. their total amount (formatted to be integer) that calculate from ***order unit price * order quantity***
4. their number of orders

Finally order the results by product name then discount range (both ascending order).

**HINT**

- [PostgreSQL CASE URL: (https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-case/)](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-case/)

<details>
<summary>Solution</summary>

```sql
--Solution query
SELECT
    p.product_name,
	CASE 
		WHEN d.discount = 0 THEN '1. No'
		WHEN d.discount > 0 AND d.discount <= 0.05 THEN '2. Less 5%'
		WHEN d.discount > 0.05 AND d.discount <= 0.10 THEN '3. 5% - 10%'
        WHEN d.discount > 0.10 THEN '4. Over 10%'
		END AS discount_range,
	ROUND(SUM(d.unit_price * d.quantity)) AS total_amount,
	COUNT(DISTINCT d.order_id) AS total_number_orders
FROM products AS p
INNER JOIN order_details AS d
ON d.product_id =  p.product_id
GROUP BY 
	p.product_name,
	discount_range
ORDER BY 
	p.product_name,
	discount_range;
```
</details>

<details>
<summary>
Output example
</summary>

|           product_name           | discount_range | total_amount | total_number_orders|
|----------------------------------|----------------|-------------|---------------------|
| Grandma's Boysenberry Spread     | 1. No          |         5170 |                   8|
| Grandma's Boysenberry Spread     | 2. Less 5%     |           25 |                   1|
| Grandma's Boysenberry Spread     | 3. 5% - 10%    |         1650 |                   2|
| Grandma's Boysenberry Spread     | 4. Over 10%    |          500 |                   1|
| Gravad lax                       | 1. No          |         1019 |                   4|
| Gravad lax                       | 4. Over 10%    |         2028 |                   2|
| Guaraná Fantástica               | 1. No          |         3011 |                  33|
| Guaraná Fantástica               | 3. 5% - 10%    |          367 |                   3|

</details>

**Question**

>What if the Pricing Team want to know how each category performs according to their unit price range.

<details>
<summary> Question Output</summary>

| category_name  | price_range  | total_amount | total_number_orders |
|----------------|--------------|----------------|-----------------------|
| Beverages      | 1. Below $20 | 111464         | 317                   |
| Beverages      | 2. $20 - $50 | 25079          | 28                    |
| Beverages      | 3. Over $50  | 149984         | 24                    |

</details>

## Question7: Logistic Team
---

The Logistics Team wants to know what is the current state of our regional **suppliers**' stocks for each **product**. In order to help them they asked you to provide them a list of products with:

1. their **supplier** region” as: 
   * “America” (that include 'US', 'Brazil', 'Canada')
   * “Europe” 
   * “Asia-Pacific” (that include 'Australia', 'Singapore', 'Japan')
2. their product name
3. their total units in stock
4. their total units on order
5. their total reorder level

Finally order the results by **supplier** region then product name then price range (each in ascending order).

<details>
<summary>Solution</summary>

```sql
--Solution query
SELECT
	CASE
		WHEN s.country IN ('Australia', 'Singapore', 'Japan' ) THEN 'Asia-Pacific'
		WHEN s.country IN ('US', 'Brazil', 'Canada') THEN 'America'
		ELSE 'Europe'
	END AS supplier_region,
    p.product_name,
	p.units_in_stock AS units_in_stock,
	p.units_on_order AS units_on_order,
	p.reorder_level 
FROM suppliers AS s
INNER JOIN products AS p
ON s.supplier_id = p.supplier_id
WHERE s.region IS NOT NULL
ORDER BY 
	supplier_region,
    product_name,
	p.unit_price;
```
</details>
<details>
<summary>Output Example</summary>

| supplier_region |           product_name           | units_in_stock | units_on_order | reorder_level|
|-----------------|----------------------------------|----------------|----------------|--------------|
| America         | Pâté chinois                     |            115 |              0 |            20|
| America         | Sirop d'érable                   |            113 |              0 |            25|
| America         | Tarte au sucre                   |             17 |              0 |             0|
| America         | Tourtière                        |             21 |              0 |            10|
| Asia-Pacific    | Alice Mutton                     |              0 |              0 |             0|
| Asia-Pacific    | Carnarvon Tigers                 |             42 |              0 |             0|
| Asia-Pacific    | Filo Mix                         |             38 |              0 |            25|
| Asia-Pacific    | Perth Pasties                    |              0 |              0 |             0|
| Asia-Pacific    | Vegie-spread                     |             24 |              0 |             5|
| Europe          | Boston Crab Meat                 |            123 |              0 |            30|
| Europe          | Chef Anton's Cajun Seasoning     |             53 |              0 |             0|
| Europe          | Chef Anton's Gumbo Mix           |              0 |              0 |             0|

</details>

**Question**
> What if the Logistics Team wants to know what is the current state of our regional suppliers' stocks for each **category** of product.

<details>
<summary>Question Output</summary>

| category_name  | supplier_region | units_in_stock | units_on_order | reorder_level |
|----------------|-----------------|----------------|----------------|---------------|
| Confections    | America         |             17 |              0 |             0|
| Meat/Poultry   | America         |            115 |              0 |            20|
| Beverages      | Asia-Pacific    |             15 |             10 |            30|
| Confections    | Asia-Pacific    |             29 |              0 |            10|

</details>

## Question8: Pricing Team
---
The Pricing Team wants to know for each currently offered product how their unit price compares against their categories average and median unit price. In order to help them they asked you to provide them a list of products with:

1. their category name
2. their product name
3. their unit price
4. their category average unit price (formatted to have only 2 decimals)
5. their category median unit price (formatted to have only 2 decimals)
6. their position against the category average unit price as:
   * “Below Average”
   * “Equal Average”
   * “Over Average”
7. their position against the category median unit price as:
   * “Below Median”
   * “Equal Median”
   * “Over Median”

Filtered on the following conditions:
   * They are not discontinued 

Finally order the results by category name then product name (both ascending).

**HINT**

- [Percentile in PostgreSQL (https://ubiq.co/database-blog/calculate-percentile-postgresql/)](https://ubiq.co/database-blog/calculate-percentile-postgresql/)

<details>
<summary>Solution</summary>

```sql
--Solution query
WITH cte_price AS (
	SELECT 
		c.category_name,
		p.product_name,
		p.unit_price,
		ROUND(AVG(d.unit_price)::NUMERIC,2) AS average_unit_price,
		ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY d.unit_price))::NUMERIC,
		2) AS median_unit_price
	FROM categories AS c
	INNER JOIN products AS p
	ON c.category_id = p.category_id
	INNER JOIN order_details AS d
	ON p.product_id = d.product_id
	WHERE p.discontinued = 0
	GROUP BY 
		c.category_name,
		p.product_name,
		p.unit_price
)
SELECT
	category_name,
	product_name,
	unit_price,
	average_unit_price,
	median_unit_price,
	CASE
		WHEN unit_price > average_unit_price THEN 'Over Average'
		WHEN unit_price = average_unit_price THEN 'Equal Average'
		WHEN unit_price < average_unit_price THEN 'Below Average'
	END AS average_unit_price_position,
	CASE
		WHEN unit_price > median_unit_price THEN 'Over Average'
		WHEN unit_price = median_unit_price THEN 'Equal Average'
		WHEN unit_price < median_unit_price THEN 'Below Average'
	END AS median_unit_price_position
FROM cte_price
ORDER BY 
	category_name,
	product_name;
```

</details>

<details>
<summary>
Output example
</summary>

| category_name  |           product_name           | unit_price | average_unit_price | median_unit_price | average_unit_price_position | median_unit_price_position 
|----------------|----------------------------------|------------|--------------------|-------------------|-----------------------------|----------------------------
| Beverages      | Chartreuse verte                 |         18 |              16.68 |             18.00 | Over Average                | Equal Average
| Beverages      | Côte de Blaye                    |      263.5 |             245.93 |            263.50 | Over Average                | Equal Average
| Beverages      | Ipoh Coffee                      |         46 |              43.04 |             46.00 | Over Average                | Equal Average
| Beverages      | Lakkalikööri                     |         18 |              16.98 |             18.00 | Over Average                | Equal Average
| Beverages      | Laughing Lumberjack Lager        |         14 |              13.72 |             14.00 | Over Average                | Equal Average
| Beverages      | Outback Lager                    |         15 |              14.15 |             15.00 | Over Average                | Equal Average
| Beverages      | Rhönbräu Klosterbier             |       7.75 |               7.38 |              7.75 | Over Average                | Equal Average
| Beverages      | Sasquatch Ale                    |         14 |              12.97 |             14.00 | Over Average                | Equal Average
| Beverages      | Steeleye Stout                   |         18 |              17.00 |             18.00 | Over Average                | Equal Average
| Condiments     | Aniseed Syrup                    |         10 |               9.50 |             10.00 | Over Average                | Equal Average
| Condiments     | Chef Anton's Cajun Seasoning     |         22 |              20.68 |             22.00 | Over Average                | Equal Average
| Condiments     | Genen Shouyu                     |         13 |              14.47 |             15.50 | Below Average               | Below Average
| Condiments     | Grandma's Boysenberry Spread     |         25 |              24.17 |             25.00 | Over Average                | Equal Average

</details>

## Question9: Sales Team
---

The Sales Team wants to build a list of **KPIs** to measure **employees' performances**. In order to help them they asked you to provide them a list of employees with:

1. their full name (first name and last name combined in a single field)
2. their job title
3. their total **sales amount excluding discount** (formatted to have only 2 decimals)
4. their total number of orders
5. their total **number of entries** (each row of an order)
6. their **average amount per entry** (formatted to have only 2 decimals)
7. their **average amount per order** (formatted to have only 2 decimals)
8. their **total discount amount** (formatted to have only 2 decimals)
9. their **total sales amount including discount** (formatted to have only 2 decimals)
10. Their **total discount percentage** (formatted to have only 2 decimals)

Finally **order** the results by **total sales amount including discount (descending)**.

<details>
<summary>Solution</summary>
```sql
--Solution query
WITH cte_kpi AS (
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
	ROUND(
		SUM(d.quantity * d.unit_price)::NUMERIC,
		2) AS total_sale_amount_excluding_discount,
    COUNT(DISTINCT d.order_id) AS total_number_orders,
    COUNT(d.*) AS total_number_entries,
		ROUND(
		SUM(d.discount*(d.quantity * d.unit_price))::NUMERIC,
		2) AS total_discount_amount,
	ROUND(
		SUM((1 - d.discount)*(d.quantity * d.unit_price))::NUMERIC,
		2) AS total_sale_amount_including_discount
FROM orders AS o
INNER JOIN employees AS e
ON o.employee_id = e.employee_id
INNER JOIN order_details AS d
ON d.order_id = o.order_id
INNER JOIN products AS p
ON d.product_id = p.product_id
GROUP BY 
	employee_full_name,
	employee_title
)
SELECT 
	employee_full_name,
	employee_title,
	total_sale_amount_excluding_discount,
	total_number_orders,
	total_number_entries,
	ROUND(
		SUM(total_sale_amount_excluding_discount/total_number_entries),
		   2) AS average_amount_per_entry,
	ROUND(
		SUM(total_sale_amount_excluding_discount/total_number_orders),
		   2) AS average_amount_per_order,
	total_discount_amount,
	total_sale_amount_including_discount,
	SUM(ROUND(
		(total_sale_amount_excluding_discount-total_sale_amount_including_discount)/
		total_sale_amount_excluding_discount*100,
		2)) AS total_discount_percentage
FROM cte_kpi
GROUP BY
	employee_full_name,
	employee_title,
	total_sale_amount_excluding_discount,
	total_number_orders,
	total_number_entries,
	total_sale_amount_including_discount,
	total_discount_amount
ORDER BY total_sale_amount_including_discount DESC;
```
</details>

<details>
<summary>
Output example
</summary>

| employee_full_name | employee_title           | total_sale_amount_excluding_discount | total_number_orders | total_number_entries | average_amount_per_entry | average_amount_per_order | total_discount_amount | total_sale_amount_including_discount | total_discount_percentage |
|----------------------|----------------------------|----------------------------------------|-----------------------|------------------------|----------------------------|----------------------------|-------------------------|----------------------------------------|-----------------------------|
| Margaret Peacock   | Sales Representative     | 250187.45                              | 156                   | 420                    | 595.68                     | 1603.77                    | 17296.60                | 232890.85                              | 6.91                        |
| Janet Leverling    | Sales Representative     | 213051.30                              | 127                   | 321                    | 663.71                     | 1677.57                    | 10238.46                | 202812.84                              | 4.81                        |
| Nancy Davolio      | Sales Representative     | 202143.71                              | 123                   | 345                    | 585.92                     | 1643.44                    | 10036.11                | 192107.60                              | 4.96                        |
| Andrew Fuller      | Vice President, Sales    | 177749.26                              | 96                    | 241                    | 737.55                     | 1851.55                    | 11211.51                | 166537.76                              | 6.31                        |
| Laura Callahan     | Inside Sales Coordinator | 133301.03                              | 104                   | 260                    | 512.70                     | 1281.74                    | 6438.75                 | 126862.28                              | 4.83                        |
| Robert King        | Sales Representative     | 141295.99                              | 72                    | 176                    | 802.82                     | 1962.44                    | 16727.76                | 124568.23                              | 11.84                       |
| Anne Dodsworth     | Sales Representative     | 82964.00                               | 43                    | 107                    | 775.36                     | 1929.40                    | 5655.93                 | 77308.07                               | 6.82                        |
| Michael Suyama     | Sales Representative     | 78198.10                               | 67                    | 168                    | 465.46                     | 1167.14                    | 4284.97                 | 73913.13                               | 5.48                        |
| Steven Buchanan    | Sales Manager            | 75567.75                               | 42                    | 117                    | 645.88                     | 1799.23                    | 6775.47                 | 68792.28                               | 8.97                        |


</details>


## Question10: Sales Team 
---

The Sales Team wants to build another list of **KPIs** to measure **employees' performances** across each **category**. In order to help them they asked you to provide them a list of **categories** and **employees** with:

1. their **categories** name
2. their **full name** (first name and last name combined in a 3. single field)
3. their **total sales amount including discount** (formatted to have only 2 decimals)
4. their **percentage of total sales amount** against the **total sales amount across all employees** (formatted to have only 2 decimals)
5. their **percentage of total sales amount** against the **total sales amount for each employees** (formatted to have only 2 decimals)

Finally **order** the results by **category name** (**ascending**) then **total sales amount** (**descending**).

HINT

- [PostgreSQL Window Functions (https://www.postgresqltutorial.com/postgresql-window-function/)](https://www.postgresqltutorial.com/postgresql-window-function/)

<details>
<summary>Solution</summary>

```sql
--Solution query
WITH cte_kpi AS (
SELECT
    c.category_name,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
    ROUND(
		  SUM(d.quantity * d.unit_price)::NUMERIC,
		  2) AS total_sale_amount_including_discount
FROM employees AS e
INNER JOIN orders AS o
	ON e.employee_id = o.employee_id 
INNER JOIN order_details AS d
	ON o.order_id = d.order_id
INNER JOIN products AS p
	ON d.product_id = p.product_id
INNER JOIN categories AS c
	ON c.category_id = p.category_id
GROUP BY 
	category_name,
	employee_full_name
)
SELECT 
	*,
	ROUND(
		SUM(total_sale_amount_including_discount) / 
		SUM(SUM(total_sale_amount_including_discount))
			OVER (PARTITION BY employee_full_name) * 100,
		2) AS percentage_of_employee_sales,
	ROUND(	
		SUM(total_sale_amount_including_discount) / 
		SUM(SUM(total_sale_amount_including_discount))
			OVER (PARTITION BY category_name) * 100,
		2) AS percentage_of_category_sales
FROM cte_kpi
GROUP BY
	category_name,
	employee_full_name,
	total_sale_amount_including_discount
ORDER BY
	category_name,
	total_sale_amount_including_discount DESC;
```

</details>

<details>
<summary>
Output example
</summary>

| category_name  | employee_full_name | total_sale_amount_including_discount | percentage_of_employee_sales | percentage_of_category_sales 
|----------------|--------------------|--------------------------------------|------------------------------|------------------------------
| Beverages      | Margaret Peacock   |                             52842.35 |                        21.12 |                        18.44
| Beverages      | Nancy Davolio      |                             48832.00 |                        24.16 |                        17.04
| Beverages      | Janet Leverling    |                             46506.55 |                        21.83 |                        16.23
| Beverages      | Andrew Fuller      |                             42029.40 |                        23.65 |                        14.67
| Beverages      | Robert King        |                             33517.00 |                        23.72 |                        11.70
| Beverages      | Anne Dodsworth     |                             20513.60 |                        24.73 |                         7.16
| Beverages      | Laura Callahan     |                             18640.80 |                        13.98 |                         6.51
| Beverages      | Steven Buchanan    |                             13517.50 |                        17.89 |                         4.72
| Beverages      | Michael Suyama     |                             10127.75 |                        12.95 |                         3.53
| Condiments     | Margaret Peacock   |                             25242.45 |                        10.09 |                        22.20
| Condiments     | Andrew Fuller      |                             16353.10 |                         9.20 |                        14.38
| Condiments     | Laura Callahan     |                             15447.95 |                        11.59 |                        13.59
| Condiments     | Janet Leverling    |                             14109.15 |                         6.62 |                        12.41
| Condiments     | Nancy Davolio      |                             14033.85 |                         6.94 |                        12.34

</details>
