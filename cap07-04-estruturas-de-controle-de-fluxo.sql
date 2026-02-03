/*
Arquivo: cap07-04-estruturas-de-controle-de-fluxo.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
DELIMITER //

CREATE PROCEDURE sp_classificar_cliente (
    IN p_customer_id INT
)
BEGIN
    DECLARE v_total_alugueis INT;

    -- Conta quantos alugueis o cliente possui
    SELECT COUNT(*)
    INTO v_total_alugueis
    FROM rental
    WHERE customer_id = p_customer_id;

    -- Estrutura de controle de fluxo
    IF v_total_alugueis = 0 THEN
        SELECT 'Cliente sem histórico de aluguel' AS classificacao;

    ELSEIF v_total_alugueis BETWEEN 1 AND 10 THEN
        SELECT 'Cliente ocasional' AS classificacao;

    ELSE
        SELECT 'Cliente frequente' AS classificacao;
    END IF;

END //

DELIMITER ;

CALL sp_classificar_cliente(1);

DELIMITER //

CREATE PROCEDURE sp_classificar_filme_por_duracao (
    IN p_film_id INT
)
BEGIN
    DECLARE v_duracao INT;

    -- Obtém a duração do filme
    SELECT length
    INTO v_duracao
    FROM film
    WHERE film_id = p_film_id;

    -- Estrutura CASE como controle de fluxo
    CASE
        WHEN v_duracao IS NULL THEN
            SELECT 'Filme não encontrado' AS classificacao;
        WHEN v_duracao > 120 THEN
	      SELECT 'Longa-metragem' AS classificacao;
        WHEN v_duracao >= 61 THEN
            SELECT 'Média-metragem' AS classificacao;
        ELSE
            SELECT 'Curta-metragem' AS classificacao;
    END CASE;

END //

DELIMITER ;

CALL sp_classificar_filme_por_duracao(100);

DELIMITER //

CREATE PROCEDURE sp_listar_primeiros_filmes()
BEGIN
    DECLARE v_film_id INT DEFAULT 1;

    WHILE v_film_id <= 5 DO
        SELECT film_id, title
        FROM film
        WHERE film_id = v_film_id;

        SET v_film_id = v_film_id + 1;
    END WHILE;

END //

DELIMITER ;

CALL sp_listar_primeiros_filmes;

DELIMITER //

CREATE PROCEDURE sp_listar_primeiros_filmes_loop()
BEGIN
    DECLARE v_film_id INT DEFAULT 1;

    loop_filmes: LOOP

        -- Condição de saída do loop
        IF v_film_id > 5 THEN
            LEAVE loop_filmes;
        END IF;

        SELECT film_id, title
        FROM film
        WHERE film_id = v_film_id;

        SET v_film_id = v_film_id + 1;

    END LOOP loop_filmes;

END //

DELIMITER ;

CALL sp_listar_primeiros_filmes_loop;

DELIMITER //

CREATE PROCEDURE sp_listar_primeiros_filmes_repeat()
BEGIN
    DECLARE v_film_id INT DEFAULT 1;

    REPEAT
        SELECT film_id, title
        FROM film
        WHERE film_id = v_film_id;

        SET v_film_id = v_film_id + 1;

    UNTIL v_film_id > 5
    END REPEAT;

END //

DELIMITER ;

CALL sp_listar_primeiros_filmes_repeat;

