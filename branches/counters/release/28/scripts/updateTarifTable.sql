/*
Выставит для таблиц с тарифами длину поля 120
*/
USE [Subsidy]

DECLARE @SQLScript nvarchar(200)
DECLARE @i int
SET @i = 1

CREATE TABLE #updTable (idd int, tname nvarchar(8))

INSERT INTO #updTable
SELECT 1, 'cont'
UNION ALL
SELECT 2, 'cold'
UNION ALL
SELECT 3, 'canal'
UNION ALL
SELECT 4, 'hot'
UNION ALL
SELECT 5, 'heat'
UNION ALL
SELECT 6, 'gas'

WHILE @i <= 6
BEGIN
	SET @SQLScript = ''

	SET @SQLScript = 'ALTER TABLE '+ (SELECT tname FROM #updTable WHERE idd = @i ) + ' '
	SET @SQLScript = @SQLScript + 'ALTER COLUMN name'+(SELECT tname FROM #updTable WHERE idd = @i)+' char(120) NOT NULL'
	SET @SQLScript = @SQLScript
	EXECUTE (@SQLScript)
	SET @i = @i + 1
END
