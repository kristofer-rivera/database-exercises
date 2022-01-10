USE employees;

-- Question 2: 

SELECT DISTINCT title FROM titles;
-- There have been 7 unique titles. 

-- Question 3: 

SELECT last_name 
FROM employees
GROUP BY last_name
HAVING last_name LIKE 'E%' AND last_name LIKE '%E';
-- Erde, Eldridge,Etalle, Erie, Erbe

-- Question 4: 

SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING last_name LIKE 'E%' AND last_name LIKE '%E';

-- Question 5:

SELECT last_name FROM employees 
GROUP BY last_name
HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- Chleq, Lindqvist, Qiwen 

-- Question 6: 

SELECT last_name, count(*) AS n_same_last_name
FROM employees 
GROUP BY last_name
HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- 189, 190, 168

-- Question 7:

SELECT first_name, gender, count(*) 
FROM employees
GROUP BY first_name, gender
HAVING first_name IN ('Irena', 'Vidya', 'Maya');

-- Question 8: 

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)))
AS username, count(*)
FROM employees
GROUP BY username;
-- Yes there are duplicate usernames. 

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)))
AS username, count(*)
FROM employees
GROUP BY username
HAVING count(username) > 1;

-- BONUS: 13251 

-- Question 9: 

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;

SELECT dept_no, COUNT(emp_no)
FROM dept_emp
GROUP BY dept_no;

SELECT emp_no, COUNT(salary)
FROM salaries
GROUP BY emp_no;

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

SELECT emp_no, MIN(salary)
FROM salaries 
GROUP BY emp_no; 

SELECT emp_no, STD(salary)
FROM salaries
GROUP BY emp_no;

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) LIKE ('8%');









