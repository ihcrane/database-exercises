SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC;
-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker
SELECT * FROM employees WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25'
AND (hire_date > '1990-01-01' AND hire_date <'1999-12-31') ORDER BY hire_date LIMIT 5;
-- Utz Mandell
-- Bouchung Schreiter
-- Baocai Kushner
-- Petter Stroustrup
-- Hatem Lubachevsky
SELECT * FROM employees WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25'
AND (hire_date > '1990-01-01' AND hire_date <'1999-12-31') ORDER BY hire_date LIMIT 5 OFFSET 49;
-- LIMIT and OFFSET help narrow down results and put less stress on the system when querying