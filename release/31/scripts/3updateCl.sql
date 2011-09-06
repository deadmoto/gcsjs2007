USE [Subsidy]


if object_id('tempdb..#curhist') is not null
  drop table #curhist

--клиенты только за активный период
CREATE TABLE #curhist (regn int, id_fond smalldatetime)

DECLARE @date smalldatetime
SET @date = CONVERT(smalldatetime, '01.12.2009', 104)

INSERT INTO #curhist
SELECT  Cl.regn, Hist.id_fond as id_fond
FROM Cl INNER JOIN
	Hist ON Cl.regn = Hist.regn INNER JOIN
		(SELECT   regn, MAX(bdate) AS bdate
		FROM  hist
		WHERE    (bdate <= @date)
		GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate AND Hist.bdate <= @date 
	AND Hist.edate > @date


UPDATE Cl
SET id_stnd = 1
FROM Cl INNER JOIN
	#curhist ON cl.regn = #curhist.regn AND #curhist.id_fond in (5)

UPDATE Cl
SET id_stnd = 2
FROM Cl INNER JOIN
	#curhist ON cl.regn = #curhist.regn AND #curhist.id_fond in (1,2,3,4,6,7)