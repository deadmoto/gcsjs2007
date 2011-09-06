USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[lastnowsub]    Script Date: 05/30/2011 15:40:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[lastnowsub] @idd tinyint,@dnow char(10) ,@dlast char(10) 
AS

declare @datelast smalldatetime
declare @datenow smalldatetime

set @datenow=convert(smalldatetime,@dnow,104)
set @datelast=convert(smalldatetime,@dlast,104)

create table #curhist (regn int,bdate smalldatetime,edate smalldatetime,mcount tinyint,quanpriv tinyint,pmin float,income float,id_insp smallint,id_dist tinyint,id_cntrl tinyint,reason varchar(60),
			id_own tinyint,id_mng smallint,id_fond tinyint,id_cert tinyint,id_bank tinyint,acbank varchar(20),calc tinyint,mdd tinyint)

insert into #curhist
select * 
from hist 
where bdate<=@datenow and  edate>@datenow and id_dist=@idd
order by regn

create table #addr (reg int, home varchar(60) COLLATE SQL_Latin1_General_CP1251_CI_AS)

insert into #addr
select cl.regn, rtrim(strt.namestreet)+' '+upper(rtrim(cl.nhouse))+'/'+rtrim(corp)
from cl inner join strt on cl.id_street=strt.id_street
inner join #curhist on cl.regn=#curhist.regn

update #addr
set home=left(home,patindex('%/%',home)-1) where right(rtrim(home),len(home)-patindex('%/%',home)) =''
update #addr
set home=rtrim(home)+ ', кв.'+(select rtrim(cl.apart) from cl where cl.regn=#addr.reg)
update #addr
set home=left(home,patindex('%, кв.%',home)-1) where right(rtrim(home),len(home)-patindex('%, кв.%',home)-4) =''

create table #sumsublast(regn int,summa float)

insert into #sumsublast
select #curhist.regn,sum(sub.sub)
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.sdate=@datelast
group by #curhist.regn

create table #sumsubnow(regn int,summa float)
insert into #sumsubnow
select #curhist.regn,sum(sub.sub)
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.sdate=@datenow
group by #curhist.regn

select cl.regn,cl.fio as fio,#addr.home as address,#curhist.bdate,#curhist.edate,insp.nameinsp,
         round(#sumsublast.summa,2) as sum_last,round(#sumsubnow.summa,2) as sum_now 
from cl inner join #addr on cl.regn=#addr.reg
	inner join #curhist on #curhist.regn=#addr.reg
	inner join mng on #curhist.id_mng=mng.id_mng and #curhist.id_dist=mng.id_dist
	inner join insp on #curhist.id_insp=insp.id_insp and #curhist.id_dist=insp.id_dist
	inner join cert on #curhist.id_cert=cert.id_cert
	inner join #sumsublast on cl.regn=#sumsublast.regn
	inner join #sumsubnow on cl.regn=#sumsubnow.regn
where round(#sumsubnow.summa,2) < round(#sumsublast.summa,2) and (#curhist.bdate <> @datenow)
order by cl.fio