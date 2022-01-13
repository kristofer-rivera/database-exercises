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






