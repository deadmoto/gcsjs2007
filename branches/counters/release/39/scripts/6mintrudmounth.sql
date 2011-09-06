if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mintrudmounth]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[mintrudmounth]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE    PROCEDURE mintrudmounth @d char(10) AS

declare @date smalldatetime
set @date=convert(smalldatetime, @d ,104)
-------------------------------------------------------------------------
create table #s (reg int, stop tinyint)
create table #ss (reg int,summa float)
create table #ssl (reg int, summa float)
create table #final (bdate smalldatetime, edate smalldatetime, regn int, summa float, heating tinyint, stnd tinyint, dist tinyint, diff tinyint, cert tinyint)
create table #report (dist tinyint, namedist char(40), allcount int, allsum float, newcount int, newsum float, homecount int, homesum float, gwccount int, gwcsum float)
-------------------------------------------------------------------------
insert into #s
select distinct (cl.regn), sub.stop
from cl left join sub on cl.regn=sub.regn and  sub.sdate=@date

update #s
set stop=0 where stop is null
-------------------------------------------------------------------------
insert into #ss
select distinct (cl.regn),sum(sub.sub)
from cl left join sub on cl.regn=sub.regn and sub.sdate=@date and (sub.stop<2)
group by cl.regn

update #ss
set summa=0 where summa is null
-------------------------------------------------------------------------
insert into #ssl
select distinct (#ss.reg), sum(sluj.sub)
from sluj inner join #ss on sluj.regn=#ss.reg and sluj.sdate=@date
group by #ss.reg

update #ss
set #ss.summa = #ss.summa - #ssl.summa
from #ss inner join #ssl on #ss.reg = #ssl.reg
-------------------------------------------------------------------------
insert into #final
select hist.bdate, hist.edate,cl.regn, #ss.summa, hist.id_heating, cl.id_stnd, cl.id_dist, DATEDIFF(month, hist.bdate, hist.edate) as diff, hist.id_cert
from hist inner join (select regn, max(bdate) as bdate from hist where bdate<=@date group by regn) sb on hist.regn=sb.regn and hist.bdate=sb.bdate
inner join cl  on cl.regn=hist.regn
inner join #s on cl.regn=#s.reg
inner join #ss on cl.regn=#ss.reg
where hist.bdate=CONVERT(smalldatetime,@date,104)
-------------------------------------------------------------------------
DELETE FROM #final
WHERE diff = 0 AND summa = 0
-------------------------------------------------------------------------
DELETE FROM #s
INSERT INTO #s
SELECT regn, count(regn)
FROM Hist
GROUP BY regn
-------------------------------------------------------------------------
INSERT INTO #report (dist, namedist)
SELECT distinct #final.dist, Dist.namedist
FROM #final INNER JOIN Dist ON #final.dist = Dist.id_dist

UPDATE #report
SET
	allcount = (SELECT count(regn) FROM #final WHERE #final.dist = #report.dist),
	allsum = (SELECT sum(summa) FROM #final WHERE #final.dist = #report.dist),

	newcount = (SELECT count(#final.regn)
		   FROM #final INNER JOIN #s on #final.regn = #s.reg --AND #s.stop = 1
		   WHERE #final.dist = #report.dist AND cert = 1),

	newsum = (SELECT sum(#final.summa)
		  FROM #final INNER JOIN #s on #final.regn = #s.reg --AND #s.stop = 1
		  WHERE #final.dist = #report.dist AND cert = 1),

	homecount = (SELECT count(#final.regn)
		   FROM #final INNER JOIN #s on #final.regn = #s.reg --AND #s.stop = 1
		   WHERE stnd = 2 AND #final.dist = #report.dist AND cert = 1),
	homesum = (SELECT sum(#final.summa)
		  FROM #final INNER JOIN #s on #final.regn = #s.reg --AND #s.stop = 1
		  WHERE stnd = 2 AND #final.dist = #report.dist AND cert = 1),

	gwccount = (SELECT count(#final.regn)
		   FROM #final INNER JOIN #s on #final.regn = #s.reg --AND #s.stop = 1
		   WHERE (heating = 2 OR heating = 3) AND stnd = 2 AND #final.dist = #report.dist AND cert = 1),
	gwcsum = (SELECT sum(#final.summa)
		  FROM #final INNER JOIN #s on #final.regn = #s.reg --AND #s.stop = 1
		  WHERE (heating = 2 OR heating = 3) AND stnd = 2 AND #final.dist = #report.dist AND cert = 1)

SELECT * FROM #report
ORDER BY namedist





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

