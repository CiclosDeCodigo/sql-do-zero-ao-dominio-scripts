/*
Arquivo: cap05-02-subconsultas.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
);

