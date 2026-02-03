/*
Arquivo: cap06-01-indices.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    documento CHAR(14) NOT NULL,   -- CPF (11) ou CNPJ (14)
    status CHAR(1) NOT NULL,       -- A = Ativo, I = Inativo
    tipo CHAR(2) NOT NULL,         -- PF ou PJ
    UNIQUE (documento)
);

CREATE TABLE codigo_lancamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    tipo CHAR(1) NOT NULL             -- D = Débito, C = Crédito
);

CREATE TABLE extrato (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    lancamento_id INT NOT NULL,
    descricao VARCHAR(150),
    valor DECIMAL(10,2) NOT NULL,
    data_lancamento DATE NOT NULL
);

INSERT INTO codigo_lancamento (descricao, tipo) VALUES
('Pagamento boleto', 'D'),
('Compra débito', 'D'),
('Compra crédito', 'D'),
('Transferência enviada', 'D'),
('Tarifa bancária', 'D'),
('Saque', 'D'),
('Pagamento cartão', 'D'),
('TED enviada', 'D'),
('DOC enviado', 'D'),
('Pix enviado', 'D'),
('Salário', 'C'),
('Transferência recebida', 'C'),
('Pix recebido', 'C'),
('TED recebida', 'C'),
('DOC recebido', 'C'),
('Rendimento aplicação', 'C'),
('Estorno', 'C'),
('Reembolso', 'C'),
('Depósito', 'C'),
('Crédito promocional', 'C');

INSERT INTO clientes (nome, documento, status, tipo)
SELECT
    CONCAT('Cliente ', seq),
    CASE
        WHEN tipo = 'PF'
            THEN LPAD(seq, 11, '0')
        ELSE
            LPAD(seq, 14, '0')
    END AS documento,
    IF(RAND() > 0.1, 'A', 'I'),
    tipo
FROM (
    SELECT
        @row := @row + 1 AS seq,
        IF(RAND() > 0.7, 'PJ', 'PF') AS tipo
    FROM information_schema.tables t1,
         information_schema.tables t2,
         (SELECT @row := 0) r
    LIMIT 5000
) x;

INSERT INTO extrato (cliente_id, lancamento_id, descricao, valor, data_lancamento)
SELECT
    FLOOR(1 + RAND() * 5000),                 -- cliente aleatório
    FLOOR(1 + RAND() * 20),                   -- código lançamento
    'Lançamento automático',
    ROUND(RAND() * 5000, 2),
    ‘2025-12-31’ - INTERVAL FLOOR(RAND() * 365) DAY
FROM (
    SELECT @row := @row + 1
    FROM information_schema.tables t1,
         information_schema.tables t2,
         information_schema.tables t3,
         (SELECT @row := 0) r
    LIMIT 200000
) x;

Select count(*) from clientes;
Select count(*) from codigo_lancamento;
Select count(*) from extrato;


