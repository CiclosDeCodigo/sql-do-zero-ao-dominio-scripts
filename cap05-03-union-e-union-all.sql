/*
Arquivo: cap05-03-union-e-union-all.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT first_name, last_name FROM actor
UNION
SELECT first_name, last_name FROM customer;

SELECT first_name, last_name FROM actor
UNION ALL
SELECT first_name, last_name FROM customer;

