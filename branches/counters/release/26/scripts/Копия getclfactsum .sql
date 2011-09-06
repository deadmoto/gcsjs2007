if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getclfactsum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[getclfactsum]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE getclfactsum @date char(10)
AS

CREATE TABLE #curFactSum (regn int, fio char(255), SumSub float, SumFact float, bdate smalldatetime,  edate smalldatetime, Differencee float, address char(255), id_heating int)
CREATE TABLE #sb (regn int, bdate smalldatetime, id_heating int)
CREATE TABLE #tt (regn int, bdate smalldatetime, edate smalldatetime, SumFact float, SumSub float)
CREATE TABLE #ttemp (regn int, bdate smalldatetime)

CREATE TABLE #finalTable (regn int, fio char(255), SumSub float, SumFact float, bdate smalldatetime,  edate smalldatetime, Differencee float, address char(255), id_heating int)

INSERT INTO #sb
SELECT     regn, max (bdate) as bdate, id_heating --bdate, id_heating
                            FROM          hist
                            WHERE      (bdate <= CONVERT(smalldatetime, @date, 104))
                            GROUP BY regn, id_heating--,bdate

--SELECT * FROM #sb
/*INSERT INTO #ttemp
SELECT     regn, max (bdate) as bdate
FROM          FactSale
--WHERE (bdate <= CONVERT(smalldatetime, @date, 104))
GROUP BY regn--,bdate
*/
INSERT INTO #ttemp
SELECT     regn, bdate
FROM          FactSale
WHERE (edate =CONVERT(smalldatetime, @date, 104))
GROUP BY regn,bdate

--SELECT * FROM #ttemp

INSERT INTO #tt
SELECT     FactSale.regn AS regn, FactSale.bdate AS bdate, FactSale.edate AS edate, SUM(FactSale.factsum) AS SumFact, SUM(FactSale.sub)  AS SumSub
FROM          FactSale INNER JOIN
                                                      #ttemp ON FactSale.regn = #ttemp.regn AND FactSale.bdate = #ttemp.bdate
GROUP BY FactSale.regn, FactSale.bdate, FactSale.edate

--SELECT * FROM #tt

INSERT INTO #curFactSum
SELECT     Cl.regn, Cl.fio, #tt.SumSub, #tt.SumFact, MAX(#tt.bdate) AS bdate, MAX(#tt.edate) AS edate, #tt.SumSub - #tt.SumFact AS Differencee, 
                      LTRIM(RTRIM(Strt.namestreet)) + ', д.' + LTRIM(RTRIM(Cl.nhouse)) + (CASE WHEN LTRIM(RTRIM(Cl.corp)) = '' THEN '' ELSE '/' + Cl.corp END) 
                      + ', кв.' + LTRIM(RTRIM(Cl.apart)) AS address, #sb.id_heating
FROM         Cl INNER JOIN Hist ON Cl.regn = Hist.regn INNER JOIN  #sb ON Hist.regn = #sb.regn AND Hist.bdate = #sb.bdate AND Hist.bdate <= CONVERT(smalldatetime, @date, 104) AND 
                      Hist.edate > CONVERT(smalldatetime, @date, 104) INNER JOIN
                           #tt ON Cl.regn =#tt.regn INNER JOIN 
                      Strt ON Cl.id_street = Strt.id_street
WHERE     (Hist.bdate = CONVERT(smalldatetime, @date, 104) AND hist.id_cert=2)
GROUP BY Cl.regn, Cl.fio, #tt.SumSub, #tt.SumFact, Strt.namestreet, Cl.nhouse, Cl.corp, Cl.apart,#sb.id_heating
--ORDER BY Cl.fio

UPDATE #curFactSum
SET Differencee=0
WHERE  Differencee<0

--SELECT * FROM #curFactSum

INSERT INTO #finalTable
SELECT * FROM  #curFactSum
WHERE id_heating=1

--SELECT * FROM  #finalTable
--выбрались все клиенты у кого обычный тип отопления

CREATE TABLE #curFactSumHeat (regn int, bdate smalldatetime, edate smalldatetime, SumSub float, SumFact float, mmod int)
CREATE TABLE #curFactSumHeat2 (regn int, bdate smalldatetime, edate smalldatetime, SumSub float, SumFact float,mmod int)

INSERT INTO #curFactSumHeat
SELECT FactSale.regn as regn,FactSale.bdate as bdate,FactSale.edate as edate,sum(sub) as SumSub, sum(factsum) as SumFact, 0 as mmod 
FROM  FactSale INNER JOIN #curFactSum on FactSale.regn=#curFactSum.regn AND FactSale.bdate<= #curFactSum.bdate
WHERE id_heating<>1 AND  FactSale.bdate < CONVERT(smalldatetime, @date, 104)
GROUP BY FactSale.regn,FactSale.bdate,FactSale.edate
--ORDER BY regn, FactSale.bdate

--SELECT * FROM #curFactSumHeat

INSERT INTO #curFactSumHeat2
SELECT #curFactSumHeat.regn, #curFactSumHeat.bdate, #curFactSumHeat.edate, #curFactSumHeat.SumSub, #curFactSumHeat.SumFact, #curFactSumHeat.mmod
FROM #curFactSumHeat  INNER JOIN 
	(SELECT regn, count(regn) % 2 as mode FROM #curFactSumHeat GROUP BY regn) tmp1 on #curFactSumHeat.regn=tmp1.regn AND  #curFactSumHeat.mmod=tmp1.mode
--ORDER BY #curFactSumHeat.regn, #curFactSumHeat.bdate DESC

--SELECT * FROM #curFactSumHeat2

DELETE FROM #curFactSumHeat2
WHERE edate <= dateadd(Year,-1,CONVERT(smalldatetime, @date, 104))


--SELECT * FROM #curFactSumHeat2

INSERT INTO #finalTable
SELECT     Cl.regn, Cl.fio, tmp2.SumSub, tmp2.SumFact, tmp2.bdate, tmp2.edate, tmp2.SumSub - tmp2.SumFact AS Differencee, 
                      LTRIM(RTRIM(Strt.namestreet)) + ', д.' + LTRIM(RTRIM(Cl.nhouse)) + (CASE WHEN LTRIM(RTRIM(Cl.corp)) = '' THEN '' ELSE '/' + Cl.corp END) 
                      + ', кв.' + LTRIM(RTRIM(Cl.apart)) AS address, tmp2.id_heating
FROM         Cl INNER JOIN 
	(SELECT regn as regn, min(bdate) as bdate, max(edate) as edate, sum(SumSub) as SumSub, sum(SumFact) as SumFact, 1 as id_heating
	from #curFactSumHeat2
	GROUP BY regn) tmp2 on cl.regn=tmp2.regn
	     INNER JOIN 
                      Strt ON Cl.id_street = Strt.id_street


/*SELECT regn, bdate, edate, SumSub, SumFact
from #curFactSumHeat2


SELECT regn, min(bdate), max(edate), sum(SumSub), sum(SumFact)
from #curFactSumHeat2
GROUP BY regn
*/

UPDATE #finalTable
SET Differencee=0
WHERE  Differencee<0


SELECT * FROM  #finalTable
ORDER BY fio
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

