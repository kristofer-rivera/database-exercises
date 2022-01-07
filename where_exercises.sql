-- Question 1

USE employees;
SHOW TABLES;
SELECT * FROM employees;

-- Question 2

SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya');
-- 709 records where returned. 

-- Question 3

SELECT * FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 709 records returned. The numbers matched with question 2.

-- Question 4

SELECT * FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';
-- 441 records returned. 

-- Question 5 

SELECT * FROM employees
WHERE last_name Like 'E%';
-- 7330 results. 

-- Question 6

SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
-- # of employees whose last name starts or ends with E = 30723
SELECT * FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';
-- Ends with E but does not start with E = 23393

-- Question 7 

SELECT * FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
-- Stars and ends with E = 899
SELECT * FROM employees
WHERE last_name LIKE '%E';
-- Ends with E regardless = 24292

-- Question 8 

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 135214 employees returned 

-- Question 9 

SELECT * FROM employees
WHERE birth_date LIKE '%12-25';
-- 842 employees returned

-- Question 10 

SELECT * FROM employees
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25';
-- 362 employees returned 

-- Question 11 

SELECT * FROM employees 
WHERE last_name LIKE '%q%';
-- 1873 records returned 

-- Question 12 

SELECT * FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- 547 employees returned 
