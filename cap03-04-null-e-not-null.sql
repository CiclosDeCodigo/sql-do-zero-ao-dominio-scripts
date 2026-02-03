/*
Arquivo: cap03-04-null-e-not-null.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
use db_estudo;

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NULL,
    carga_horaria INT NOT NULL,
    data_inicio DATE NULL
);

use db_estudo;

INSERT INTO curso (nome, descricao, carga_horaria, data_inicio)
VALUES ('SQL Básico', 'Curso introdutório de SQL', 40, '2026-03-01');

INSERT INTO curso (nome, descricao, carga_horaria, data_inicio)
VALUES ('SQL Intermediário', NULL, 60, NULL);

USE db_estudo;
SELECT * FROM curso;

INSERT INTO curso (nome, descricao, carga_horaria, data_inicio)
VALUES ('SQL Avançadp', NULL, null, NULL);
