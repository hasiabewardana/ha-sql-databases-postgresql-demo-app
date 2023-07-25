-- Simple queries
-- Give me a list of all employees in the company
SELECT *
FROM employees;

-- How many departments are there in the company?
SELECT count(*)
FROM departments;

-- How many times has employee 10001 had a raise?
SELECT count(*) - 1
FROM salaries
WHERE emp_no = '10001';

-- What title does 10006 have?
SELECT title
FROM titles
WHERE emp_no = '10006'
  AND to_date = '9999-01-01';

-- Aliases
-- Changing column names in a select query
SELECT emp_no AS "Employee #", birth_date AS "Birthday", first_name AS "First name"
FROM employees;

-- Functions
-- Scalar functions
-- Concat function
SELECT emp_no, concat(first_name, ' ', last_name) AS "Full Name"
FROM employees;

-- Aggregate functions
-- How many people are working in the company?
SELECT count(emp_no)
FROM employees;

-- What is the minimum of employee no?
SELECT min(emp_no)
FROM employees;

-- What is the maximum of employee no?
SELECT max(emp_no)
FROM employees;

-- Get the highest salary available.
SELECT max(salary)
FROM salaries;

-- Get the total amount of salaries paid.
SELECT sum(salary)
FROM salaries;

-- Exercise: Aggregate Functions
-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: Employees
 */
--

-- Question 1: What is the average salary for the company?
-- Table: Salaries
SELECT avg(salary)
FROM salaries;

-- Question 2: What year was the youngest person born in the company?
-- Table: employees
SELECT extract(year from max(birth_date))
FROM employees;

-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: France
 */
--

-- Question 1: How many towns are there in france?
-- Table: Towns
SELECT count(id)
FROM towns;

-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: World
 */
--

-- Question 1: How many official languages are there?
-- Table: countrylanguage
SELECT count(language)
FROM countrylanguage
WHERE isofficial = true;

-- Question 2: What is the average life expectancy in the world?
-- Table: country
SELECT avg(lifeexpectancy)
FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
SELECT avg(population)
FROM city
WHERE countrycode = 'NLD';