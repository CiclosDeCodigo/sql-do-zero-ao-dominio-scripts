/*
Arquivo: cap03-02-tipos-de-dados.sql
Projeto: SQL do Zero ao Domínio
Descrição:
Autor: Rodrigo Minerva Colombo
Data: 02/2026
*/
SELECT 0.1 + 0.2; -- Resultado pode NÃO ser exatamente 0.3 
CREATE TABLE teste ( valor_decimal DECIMAL(10,2), valor_double DOUBLE ); INSERT INTO teste VALUES (0.1 + 0.2, 0.1 + 0.2); SELECT * FROM teste; 

