--Question 1: 
SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--Question 2:
SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 7;

--Question 3
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	having sum(amount) > 175
);

--Question 4
SELECT first_name, last_name, district, city, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Argentina';

--Question 5
SELECT film_category.category_id, name, count(*) AS num_movies_in_cat
FROM film_category
JOIN category
ON film_category.category_id = category.category_id
GROUP BY film_category.category_id, category.name
ORDER BY count(*) DESC;

--Question 6
SELECT film_actor.film_id, title, count(*) AS num_actors
FROM film_actor
JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film_actor.film_id, film.title
ORDER BY count(*) DESC
LIMIT 1;

--Question 7
SELECT film_actor.actor_id, first_name, last_name, count(*) AS num_films
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id, first_name, last_name
ORDER BY count(*)
LIMIT 1;

--Question 8
SELECT city.country_id, country, count(*) AS num_cities
FROM city
JOIN country
ON city.country_id = country.country_id
GROUP BY city.country_id, country
ORDER BY count(*) DESC
LIMIT 3;

--Question 9
SELECT film_actor.actor_id, first_name, last_name, count(*)
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id, first_name, last_name
HAVING count(*) BETWEEN 20 AND 25;
--ORDER BY last_name;
