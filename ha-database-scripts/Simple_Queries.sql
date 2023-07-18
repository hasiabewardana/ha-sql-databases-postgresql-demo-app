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