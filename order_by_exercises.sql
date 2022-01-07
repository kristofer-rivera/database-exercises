-- WHERE EXERCISES

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

-- ORDER BY EXERCISES

-- Question 2

SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;
-- The first person is Irena Reutenauer, the last person listed is Vidya Simmen

-- Question 3 
SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;
-- First person is Irena Acton, last person is Vidya Zweizig.

-- Question 4 

SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;
-- First person listed is Irena Acton, last person is Maya Zyda. 

-- Question 5 

SELECT * FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no;
-- 899 employees returned. The first employee # is 10021 and their names is Ramzi Erde. The last employee # is 499648 and their name is Tadahiro Erde. 

-- Question 6 

SELECT * FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY hire_date DESC;
-- 899 employees returened. The newest employee is Taiji Eldridge and the oldest employee is Sergi Erde. 

-- Question 7 
SELECT * FROM employees
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC, hire_date DESC;
-- 362 employees returned. Oldest emp hired last = Khun Bernini and Douadi Pettis is the youngest emp hired first. 






