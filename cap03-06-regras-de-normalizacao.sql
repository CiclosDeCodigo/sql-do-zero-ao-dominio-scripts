/*
Arquivo: cap03-06-regras-de-normalizacao.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    cpf         CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE tipo_telefone (
    id_tipo_telefone INT AUTO_INCREMENT PRIMARY KEY,
    descricao        VARCHAR(30) NOT NULL
);

CREATE TABLE cliente_telefone (
    id_cliente        INT NOT NULL,
    id_tipo_telefone  INT NOT NULL,
    telefone          VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_cliente, telefone),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_tipo_telefone) REFERENCES tipo_telefone(id_tipo_telefone)
);

