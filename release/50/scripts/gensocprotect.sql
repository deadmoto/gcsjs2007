USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[gensocprotect]    Script Date: 05/30/2011 15:37:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


ALTER PROCEDURE [dbo].[gensocprotect] @idd tinyint,@d varchar(10)
AS

declare @date smalldatetime

set @date=convert(smalldatetime,@d,104)

create table #curhist (regn int,bdate smalldatetime,edate smalldatetime,mcount tinyint,income float,id_dist tinyint,calc tinyint)

insert into #curhist
select regn,bdate,edate,mcount,income,id_dist,calc 
from hist 
where bdate<=@date and  edate>@date and id_dist=@idd
order by regn

update #curhist
set calc=null

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

create table #sumsub(regn int,summa float)

insert into #sumsub
select #curhist.regn,sum(sub.sub)
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.sdate=@date
group by #curhist.regn

create table #s15 (reg int, namelgot varchar(51),idlg int)

insert into #s15
select fam.regn,priv.namepriv,priv.id_priv
from fam inner join priv on fam.id_priv=priv.id_priv
where  fam.id_rel=1


select cl.regn  as REGNO,cl.fio as FIO,#addr.home as ADDRESS,#curhist.mcount as MEN,cast(#curhist.income as decimal(10,2)) as DOHOD, 
           #s15.namelgot as LGOTA,cl.rdate as REGDATE,#curhist.bdate as FIRSTDATE,#curhist.edate as LASTDATE,
           cast(#sumsub.summa as decimal(10,2)) as SUB,#curhist.calc as PASP
from cl   inner join #addr on cl.regn=#addr.reg
	inner join #curhist on #curhist.regn=#addr.reg
	inner join #s15 on cl.regn=#s15.reg
	inner join #sumsub on cl.regn=#sumsub.regn