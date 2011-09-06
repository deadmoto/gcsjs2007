USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[gendolg]    Script Date: 05/30/2011 15:36:47 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



ALTER PROCEDURE [dbo].[gendolg] @idd tinyint,@d varchar(10)
AS

 declare @date smalldatetime

set @date=convert(smalldatetime,@d,104)

select 
cl.regn as RNUMBER
,RTRIM(cl.fio) as NAME
,(RTRIM(Strt.namestreet)+' д.'+RTRIM(cl.nhouse)+' '+cl.corp+'кв.'+cl.apart) as address
,mng.namemng as HOLDER
,convert(smalldatetime,hist.bdate,104) as Firstdate
,hist.edate as Lastdate
,cast(sum(sub.sub) AS decimal(10,2)) as Sum_all
,sub.acservice as ACCNT01
,sub.stop as person
from cl inner 
join Strt on cl.id_street=Strt.id_street inner
join Hist on cl.regn=hist.regn
join sub on cl.regn=sub.regn 
join mng on mng.id_mng=hist.id_mng
where cl.id_dist=@idd and (hist.id_fond=3) 
and hist.id_dist=@idd and mng.id_dist=@idd 
and hist.edate>@date
and hist.bdate<=@date
and sub.service=0
and sub.sdate=hist.bdate
group by cl.regn,cl.fio,(RTRIM(Strt.namestreet)+' д.'+RTRIM(cl.nhouse)+' '+cl.corp+'кв.'+cl.apart),
mng.namemng, hist.bdate,hist.edate,sub.acservice,sub.stop
order by HOLDER,ACCNT01,rnumber,fio