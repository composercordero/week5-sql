CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	room_numnber INTEGER NOT NULL
);

ALTER TABLE theater
RENAME COLUMN room_numnber TO room_number

INSERT INTO theater(room_number)
VALUES (1), (2), (3), (4), (5), (6);

SELECT *
FROM theater;

CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	theater_id INTEGER,
	FOREIGN KEY(theater_id) REFERENCES theater(theater_id)
);


CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	duration INTEGER NOT NULL,
	rating VARCHAR(50) NOT NULL,
	theater_id INTEGER,
	FOREIGN KEY(theater_id) REFERENCES theater(theater_id)
);

INSERT INTO movie(title, duration, rating) VALUES('The Ring', 20, 'PG-13'); 
-- Added the theater_id manually because I didn't know how to once I ran the script.

SELECT * FROM movie;
INSERT INTO movie(title, duration, rating, theater_id) VALUES
('American Pie', 10, 'PG-13', 4),
('Kirby: Live Action', 15, 'PG-13', 6),
('The Walking Dead: The Movie', 12, 'R', 3),
('Harry Potter', 5, 'PG-13', 1),
('Lord of the Rings', 25, 'PG-13', 2),
('Finding Nemo 2', 30, 'PG-13', 3),
('Breaking Bad: The Movie', 65, 'R', 6),
('The Wave', 320, 'PG-13', 5),
('About Time', 1, 'R', 4)
;

SELECT * FROM theater;
SELECT * FROM movie;
-- movie.id is wrong for some reason.


CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	seat_number INTEGER NOT NULL,
	movie_id INTEGER,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	email_address VARCHAR(50) NOT NULL,
	age INTEGER NOT NULL,
	ticket_id INTEGER,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)	
);

ALTER TABLE customer
ADD payment_id INTEGER NOT NULL;

ALTER TABLE customer
ADD FOREIGN KEY(payment_id) REFERENCES payment(payment_id);
-- Did this add another FK or erase the previous one? I think it added as shown in the database.
-- I erased it manually.

-- To drop a foreign key ALTER TABLE table_name DROP CONSTRAINT tablename_colname_fkey

CREATE TABLE payment(
	payment_id SERIAL PRIMARY KEY,
	amount INTEGER NOT NULL,
	payment_date TIMESTAMP NOT NULL,
	ticket_id INTEGER,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)	
);


ALTER TABLE payment
DROP COLUMN rating;

SELECT * FROM movie;
SELECT * FROM theater;


SELECT * FROM customer;

INSERT INTO customer (
	first_name,
	last_name,
	email_address,
	age,
	ticket_id,
	payment_id
) VALUES (
	'Carlos',
	'Cordero',
	'fake@email.com',
	32,
	1,
	1
);
