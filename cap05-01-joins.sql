/*
Arquivo: cap05-01-joins.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
USE db_estudo;

CREATE TABLE tabela_a (
    id_a INT NOT NULL
);

CREATE TABLE tabela_b (
    id_b INT NOT NULL
);

INSERT INTO tabela_a (id_a)
VALUES (1), (2), (3), (4), (5), (6);

INSERT INTO tabela_b (id_b)
VALUES (4), (5), (6), (7), (8), (9);

SELECT a.id_a, b.id_b
FROM tabela_a a
INNER JOIN tabela_b b
    ON a.id_a = b.id_b;

SELECT a.id_a, b.id_b
FROM tabela_a a
LEFT JOIN tabela_b b
    ON a.id_a = b.id_b;

SELECT a.id_a
FROM tabela_a a
LEFT JOIN tabela_b b
    ON a.id_a = b.id_b
WHERE b.id_b IS NULL;

SELECT a.id_a, b.id_b
FROM tabela_a a
RIGHT JOIN tabela_b b
    ON a.id_a = b.id_b;

SELECT a.id_a, b.id_b
FROM tabela_a a
RIGHT JOIN tabela_b b
    ON a.id_a = b.id_b;

SELECT a.id_a, b.id_b
FROM tabela_a a
LEFT JOIN tabela_b b
    ON a.id_a = b.id_b
UNION
SELECT a.id_a, b.id_b
FROM tabela_a a
RIGHT JOIN tabela_b b
    ON a.id_a = b.id_b;

SELECT a.id_a, b.id_b
FROM tabela_a a
LEFT JOIN tabela_b b
    ON a.id_a = b.id_b
WHERE b.id_b IS NULL
UNION
SELECT a.id_a, b.id_b
FROM tabela_a a
RIGHT JOIN tabela_b b
    ON a.id_a = b.id_b
WHERE a.id_a IS NULL;

SELECT id_a, id_b
FROM tabela_a
CROSS JOIN tabela_b
order by id_a, id_b;

SELECT f.film_id,
	 f.description,
       c.name as name_category,    
	 l.name as name_language,
       ol.name as name_original_language
FROM film as f
INNER JOIN language as l
	ON f.language_id = l.language_id
LEFT JOIN language as ol
	ON f.original_language_id = ol.language_id
INNER JOIN film_category as fc
	on f.film_id = fc.film_id
INNER JOIN category as c
	on fc.category_id = c.category_id
ORDER BY film_id, name_category, name_language
