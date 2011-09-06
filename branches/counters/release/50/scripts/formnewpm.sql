USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[formnewpm]    Script Date: 05/30/2011 15:34:54 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




ALTER  PROCEDURE [dbo].[formnewpm] @d1 varchar(10),@d2 varchar(10),@d tinyint
AS

declare @old smalldatetime, @new smalldatetime

set @old=convert(smalldatetime,@d1,104)
set @new=convert(smalldatetime,@d2,104)

create table #c1(sdate smalldatetime, reg int, service tinyint,id_service tinyint,acservice varchar(20),pm float,snpm float, sub float, spfree float,stop tinyint, stndsub float)

insert into #c1
select @new,sub.regn,sub.service,sub.id_service,sub.acservice,sub.pm,sub.snpm,sub.sub,sub.spfree,sub.stop,sub.stndsub
from sub inner join hist on sub.regn=hist.regn and hist.bdate<@new and  hist.edate>@new and hist.id_dist=@d
where sub.sdate=@old and sub.regn not in (select distinct(hist.regn)
						from sub inner join hist on hist.regn=sub.regn and bdate<@new and edate>@new and id_dist=@d
						where sub.sdate=@new)

update #c1 set stop=3 where stop=2
update #c1 set pm=0 where service>11
update #c1 set snpm=0 where service>11
update #c1 set sub=0 where service>11
update #c1 set spfree=0 where service>11
update #c1 set stndsub=0 where service>11

insert into sub
select * from #c1


