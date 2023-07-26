-- Simple queries
-- Giving a list of all employees in the company
-- Database: Employees
SELECT *
FROM employees;

-- How many departments are there in the company?
-- Database: Employees
SELECT count(*)
FROM departments;

-- How many times has employee 10001 had a raise?
-- Database: Employees
SELECT count(*) - 1
FROM salaries
WHERE emp_no = '10001';

-- What title does 10006 have?
-- Database: Employees
SELECT title
FROM titles
WHERE emp_no = '10006'
  AND to_date = '9999-01-01';

-- Aliases
-- Changing column names in a select query
-- Database: Employees
SELECT emp_no AS "Employee #", birth_date AS "Birthday", first_name AS "First name"
FROM employees;

-- Functions
-- Scalar functions
-- Concat function
-- Database: Employees
SELECT emp_no, concat(first_name, ' ', last_name) AS "Full Name"
FROM employees;

-- Aggregate functions
-- How many people are working in the company?
-- Database: Employees
SELECT count(emp_no)
FROM employees;

-- What is the minimum of employee no?
-- Database: Employees
SELECT min(emp_no)
FROM employees;

-- What is the maximum of employee no?
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