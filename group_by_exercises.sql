SELECT COUNT(DISTINCT title) FROM titles; -- 7
SELECT last_name FROM employees WHERE last_name RLIKE ('^E.*e$') GROUP BY(last_name);
-- Erde
-- Eldridge
-- Etalle
-- Erie
-- Erbe
SELECT first_name, last_name FROM employees WHERE last_name RLIKE ('^E.*e$') GROUP BY first_name, last_name;

SELECT last_name FROM employees WHERE last_name LIKE ('%q%') AND last_name NOT LIKE ('%qu%') GROUP BY last_name;
-- Chleq
-- Lindqvist
-- Qiwen
SELECT last_name, COUNT(*) FROM employees WHERE last_name LIKE ('%q%') AND last_name NOT LIKE ('%qu%') GROUP BY last_name;
-- Chleq, 189
-- Lindqvist, 190
-- Qiwen, 168
SELECT first_name, COUNT(gender='M'), COUNT(gender='F') FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY first_name;

SELECT LOWER(CONCAT(
    SUBSTR(first_name, 1, 1), 
    SUBSTR(last_name, 1, 4), '_',
    SUBSTR(birth_date, 6, 2),
    SUBSTR(birth_date, 3, 2))) AS username, COUNT(*) as n_same_username FROM employees GROUP BY username HAVING n_same_username >1;
-- 13251 duplicates

SELECT AVG(salary), emp_no FROM salaries GROUP BY emp_no;

SELECT dept_no, COUNT(emp_no) FROM dept_emp GROUP BY dept_no;

SELECT emp_no, COUNT(salary) FROM salaries GROUP BY emp_no;

SELECT emp_no, MAX(salary) FROM salaries GROUP BY emp_no;

SELECT emp_no, MIN(salary) FROM salaries GROUP BY emp_no;

SELECT emp_no, MAX(salary) FROM salaries WHERE salary > 150000 GROUP BY emp_no;

SELECT emp_no, AVG(salary) FROM salaries WHERE (salary > 80000 AND salary < 90000) GROUP BY emp_no;