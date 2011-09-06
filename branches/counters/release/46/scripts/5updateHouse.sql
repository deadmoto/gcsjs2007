USE [Subsidy]
--добавляем поле лифт
ALTER TABLE dbo.House ADD
	elevator tinyint NULL
GO
UPDATE House SET elevator = 0
GO
ALTER TABLE dbo.House ALTER COLUMN
	elevator tinyint NOT NULL