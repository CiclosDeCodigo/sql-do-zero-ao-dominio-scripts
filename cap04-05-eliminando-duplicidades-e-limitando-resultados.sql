/*
Arquivo: cap04-05-eliminando-duplicidades-e-limitando-resultados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT DISTINCT rating
FROM film;

SELECT DISTINCT rating, rental_rate
FROM film
ORDER BY rating, rental_rate;

SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC
LIMIT 3;

SELECT title
FROM film
ORDER BY title
LIMIT 10 OFFSET 10;

