SELECT users.name as user_name, roles.name as role_name, users.email as emails, COUNT(roles.name)
 FROM users JOIN roles on users.role_id = roles.id GROUP BY role_name, user_name, emails;

 -- EMPLOYEES DB

 --Q2
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE t.title = 'Manager' AND t.to_date = '9999-01-01'
ORDER BY d.dept_name;

--Q3
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE title = 'Manager' AND t.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY d.dept_name;

--Q4
SELECT t.title, COUNT(e.emp_no)
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE d.dept_name = 'Customer Service' AND dm.to_date = '9999-01-01'
GROUP BY t.title;

--Q5
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN titles AS t
	ON e.emp_no = t.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE title = 'Manager' AND t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

--Q6
SELECT d.dept_name, COUNT(de.emp_no)
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
GROUP BY d.dept_name
ORDER BY d.dept_name;

--Q7
SELECT d.dept_name, AVG(s.salary)
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE de.to_date >= NOW()
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC LIMIT 1;

--Q8
SELECT e.first_name, e.last_name
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC LIMIT 1;

--Q9
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary,
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN titles AS t
	ON e.emp_no = t.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE title = 'Manager' AND t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC LIMIT 1;

--Q10
SELECT d.dept_name, ROUND(AVG(s.salary), 0)
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;

--Q11: Bonus 1
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name, CONCAT(em.first_name, ' ', em.last_name)
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
RIGHT JOIN dept_emp AS de
	ON dm.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN employees AS em
	ON dm.emp_no = em.emp_no
WHERE dm.to_date = '9999-01-01' AND dm.emp_no = em.emp_no
GROUP BY employee_name, d.dept_name, dm.emp_no;

--Q12: Bonus 2
SELECT d.dept_name, MAX(s.salary) AS highest_salary
FROM departments AS d 
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE s.to_date >= NOW()
GROUP BY d.dept_name;