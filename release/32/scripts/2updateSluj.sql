USE [Subsidy]

ALTER TABLE Sluj
ADD factminus tinyint
GO

UPDATE Sluj
SET factminus = 0
GO

ALTER TABLE Sluj
ALTER COLUMN factminus tinyint NOT NULL
GO