USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[getclinfo_office]    Script Date: 06/15/2011 17:43:40 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[getclinfo_office] @idd tinyint, @date char(10), @office tinyint
AS

declare @dateLast smalldatetime

set @dateLast=convert(smalldatetime, @date, 104)

create table #cursub (regn int,sub float)

insert into #cursub
select cl.regn,sum(sub.sub)
from sub inner join cl on cl.regn=sub.regn and cl.id_dist=@idd
where sub.sdate=@dateLast 
group by cl.regn

select cl.regn,cl.fio,strt.namestreet,cl.nhouse,cl.corp,cl.apart,cl.tel,mng.namemng,hist.bdate,hist.edate,dist.boss,#cursub.sub
from cl inner join hist on cl.regn=hist.regn and hist.bdate<=@datelast and hist.edate>@datelast  
inner join mng on hist.id_mng=mng.id_mng and hist.id_dist=mng.id_dist
inner join strt on cl.id_street=strt.id_street
inner join dist on cl.id_dist=dist.id_dist
inner join #cursub on cl.regn=#cursub.regn
inner join insp on hist.id_insp = insp.id_insp
where cl.id_dist=@idd and insp.id_office = @office
order by cl.fio
