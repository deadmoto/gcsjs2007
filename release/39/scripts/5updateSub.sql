USE [Subsidy]
ALTER TABLE Sub Add stndsub float
GO

UPDATE Sub
SET stndsub = 0
GO 

ALTER TABLE Sub ALTER COLUMN stndsub float NOT NULL
GO 