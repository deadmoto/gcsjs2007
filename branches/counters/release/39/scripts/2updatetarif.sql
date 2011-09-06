USE [Subsidy]
--Cold
ALTER TABLE Cold ADD normcold float
GO

UPDATE Cold
SET normcold = 1
GO

ALTER TABLE Cold
ALTER COLUMN normcold float NOT NULL
GO
--------

--Hot
ALTER TABLE Hot ADD normhot float
GO

UPDATE Hot
SET normhot = 1
GO

ALTER TABLE Hot 
ALTER COLUMN normhot float NOT NULL
GO
--------

--Gas
ALTER TABLE Gas ADD normgas float
GO

UPDATE Gas
SET normgas = 1
GO

ALTER TABLE Gas 
ALTER COLUMN normgas float NOT NULL
GO
--------

--Canal
ALTER TABLE Canal ADD normcanal float
GO

UPDATE Canal
SET normcanal = 1
GO

ALTER TABLE Canal 
ALTER COLUMN normcanal float NOT NULL
GO
--------

--Heat
ALTER TABLE Heat ADD normheat float
GO

UPDATE Heat
SET normheat = 1
GO

ALTER TABLE Heat 
ALTER COLUMN normheat float NOT NULL
GO
--------

