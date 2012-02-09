set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


ALTER PROCEDURE [dbo].[getclinfo_office] @idd tinyint, @date char(10), @office int
AS

declare @dateLast smalldatetime

set @dateLast=convert(smalldatetime, @date, 104)

create table #cursub (regn int,sub float)

insert into #cursub
select cl.regn,sum(sub.sub)
from sub inner join cl on cl.regn=sub.regn and cl.id_dist=@idd
where sub.sdate=@dateLast 
group by cl.regn

if @office = -1
begin
  exec dbo.getclinfo @idd, @date
end
else
begin
	select cl.regn,cl.fio,strt.namestreet,cl.nhouse,cl.corp,cl.apart,cl.tel,mng.namemng,hist.bdate,hist.edate,dist.boss,#cursub.sub
	from cl inner join hist on cl.regn=hist.regn and hist.bdate<=@datelast and hist.edate>@datelast  
	inner join mng on hist.id_mng=mng.id_mng and hist.id_dist=mng.id_dist
	inner join strt on cl.id_street=strt.id_street
	inner join dist on cl.id_dist=dist.id_dist
	inner join #cursub on cl.regn=#cursub.regn
	inner join insp on hist.id_insp = insp.id_insp
	where cl.id_dist=@idd and insp.id_office = @office
	order by cl.fio
end

