if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[formnewpm]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[formnewpm]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE  PROCEDURE formnewpm @d1 char(10),@d2 char(10),@d tinyint
AS

declare @old smalldatetime, @new smalldatetime

set @old=convert(smalldatetime,@d1,104)
set @new=convert(smalldatetime,@d2,104)

create table #c1(sdate smalldatetime, reg int, service tinyint,id_service tinyint,acservice char(20),pm float,snpm float, sub float, spfree float,stop tinyint, stndsub float)

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


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

