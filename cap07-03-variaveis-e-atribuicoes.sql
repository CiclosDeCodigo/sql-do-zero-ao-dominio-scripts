/*
Arquivo: cap07-03-variaveis-e-atribuicoes.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
-- Atribuição direta
SET @categoria = 'Action';
-- Atribuição por consulta
SELECT COUNT(*) INTO @total FROM film;

SET @nome_variavel = valor; -- atribuição direta
SELECT @nome_variavel := valor; -- atribuição inline
SELECT coluna INTO @nome_variavel FROM tabela; -- atribuição de resultado

SET @limite_duracao = 120;

SELECT title, length 
FROM film 
WHERE length > @limite_duracao;

SELECT @duracao_media := AVG(length) FROM film;
SELECT @duracao_media; 

SELECT @duracao_media := AVG(length) FROM film;
SELECT title, length, length - @duracao_media AS diferenca 
FROM film 
WHERE length > @duracao_media;

SELECT category_id INTO @cat_action
FROM category 
WHERE name = 'Action';

-- Usar o ID
SELECT COUNT(*) 
FROM film_category 
WHERE category_id = @cat_action;

DELIMITER $$
CREATE PROCEDURE filmes_acima_duracao(IN p_duracao INT)
BEGIN
    DECLARE v_total_encontrados INT;
    
    -- Contar quantos filmes têm duração acima do parâmetro
    SELECT COUNT(*) INTO v_total_encontrados
    FROM film 
    WHERE length > p_duracao;
    
    -- Exibir resultado
    SELECT 
        p_duracao AS duracao_minima,
        v_total_encontrados AS total_filmes;
    
    -- Listar os filmes
    SELECT title, length
    FROM film 
    WHERE length > p_duracao
    ORDER BY length DESC;
END$$
DELIMITER ;

CALL filmes_acima_duracao(150);
