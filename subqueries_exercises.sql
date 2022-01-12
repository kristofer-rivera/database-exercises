USE employees;

-- Question 1: 

SELECT * FROM employees WHERE employees.emp_no IN(SELECT dept_emp.emp_no FROM dept_emp WHERE to_date = '9999-01-01') AND hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010');

-- Question 2: 

SELECT * FROM titles WHERE titles.emp_no IN(SELECT dept_emp.emp_no FROM dept_emp WHERE to_date = '9999-01-01') AND titles.emp_no IN(SELECT emp_no FROM employees WHERE first_name = 'Aamod');

SELECT DISTINCT 
-- 251 results

-- Question 3: 

SELECT * FROM employees WHERE employees.emp_no IN(SELECT dept_emp.emp_no FROM dept_emp WHERE to_date != '9999-01-01');
-- 85108 employees are in the table who are not currently working for the company. 

-- Question 4: 

SELECT first_name, last_name FROM employees WHERE emp_no IN(SELECT dept_manager.emp_no FROM dept_manager WHERE gender = 'F' AND to_date = '9999-01-01');
-- Isamy Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- Question 5: 

SELECT emp_no, salary FROM salaries WHERE to_date = '9999-01-01' AND salary > (SELECT AVG(salary) FROM salaries);
-- 154543 results. 

-- Question 6: 

SELECT salary FROM salaries
WHERE to_date = '9999-01-01'
ORDER BY salary DESC;

SELECT COUNT(salary) AS num_sal
FROM salaries
WHERE to_date > NOW();

SELECT MAX(salary) FROM salaries WHERE to_date > NOW();

SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW();

SELECT COUNT(salary) AS sal_in_1
FROM salaries WHERE salary >= (SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW()) AND to_date > NOW();

SELECT COUNT(salary) AS sal_in_1
FROM salaries WHERE salary >= (SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW()) AND to_date > NOW())
/
(SELECT COUNT(salary) AS num_sal
FROM salaries
WHERE to_date > NOW())
WHERE t_date . NOW()) * 100 AS percent_of_salaries;

-- INCOMPLETE SOLUTION




-- BONUS

-- Question 1:

-- Question 2:

-- Question 3:







