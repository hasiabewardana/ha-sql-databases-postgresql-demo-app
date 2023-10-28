-- Simple queries
-- Get the list of all employees in the company.
-- Database: Employees
SELECT *
FROM employees;

-- Get the no of departments in the company.
-- Database: Employees
SELECT count(*)
FROM departments;

-- Get the no of times that employee 10001 had raises.
-- Database: Employees
SELECT count(*) - 1
FROM salaries
WHERE emp_no = '10001';

-- Get the title of employee 10006.
-- Database: Employees
SELECT title
FROM titles
WHERE emp_no = '10006'
  AND to_date = '9999-01-01';

-- Aliases
-- Change column names in a select query.
-- Database: Employees
SELECT emp_no AS "Employee #", birth_date AS "Birthday", first_name AS "First name"
FROM employees;

-- Functions
-- Scalar functions
-- Concatenate columns.
-- Database: Employees
SELECT emp_no, concat(first_name, ' ', last_name) AS "Full Name"
FROM employees;

-- Aggregate functions
-- Get the no of people working in the company.
-- Database: Employees
SELECT count(emp_no)
FROM employees;

-- Get the minimum of employee no.
-- Database: Employees
SELECT min(emp_no)
FROM employees;

-- Get the maximum of employee no.
-- Database: Employees
SELECT max(emp_no)
FROM employees;

-- Get the highest salary available.
-- Database: Employees
SELECT max(salary)
FROM salaries;

-- Get the total amount of salaries paid.
-- Database: Employees
SELECT sum(salary)
FROM salaries;

-- Question 1: What is the average salary for the company?
-- Database: Employees
-- Table: Salaries
SELECT avg(salary)
FROM salaries;

-- Question 2: What year was the youngest person born in the company?
-- Table: employees
-- Database: Employees
SELECT extract(year from max(birth_date))
FROM employees;

-- Question 1: How many towns are there in france?
-- Database: France
-- Table: Towns
SELECT count(id)
FROM towns;

-- Question 1: How many official languages are there?
-- Database: World
-- Table: countrylanguage
SELECT count(language)
FROM countrylanguage
WHERE isofficial = true;

-- Question 2: What is the average life expectancy in the world?
-- Database: World
-- Table: country
SELECT avg(lifeexpectancy)
FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Database: World
-- Table: city
SELECT avg(population)
FROM city
WHERE countrycode = 'NLD';

-- This is singe-line comment.
/*
This is multi-line comment.
We can describe complex logic in multi-line comments.
*/

-- Get a list of all female employees.
-- Database: Employees
-- Table: employees
SELECT first_name
FROM employees
WHERE gender = 'F';

/*
Filter out with 2 criteria.
Database: Employees
Table: employees
*/
SELECT *
FROM employees
WHERE first_name = 'Uri' AND last_name = 'Lenart';

/*
Want to filter out 2 first names
Database: Employees
Table: employees
*/
SELECT *
FROM employees
WHERE first_name = 'Uri' OR first_name = 'Alain';

/*
How many female customers do we have from the state of Oregon (OR) and New York (NY)?
Database: Store
Table: Customers
*/
select count(firstname)
from customers
where (state='OR' or state='NY') and gender='F';

/*
How many customers aren't 55?
Database: Store
Table: Customers
*/
select count(firstname)
from customers
where not age=55;

/*
Database: Store
Table: Customers
*/
-- How many female customers do we have from the state of Oregon (OR)?
select count(firstname)
from customers
where gender='F' and state='OR';

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
select firstname
from customers
where age>44 and income>=100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
select firstname
from customers
where age>=30 and age<=50 and income<50000;

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
select avg(income)
from customers
where age>20 and age<50;

/*
* DB: Store
* Table: Customers
* Question:
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/
select firstname
from customers
where (age<30 or age>50) and income>50000 and age=50 and (country='Japan' or country='Australia');

/*
* DB: Store
* Table: Orders
* Question:
* What was our total sales in June of 2004 for orders over 100 dollars?
*/
select sum(totalamount)
from orders
where (orderdate>='2004-06-01' and orderdate>='2004-06-30') and totalamount>100;

/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/
SELECT coalesce(address2, 'No Address')
FROM customers;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/
SELECT *
FROM customers
WHERE address2 IS NOT null;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/
SELECT coalesce(lastName, 'Empty'), * from customers
where (age IS NULL);

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
select firstname
from customers
where (age between 30 and 50) and income<50000;

-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
select avg(income)
from customers
where age between 20 and 50;

/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623
*/
SELECT count(orderid)
FROM orders
where customerid in (7888, 1082, 12808, 9623);


/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/
SELECT count(id)
FROM city
where district in ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/
SELECT first_name, EXTRACT (YEAR FROM AGE(birth_date)) as "age"
FROM employees
where first_name like 'M%';

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/
select count(emp_no)
from employees
where first_name ilike 'A%R';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211
*/
select count(customerid)
from customers
where zip::text like '%2%';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109
*/
select count(customerid)
from customers
where zip::text like '2_1%';

/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"
* Expected output: https://imgur.com/AVe6G4c
*/
select coalesce(state, 'No State')
from customers
where phone::text like '302%';