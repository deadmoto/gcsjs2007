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

create table #s (reg int, stop tinyint)

insert into #s
select distinct (cl.regn),sub.stop 
from cl left join sub on cl.regn=sub.regn and  sub.sdate=@date and cl.id_dist=@idd

update #s
set stop=0 where stop is null

--select * from #s

create table #ss (reg int, summa float)

insert into #ss
select distinct (cl.regn),sum(sub.sub)
from cl left join sub on cl.regn=sub.regn and sub.sdate=@date and (sub.stop<2) 
where cl.id_dist=@idd 
group by cl.regn

update #ss
set summa=0 where summa is null

--select * from #ss

create table #ssl (reg int, summa float)

insert into #ssl
select distinct (#ss.reg),sum(sluj.sub)
from sluj inner join #ss on sluj.regn=#ss.reg and sluj.sdate=@date
group by #ss.reg

--update #ssl
--set summa=0 where summa is null

update #ss
set #ss.summa = #ss.summa - #ssl.summa
from #ss inner join #ssl on #ss.reg = #ssl.reg

/*select * from #ss
order by summa
select * from #ssl
order by summa
*/
create table #final (bdate smalldatetime,edate smalldatetime,calc int, regn int, fio char(43),namestreet char(41),nhouse char(7),corp char(2),apart char(8),stop int,summa float)

insert into #final
select hist.bdate,hist.edate,hist.calc,cl.regn,cl.fio,strt.namestreet,cl.nhouse,cl.corp,cl.apart,#s.stop,#ss.summa
from hist inner join (select regn, max(bdate) as bdate from hist where bdate<=@date and id_dist = @idd group by regn) sb on hist.regn=sb.regn and hist.bdate=sb.bdate 
inner join cl  on cl.regn=hist.regn
inner join strt on cl.id_street=strt.id_street 
inner join #s on cl.regn=#s.reg
inner join #ss on cl.regn=#ss.reg
order by cl.fio


select * from #final
order by fio

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

