# The different concepts of databases and the commands used in PostgreSQL


There are mainly divided into 4 categories: DDL, DML, DCL & TCL.

- The **[DDL](#-Data-Definition-(DDL)-Commands)** (Data Definition Language) commands are used to define the database.  
Example: **CREATE, DROP, ALTER, TRUNCATE, COMMENT, RENAME**.
- The **[DML](#-Data-Manipulation-(DML)-Commands)** (Data Manipulation Language) commands deal with the manipulation of data present in the database.  
Example: **SELECT, INSERT, UPDATE, DELETE**.
- The **DCL** (Data Control Language) commands deal with the permissions, rights and other controls of the database system.  
Example: **GRANT, INVOKE**.
- The **TCL** (Transaction Control Language) commands deal with the transaction of the database.  
Example: **BEGIN, COMMIT, ROLLBACK.**


## Data Definition (DDL) Commands
---

### **CREATE**

This statement is used to either create a schema, tables or an index.

**The ‘CREATE TABLE’ Statement**

The CREATE TABLE statement is used to create a new table in a database.

***Syntax***:
```sql
CREATE TABLE table_name (  
   column1 datatype,  
   column2 datatype,  
   column3 datatype,  
....  
);
```
***Example***:
```sql
CREATE TABLE staff_type
(   staff_type_id INT,
    staff_type_name VARCHAR(50),
    PRIMARY KEY (staff_type_id)
);
CREATE TABLE teachersinfo
( teacher_id INT,
  teacher_name VARCHAR(200),
  address VARCHAR(255),
  city VARCHAR(255),
  postal_code INT,
  country VARCHAR(255),
  salary INT,
  staff_type_id INT,
  PRIMARY KEY (teacher_id),
  FOREIGN KEY (staff_type_id) REFERENCES staff_type(staff_type_id)
);
```

**Check this on Postgres**
```sql
northwind=# \d teachersinfo
                    Table "public.teachersinfo"
Column        |          Type          | Collation | Nullable | Default 
--------------+------------------------+-----------+----------+---------
teacher_id    | integer                |           | not null | 
teacher_name  | character varying(200) |           |          | 
address       | character varying(255) |           |          | 
city          | character varying(255) |           |          | 
postal_code   | integer                |           |          | 
country       | character varying(255) |           |          | 
salary        | integer                |           |          | 
staff_type_id | integer                |           |          | 
Indexes:
    "teachersinfo_pkey" PRIMARY KEY, btree (teacher_id)
Foreign-key constraints:
    "teachersinfo_staff_type_id_fkey" FOREIGN KEY (staff_type_id) REFERENCES staff_type(staff_type_id)

northwind=# \d staff_type
                    Table "public.staff_type"
    Column         |         Type          | Collation | Nullable | Default 
----------------+-----------------------+-----------+----------+---------
staff_type_id   | integer               |           | not null | 
staff_type_name | character varying(50) |           |          | 
Indexes:
    "staff_type_pkey" PRIMARY KEY, btree (staff_type_id)
Referenced by:
    TABLE "teachersinfo" CONSTRAINT "teachersinfo_staff_type_id_fkey" FOREIGN KEY (staff_type_id) REFERENCES staff_type(staff_type_id)
```

Try this on Northwind database
```sql

root@ab1925c9a811:/# psql -U postgres northwind
psql (15.1 (Debian 15.1-1.pgdg110+1))
Type "help" for help.

northwind=# \d employees
                          Table "public.employees"
      Column       |          Type          | Collation | Nullable | Default 
-------------------+------------------------+-----------+----------+---------
 employee_id       | smallint               |           | not null | 
 last_name         | character varying(20)  |           | not null | 
 first_name        | character varying(10)  |           | not null | 
 title             | character varying(30)  |           |          | 
 title_of_courtesy | character varying(25)  |           |          | 
 birth_date        | date                   |           |          | 
 hire_date         | date                   |           |          | 
 address           | character varying(60)  |           |          | 
 city              | character varying(15)  |           |          | 
 region            | character varying(15)  |           |          | 
 postal_code       | character varying(10)  |           |          | 
 country           | character varying(15)  |           |          | 
 home_phone        | character varying(24)  |           |          | 
 extension         | character varying(4)   |           |          | 
 photo             | bytea                  |           |          | 
 notes             | text                   |           |          | 
 reports_to        | smallint               |           |          | 
 photo_path        | character varying(255) |           |          | 
Indexes:
    "pk_employees" PRIMARY KEY, btree (employee_id)
Foreign-key constraints:
    "fk_employees_employees" FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
Referenced by:
    TABLE "employee_territories" CONSTRAINT "fk_employee_territories_employees" FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
    TABLE "employees" CONSTRAINT "fk_employees_employees" FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
    TABLE "orders" CONSTRAINT "fk_orders_employees" FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
    TABLE "orders_2" CONSTRAINT "orders_2_employee_id_fkey" FOREIGN KEY (employee_id) REFERENCES employees(employee_id)

```
On other hand pg_dump utility can help you.

```sh
pg_dump --help
pg_dump -U postgres -Fp -s -t employees northwind

```

Output from pg_dump

```sql
--
-- PostgreSQL database dump complete
--

root@ab1925c9a811:/# pg_dump -U postgres -Fp  -s -t employees northwind
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id smallint NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


--
-- Name: employees fk_employees_employees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES public.employees(employee_id);


--
-- PostgreSQL database dump complete
--
```

### **ALTER**

This statement is used to add, modify or delete constraints or columns.

**The ‘ALTER TABLE’ Statement**

The ALTER TABLE statement is used to either add, modify or delete constraints and columns from a table.

***Syntax***:
```sql
ALTER TABLE table_name  
ADD column_name datatype;
```
***Example***:
```sql
ALTER TABLE teachersinfo
ADD dateofbirth DATE;
```

### **DROP**

This command is used to delete the database, tables or columns.

**The ‘DROP TABLE’ Statement**

The DROP TABLE statement is used to drop the entire table with all its values.

***Syntax***:

```sql 
DROP TABLE table_name;
```

***Example***:

```sql
DROP TABLE teachersinfo;
```

### **TRUNCATE**

The TRUNCATE statement is used to delete the data which is present inside a table, but the table doesn’t get deleted.

***Syntax***:

```sql
TRUNCATE TABLE table_name;
```

***Example***:

```sql
TRUNCATE TABLE teachersinfo;
```

### **RENAME**

The RENAME statement is used to rename one or more tables or columns.

***Syntax***:

```sql
--Rename Table name  
ALTER TABLE table_name RENAME TO new_table_name;  

-- Rename Column name  
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name; 
```

***Example***:
```sql
ALTER TABLE teachersinfo RENAME TO infoteachers;
ALTER TABLE infoteachers RENAME COLUMN dateofbirth TO dob;
```

### Different Types Of Keys In Database – PostgreSQL Tutorial

There are mainly 5 types of Keys, that can be mentioned in the database.

- **Candidate Key** – A Candidate Key is a combination of a minimal set of attributes which can uniquely identify a tuple. Any relation can have more than a single Candidate Key, with the key being a simple or a composite key.
- **Super Key** – A Super Key is the set of attributes which can uniquely identify a tuple. So, a Candidate Key is a Super Key, but vice-versa isn’t true.
- **Primary Key** – A Primary Key is a set of attributes that can be used to uniquely identify every tuple. So, if there are 3-4 candidate keys present in a relationship, then out those, one can be chosen as a Primary Key.
- **Alternate Key** – All the Candidate Keys other than the Primary Key is called as an Alternate Key.
- **Foreign Key** – An attribute that can only take the values present as the values of some other attribute, is the foreign key to the attribute to which it refers.

### Constraints Used In Database – PostgreSQL Tutorial

The constraints which you can use in databases are as follows:

- **NOT NULL** – The NOT NULL constraint ensures that a NULL value cannot be stored in a column
- **UNIQUE** – The UNIQUE constraint makes sure that all the values in a column are different
- **CHECK** -The CHECK constraint ensures that all the values in a column satisfy a specific condition.
- **DEFAULT** -The DEFAULT constraint consists of a set of default values for a column when no value is specified.
- **INDEX** – The INDEX constraint is used to create and retrieve data from the database very quickly

### Data Manipulation (DML) Commands
----

This section of the article consists of the commands, by which you can manipulate your database. The commands are:

- INSERT
- UPDATE
- DELETE
- SELECT

### **INSERT**

The INSERT statement is used to insert new records in a table. 

***Syntax***:

```sql
-- The INSERT INTO statement can be written in the following two ways:   

INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);  

--You need not mention the column names  
INSERT INTO table_name VALUES (value1, value2, value3, ...);
```

***Example***:

```sql
INSERT INTO teachersinfo(teacher_id, teacher_name, address, city, postal_code, country, salary) VALUES ('01', 'saurav','gangnam street', 'seoul', '06499', 'south korea', '42000'); 
 
INSERT INTO teachersinfo VALUES ('02', 'Preeti','Queens Quay', 'Rio Claro', '13500', 'Brazil', '45900');
```

### UPDATE

The UPDATE statement is used to modify the existing records in a table.

***Syntax***:

```sql
UPDATE table_name  
SET column1 = value1, column2 = value2, ...  
WHERE condition;
```
***Example***:

```sql
UPDATE teachersinfo
SET teacher_name = 'Alfred', City= 'Frankfurt'
WHERE teacher_id = '01';
```

### **DELETE**

The DELETE statement is used to delete existing records in a table.

***Syntax***:

```sql
DELETE FROM table_name WHERE condition;
```

***Example***:

```sql
DELETE FROM TeachersInfo WHERE TeacherName='Vinod';
```

### **SELECT**

The SELECT statement is used to select data from a database and the data returned is stored in a result table, called the result-set.

The following are the two ways of using this statement:

***Syntax***:

```sql
SELECT column1, column2, ...   
FROM table_name; 

--(*) is used to select all from the table  
SELECT * FROM table_name;
```

***Example***:

```sql
SELECT teacher_name, city FROM teachersinfo; SELECT * FROM teachersinfo;
```

Apart from the individual SELECT keyword, you can use the SELECT keyword with the following statements:

- DISTINCT
- ORDER BY
- GROUP BY
- HAVING Clause

**The ‘SELECT DISTINCT’ Statement**

The SELECT DISTINCT statement is used to return only distinct or different values. So, if you have a table with duplicate values, then you can use this statement to list distinct values.

***Syntax***:
```sql
SELECT DISTINCT column1, column2, ...  
FROM table_name;
```
***Example***:

```sql
SELECT country FROM teachersinfo;
```

#### The ‘ORDER BY’ Statement

The ORDER BY statement is used to sort the desired results in ascending or descending order. By default, the results would be sorted in ascending order. If you want to sort the records in descending order, then you have to use the DESC keyword.

***Syntax***:

```sql
SELECT column1, column2, ...  
FROM table_name  
ORDER BY column1, column2, ...ASC|DESC;  
```

***Example***:

```sql
SELECT * FROM teachersinfo
ORDER BY country; 
 
SELECT * FROM teachersinfo
ORDER BY country DESC;
 
SELECT * FROM teachersinfo
ORDER BY country, TeachersName;
 
SELECT * FROM teachersinfo
ORDER BY country ASC, teachers_name DESC;
```

#### The ‘GROUP BY’ Statement

This statement is used with the aggregate functions to group the result-set by one or more columns.

***Syntax***:
```sql
SELECT column_name(s)  
FROM table_name  
WHERE condition  
GROUP BY column_name(s)  
ORDER BY column_name(s);
```

***Example***:
```sql
SELECT COUNT(TeacherID), Country
FROM TeachersInfo
GROUP BY Country
ORDER BY COUNT(TeacherID) DESC;
```

#### The ‘HAVING’ Clause Statement

Since the WHERE keyword cannot be used with aggregate functions, the HAVING clause was introduced.

***Syntax***:

```sql
SELECT column_name(s)  
FROM table_name  
WHERE condition  
GROUP BY column_name(s)  
HAVING condition  
ORDER BY column_name(s);
```

***Example***:

```sql
SELECT COUNT(teacher_id), country
FROM teachersinfo
GROUP BY country
HAVING COUNT(salary);
```

### Aggregate Functions – PostgreSQL Tutorial
---

The following section of the article will include functions such as:

- MIN()
- MAX()
- COUNT()
- AVG()
- SUM()

**MIN()Function**

The MIN function returns the smallest value of the selected column in a table.

***Syntax***:

```sql
SELECT MIN(column_name) FROM table_name WHERE condition;  
```

***Example***:

```sql
SELECT MIN(salary) AS smallestsalary FROM teachersinfo;
```

**MAX() Function**

The MAX function returns the largest value of the selected column in a table.

***Syntax***:

```sql
SELECT MAX (column_name) FROM table_name WHERE condition;  
```

***Example***:

```sql
SELECT MAX(salary) AS largestsalary FROM teachersinfo;
```

**COUNT() Function**

The COUNT function returns the number of rows that match the specified criteria.

***Syntax***:

```sql
SELECT COUNT (column_name) FROM table_name WHERE condition;  
```

***Example***:

```sql
SELECT COUNT(teacher_id) FROM teachersinfo;
```

**AVG() Function**

The AVG function returns the average value of a numeric column that you choose.

***Syntax***:

```sql
SELECT AVG (column_name) FROM table_name WHERE condition;
```

***Example***:

```sql
SELECT AVG(salary) FROM teachersinfo;
```

**SUM() Function**

The SUM function returns the total sum of a numeric column that you choose.

***Syntax***:

```sql
SELECT SUM(column_name) FROM table_name WHERE condition;  
```

***Example***:

```sql
SELECT SUM(salary) FROM teachersinfo;
```

### Special Operators – PostgreSQL Tutorial
---

This section of the article will include the following operators:

- BETWEEN
- IS NULL
- LIKE
- IN
- EXISTS
- ALL
- ANY

**BETWEEN Operator**

The BETWEEN operator is an inclusive operator which selects values(numbers, texts or dates) within a given range.

***Syntax***:

```sql
SELECT column_name(s)  
FROM table_name  
WHERE column_name BETWEEN value1 AND value2;  
```

***Example***:

```sql 
SELECT * FROM TeachersInfo WHERE Fees BETWEEN 30000 AND 45000;
```

***IS NULL Operator***

Since, it is not possible to test for NULL values with the comparison operators(=, <, >), we can use IS NULL and IS NOT NULL operators instead.

***Syntax***:

```sql
--Syntax IS NULL  
 
SELECT column_names  
FROM table_name  
WHERE column_name IS NULL;  
 
--Syntax for IS NOT NULL  
SELECT column_names  
FROM table_name  
WHERE column_name IS NOT NULL;  
```

***Example***:

```sql
SELECT teacher_name FROM teachersinfo
WHERE address IS NULL;
SELECT teacher_name FROM teachersinfo
WHERE address IS NOT NULL;
```

***LIKE Operator***

The LIKE operator is used in a WHERE clause to search for a specified pattern in a column of a table.

The mentioned below are the two wildcards that are used in conjunction with the LIKE operator:

- % – The percent sign represents zero, one, or multiple characters
- _ – The underscore represents a single character

***Syntax***:

```sql
SELECT column1, column2, ...  
FROM table_name  
WHERE column LIKE pattern;
```

***Example***:

```sql
SELECT * FROM teachersinfo
WHERE teacher_name LIKE 'S%';
```

**IN Operator**

The IN operator is a shorthand operator and is used for multiple OR conditions.

***Syntax***:

```sql
SELECT column_name(s)  
FROM table_name  
WHERE column_name IN (value1, value2, ...);
```

***Example***:

```sql
SELECT * FROM TeachersInfo
WHERE Country IN ('South Korea', 'India', 'Brazil');
```

NOTE: You can also use IN while writing Nested Queries.

***EXISTS Operator***

The EXISTS operator is used to test if a record exists or not.

***Syntax***:

```sql
SELECT column_name(s)  
FROM table_name  
WHERE EXISTS  
       (SELECT column_name   
       FROM table_name  
       WHERE condition);
```

***Example***:

```sql
SELECT teacher_name
FROM teachersinfo
WHERE EXISTS 
    (SELECT * 
        FROM teachersinfo 
        WHERE teacher_id = 05 AND salary > 25000);
```

**ALL Operator**

The ALL operator is used with a WHERE or HAVING clause and returns true if all of the sub-query values meet the condition.

***Syntax***:

```sql
SELECT column_name(s)  
FROM table_name  
WHERE column_name operator ALL  
            (SELECT column_name 
            FROM table_name 
            WHERE condition);
```

**Example**:

```sql
SELECT teachername
FROM teachersinfo
WHERE teacher_id = ALL 
        (SELECT teacher_id 
            FROM teachersinfo 
            WHERE Salary > 25000);
```

**ANY Operator**

Similar to the ALL operator, the ANY operator is also used with a WHERE or HAVING clause and returns true if any of the sub-query values meet the condition.

***Syntax***:

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
        (SELECT column_name FROM table_name WHERE condition);
```

***Example***:

```sql
SELECT teachername
FROM teachersinfo 
WHERE teacherid = ANY
    (SELECT teacherid 
        FROM teachersinfo WHERE salary BETWEEN 32000 AND 45000);
```

### Set Operations
---

There are mainly three set operations: **UNION, INTERSECT, MINUS**. You can refer to the image below to understand the set operations in SQL. Refer to the below image:

**UNION**

The UNION operator is used to combine the result-set of two or more SELECT statements.

***Syntax***

```sql
SELECT  column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
```

**INTERSECT**

The INTERSECT clause is used to combine two SELECT statements and return the intersection of the data-sets of both the SELECT statements.

***Syntax***

```sql
SELECT Column1 , Column2 ....
FROM  table_name;
WHERE condition

INTERSECT

SELECT Column1 , Column2 ....
FROM  table_name;
WHERE condition
```

**EXCEPT**

The EXCEPT operator returns those tuples that are returned by the first SELECT operation, and are not returned by the second SELECT operation.

***Syntax***


```sql
SELECT  column_name FROM  table_name;

EXCEPT

SELECT column_name FROM table_name;
```

### Limit, Offset and Fetch
---

**LIMIT**

The LIMIT statement is used to retrieve a portion of the rows out of the complete rows present in the table.

***Syntax***:

```sql 
SELECT column_name FROM table_name LIMIT number;
```

***Example***:

```sql
SELECT * FROM TeachersInfo LIMIT 5;
```

**OFFSET**

The OFFSET statement omits the number of rows you mention and then retrieves the rest portion of the rows.

***Syntax***:

```sql
SELECT column_name  
FROM table_name OFFSET number LIMIT number;
```

**Example**:

```sql
--Select 3 rows from TeachersInfo after the 5th row
SELECT * FROM TeachersInfo OFFSET 5 LIMIT 3;

--Select all rows from TeachersInfo
SELECT * FROM TeachersInfo OFFSET 2;
```

### Joins
---
JOINS in PostgreSQL are used to combine rows from two or more tables, based on a related column between those tables. The following are the types of joins: 

- **INNER JOIN**: The INNER JOIN returns those records which have matching values in both the tables.
- **LEFT JOIN**: The LEFT JOIN returns records from the left table, and also those records which satisfy the condition from the right table.
- **RIGHT JOIN**: The RIGHT JOIN returns records from the right table, and also those records which satisfy the condition from the left table.
- **FULL JOIN**: The FULL JOIN returns all those records which either have a match in the left or the right table.


**INNER JOIN**

***Syntax***:

```sql
SELECT column_name(s)  
FROM table1  
INNER JOIN table2 ON table1.column_name = table2.column_name;
```

***Example***:

```sql
SELECT subjects.subject_id, teachersinfo.teacher_name
FROM subjects
INNER JOIN teachersinfo ON subjects.teacher_id = teachersinfoteacher_id;
```

**LEFT JOIN**

***Syntax***:

```sql
SELECT column_name(s)  
FROM table1  
LEFT JOIN table2 ON table1.column_name = table2.column_name;
```

***Example***:

```sql
SELECT teachersinfo.teacher_name, subjects.subject_id
FROM teachersinfo
LEFT JOIN subjects ON teachersinfo.teacherid = subjects.teacherid
ORDER BY teachersinfo.teachername;
```

**RIGHT JOIN**

***Syntax***:

```sql
SELECT column_name(s) 
FROM table1 
RIGHT JOIN table2 ON table1.column_name = table2.column_name;
```

***Example***:

```sql
SELECT subjects.subject_id
FROM subjects
RIGHT JOIN teachersinfo ON subjects.subject_id = teachersinfoteacher_id
ORDER BY subjects.subject_id;
```
**FULL JOIN**

***Syntax***:

```sql
SELECT column_name(s)  
FROM table1  
FULL OUTER JOIN table2 ON table1.column_name = table2.column_name;
```

***Example***:

```sql
SELECT teachersinfo.teacher_name, subjects.subject_id
FROM teachersinfo
FULL OUTER JOIN subjects ON teachersinfo.teacher_id = subjectssubject_id
ORDER BY teachersinfo.teacher_name;
```

## PostgreSQL CASE
---

The PostgreSQL CASE expression is the same as IF/ELSE statement in other programming languages. It allows you to add if-else logic to the query to form a powerful query.

Since CASE is an expression, you can use it in any places where an expression can be used e.g.,SELECT, WHERE, GROUP BY, and HAVING clause.

The CASE expression has two forms: general and simple form.

### 1) General PostgreSQL CASE expression

The following illustrates the general form of the CASE statement:

```sql
CASE 
  WHEN condition_1  THEN result_1
  WHEN condition_2  THEN result_2
  [WHEN ...]
  [ELSE else_result]
END
```

In this syntax, each condition **(condition_1, condition_2…)** is a boolean expression that returns either **true** or **false**.

When a condition evaluates to **false**, the **CASE** expression evaluates the next condition from the top to bottom until it finds a condition that evaluates to **true**.

If a condition evaluates to **true**, the **CASE** expression returns the corresponding result that follows the condition. For example, if the **condition_2** evaluates to **true**, the **CASE** expression returns the **result_2**. Also, it immediately stops evaluating the next expression.

In case all conditions evaluate to **false**, the **CASE** expression returns the result (**else_result**) that follows the **ELSE** keyword. If you omit the **ELSE** clause, the **CASE** expression returns **NULL**.

**A) A general CASE example**

Suppose you want to label the films by their length based on the following logic:

- If the lengh is less than 50 minutes, the film is short.
- If the length is greater than 50 minutes and less than or equal to 120 minutes, the film is medium.
- If the length is greater than 120 minutes, the film is long.

To apply this logic, you can use the **CASE** expression in the **SELECT** statement as follows:

```sql
SELECT title,
   length,
   CASE
       WHEN length> 0
            AND length <= 50 THEN 'Short'
       WHEN length > 50
            AND length <= 120 THEN 'Medium'
       WHEN length> 120 THEN 'Long'
   END duration
FROM film
ORDER BY title;
```

>Note that we placed a column alias duration after the CASE expression.

**B) Using CASE with an aggregate function**

***example***

Suppose that you want to assign price segments to films with the following logic:

- If the rental rate is 0.99, the film is economic.
- If the rental rate is 1.99, the film is mass.
- If the rental rate is 4.99, the film is premium.

And you want to know the number of films that belong to economy, mass, and premium.

In this case, you can use the **CASE** expression to construct the query as follows:

```sql
SELECT
SUM (CASE
    WHEN rental_rate = 0.99 THEN 1
    ELSE 0
    END
) AS "Economy",
SUM (
	CASE
	WHEN rental_rate = 2.99 THEN 1
	ELSE 0
	END
) AS "Mass",
SUM (
	CASE
	WHEN rental_rate = 4.99 THEN 1
	ELSE 0
	END
) AS "Premium"
FROM
	film;
```

### 2) Simple PostgreSQL CASE expression

PostgreSQL provides another form of the CASE expression called simple form as follows:

```sql
CASE expression
    WHEN value_1 THEN result_1
    WHEN value_2 THEN result_2 
    [WHEN ...]
ELSE
    else_result
END
```

The **CASE** first evaluates the **expression** and compares the result with each value( **value_1, value_2**, …) in the WHEN clauses sequentially until it finds the match.

Once the result of the **expression** equals a value (value1, value2, etc.) in a **WHEN** clause, the **CASE** returns the corresponding result in the **THEN** clause.

If **CASE** does not find any matches, it returns the **else_result** in that follows the **ELSE**, or **NULL** value if the ELSE is not available.

**A) Simple PostgreSQL CASE expression example**

```sql
SELECT title,
   rating,
   CASE rating
       WHEN 'G' THEN 'General Audiences'
       WHEN 'PG' THEN 'Parental Guidance Suggested'
       WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
       WHEN 'R' THEN 'Restricted'
       WHEN 'NC-17' THEN 'Adults Only'
   END rating_description
FROM film
ORDER BY title;
```

**B) Using simple PostgreSQL CASE expression with aggregate function** 

The following statement uses CASE expression with the SUM function to calculate the number of films in each rating:

```sql
SELECT
   SUM(CASE rating
         WHEN 'G' THEN 1 
	     ELSE 0 
	   END) "General Audiences",
   SUM(CASE rating
         WHEN 'PG' THEN 1 
	     ELSE 0 
	   END) "Parental Guidance Suggested",
   SUM(CASE rating
         WHEN 'PG-13' THEN 1 
	     ELSE 0 
	   END) "Parents Strongly Cautioned",
   SUM(CASE rating
         WHEN 'R' THEN 1 
	     ELSE 0 
	   END) "Restricted",
   SUM(CASE rating
         WHEN 'NC-17' THEN 1 
	     ELSE 0 
	   END) "Adults Only"
FROM film;
```

## With Clause

In PostgreSQL, the **WITH** query provides a way to write auxiliary statements for use in a larger query. It helps in breaking down complicated and large queries into simpler forms, which are easily readable. These statements often referred to as Common Table Expressions or CTEs, can be thought of as defining temporary tables that exist just for one query.

The **WITH** query being CTE query, is particularly useful when subquery is executed multiple times. It is equally helpful in place of temporary tables. It computes the aggregation once and allows us to reference it by its name (may be multiple times) in the queries.

The **WITH** clause must be defined before it is used in the query.

***Syntax***

The basic syntax of WITH query is as follows −

```sql
WITH
   name_for_summary_data AS (
      SELECT Statement)
   SELECT columns
   FROM name_for_summary_data
   WHERE conditions <=> (
      SELECT column
      FROM name_for_summary_data)
   [ORDER BY columns]
```

Where ***name_for_summary_data*** is the name given to the WITH clause. The ***name_for_summary_data*** can be the same as an existing table name and will take precedence.

>You can use data-modifying statements (INSERT, UPDATE or DELETE) in WITH. This allows you to perform several different operations in the same query.

## Recursive WITH

Recursive WITH or Hierarchical queries, is a form of CTE where a CTE can reference to itself, i.e., a WITH query can refer to its own output, hence the name recursive.

***Example***

Consider the table COMPANY having records as follows −

```sql
select * from COMPANY;
```

| id | name  | age | address   | salary|
|----|-------|-----|-----------|--------|
|  1 | Paul  |  32 | California|  20000|
|  2 | Allen |  25 | Texas     |  15000|
|  3 | Teddy |  23 | Norway    |  20000|
|  4 | Mark  |  25 | Rich-Mond |  65000|
|  5 | David |  27 | Texas     |  85000|
|  6 | Kim   |  22 | South-Hall|  45000|
|  7 | James |  24 | Houston   |  10000|

```sql
With CTE AS
(Select
 ID
, NAME
, AGE
, ADDRESS
, SALARY
FROM COMPANY )
Select * From CTE;
```

The above given PostgreSQL statement will produce the following result −

| id | name  | age | address   | salary|
|----|-------|-----|-----------|--------
|  1 | Paul  |  32 | California|  20000|
|  2 | Allen |  25 | Texas     |  15000|
|  3 | Teddy |  23 | Norway    |  20000|
|  4 | Mark  |  25 | Rich-Mond |  65000|
|  5 | David |  27 | Texas     |  85000|
|  6 | Kim   |  22 | South-Hall|  45000|
|  7 | James |  24 | Houston   |  10000|

Now, let us write a query using the RECURSIVE keyword along with the WITH clause, to find the sum of the salaries less than 20000, as follows −

```sql
WITH RECURSIVE t(n) AS (
   VALUES (0)
   UNION ALL
   SELECT SALARY FROM COMPANY WHERE SALARY < 20000
)
SELECT sum(n) FROM t;
```
The above given PostgreSQL statement will produce the following result −

```sql
  sum
-------
 25000
(1 row)
```
