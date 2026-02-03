/*
Arquivo: cap04-06-inserindo-dados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
USE db_estudo;

CREATE TABLE unidade_federacao (
    sigla CHAR(2) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

INSERT INTO unidade_federacao (sigla, nome) 
VALUES ('SP', 'São Paulo');

INSERT INTO unidade_federacao (nome, sigla) 
VALUES ('Rio de Janeiro', 'RJ');

INSERT INTO unidade_federacao 
VALUES ('MG', 'Minas Gerais');

INSERT INTO unidade_federacao (sigla, nome) VALUES 
('AM', 'Amazonas'),
('BA', 'Bahia'),
('PR', 'Paraná');

-- Criando a tabela de Autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Criando a tabela de Livros
CREATE TABLE livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    fk_id_autor INT,
    FOREIGN KEY (fk_id_autor) REFERENCES autores(id_autor)
);

INSERT INTO autores (nome, nacionalidade) 
VALUES ('Machado de Assis', 'Brasileira');

INSERT INTO autores (nome, nacionalidade) 
VALUES ('George Orwell', 'Britânica');

INSERT INTO autores (nome, nacionalidade) 
VALUES ('Clarice Lispector', 'Ucraniana/Brasileira');

-- Inserindo livros vinculados ao Machado de Assis (ID 1)
INSERT INTO livros (titulo, ano_publicacao, fk_id_autor) 
VALUES ('Dom Casmurro', 1899, 1);

-- Inserindo livros vinculados ao George Orwell (ID 2)
INSERT INTO livros (titulo, ano_publicacao, fk_id_autor) 
VALUES ('1984', 1949, 2);

-- Inserindo livros vinculados à Clarice Lispector (ID 3)
INSERT INTO livros (titulo, ano_publicacao, fk_id_autor) 
VALUES ('A Hora da Estrela', 1977, 3);

INSERT INTO autores (nome, nacionalidade) 
VALUES ('J.R.R. Tolkien', 'Britânica');

INSERT INTO livros (titulo, ano_publicacao, fk_id_autor) 
VALUES ('O Senhor dos Anéis', 1954, LAST_INSERT_ID());

