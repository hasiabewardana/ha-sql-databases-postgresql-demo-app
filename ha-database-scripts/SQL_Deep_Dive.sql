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
-- Question 2: What year was the youngest person born in the company?
-- Table: employees
SELECT avg(salary)
FROM salaries;