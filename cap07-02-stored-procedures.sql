/*
Arquivo: cap07-02-stored-procedures.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT
    ROUTINE_NAME,
    ROUTINE_TYPE
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = 'sakila'
  AND ROUTINE_TYPE in('PROCEDURE', 'FUNCTION');

DELIMITER $$

CREATE PROCEDURE sp_listar_filmes_titulo()
BEGIN
    SELECT film_id, title 
    FROM film
    ORDER BY title;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_listar_filmes_por_classificacao (
    IN p_rating VARCHAR(10)
)
BEGIN
    SELECT film_id, title, rating
    FROM film
    WHERE rating = p_rating;
END $$

DELIMITER ;

CALL sp_listar_filmes_por_classificacao('G');

DELIMITER $$

CREATE PROCEDURE sp_total_filmes_por_classificacao (
    IN p_rating VARCHAR(10),
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_total
    FROM film
    WHERE rating = p_rating;
END $$

DELIMITER ;

SET @total = 0;
CALL sp_total_filmes_por_classificacao('G', @total);
SELECT @total;

DELIMITER $$

CREATE PROCEDURE sp_incrementar_valor (
    INOUT p_valor INT
)
BEGIN
    SET p_valor = p_valor + 10;
END $$

DELIMITER ;

SET @numero = 5;
CALL sp_incrementar_valor(@numero);
SELECT @numero;

DROP PROCEDURE nome_da_procedure;