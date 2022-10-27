--Q1
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date = (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010)

--Q2
SELECT t.title, f.first_name, f.last_name
FROM (
	SELECT emp_no, first_name, last_name
	FROM employees
	WHERE first_name = 'Aamod') AS f
JOIN titles AS t
	ON f.emp_no = t.emp_no;

--Q3
SELECT f.first_name, f.last_name
FROM (
	SELECT first_name, last_name, emp_no
	FROM employees) AS f
JOIN dept_emp AS de
	ON f.emp_no = de.emp_no
JOIN salaries AS s
	ON de.emp_no = s.emp_no
JOIN titles AS t
	ON s.emp_no = t.emp_no
WHERE de.to_date <= CURDATE() AND s.to_date <= CURDATE() AND t.to_date <= CURDATE()
GROUP BY f.first_name, f.last_name;
-- 72074

--Q4
SELECT e.first_name, e.last_name, e.gender
FROM(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date >= CURDATE()) AS dm
JOIN employees AS e
	ON dm.emp_no = e.emp_no
WHERE e.gender = 'F';
-- Isamu Legleitner
-- Karsten Sigstam
-- Leon DasSarma
-- Hilary Kambil

--Q5
SELECT emp_no, salary
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries)
AND to_date > CURDATE();

--Q6
SELECT emp_no, salary
FROM salaries
WHERE to_date >= CURDATE() AND (
SELECT MAX(salary) - STD(salary)
FROM salaries) < salary 
WHERE to.date >= NOW()
ORDER BY salary DESC;
-- 78

SELECT emp_no, salary, (COUNT(emp_no) / (SELECT COUNT(emp_no) FROM salaries WHERE to_date >= CURDATE()) * 100)
FROM salaries
WHERE to_date >= CURDATE() AND (
SELECT MAX(salary) - STD(salary)
FROM salaries) < salary 
GROUP BY emp_no, salary
ORDER BY salary DESC;
-- 0.0004

--Q7: Bonus 1
SELECT e.first_name, e.last_name, e.gender, d.dept_name
FROM(
	SELECT emp_no, dept_no
	FROM dept_manager
	WHERE to_date >= CURDATE()) AS dm
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN departments AS d
	ON dm.dept_no = d.dept_no
WHERE e.gender = 'F';

--Q8: Bonus 2
SELECT first_name, last_name, salary
FROM employees AS e
JOIN (SELECT salary, emp_no FROM salaries WHERE to_date>=CURDATE() ORDER BY salary DESC LIMIT 1) AS s
	ON s.emp_no = e.emp_no;

--Q9: Bonus 3
SELECT d.dept_name, first_name, last_name, salary
FROM employees AS e
JOIN (SELECT salary, emp_no FROM salaries WHERE to_date>=CURDATE() ORDER BY salary DESC LIMIT 1) AS s
	ON s.emp_no = e.emp_no
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no;