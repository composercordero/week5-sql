--Week 5 - Monday Questions
--
--1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2

SELECT * FROM actor;

SELECT COUNT(*) FROM actor
WHERE last_name LIKE 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--Answer: 5607

SELECT COUNT(amount)
FROM payment
WHERE amount 
BETWEEN 3.99 AND 5.99;

--3. What films have exactly 7 copies? (search in inventory)
--Answer: See the list below, too many to copy.

SELECT * FROM inventory;

--SELECT inventory.film_id, film.title, COUNT(inventory.film_id)
--FROM inventory, film
--GROUP BY inventory.film_id, film.title
--HAVING COUNT(inventory.film_id) = 7
--ORDER BY inventory.film_id;

SELECT film_id,COUNT(film_id)
FROM inventory
GROUP BY film_id
HAVING COUNT(film_id) = 7
ORDER BY film_id;

--4. How many customers have the first name ‘Willie’?
--Answer: 2

SELECT * 
FROM customer
ORDER BY first_name DESC;

SELECT COUNT(first_name)
FROM customer
WHERE first_name LIKE 'Willie';


--5. What store employee (get the id) sold the most rentals (use the rental table)?
--Answer:



--6. How many unique district names are there?
-- Answer: 378

SELECT district FROM address;

SELECT COUNT(DISTINCT district) 
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Answer: 508

SELECT film_id, COUNT(film_id) AS num_of_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_of_actors DESC;


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--Answer: 21

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--Answer: {'0.99': 269, '2.99':290, '4.99':281}

SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250
ORDER BY amount;


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
--Answer: 5 rating categories, NC-17 has the most ratings at 210.

SELECT COUNT(DISTINCT rating) 
FROM film;

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating);