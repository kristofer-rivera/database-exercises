USE employees;


-- Question 2

SELECT concat(first_name, ' ',last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

-- Question 3

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

-- Question 4

SELECT *, DATEDIFF(CURDATE(), hire_date)
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25';

-- Question 5 

SELECT min(salary) FROM salaries;
-- 38623
SELECT max(salary) FROM salaries;
-- 158220

-- Question 6 

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) 
AS username, first_name, last_name, birth_date 
FROM employees