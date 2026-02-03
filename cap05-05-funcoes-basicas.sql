/*
Arquivo: cap05-05-funcoes-basicas.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT COUNT(*) AS total_filmes
FROM film;

SELECT SUM(amount) AS total_pago
FROM payment;

SELECT AVG(length) AS duracao_media
FROM film;

SELECT MIN(length) AS menor_duracao
FROM film;

SELECT MAX(length) AS maior_duracao
FROM film;

SELECT NOW();

SELECT CURDATE();

SELECT DATE(payment_date) as payment_date
FROM payment
LIMIT 5;

SELECT UPPER(first_name), LOWER(last_name)
FROM customer
LIMIT 5;

SELECT title, LENGTH(title) AS tamanho
FROM film
LIMIT 5;

SELECT CONCAT(first_name, ' ', last_name) AS nome_completo
FROM customer
LIMIT 5;

SELECT LEFT(title, 5)
FROM film
LIMIT 5;

SELECT SUBSTRING(title, 3, 5)
FROM film
LIMIT 5;

SELECT ROUND(amount, 1)
FROM payment
LIMIT 5;

SELECT CEILING(amount)
FROM payment
LIMIT 5;

SELECT FLOOR(amount)
FROM payment
LIMIT 5;

