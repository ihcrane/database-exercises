SELECT first_name, last_name FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya' ORDER BY first_name;
-- Irena Reutenauer
-- Vidya Simmen
SELECT first_name, last_name FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya' ORDER BY first_name, last_name;
-- Irena Acton
-- Vidya Zweizig
SELECT first_name, last_name FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya' ORDER BY last_name, first_name;
-- Irena Acton
-- Maya Zyda
SELECT * FROM employees WHERE last_name LIKE ('E%e') ORDER BY emp_no;
-- 899
-- 10021, Ramzi Erde
-- 499648, Tadahiro Erde
SELECT * FROM employees WHERE last_name LIKE ('E%e') ORDER BY hire_date DESC;
-- 899
-- Teiji Eldridge
-- Sergi Erde
SELECT * FROM employees WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%' ORDER BY birth_date, hire_date DESC;
-- 362
-- Khun Bernini
-- Douadi Pettis
