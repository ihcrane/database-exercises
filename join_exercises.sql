SELECT users.name as user_name, roles.name as role_name, users.email as emails, COUNT(roles.name)
 FROM users JOIN roles on users.role_id = roles.id GROUP BY role_name, user_name, emails;

 -- EMPLOYEES DB

 --Q2
SELECT dept_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM departments AS d 
JOIN dept_manager AS dm
	ON dm.dept_no = d.dept_no AND to_date > CURDATE()
JOIN employees AS e USING(emp_no)
ORDER BY dept_name;


--Q3
SELECT dept_name, CONCAT(first_name, ' ', last_name) AS full_name, gender
FROM employees AS e
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
	AND dm.to_date > CURDATE()
	AND gender = 'F'
JOIN departments AS d USING(dept_no);

--Q4
SELECT t.title, COUNT(de.emp_no) AS total 
FROM dept_emp AS de
JOIN titles AS t
	ON t.emp_no = de.emp_no AND t.to_date > CURDATE()
JOIN employees AS e
	ON e.emp_no = de.emp_no AND de.to_date > CURDATE()
JOIN departments AS d
	ON d.dept_no = de.dept_no AND dept_name = 'Customer Service'
GROUP BY t.title;

--Q5
SELECT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, salary
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no AND dm.to_date > CURDATE()
JOIN employees AS e USING(emp_no)
JOIN titles AS t USING(emp_no)
JOIN salaries AS s
	ON s.emp_no = e.emp_no AND s.to_date > CURDATE()
GROUP BY dept_name, full_name, salary;

--Q6
SELECT dept_name, COUNT(de.emp_no)
FROM departments AS d 
JOIN dept_emp AS de USING(dept_no)
JOIN employees AS e USING(emp_no)
GROUP BY dept_name;

--Q7
SELECT dept_name, AVG(salary)
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no AND de.to_date > CURDATE()
JOIN employees AS e USING(emp_no)
JOIN salaries AS s
	ON s.emp_no = e.emp_no AND s.to_date > CURDATE()
GROUP BY d.dept_name
ORDER BY AVG(salary) DESC LIMIT 1;

--Q8
SELECT first_name, last_name
FROM departments AS d 
JOIN dept_emp AS de USING(dept_no)
JOIN employees AS e USING(emp_no)
JOIN salaries AS s USING(emp_no)
WHERE dept_name = 'Marketing'
ORDER BY salary DESC LIMIT 1;

--Q9
SELECT dept_name, CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no AND dm.to_date > CURDATE()
JOIN employees AS e USING(emp_no)
JOIN titles AS t USING(emp_no)
JOIN salaries AS s
	ON s.emp_no = e.emp_no AND s.to_date > CURDATE()
ORDER BY s.salary DESC LIMIT 1;

--Q10
SELECT dept_name, ROUND(AVG(salary), 0)
FROM departments AS d 
JOIN dept_emp AS de USING(dept_no)
JOIN employees AS e USING(emp_no)
JOIN salaries AS s USING(emp_no)
GROUP BY d.dept_name
ORDER BY AVG(salary) DESC;


--Q11: Bonus 1
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name, CONCAT(em.first_name, ' ', em.last_name) AS manager_name
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no AND dm.to_date > CURDATE()
JOIN dept_emp AS de 
	ON dm.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN employees AS em 
	ON dm.emp_no = em.emp_no;

--Q12: Bonus 2
SELECT s. department, s.highest_salary, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM (
SELECT s.department, s.highest_salary, y.emp_no
FROM (
SELECT d.dept_name AS department, MAX(s.salary) AS highest_salary
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE s.to_date >= CURDATE()
GROUP BY d.dept_name
ORDER BY d.dept_name) AS s
JOIN departments AS d
	ON s.department = d.dept_name
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
LEFT JOIN salaries AS y
	ON s.highest_salary = y.salary
GROUP BY s.department, s.highest_salary, y.emp_no
ORDER BY s.department) AS s
JOIN employees AS e
	ON s.emp_no = e.emp_no;