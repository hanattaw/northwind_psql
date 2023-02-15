-- For their annual review of the company pricing strategy, the Product Team wants to look at the -- products that are currently being offered for a specific price range ($20 to $50). In order to -- help them they asked you to provide them with a list of products with the following information:
-- 
-- 1. their name
-- 2. their unit price
-- 
-- Filtered on the following conditions:
-- 
-- 1. their unit price is between 20 and 50
-- 2. they are not discontinued

-- Finally order the results by unit price in a descending order (highest first).

-- Output example:
----------------------------------+------------
           product_name           | unit_price 
----------------------------------+------------
 Tarte au sucre                   |       49.3
 Ipoh Coffee                      |         46
 Vegie-spread                     |       43.9
 Schoggi Schokolade               |       43.9


--Answer:




-- The Logistics Team wants to do a retrospection of their performances for the year 1998, in order -- to identify for which countries they didn’t perform well. They asked you to provide them a list of -- countries with the following information:
-- 
-- 1. their average days between the order date and the shipping date (formatted to have only 2 -- decimals)
-- 2. their total number of orders (based on the order date) Filtered on the following conditions:
-- 3. the year of order date is 1998
-- 4. their average days between the order date and the shipping date is greater or equal 5 days
-- 5. their total number of orders is greater than 10 orders
-- 
-- Finally order the results by country name in an ascending order (lowest first).

--Output example:
--------------+-------------------------------------+---------------------
ship_country | average_days_between_order_shipping | total_number_orders 
--------------+-------------------------------------+---------------------
 Austria      |                                5.89 |                  11
 Brazil       |                                8.12 |                  28
 France       |                                9.43 |                  23
 Germany      |                                5.38 |                  34

-- Answer:


-- The Logistics Team wants to do a retrospection of their global performances over 1997-1998, in -- order to identify for which month they perform well. They asked you to provide them a list with:
-- 
-- 1. their year/month as single field in a date format (e.g. “1996-01-01” January 1996)
-- 2. their total number of orders
-- 3. their total freight (formatted to have no decimals)
-- 
-- Filtered on the following conditions:
-- 1. the order date is between 1997 and 1998
-- 2. their total number of orders is greater than 35 orders
-- 
-- Finally order the results by total freight (descending order).
-- 
-- Output Example:
------------+---------------------+---------------
year_month | total_number_orders | total_freight 
------------+---------------------+---------------
 1998-1-01  |                  55 |          5463
 1997-10-01 |                  38 |          3946
 1997-12-01 |                  48 |          3758
 1997-9-01  |                  37 |          3237

-- Answer:


-- The Pricing Team wants to know how each category performs according to their price range. In order 
-- to help them they asked you to provide them a list of categories with:
-- 
-- 1. their category name
-- 2. their total amount (formatted to be integer)
-- 3. their number of orders
-- 
-- Finally order the results by category name then price range (both ascending order).

-- Output Example:
----------------+--------------+---------------------
 category_name  | total_amount | total_number_orders 
----------------+--------------+---------------------
 Beverages      |       111464 |                 317
 Beverages      |        25079 |                  28
 Beverages      |       149984 |                  24

-- Answer:




-- The Pricing Team wants to know for each currently offered product how their unit price compares -- against their categories average and median unit price. In order to help them they asked you to -- provide them a list of products with:
-- 
-- 1. their category name
-- 2. their product name
-- 3. their unit price
-- 4. their category average unit price (formatted to have only 2 decimals)
-- 5. their category median unit price (formatted to have only 2 decimals)
-- 6. their position against the category average unit price as:
-- 	- “Below Average”
-- 	- “Equal Average”
-- 	- “Over Average”
-- They are not discontinued
-- 
-- Finally order the results by category name then product name (both ascending).
-- 
-- Output example:
----------------+------------------------+------------+--------------------+-----------------------------
category_name   |           product_name | unit_price | average_unit_price | average_unit_price_position 
----------------+------------------------+------------+--------------------+-----------------------------
 Beverages      | Chartreuse verte       |         18 |              16.68 | Over Average
 Beverages      | Côte de Blaye          |      263.5 |             245.93 | Over Average
 Beverages      | Ipoh Coffee            |         46 |              43.04 | Over Average

-- Answer:

