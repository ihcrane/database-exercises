SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709
SELECT first_name, last_name FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya';
-- 709
SELECT first_name, last_name, gender FROM employees WHERE (first_name='Irena' OR first_name='Vidya' OR first_name='Maya') AND gender='M';
-- 441
SELECT first_name, last_name FROM employees WHERE last_name LIKE '^E';
-- 7330
SELECT first_name, last_name FROM employees WHERE last_name IN ('^E' OR 'e$');
-- 300024
SELECT first_name, last_name FROM employees WHERE last_name RLIKE ('^E.*e$');
-- 899
SELECT hire_date FROM employees WHERE hire_date > '1990-01-01' AND hire_date <'1999-12-31';
-- 135147
SELECT first_name, last_name, birth_date FROM employees WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25';
-- 842
SELECT * FROM employees WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25'
AND (hire_date > '1990-01-01' AND hire_date <'1999-12-31');
-- 361
SELECT first_name, last_name FROM employees WHERE last_name LIKE ('%q%');
-- 1873
SELECT first_name, last_name FROM employees WHERE last_name LIKE ('%q%') AND last_name NOT LIKE ('%qu%');
-- 547