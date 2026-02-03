/*
Arquivo: cap04-04-operadores-de-comparacao-e-operadores-logicos.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT customer_id, first_name 
FROM customer
WHERE customer_id = 1;

SELECT country_id, country
FROM country
WHERE country = 'Brazil';

SELECT city 
FROM city
WHERE country_id = 999;

SELECT language_id, name
FROM language
WHERE name <> 'English';

SELECT staff_id, first_name, last_name
FROM staff
WHERE first_name <> 'Jon';

SELECT payment_id, rental_id, amount
FROM payment
WHERE amount > 10;

SELECT payment_id, rental_id, amount
FROM payment
WHERE amount > 11.99;

SELECT first_name, last_name 
FROM actor
WHERE first_name > last_name
ORDER BY first_name;

SELECT payment_id, rental_id, amount
FROM payment
WHERE amount >= 11.99;

SELECT language_id, name, last_update
FROM language
WHERE last_update >= '2006-01-01';

SELECT first_name, last_name FROM actor
WHERE first_name >= 'Z'
ORDER BY first_name desc;

SELECT payment_id, rental_id, amount
FROM payment
WHERE amount < 1
ORDER BY amount desc;

SELECT category_id, name
FROM category
WHERE category_id < 3;

SELECT first_name, last_name 
FROM actor
WHERE first_name < last_name
ORDER BY first_name;

SELECT payment_id, rental_id, amount
FROM payment
WHERE amount <= 0.01;

SELECT language_id, name, last_update
FROM sakila.language
WHERE last_update <= '2006-01-01';

SELECT first_name, last_name FROM actor
WHERE first_name <= 'AL'
ORDER BY first_name desc;

SELECT title, rating
FROM film
WHERE rating = 'PG'
  AND rental_rate > 2.99;

SELECT first_name, last_name
FROM customer
WHERE active = 1
  AND store_id = 1
  AND first_name = 'MARY';

SELECT rating, title
FROM film
WHERE (rating = 'G'
   OR rating = 'PG')
ORDER BY rating, title;

SELECT active, store_id, customer_id
FROM customer
WHERE active = 1
  AND store_id = 1 OR store_id = 2
ORDER BY active, store_id, customer_id;

SELECT active, store_id, customer_id
FROM customer
WHERE active = 1
  AND (store_id = 1 OR store_id = 2)
ORDER BY active, store_id, customer_id;

SELECT rating, title
FROM film
WHERE NOT rating = 'R'
ORDER BY rating, title;

SELECT first_name, last_name
FROM customer
WHERE NOT active = 0;

SELECT category_id, name
FROM category
WHERE category_id in(1,2,3);

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (1, 5, 10);

SELECT category_id, name
FROM category
WHERE category_id NOT IN(1,2,3);

SELECT first_name, last_name
FROM actor
WHERE actor_id NOT IN(1, 5, 10);

SELECT title
FROM film
WHERE title LIKE 'AR%'; -- Inicia com AR

SELECT last_name
FROM customer
WHERE last_name LIKE '%SON'; -- Termina com SON

SELECT last_name
FROM customer
WHERE last_name LIKE '%ANDER%'; -- Contem ANDER

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name like 'D_N'
ORDER BY actor_id ; -- Começa com D, termina com N e tenha um caractere no meio

SELECT address_id, address, address2
FROM address
WHERE address2 IS NULL
ORDER BY address_id, address, address2;

SELECT address_id, address, address2
FROM address
WHERE address2 = NULL -- Consulta incorreta: não haverá resultado
ORDER BY address_id, address, address2;

SELECT address_id, address, address2
FROM address
WHERE address2 IS NOT NULL
ORDER BY address_id, address, address2;
