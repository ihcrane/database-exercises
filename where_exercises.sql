SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709
SELECT first_name, last_name FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya';
-- 709
SELECT first_name, last_name, gender FROM employees WHERE (first_name='Irena' OR first_name='Vidya' OR first_name='Maya') AND gender='M';
-- 441
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%';
-- 7330
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%e';
-- 30723
SELECT first_name, last_name FROM employees WHERE last_name LIKE ('E%e');
-- 899
SELECT COUNT(*) FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 135214
SELECT first_name, last_name, birth_date FROM employees WHERE birth_date LIKE '%-12-15';
-- 842
SELECT * FROM employees WHERE birth_date LIKE '%-12-25' AND (hire_date BETWEEN '1990-01-01' AND '1999-12-31');
-- 362
SELECT first_name, last_name FROM employees WHERE last_name LIKE ('%q%');
-- 1873
SELECT first_name, last_name FROM employees WHERE last_name LIKE ('%q%') AND last_name NOT LIKE ('%qu%');
-- 547