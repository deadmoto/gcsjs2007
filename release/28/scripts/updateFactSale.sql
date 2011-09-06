/*
Скрипт добавляет к таблице FactSale новую колонку "id_dist", с номером Вашего округа;
*/
USE [Subsidy]

ALTER TABLE FactSale
ADD id_dist tinyint
GO

DECLARE @dist tinyint
--именить значение @dist для своего округа
SET @dist = 6

UPDATE FactSale
SET id_dist = @dist
GO

ALTER TABLE FactSale
ALTER COLUMN id_dist tinyint NOT NULL
GO

SELECT * FROM FactSale