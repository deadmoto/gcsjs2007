USE [Subsidy]
ALTER TABLE Hist ADD indrstnd tinyint
GO
UPDATE Hist SET indrstnd=0
GO
ALTER TABLE Hist 
ALTER COLUMN indrstnd tinyint NOT NULL
GO
ALTER TABLE Hist ADD indrstndval float
GO
UPDATE Hist SET indrstndval=0
GO
ALTER TABLE Hist 
ALTER COLUMN indrstndval float NOT NULL
GO