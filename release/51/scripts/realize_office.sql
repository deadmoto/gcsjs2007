USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[realize_office]    Script Date: 06/15/2011 19:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[realize_office] @date char(10), @dist tinyint, @office tinyint
AS

declare @d smalldatetime

set @d = CONVERT(smalldatetime, @date, 104)

create table #curhist (regn int,bdate smalldatetime,edate smalldatetime,id_fond tinyint,id_cert tinyint)

insert into #curhist
select hist.regn,hist.bdate,hist.edate,hist.id_fond,hist.id_cert
from hist 
	INNER JOIN Insp ON Insp.id_insp = hist.id_insp
where hist.bdate<=@d and  hist.edate>@d and hist.id_dist=@dist and insp.id_office = @office
order by regn

create table #c1 (fnd tinyint, num smallint, numn smallint, numo smallint, sums float,sumsl float)

insert into #c1 (fnd, num) select #curhist.id_fond, count(distinct(#curhist.regn))
from #curhist INNER JOIN sub ON #curhist.regn = sub.regn and sub.sdate=#curhist.bdate
WHERE (sub.sdate = @d)and (sub.stop<2)
GROUP BY #curhist.id_fond

update #c1
set numn=(select count(distinct(#curhist.regn)) from #curhist INNER JOIN sub ON #curhist.regn = sub.regn and sub.sdate=#curhist.bdate 
	   WHERE (sub.sdate = @d)and(#curhist.id_cert>1)and(#curhist.id_fond=fnd)and (sub.stop<2)
	   GROUP BY  #curhist.id_fond ),
     numo=(select count(distinct(#curhist.regn)) from #curhist INNER JOIN sub ON #curhist.regn = sub.regn and sub.sdate=#curhist.bdate
	   WHERE (sub.sdate = @d)and(#curhist.id_cert=3)and(#curhist.id_fond=fnd)and (sub.stop<2)
	   GROUP BY  #curhist.id_fond ),
     sums=(select SUM(sub.sub) from #curhist INNER JOIN 	sub ON #curhist.regn = sub.regn and sub.sdate=#curhist.bdate
	WHERE (sub.sdate = @d)and(#curhist.id_fond=fnd)and (sub.stop<2)
	GROUP BY  #curhist.id_fond),
     sumsl=(select SUM(sluj.sub) from #curhist left JOIN sluj ON #curhist.regn = sluj.regn and sluj.sdate=#curhist.bdate
	WHERE (sluj.sdate = @d)and(#curhist.id_fond=fnd)
	GROUP BY  #curhist.id_fond)

update #c1 set num=0 where num is null
update #c1 set numn=0 where numn is null
update #c1 set numo=0 where numo is null
update #c1 set sums=0 where sums is null
update #c1 set sumsl=0 where sumsl is null

select fond.namefond,#c1.num,#c1.numn,#c1.numo,#c1.sums,#c1.sumsl
from #c1 inner join fond on #c1.fnd=fond.id_fond
order by fond.id_fond


