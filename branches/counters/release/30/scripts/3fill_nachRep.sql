USE [Subsidy]
DECLARE @i int
DECLARE @dist nvarchar(1)
DECLARE @date nvarchar(10)
SET @i = 1
SET @dist = '7' --поставить свой округ

WHILE @i <= 11
BEGIN
  IF @i >= 10 
  BEGIN
    SET @date = ('01.'+convert(nvarchar,@i)+'.2009')
  END
  ELSE
  BEGIN
    SET @date = ('01.0'+convert(nvarchar,@i)+'.2009')
  END
  EXECUTE nachnew @date, @dist
  SET @i = @i + 1
END