/*
Arquivo: cap04-02-consulta-e-recuperacao-de-dados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
USE sakila;

SELECT first_name, last_name FROM actor;

SELECT * FROM actor;

SELECT film_id, title 
FROM film;

SELECT title, rental_rate
FROM film
WHERE rental_rate > 4.00;

SELECT rating, COUNT(*) AS total_filmes
FROM sakila.film
GROUP BY rating;

SELECT min(last_update) FROM actor;

SELECT min(payment_date),
       max(payment_date)
FROM sakila.payment;

SELECT rating, COUNT(*) AS total_filmes
FROM sakila.film
GROUP BY rating
HAVING COUNT(*) > 200;

SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC, title;

SELECT rating, COUNT(*) AS total_filmes
FROM film
WHERE rental_rate > 2.99
GROUP BY rating
HAVING COUNT(*) > 50
ORDER BY total_filmes DESC;

