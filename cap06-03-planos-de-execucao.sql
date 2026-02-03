/*
Arquivo: cap06-03-planos-de-execucao.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
EXPLAIN
SELECT *
FROM extrato
WHERE cliente_id = 1234
  AND data_lancamento BETWEEN '2025-01-01' AND '2025-12-31';

CREATE INDEX idx_extrato_cliente_data
ON extrato (cliente_id, data_lancamento);

EXPLAIN
SELECT *
FROM extrato
WHERE cliente_id = 1234
  AND data_lancamento BETWEEN '2025-01-01' AND '2026-12-31';

