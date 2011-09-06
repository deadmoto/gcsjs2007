if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getinfoscr]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[getinfoscr]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO






CREATE  PROCEDURE getinfoscr @idd tinyint,@d char(10)
AS

declare @date smalldatetime
set @date=convert(smalldatetime,@d,104)

CREATE TABLE #ccl (regn int, stop tinyint)
CREATE TABLE #cclSub (regn int, sub float)
CREATE TABLE #cclSluj (regn int, sub float)
CREATE TABLE #final (bdate smalldatetime, edate smalldatetime, calc int, regn int, fio char(43), namestreet char(41), nhouse char(7), corp char(2), apart char(8), stop int, summa float)

--выбираем клиентов из базы
INSERT INTO #ccl
SELECT distinct (cl.regn), sub.stop
FROM cl LEFT JOIN sub ON cl.regn=sub.regn and sub.sdate=@date and cl.id_dist=@idd

UPDATE #ccl
SET stop=0 WHERE stop IS NULL

--SELECT * FROM #ccl

--выбираем текущее значение субсидии
INSERT INTO #cclSub
SELECT distinct (#ccl.regn), sum(sub.sub)
FROM #ccl LEFT JOIN sub on #ccl.regn=sub.regn and sub.sdate=@date-- and (sub.stop<2) 
GROUP BY #ccl.regn
ORDER BY #ccl.regn

--выбираем текущее значение служебных
INSERT INTO #cclSluj
SELECT distinct (#ccl.regn), sum(sluj.sub)
FROM #ccl LEFT JOIN sluj on #ccl.regn=sluj.regn and sluj.sdate=@date
--WHERE #ccl.stop < 2
GROUP BY #ccl.regn
ORDER BY #ccl.regn

UPDATE #cclSub
SET sub = 0
WHERE sub is NULL

UPDATE #cclSluj
SET sub = 0
WHERE sub is NULL

--SELECT * FROM #cclSub
--SELECT * FROM #cclSluj

--данные к выводу
INSERT INTO #final
SELECT hist.bdate, hist.edate, hist.calc, cl.regn, cl.fio, strt.namestreet, cl.nhouse, cl.corp, cl.apart, #ccl.stop, #cclSub.sub - #cclSluj.sub
FROM hist INNER JOIN 
	(SELECT regn, max(bdate) as bdate 
	FROM hist 
	WHERE bdate<=@date and id_dist = @idd GROUP BY regn) sb on hist.regn=sb.regn and hist.bdate=sb.bdate 
INNER JOIN cl on cl.regn=hist.regn
INNER JOIN strt on cl.id_street=strt.id_street 
INNER JOIN #ccl on cl.regn=#ccl.regn
INNER JOIN #cclSub on cl.regn=#cclSub.regn
INNER JOIN #cclSluj on cl.regn=#cclSluj.regn

SELECT * FROM #final
ORDER BY fio


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

