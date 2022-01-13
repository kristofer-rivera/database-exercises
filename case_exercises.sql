USE employees;
-- Question 1:

SELECT emp_no, dept_no, from_date AS 'start_date', to_date AS 'end_date',
IF (to_date = '9999-01-01', TRUE, FALSE) AS 'is_current_employee'
FROM dept_emp;

-- Question 2: 

SELECT CONCAT(first_name, ' ', last_name) AS 'Name', 
CASE
WHEN last_name BETWEEN 'A%' AND 'H%' THEN 'A-H'
WHEN last_name BETWEEN 'I%' AND 'Q%' THEN 'I-Q'
ELSE 'R-Z'
END AS 'alpha_group'
FROM employees;

-- Question 3: 

SELECT COUNT(CASE WHEN birth_date LIKE '195%' THEN '50s' END) AS '1950s', COUNT(CASE WHEN birth_date LIKE '196%' THEN '60s' END) AS '1960s'
FROM employees;

-- Other solution:

SELECT 
CASE
WHEN birth_date LIKE '195%' THEN '50s'
WHEN birth_date LIKE '196%' THEN '60s'
ELSE NULL
END  AS 'Decade',
COUNT(*) AS 'Number_Born'
FROM employees
GROUP BY decade;

-- Question 4: 

SELECT 
CASE 
WHEN d.dept_name IN ('Research', 'Development') THEN 'R&D'
WHEN d.dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
WHEN d.dept_name IN ('Production,' 'Quality Management') THEN 'Production & QM'
WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
ELSE d.dept_name
END AS dept_group,
AVG(s.salary) AS avg_salary
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
WHERE s.to_date > NOW() AND de.to_date > NOW()
GROUP BY dept_group; 









