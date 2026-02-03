/*
Arquivo: cap04-08-removendo-dados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
DELETE FROM livros WHERE id_livro = 4;

DELETE FROM livros 
WHERE fk_id_autor = 1 
  AND ano_publicacao < 1910;

DELETE FROM livros WHERE fk_id_autor = 3;
DELETE FROM autores WHERE id_autor = 3;

