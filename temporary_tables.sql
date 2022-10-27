--Q1
CREATE TEMPORARY TABLE noether_2023.employees_with_departments AS 
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(50);
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;


CREATE TEMPORARY TABLE noether_2023.employees_with_departments AS
SELECT CONCAT(first_name, ' ', last_name), dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

--Q2
CREATE TEMPORARY TABLE noether_2023.payment AS
SELECT payment_id, customer_id, staff_id, rental_id, TRUNCATE(amount * 100, 0), payment_date, last_update
FROM payment;

--Q3/Q4
CREATE TEMPORARY TABLE noether_2023.sd_salary AS
SELECT de.emp_no, s.salary AS sal, dept_name, zscore
FROM departments AS d
JOIN dept_emp AS de USING(dept_no)
JOIN salaries AS s ON s.emp_no = de.emp_no AND s.to_date > CURDATE()
JOIN (SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries) AS z USING(salary);

SELECT dept_name, ROUND(AVG(sal), 2), ROUND(AVG(zscore), 4)
FROM sd_salary  
GROUP BY dept_name;
--Marketing, .382224
--Finance, .342039
--Human Resources, -.176686
--Production, -.028436
--Development, -.035861
--Quality Management, -.116356
--Sales, ,736888
--Research, -.027301
--Customer Service, -.113316