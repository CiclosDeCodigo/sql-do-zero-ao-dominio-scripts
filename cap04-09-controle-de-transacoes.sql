/*
Arquivo: cap04-09-controle-de-transacoes.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
START TRANSACTION;

INSERT INTO autores (nome, nacionalidade)
VALUES ('Franz Kafka', 'Tcheca');

INSERT INTO livros (titulo, ano_publicacao, fk_id_autor)
VALUES ('A Metamorfose', 1915, LAST_INSERT_ID());

SELECT * FROM autores WHERE nome = 'Franz Kafka';
SELECT * FROM livros WHERE titulo = 'A Metamorfose';

COMMIT;

START TRANSACTION;

UPDATE livros
SET ano_publicacao = 1950
WHERE titulo = '1984';

DELETE FROM livros
WHERE id_livro = 5;

SELECT * FROM livros;

ROLLBACK;

SELECT * FROM livros;
