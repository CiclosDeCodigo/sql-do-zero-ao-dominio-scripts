/*
Arquivo: cap04-07-atualizando-dados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT id_livro, titulo FROM livros WHERE titulo = 'Dom Casmurro';

UPDATE livros 
SET ano_publicacao = 1900 
WHERE id_livro = 1;

UPDATE autores 
SET nome = 'Eric Arthur Blair (George Orwell)', 
    nacionalidade = 'Inglesa' 
WHERE id_autor = 2;

UPDATE livros 
SET ano_publicacao = ano_publicacao + 1 
WHERE fk_id_autor = 1;

UPDATE autores SET nacionalidade = 'Brasileira';

