/*
������ ��������� � ������� FactBalance ����� ������� "id_dist", � ������� ������ ������;
*/
USE [Subsidy]

ALTER TABLE FactBalance
ADD id_dist tinyint
GO

DECLARE @dist tinyint
--������� �������� @dist ��� ������ ������
SET @dist = 3

UPDATE FactBalance
SET id_dist = @dist
GO

UPDATE FactBalance
SET balance = ROUND(balance,2)
GO

ALTER TABLE FactBalance
ALTER COLUMN id_dist tinyint NOT NULL
GO

SELECT * FROM FactBalance