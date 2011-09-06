DECLARE @maxCold tinyint 
DECLARE @maxHot tinyint
DECLARE @maxGas tinyint
DECLARE @maxCanal tinyint
DECLARE @maxHeat tinyint
DECLARE @curDist tinyint
DECLARE @date smalldatetime
-------------------------------------------------------------------
SET @maxCold = cast ((SELECT MAX(id_cold) + 1 FROM cold) as tinyint)
SET @maxHot = cast ((SELECT MAX(id_hot) + 1 FROM hot) as tinyint)
SET @maxGas = cast ((SELECT MAX(id_gas) + 1 FROM gas) as tinyint)
SET @maxCanal = cast ((SELECT MAX(id_canal) + 1 FROM canal) as tinyint)
SET @maxHeat = cast ((SELECT MAX(id_heat) + 1 FROM heat) as tinyint)
SET @curDist = cast ((SELECT TOP 1 id_dist FROM Cl GROUP BY id_dist) as tinyint)
SET @date = convert(smalldatetime, '01.04.2010', 104)
-------------------------------------------------------------------
INSERT INTO Cold 
VALUES (@curDist, @date, @maxCold, '�� �������� �����', 11.28, 11.28, 5.472)

INSERT INTO Hot 
VALUES (@curDist, @date, @maxHot, '�� �������� �����', 51.95, 51.95, 3.51)

INSERT INTO Gas 
VALUES (@curDist, @date, @maxGas, '�� �������� �����', 48.35, 2.7)

INSERT INTO Canal 
VALUES (@curDist, @date, @maxCanal, '�� �������� �����', 9.93, 8.982)
---
INSERT INTO Heat 
VALUES (@curDist, @date, @maxHeat, '�� �������� ����� �� 2,7�', 939.19, 0.0209)

SET @maxHeat = cast ((SELECT MAX(id_heat) + 1 FROM heat) as tinyint)

INSERT INTO Heat 
VALUES (@curDist, @date, @maxHeat, '�� �������� ����� �� 2,7� �� 3,0�', 939.19, 0.0225)

SET @maxHeat = cast ((SELECT MAX(id_heat) + 1 FROM heat) as tinyint)

INSERT INTO Heat 
VALUES (@curDist, @date, @maxHeat, '�� �������� ����� �� 3,0� �� 3,5�', 939.19, 0.0251)

SET @maxHeat = cast ((SELECT MAX(id_heat) + 1 FROM heat) as tinyint)

INSERT INTO Heat 
VALUES (@curDist, @date, @maxHeat, '�� �������� ����� �� 3,5� � ����', 939.19, 0.0285)