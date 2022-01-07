USE employees; SHOW TABLES;

-- Question 2

SELECT DISTINCT title FROM titles
ORDER BY title DESC
LIMIT 10;

-- Question 3

SELECT * FROM employees
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;
--  Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

-- Question 4

SELECT * FROM employees
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
-- The relationship can be expresses as follows: Page = Offset + Limit/Limit