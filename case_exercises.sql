--Q1
SELECT e.emp_no, full_name, dept_no, hire_date,
	CASE WHEN to_date < CURDATE() THEN to_date
	ELSE '9999-01-01'
END AS end_date,
	CASE WHEN to_date < CURDATE() THEN 0
	ELSE 1
END AS is_current_employee
FROM (SELECT CONCAT(first_name, " ", last_name) AS full_name, emp_no, hire_date FROM employees GROUP BY emp_no) AS e
JOIN dept_emp AS de USING(emp_no)
GROUP BY e.emp_no, full_name, hire_date, dept_no;

--Q2
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
	CASE last_name
		WHEN last_name NOT RLIKE '^[A-H]' THEN 'A-H'
		WHEN last_name NOT RLIKE '^[I-Q]' THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;

--Q3
SELECT 
		COUNT(CASE WHEN birth_date LIKE '195%-%-%' THEN birth_date ELSE NULL END) AS '50s',
		COUNT(CASE WHEN birth_date LIKE '196%-%-%' THEN birth_date ELSE NULL END) AS '60s',
		COUNT(CASE WHEN birth_date LIKE '197%-%-%' THEN birth_date ELSE NULL END) AS '70s',
		COUNT(CASE WHEN birth_date LIKE '198%-%-%' THEN birth_date ELSE NULL END) AS '80s',
		COUNT(CASE WHEN birth_date LIKE '199%-%-%' THEN birth_date ELSE NULL END) AS '90s'
FROM employees;

--Q4
SELECT ROUND(AVG(salary), 2) AS avg_salary,
   CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       WHEN dept_name IN ('finance', 'Human resources') THEN 'Finance & HR'
       ELSE dept_name
   END AS dept_group
FROM departments AS d
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no AND de.to_date > CURDATE()
JOIN salaries AS s
	ON s.emp_no = de.emp_no AND s.to_date > CURDATE()
GROUP BY dept_group;