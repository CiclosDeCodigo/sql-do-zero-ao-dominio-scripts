/*
Arquivo: cap04-03-aliases-e-legibilidade-de-consultas-sql.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

SELECT f.title, f.rental_rate
FROM film AS f;

SELECT first_name
FROM customer
INNER JOIN staff ON customer.store_id = staff.store_id;

SELECT customer.first_name
FROM customer
INNER JOIN staff ON customer.store_id = staff.store_id;

SELECT c.first_name AS client_first_name
FROM customer AS c
INNER JOIN staff AS s ON c.store_id = s.store_id;

