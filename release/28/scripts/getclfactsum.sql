if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getclfactsum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[getclfactsum]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







CREATE   PROCEDURE getclfactsum @d char(10), @dist int
AS

declare @date smalldatetime
set @date = convert(smalldatetime, @d, 104)

----------------------------------------------------------
CREATE TABLE #CurHistFirst (regn int, bdate smalldatetime, edate smalldatetime, id_cert int, id_heating int)
CREATE TABLE #CurHistFirstCert(regn int, bdate smalldatetime)

CREATE TABLE #ttemp (regn int, bdate smalldatetime, edate smalldatetime, SumSub float, SumFact float)
CREATE TABLE #ttemp2 (regn int, bdate smalldatetime, edate smalldatetime)
CREATE TABLE #ttemp2Rcounr (regn int, cntmod tinyint, cnt tinyint)

--CREATE TABLE #curFactSum (regn int, fio char(255), SumSub float, SumFact float, bdate smalldatetime,  edate smalldatetime, Differencee float, address char(255), id_heating int)
CREATE TABLE #finalTable (regn int, fio char(255), SumSub float, SumFact float, bdate smalldatetime,  edate smalldatetime, Differencee float, address char(255), id_heating int)
----------------------------------------------------------

DECLARE @SQLScript nvarchar(800)
DECLARE @SQLParam nvarchar(100)

SET @SQLScript = 
N'INSERT INTO #CurHistFirstCert
SELECT hist.regn, max (hist.bdate) as bdate
FROM hist INNER JOIN
	#CurHistFirst on hist.regn = #CurHistFirst.regn AND hist.bdate < #CurHistFirst.bdate
	and hist.bdate >= (case when #CurHistFirst.id_heating = 1 then convert(smalldatetime, ''01.08.2008'', 104) else  convert(smalldatetime, ''01.02.2008'', 104) end)
WHERE #CurHistFirst.id_cert = @cert 
GROUP BY hist.regn

DELETE FROM #CurHistFirst
WHERE regn in (select regn from #CurHistFirstCert)

INSERT INTO #CurHistFirst
SELECT     hist.regn, hist.bdate, hist.edate, hist.id_cert, hist.id_heating
FROM hist INNER JOIN
	#CurHistFirstCert on hist.regn = #CurHistFirstCert.regn AND #CurHistFirstCert.bdate = hist.bdate

DELETE FROM #CurHistFirstCert'

SET @SQLParam =	N'@cert int'	
----------------------------------------------------------

INSERT INTO #CurHistFirst
SELECT regn, max (bdate) as bdate, edate, id_cert, id_heating 
FROM hist
WHERE (bdate = convert(smalldatetime, @date, 104)) and id_dist=@dist
GROUP BY regn,id_cert,edate, id_heating

----------------------------------------------------------
EXECUTE sp_executesql @SQLScript, @SQLParam, @cert = 1;
EXECUTE sp_executesql @SQLScript, @SQLParam, @cert = 3;
----------------------------------------------------------

--SELECT * FROM #CurHistFirst

INSERT INTO #ttemp
SELECT    FactSale.regn, FactSale.bdate, FactSale.edate, sum(FactSale.sub) as SumSub, sum(FactSale.factsum) as SumFact
FROM          FactSale INNER JOIN #CurHistFirst on #CurHistFirst.regn = FactSale.regn
Where (#CurHistFirst.id_cert = 2) AND (FactSale.edate = convert(smalldatetime, @date, 104)) AND (#CurHistFirst.id_heating = 1)
GROUP BY FactSale.regn, FactSale.bdate, FactSale.edate, #CurHistFirst.id_heating

INSERT INTO #ttemp
SELECT FactSale.regn, FactSale.bdate,FactSale.edate, sum(sub) as SumSub, sum(factsum)  as SumFact
FROM FactSale
INNER JOIN #CurHistFirst on #CurHistFirst.regn = FactSale.regn and #CurHistFirst.bdate = FactSale.bdate
Where /*(#CurHistFirst.id_cert <> 2) AND*/ (#CurHistFirst.id_heating = 1)
GROUP BY FactSale.regn, FactSale.bdate,FactSale.edate

--SELECT * FROM #ttemp

INSERT INTO #finalTable
SELECT     Cl.regn, Cl.fio, #ttemp.SumSub, #ttemp.SumFact, MAX(#ttemp.bdate) AS bdate, MAX(#ttemp.edate) AS edate, #ttemp.SumSub - #ttemp.SumFact AS Differencee, 
	LTRIM(RTRIM(Strt.namestreet)) + ', д.' + LTRIM(RTRIM(Cl.nhouse)) + (CASE WHEN LTRIM(RTRIM(Cl.corp)) = '' THEN '' ELSE '/' + Cl.corp END) 
	+ ', кв.' + LTRIM(RTRIM(Cl.apart)) AS address, #CurHistFirst.id_heating
FROM Cl INNER JOIN Hist ON Cl.regn = Hist.regn INNER JOIN  
	#CurHistFirst ON Hist.regn = #CurHistFirst.regn AND Hist.bdate = #CurHistFirst.bdate INNER JOIN
	#ttemp ON Cl.regn =#ttemp.regn INNER JOIN 
	Strt ON Cl.id_street = Strt.id_street
GROUP BY Cl.regn, Cl.fio, #ttemp.SumSub, #ttemp.SumFact, Strt.namestreet, Cl.nhouse, Cl.corp, Cl.apart, #CurHistFirst.id_heating
--в конечную таблицу попали все клиенты у кого обычный тип отопления

--SELECT * FROM #finalTable
----------------------------------------------------------

DELETE FROM #ttemp

INSERT INTO #ttemp
SELECT    FactSale.regn, FactSale.bdate, FactSale.edate, sum(FactSale.sub) as SumSub, sum(FactSale.factsum) as SumFact
FROM          FactSale INNER JOIN #CurHistFirst on #CurHistFirst.regn = FactSale.regn
Where (#CurHistFirst.id_cert = 2) AND (FactSale.edate = convert(smalldatetime, @date, 104)) AND (#CurHistFirst.id_heating <> 1)
GROUP BY FactSale.regn, FactSale.bdate, FactSale.edate, #CurHistFirst.id_heating

INSERT INTO #ttemp
SELECT FactSale.regn, FactSale.bdate,FactSale.edate, sum(sub) as SumSub, sum(factsum)  as SumFact
FROM FactSale
INNER JOIN #CurHistFirst on #CurHistFirst.regn = FactSale.regn and #CurHistFirst.bdate = FactSale.bdate
Where /*(#CurHistFirst.id_cert <> 2) AND */(#CurHistFirst.id_heating <> 1)
GROUP BY FactSale.regn, FactSale.bdate,FactSale.edate
----------------------------------------------------------

--выбрали все прошлые периоды
INSERT INTO #ttemp2
SELECT Hist.regn, Hist.bdate ,Hist.edate 
FROM Hist INNER join #ttemp on Hist.regn = #ttemp.regn and Hist.bdate <  #ttemp.bdate

--SELECT * FROM #ttemp2

--выбрали сколько периодов было у клиента, если число четное то у нас один из периодов
INSERT INTO #ttemp2Rcounr
SELECT regn, count(regn) %2, count(regn)
FROM #ttemp2
GROUP BY regn

--SELECT * FROM #ttemp2Rcounr

DELETE FROM #ttemp2Rcounr
WHERE cntmod = 0

--SELECT * FROM #ttemp2Rcounr

DELETE FROM #ttemp2
WHERE regn NOT IN (SELECT regn from #ttemp2Rcounr)
--
DELETE FROM #ttemp
WHERE regn NOT IN (SELECT regn from #ttemp2Rcounr)
--
DELETE FROM #ttemp2
WHERE bdate <> 
	(select max(b.bdate) from #ttemp2 as b where b.regn=regn)

--SELECT * FROM #ttemp2
----------------------------------------------------------	

INSERT INTO #ttemp
SELECT FactSale.regn, FactSale.bdate,FactSale.edate, sum(sub) as SumSub, sum(factsum)  as SumFact
FROM FactSale
INNER JOIN #ttemp2 on #ttemp2.regn = FactSale.regn and #ttemp2.bdate = FactSale.bdate
GROUP BY FactSale.regn, FactSale.bdate,FactSale.edate

INSERT INTO #finalTable
SELECT     Cl.regn, Cl.fio, tmp2.SumSub, tmp2.SumFact, tmp2.bdate AS bdate,tmp2.edate AS edate, tmp2.SumSub - tmp2.SumFact AS Differencee, 
	LTRIM(RTRIM(Strt.namestreet)) + ', д.' + LTRIM(RTRIM(Cl.nhouse)) + (CASE WHEN LTRIM(RTRIM(Cl.corp)) = '' THEN '' ELSE '/' + Cl.corp END) 
	+ ', кв.' + LTRIM(RTRIM(Cl.apart)) AS address, 2 as id_heating
FROM Cl INNER JOIN 
	(select regn, min(bdate) as bdate, max(edate) as edate,sum(SumSub) as  SumSub, sum(SumFact) as SumFAct
	from #ttemp
	GROUP BY regn
	) tmp2 on cl.regn = tmp2.regn
 INNER JOIN 
	Strt ON Cl.id_street = Strt.id_street
--GROUP BY Cl.regn, Cl.fio, tmp2.SumSub, tmp2.SumFact, Strt.namestreet, Cl.nhouse, Cl.corp, Cl.apart

--убирает из финальной таблице разницу < 0, можно закоментировать если в отчене нужны цифры с минусом
UPDATE #finalTable
SET Differencee = 0
WHERE Differencee < 0

SELECT * FROM #finalTable
ORDER BY fio




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

