--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating
--

CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description TEXT, release_year YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), length INTEGER, replacement_cost NUMERIC(5,2), rating mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, 
	length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, 
	length, replacement_cost, rating);
END;
$$;

DROP PROCEDURE IF EXISTS add_film;


CALL add_film('The Emperor''s New Grove', 'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank', 2008, 1, 2, 4.99, 75, 15.99, 'PG');

CALL add_film('The New Grove', 'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank', 2008, 1, 2, 4.99, 75, 15.99, 'PG');

CALL add_film('The Grove', 'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank', 2008, 1, 2, 4.99, 75, 15.99, 'PG-13');

SELECT *
FROM film
WHERE title LIKE 'The Emperor''s New Grove';

--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

CREATE OR REPLACE FUNCTION get_number_of_films (cat_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE number_of_films INTEGER;
BEGIN
	SELECT count(*) INTO number_of_films
	FROM category c 
	JOIN film_category fc
	ON c.category_id = fc.category_id 
	JOIN film f
	ON fc.film_id = f.film_id
	WHERE c.category_id = cat_id;
	RETURN number_of_films;
END;
$$;

CREATE OR REPLACE FUNCTION get_number_of_films (cat_name VARCHAR)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE number_of_films INTEGER;
BEGIN
	SELECT count(*) INTO number_of_films
	FROM category c 
	JOIN film_category fc
	ON c.category_id = fc.category_id 
	JOIN film f
	ON fc.film_id = f.film_id
	WHERE c.name ILIKE cat_name;
	RETURN number_of_films;
END;
$$;

DROP FUNCTION IF EXISTS get_number_of_films(INTEGER);
DROP FUNCTION IF EXISTS get_number_of_films(VARCHAR);

SELECT get_number_of_films('ClAsSics'); -- 57
SELECT get_number_of_films(4); -- 57


SELECT get_number_of_films('Comedy'); -- 58
SELECT get_number_of_films(5); -- 58

-- Create a Function that returns a table (not working yet)

CREATE OR REPLACE FUNCTION table_num_of_films(cat_name VARCHAR)
RETURNS TABLE (
	category INTEGER,
	name VARCHAR(45),
	count_f BIGINT -- Why BIGINT = https://www.postgresql.org/docs/current/functions-aggregate.html
)
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
	SELECT c.category_id, c.name, count(f.film_id) AS count_f
	FROM category c 
	JOIN film_category fc 
	ON c.category_id = fc.category_id 
	JOIN film f 
	ON fc.film_id = f.film_id
	WHERE cat_name ILIKE c.name
	GROUP BY c.category_id;
END;
$$;


DROP FUNCTION IF EXISTS table_num_of_films;

SELECT *
FROM table_num_of_films('classics');
