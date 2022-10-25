SELECT CONCAT(first_name, last_name) AS full_name FROM employees WHERE last_name RLIKE ('^E.*e$');
SELECT UPPER(CONCAT(first_name, last_name)) AS full_name FROM employees WHERE last_name RLIKE ('^E.*e$');

SELECT *, DATEDIFF(CURDATE(), hire_date) FROM employees WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25'
AND (hire_date > '1990-01-01' AND hire_date <'1999-12-31');

SELECT MAX(salaries), MIN(salaries) FROM employees;

SELECT LOWER(CONCAT(
    SUBSTR(first_name, 1, 1), 
    SUBSTR(last_name, 1, 4), '_',
    SUBSTR(birth_date, 6, 2),
    SUBSTR(birth_date, 3, 2))) FROM employees;