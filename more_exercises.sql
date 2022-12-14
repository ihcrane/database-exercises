--Q1
SELECT * FROM actor;
SELECT last_name FROM actor;
SELECT film_id, title, release_year FROM film;

--Q2
SELECT DISTINCT last_name FROM actor;
SELECT DISTINCT postal_code FROM address;
SELECT DISTINCT rating FROM film;

--Q3
SELECT title, description, rating, length FROM film WHERE length > 180;
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date >= '2005-05-27';
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date >= '2005-05-27';
SELECT * FROM customer WHERE first_name LIKE '%n' AND last_name LIKE 'S%';
SELECT * FROM customer WHERE active = 0 OR last_name LIKE 'M%';
SELECT * FROM category WHERE category_id > 4 AND (name LIKE 'C%' OR name LIKE 'S%' OR name LIKE 'T%');
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update 
    FROM staff WHERE password IS NOT NULL;
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update 
    FROM staff WHERE password IS NULL;

--Q4
SELECT phone, district FROM address WHERE district IN ('California', 'England', 'Taipei', 'West Java');
SELECT payment_id, amount, payment_date 
    FROM payment WHERE DATE(payment_date) IN ('2005-05-25', '2005-05-27', '2005-05-29');
SELECT * FROM film WHERE rating IN ('G', 'PG-13', 'NC-17');

--Q5
SELECT * FROM payment WHERE payment_date BETWEEN '2005-05-25 0:0:0' AND '2005-05-25 23:59:59';
SELECT film_id, title, description FROM film WHERE length BETWEEN 100 AND 120;

--Q6
SELECT * FROM film WHERE description LIKE 'A Thoughtful%';
SELECT * FROM film WHERE description LIKE '%boat';
SELECT * FROM film WHERE description LIKE '%database%' AND length > 180;

--Q7
SELECT * FROM payment LIMIT 20;
SELECT payment_date, amount FROM payment WHERE amount > 5 AND payment_id BETWEEN 1000 AND 2000;
SELECT * FROM customer LIMIT 100 OFFSET 100;

--Q8
SELECT * FROM film ORDER BY length ASC;
SELECT DISTINCT rating FROM film ORDER BY rating DESC;
SELECT payment_date, amount FROM payment ORDER BY amount DESC LIMIT 20;
SELECT title, description, special_features, length, rental_duration 
    FROM film WHERE special_features LIKE '%behind the scenes%' AND length < 120 
    AND rental_duration BETWEEN 5 AND 7 ORDER BY length DESC;

--Q9
SELECT customer.first_name, customer.last_name, actor.first_name, actor.last_name
FROM customer
LEFT JOIN actor 
	ON actor.last_name = customer.last_name;
SELECT customer.first_name, customer.last_name, actor.first_name, actor.last_name
FROM customer
RIGHT JOIN actor 
	ON actor.last_name = customer.last_name;
SELECT customer.first_name, customer.last_name, actor.first_name, actor.last_name
FROM customer
JOIN actor 
	ON actor.last_name = customer.last_name;
SELECT city, country
FROM city
JOIN country
	ON city.country_id = country.country_id;
SELECT title, description, release_year, language.name 
FROM film
JOIN language
	ON film.language_id = language.language_id;
SELECT first_name, last_name, address, address2, city, district, postal_code 
FROM staff
LEFT JOIN address
	ON staff.address_id = address.address_id
LEFT JOIN city
	ON address.city_id = city.city_id

--PART TWO--
--Q1
SELECT LOWER(first_name), LOWER(last_name) FROM actor;

--Q2
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe';

--Q3
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%gen%';

--Q4
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%li%' ORDER BY last_name, first_name;

--Q5
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

--Q6
SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name;

--Q7
SELECT last_name, COUNT(last_name) AS how_many FROM actor GROUP BY last_name HAVING how_many > 1;

--Q8
CREATE TABLE address

--Q9
SELECT first_name, last_name, address
FROM staff AS s
JOIN address AS a USING(address_id);

--Q10
SELECT CONCAT(first_name, ' ', last_name) AS full_name, SUM(amount) AS total_amount
FROM staff AS s
JOIN payment AS p USING(staff_id)
WHERE payment_date LIKE '2005-08-%'
GROUP BY full_name;

--Q11
SELECT title, COUNT(actor_id) AS num_of_actors
FROM actor AS a
JOIN film_actor AS fa USING(actor_id)
JOIN film AS f USING(film_id)
GROUP BY title;

--Q12
SELECT title, COUNT(inventory_id) AS num_of_movies
FROM inventory AS i
JOIN film AS f USING(film_id)
WHERE title = 'Hunchback Impossible'
GROUP BY title;

--Q13
SELECT title
FROM film AS f
WHERE (title LIKE 'Q%' OR title LIKE 'K%') AND 
    language_id IN (SELECT language_id FROM language WHERE name = 'English');

--Q14
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM actor AS a
JOIN film_actor AS fa USING(actor_id)
WHERE film_id IN (SELECT film_id FROM film WHERE title = 'Alone Trip');

--Q15
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email
FROM customer AS cus
JOIN address AS a USING(address_id)
JOIN city AS c USING(city_id)
JOIN country AS ctry USING(country_id)
WHERE country = 'Canada';

--Q16
SELECT title
FROM film AS f
JOIN film_category AS fc USING(film_id)
JOIN category AS c USING(category_id)
WHERE c.name = 'Family';

--Q17
SELECT SUM(amount) AS total, store_id
FROM payment AS p
JOIN customer AS c USING(customer_id)
JOIN store AS s USING(store_id)
GROUP BY store_id;

--Q18
SELECT store_id, city, country
FROM store AS s
JOIN address AS a USING(address_id)
JOIN city AS c USING(city_id)
JOIN country AS ctry USING(country_id);

--Q19
SELECT SUM(p.amount) AS total, c.name AS genre
FROM payment AS p
JOIN rental AS r USING(rental_id)
JOIN inventory AS i USING(inventory_id)
JOIN film_category AS f USING(film_id)
JOIN category AS c USING(category_id)
GROUP BY genre
ORDER BY total DESC LIMIT 5;

--PART THREE--
--Q1
SELECT AVG(replacement_cost), rating FROM film
GROUP BY rating;

--Q2
SELECT c.name AS genre, COUNT(DISTINCT film_id)
FROM film f
JOIN film_category fc USING(film_id)
JOIN category c USING(category_id)
GROUP BY genre;

--Q3
SELECT title, COUNT(rental_id) AS times_rented
FROM rental r
JOIN inventory i USING(inventory_id)
JOIN film f USING(film_id)
GROUP BY title
ORDER BY times_rented DESC LIMIT 5;

--Q4
SELECT title, SUM(amount) AS total
FROM payment p
JOIN rental r USING(rental_id)
JOIN inventory i USING(inventory_id)
JOIN film f USING(film_id)
GROUP BY title
ORDER BY total DESC LIMIT 5;

--Q5
SELECT CONCAT(first_name, ' ', last_name) AS full_name, SUM(amount) AS total
FROM payment p
JOIN customer c USING(customer_id)
GROUP BY full_name
ORDER BY total DESC LIMIT 1;

--Q6
SELECT CONCAT(first_name, ' ', last_name) AS full_name, COUNT(film_id) AS times_cast
FROM actor a
JOIN film_actor fa USING(actor_id)
JOIN film f USING(film_id)
GROUP BY actor_id
ORDER BY times_cast DESC LIMIT 5;

--Q7
SELECT SUBSTR(payment_date, 1, 7) AS month, store_id, SUM(amount)
FROM payment p
JOIN staff sf USING(staff_id)
JOIN store s USING(store_id)
WHERE payment_date LIKE '2005-%-%' 
GROUP BY month, store_id
ORDER BY month;

--Q8
SELECT title, CONCAT(first_name, ' ', last_name) AS customer_name, phone, address 
FROM customer c
JOIN address a USING(address_id)
JOIN rental r USING(customer_id)
JOIN inventory i USING(inventory_id)
JOIN film f USING(film_id)
WHERE return_date IS NULL;

--PART FOUR--
--Q1
SELECT dept_name, (MAX(salary) - avg_dept_salary) AS salary_diff
FROM salaries s
JOIN dept_manager dm USING(emp_no)
JOIN departments d USING(dept_no)
JOIN (
SELECT dept_name, ROUND(AVG(salary), 2) AS avg_dept_salary
FROM salaries s
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
GROUP BY dept_name) AS ads USING(dept_name)
GROUP BY dept_name; 

--PART FIVE--
--Q1
SELECT language, percentage FROM city
JOIN countrylanguage USING(countrycode)
WHERE name = 'Santa Monica';

--Q2
SELECT region, COUNT(name) AS num_countries
FROM country 
GROUP BY region
ORDER BY num_countries;

--Q3
SELECT region, SUM(population) AS total_pop
FROM country 
GROUP BY region
ORDER BY total_pop DESC;

--Q4
SELECT continent, SUM(population) AS total_pop
FROM country 
GROUP BY continent
ORDER BY total_pop DESC;

--Q5
SELECT AVG(lifeExpectancy)
FROM country;

--Q6
SELECT continent, AVG(lifeExpectancy)
FROM country
GROUP BY continent
ORDER BY AVG(lifeExpectancy);

SELECT region, AVG(lifeExpectancy)
FROM country
GROUP BY region
ORDER BY AVG(lifeExpectancy);

--Q7:Bonus 1
SELECT name, localname FROM country
WHERE name != localname;

--Q8:Bonus 2
SELECT COUNT(lifeExpectancy) FROM country
WHERE lifeExpectancy < x;

--Q9:Bonus 3
SELECT district FROM city
WHERE name = 'x';

--Q10:Bonus 4
SELECT region FROM country ctry
JOIN city c ON c.countrycode = ctry.code
WHERE c.name = 'x';

--Q11:Bonus 5
SELECT ctry.name FROM country ctry
JOIN city c ON c.countrycode = ctry.code
WHERE c.name = 'x';

--Q12:Bonus 6
SELECT lifeExpectancy FROM country ctry
JOIN city c ON c.countrycode = ctry.code
WHERE c.name = 'x';

--PART SIX--
--Q1
--topping_id, topping_name, topping_price
--pizza_id, order_id, crust_type_id, size_id (no correlation)

--Q2
--modifier_id, modifier_name, modifier_price
--no correlation

--Q3
--they both share size_id

--Q4
--crust_types, pizza_modifiers, pizza_toppings, 

--Q5
SELECT DISTINCT topping_name FROM toppings;
--9

--Q6
SELECT DISTINCT order_id FROM pizzas;
--10000

--Q7
SELECT size_name, COUNT(size_id)
FROM sizes s
JOIN pizzas p USING(size_id)
GROUP BY size_name;
--Large

--Q8
SELECT COUNT(order_id) FROM pizzas;
--20001

--Q9
SELECT size_name, COUNT(size_id)
FROM sizes s
JOIN pizzas p USING(size_id)
GROUP BY size_name;
--Large

--Q10
SELECT AVG(num_pizzas) FROM (
SELECT order_id, COUNT(pizza_id) AS num_pizzas FROM pizzas
GROUP BY order_id) AS p;
--2

--Q11
SELECT order_id, ROUND(SUM(new_topping_price + new_modifier_price + size_price), 2) AS total_price 
FROM (
SELECT order_id, size_price,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
ORDER BY order_id) AS np
GROUP BY order_id;

--Q12
SELECT ROUND(AVG(new_topping_price + new_modifier_price + size_price), 2) AS total_price 
FROM (
SELECT order_id, size_price,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
ORDER BY order_id) AS np;
--12.77

--Q13
SELECT size_name, COUNT(size_id) 
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
ORDER BY order_id) AS np
GROUP BY size_name;
--x-large

--Q14
SELECT topping_name, COUNT(topping_id) 
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
ORDER BY order_id) AS np
GROUP BY topping_name
ORDER BY COUNT(topping_id) DESC;
--pepperoni

--Q15
SELECT COUNT(pizza_id) 
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
WHERE topping_amount = 0
ORDER BY order_id) AS np;
--47654

--Q16
SELECT ROUND(AVG(new_topping_price + new_modifier_price + size_price), 2)
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
WHERE topping_amount = 0
ORDER BY order_id) AS np;
--12.8

SELECT size_name, COUNT(size_id)
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
WHERE topping_amount = 0
ORDER BY order_id) AS np
GROUP BY size_name
ORDER BY COUNT(size_id) DESC;
--x-large

--Q17
SELECT COUNT(pizza_id)
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
WHERE topping_name = 'olives' AND size_name = 'large'
ORDER BY order_id) AS np;
--1326

--Q18
SELECT AVG(num_of_toppings)
FROM (
SELECT pizza_id, COUNT(topping_id) AS num_of_toppings
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
GROUP BY pizza_id) AS np;
--2.38

--Q19
SELECT AVG(num_of_pizzas)
FROM (
SELECT order_id, COUNT(pizza_id) AS num_of_pizzas
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)
GROUP BY order_id) AS np;
--5.02

--Q20
SELECT ROUND(AVG(new_topping_price + new_modifier_price + size_price), 2)
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)) AS np;
--12.77

--Q21
SELECT AVG(order_total) FROM (
SELECT order_id, ROUND(AVG(new_topping_price + new_modifier_price + size_price), 2) AS order_total
FROM (
SELECT *,
	CASE 
		WHEN topping_amount = 'extra' THEN (topping_price * 1.5)
		WHEN topping_amount = 'double' THEN (topping_price * 2)
		WHEN topping_amount = 'light' THEN (topping_price * .5)
		WHEN topping_amount IS NULL THEN 0
		ELSE topping_amount 
END AS new_topping_price,
	CASE
		WHEN modifier_price IS NULL THEN 0
		ELSE modifier_price
END AS new_modifier_price
FROM pizzas p
JOIN sizes s USING(size_id)
JOIN crust_types c USING(crust_type_id)
LEFT JOIN pizza_toppings pt USING(pizza_id)
LEFT JOIN toppings t USING(topping_id)
LEFT JOIN pizza_modifiers pm USING(pizza_id)
LEFT JOIN modifiers m USING(modifier_id)) AS np
GROUP BY order_id) AS ot;
--12.72

