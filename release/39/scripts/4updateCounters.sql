USE [SUBSIDY]
ALTER TABLE Counters ADD  counter_serv tinyint
GO

UPDATE Counters
SET counter_serv = 0
GO

ALTER TABLE Counters ALTER COLUMN counter_serv tinyint NOT NULL
GO