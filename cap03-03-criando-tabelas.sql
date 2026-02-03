/*
Arquivo: cap03-03-criando-tabelas.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (email)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE pedido_item (
    id_pedido_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    descricao_item VARCHAR(150) NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
);

drop table pedido_item;
drop table pedido;
drop table cliente;
