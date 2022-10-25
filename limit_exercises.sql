SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker
SELECT * FROM employees WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%' ORDER BY hire_date ASC LIMIT 5;
-- Alselm Cappello
-- Utz Mandell
-- Bouchung Schreiter
-- Baocai Kushner
-- Petter Stroustrup
SELECT * FROM employees WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%' ORDER BY hire_date ASC LIMIT 5 OFFSET 45;
-- LIMIT and OFFSET help narrow down results and put less stress on the system when querying