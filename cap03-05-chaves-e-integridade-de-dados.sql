/*
Arquivo: cap03-05-chaves-e-integridade-de-dados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    cpf         CHAR(11) NOT NULL UNIQUE,
    email       VARCHAR(150) UNIQUE
);

CREATE TABLE usuario (
    email VARCHAR(150) PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL
);

CREATE TABLE matricula (
    id_aluno  INT NOT NULL,
    id_curso  INT NOT NULL,
    data_mat  DATE NOT NULL,
    PRIMARY KEY (id_aluno, id_curso)
);

CREATE TABLE pedido (
    id_pedido  INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(100),
    ramal          INT UNIQUE
);

INSERT INTO pedido (id_cliente, data_pedido)
VALUES (999, CURRENT_DATE);
