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

-- What title does 10006 have
SELECT title
FROM titles
WHERE emp_no = '10006' AND to_date = '9999-01-01';

-- Changing column names in a select query
SELECT emp_no AS "Employee #", birth_date AS "Birthday", first_name AS "First name"
FROM employees;

-- Concat function
SELECT emp_no, concat(first_name, ' ', last_name) AS "Full Name"
FROM employees;