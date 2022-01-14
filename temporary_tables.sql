-- Question 1: 

USE innis_1664;

CREATE TEMPORARY TABLE fake_employees AS SELECT * FROM employees.employees;

CREATE TEMPORARY TABLE fake_dept_emp AS SELECT * FROM employees.dept_emp;

CREATE TEMPORARY TABLE fake_departments AS SELECT * FROM employees.departments;


-- Creating Table:

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, fake_departments.dept_name
FROM fake_employees
JOIN fake_dept_emp USING (emp_no)
JOIN fake_departments USING (dept_no);


SELECT * FROM employees_with_departments;


-- a. Adding Column

ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

-- b. Updating Column

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name); 

-- c. Removing first_name, last_name

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- d. Another way would have been to create a table using a query that only pulled out dept_name from the employees database and included a CONCAT in the SELECT statement that referenced (employees.employees.first_name, ' ', employees.employees.last_name)

-- Question 2: 

CREATE TEMPORARY TABLE fake_payment AS SELECT * FROM sakila.payment;

SELECT * FROM fake_payment;

ALTER TABLE fake_payment ADD amount_transformed INT;

UPDATE fake_payment SET amount_transformed = amount * 100;

ALTER TABLE fake_payment DROP amount;

ALTER TABLE fake_payment RENAME COLUMN amount_transformed TO amount;

-- Question 3: 

-- Creating temp table with average salary per department  

CREATE TEMPORARY TABLE avg_pay_per_dept AS 
SELECT employees.departments.dept_name, AVG(employees.salaries.salary) AS average_salary
FROM employees.dept_emp 
JOIN employees.salaries 
USING (emp_no)
JOIN employees.departments
USING (dept_no)
WHERE employees.dept_emp.to_date > now() AND employees.salaries.to_date > now()
GROUP BY employees.departments.dept_name;

SELECT * FROM avg_pay_per_dept;


-- Creating temp table with salaries, departments, and emp_no


CREATE TEMPORARY TABLE emp_department_salaries AS
SELECT emp_no, dept_name, salary
FROM employees.dept_emp
	JOIN employees.departments USING(dept_no)
	JOIN employees.salaries USING(emp_no)
WHERE employees.salaries.to_date > NOW()
AND employees.dept_emp.to_date > NOW();

SELECT * FROM emp_department_salaries;


-- adding column with zscore 

ALTER TABLE emp_department_salaries ADD z_scores DECIMAL(2, 2);


SELECT AVG(salary), STDDEV(salary) FROM emp_department_salaries;

-- Updating z_score columb with values 


UPDATE emp_department_salaries
SET z_salaries = (salary - (
	SELECT AVG(employees.salaries.salary)
	FROM employees.salaries ))
	WHERE employees.salaries.to_date > NOW()))
 / (SELECT STDDEV(employees.salaries.salary) 
	FROM employees.salaries)
	WHERE employees.salaries.to_date > NOW());



-- CLASS SOLUTION :

CREATE TEMPORARY TABLE historic_aggregates AS (
SELECT AVG(salary) AS avg_salary, std(salary) AS std_salary FROM employees.salaries);


CREATE TEMPORARY TABLE current_info AS (
SELECT dept_name, AVG(salary) AS department_curr_avg
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE employees.dept_emp.to_date > curdate()
AND employees.salaries.to_date > curdate()
GROUP BY dept_name);


ALTER TABLE current_info ADD historic_avg FLOAT(10,2);
ALTER TABLE current_info ADD historic_std FLOAT(10,2);
ALTER TABLE current_info ADD zscore FLOAT(10,2);

UPDATE current_info SET historic_avg = (SELECT avg_salary FROM historic_aggregates);
UPDATE current_info SET historic_std = (SELECT std_salary FROM historic_aggregates);
UPDATE current_info SET zscore = (department_curr_avg - historic_avg) / historic_std;

SELECT * FROM current_info
ORDER BY zscore DESC;



























