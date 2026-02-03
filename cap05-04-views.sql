/*
Arquivo: cap05-04-views.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
CREATE VIEW vw_filmes_detalhados AS
SELECT f.film_id,
       f.title,
       c.name   AS category,
       l.name   AS language
FROM film f
INNER JOIN film_category fc
    ON f.film_id = fc.film_id
INNER JOIN category c
    ON fc.category_id = c.category_id
INNER JOIN language l
    ON f.language_id = l.language_id;

SELECT film_id, title, category, language
FROM vw_filmes_detalhados
ORDER BY film_id;

