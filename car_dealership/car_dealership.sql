CREATE TABLE country(
	country_id SERIAL PRIMARY KEY,
	country VARCHAR(50)
);

CREATE TABLE city(
	city_id SERIAL PRIMARY KEY,
	city VARCHAR(50),
	country_id INTEGER,
	FOREIGN KEY(country_id) REFERENCES country(country_id)
);

CREATE TABLE address(
	address_id SERIAL PRIMARY KEY,
	address VARCHAR(50),
	address2 VARCHAR(50),
	district VARCHAR(50),
	city_id INTEGER,
	FOREIGN KEY(city_id) REFERENCES city(city_id),
	postal_code INTEGER,
	phone INTEGER
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address_id INTEGER,
	FOREIGN KEY(address_id) REFERENCES address(address_id),
	email VARCHAR(50),
	car_id INTEGER,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	ticket_id INTEGER,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(20),
	model VARCHAR (20),
	year_ INTEGER,
	salesperson_id INTEGER,
	customer_id INTEGER
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address_id INTEGER,
	FOREIGN KEY(address_id) REFERENCES address(address_id),
	email VARCHAR(50)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address_id INTEGER,
	FOREIGN KEY(address_id) REFERENCES address(address_id),
	email VARCHAR(50)
);


CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	car_id INTEGER,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	date TIMESTAMP
);

ALTER TABLE car
ADD FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)

ALTER TABLE car
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id)

ALTER TABLE car
ALTER COLUMN year_ TYPE VARCHAR(20);

ALTER TABLE address
ALTER COLUMN phone TYPE VARCHAR(20);

ALTER TABLE address
ALTER COLUMN postal_code TYPE VARCHAR(20);

ALTER TABLE ticket
ADD COLUMN time_ TIMESTAMP;

------------------------------------------------------------------------------------------

INSERT INTO country(country) VALUES('Venezuela'), ('United States'), ('Colombia');

-- SELECT * FROM country; --

INSERT INTO city(city, country_id) VALUES('Maracaibo', 1), ('Caracas', 1), ('Guanare', 1), ('Portland',2), ('Barranquilla', 3);

INSERT INTO city (city, country_id) VALUES ('Austin', 2);

SELECT * FROM city;

INSERT INTO address(address, district, city_id, postal_code, phone) VALUES('1910 Rincker Rinkerson', 'Texas', 6, '78725', '888 828 8288'), ('4003 Capital City', 'Texas', 6, '78734', '845 828 3988'), ('Urbanizacion Santa Isabel', 'Zulia', 1, '4001','828 853 8128');

SELECT * FROM address;


CREATE OR REPLACE PROCEDURE add_customer(first_name VARCHAR, last_name VARCHAR, address_id INTEGER, email VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, address_id, email)
	VALUES(first_name, last_name, address_id, email);
END;
$$;

-- DROP PROCEDURE IF EXISTS add_customer; --

CALL add_customer('Carlos', 'Cordero', '1', 'myemail@gmail.com');
CALL add_customer('Sweet Pea', 'Cordero', '2', 'heremail@gmail.com');
CALL add_customer('Olive', 'Cordero', '3', 'heremail@gmail.com');
CALL add_customer('Tomas', 'Ranch', '2', 'twoemail@gmail.com');
CALL add_customer('Bean', 'Espinoza', '2', 'beanemail@gmail.com');

SELECT * FROM customer;

CREATE OR REPLACE PROCEDURE add_salesperson(first_name VARCHAR, last_name VARCHAR, address_id INTEGER, email VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(first_name, last_name, address_id, email)
	VALUES(first_name, last_name, address_id, email);
END;
$$;

CALL add_salesperson('Jose', 'Espinoza', '1', 'youremail@gmail.com');
CALL add_salesperson('Alejandra', 'Pedroza', '3', 'twoemailfour@gmail.com');
CALL add_salesperson('Annie', 'Carroll', '2', 'lastemail@gmail.com');

SELECT * FROM salesperson;

INSERT INTO ticket(time_) VALUES(NOW());
INSERT INTO ticket(time_) VALUES(NOW());
INSERT INTO ticket(time_) VALUES(NOW());

SELECT * FROM ticket;

CREATE OR REPLACE PROCEDURE add_car(make VARCHAR, model VARCHAR, year_ VARCHAR, salesperson_id INTEGER, customer_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car(make, model, year_, salesperson_id, customer_id)
	VALUES(make, model, year_, salesperson_id, customer_id);
END;
$$;

CALL add_car('Toyota', 'Yaris', '2008', 1, 2);
CALL add_car('Toyota', 'Corolla', '2010', 2, 3);
CALL add_car('Tesla', 'Water', '2020', 2, 2);

SELECT * FROM car;


CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR, last_name VARCHAR, address_id INTEGER, email VARCHAR, car_id INTEGER, ticket_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(first_name, last_name, address_id, email, car_id, ticket_id)
	VALUES(first_name, last_name, address_id, email, car_id, ticket_id);
END;
$$;

CALL add_mechanic('Koy', 'Ruggiero', 3, 'mynotemail@gmail.com', 1, 2);
CALL add_mechanic('Ray', 'Earth', 3, 'myyesemail@gmail.com', 2, 1);
CALL add_mechanic('Veronica', 'Wind', 3, 'mythreeemail@gmail.com', 2, 3);

SELECT * FROM mechanic;

INSERT INTO invoice(customer_id, salesperson_id, car_id) VALUES(2, 1, 1);
INSERT INTO invoice(customer_id, salesperson_id, car_id, date) VALUES(3, 2, 1, NOW());
INSERT INTO invoice(customer_id, salesperson_id, car_id, date) VALUES(4, 3, 2, NOW());

SELECT * FROM invoice;











