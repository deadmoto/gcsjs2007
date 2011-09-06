USE [Subsidy]

ALTER TABLE Hist
ADD rmcount tinyint
GO

UPDATE Hist
SET rmcount = mcount
GO

ALTER TABLE Hist
ALTER COLUMN rmcount tinyint NOT NULL
GO