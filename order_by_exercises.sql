SELECT * FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya' ORDER BY first_name;
-- Irena Reutenauer
-- Vidya Simmen
SELECT * FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya' ORDER BY first_name, last_name;
-- Irena Acton
-- Vidya Zweizig
SELECT * FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya' ORDER BY last_name, first_name;
-- Irena Acton
-- Maya Zyda
SELECT * FROM employees WHERE last_name RLIKE ('^E.*e$') ORDER BY emp_no;
-- 899
-- 10021, Ramzi Erde
-- 499648, Tadahiro Erde
SELECT * FROM employees WHERE last_name RLIKE ('^E.*e$') ORDER BY hire_date DESC;
-- 899
-- Teiji Eldridge
-- Sergi Erde
SELECT * FROM employees WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25'
AND (hire_date > '1990-01-01' AND hire_date <'1999-12-31') ORDER BY birth_date, hire_date DESC;
-- 361
-- Khun Bernini
-- Douadi Pettis
