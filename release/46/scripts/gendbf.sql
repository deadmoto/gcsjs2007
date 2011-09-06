USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[gendbf]    Script Date: 04/04/2011 14:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER  PROCEDURE [dbo].[gendbf] @idd tinyint,@d char(10)
AS

DECLARE @date smalldatetime

SET @date=convert(smalldatetime,@d,104)

create table #curhist (regn int,bdate smalldatetime,edate smalldatetime,mcount tinyint,quanpriv tinyint, pmin float,income float,id_insp smallint,id_dist tinyint,id_cntrl tinyint,reason char(60),
			id_own tinyint,id_mng smallint,id_fond tinyint,id_cert tinyint,id_bank tinyint,acbank char(20),calc tinyint,mdd tinyint, id_heating smallint, rmcount tinyint, indrstnd tinyint, indrstndval float)

INSERT INTO #curhist
SELECT * 
FROM dbo.curhist(@d)
WHERE id_dist = @idd

--create table #addr (reg int, home char(60) COLLATE SQL_Latin1_General_CP1251_CI_AS)
--
--insert into #addr
--select cl.regn, rtrim(strt.namestreet)+' '+upper(rtrim(cl.nhouse))+'/'+rtrim(corp)
--from cl inner join strt on cl.id_street=strt.id_street
--inner join #curhist on cl.regn=#curhist.regn

--update #addr
--set home=left(home,patindex('%/%',home)-1) where right(rtrim(home),len(home)-patindex('%/%',home)) =''
--update #addr
--set home=rtrim(home)+ ', кв.'+(select rtrim(cl.apart) from cl where cl.regn=#addr.reg)
--update #addr
--set home=left(home,patindex('%, кв.%',home)-1) where right(rtrim(home),len(home)-patindex('%, кв.%',home)-4) =''

create table #sumsub(regn int,summa float)

insert into #sumsub
select #curhist.regn,sum(sub.sub)
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.sdate=@date
group by #curhist.regn

create table #s1 (reg int, ac char(20),sum float)

insert into #s1
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=0 and sub.sdate=@date

create table #s2 (reg int, ac char(20),sum float)

insert into #s2
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=1 and sub.sdate=@date

create table #s3 (reg int, ac char(20),sum float)

insert into #s3
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=2 and sub.sdate=@date

create table #s4 (reg int, ac char(20),sum float)

insert into #s4
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=3 and sub.sdate=@date

create table #s5 (reg int, ac char(20),sum float)

insert into #s5
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=4 and sub.sdate=@date

create table #s6 (reg int, ac char(20),sum float)

insert into #s6
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=5 and sub.sdate=@date

create table #s7 (reg int, ac char(20),sum float)

insert into #s7
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=6 and sub.sdate=@date

create table #s8 (reg int, ac char(20),sum float)

insert into #s8
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=7 and sub.sdate=@date

create table #s13 (reg int, ac char(20),sum float)

insert into #s13
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=12 and sub.sdate=@date

create table #s14 (reg int, ac char(20),sum float)

insert into #s14
select #curhist.regn,sub.acservice,sub.sub
from #curhist inner join sub on #curhist.regn=sub.regn
where  sub.service=13 and sub.sdate=@date


select cl.regn,cl.rdate,cl.fio,dbo.getcl_address(cl.regn),cl.tel,#curhist.bdate,#curhist.edate,#curhist.calc,#curhist.mcount,priv.namepriv, #curhist.quanpriv,#curhist.income,cl.square,mng.namemng,insp.nameinsp,cl.boiler,
	cert.namecert,fond.namefond,settl.namesettl,own.nameown,
	#s1.ac as ac1,#s2.ac as ac2,#s3.ac as ac3,#s4.ac as ac4,#s5.ac as ac5,#s6.ac as ac6,#s7.ac as ac7,#s8.ac as ac8,#s13.ac as ac13,#s14.ac as ac14,
	#s1.sum as sum1,#s2.sum as sum2,#s3.sum as sum3,#s4.sum as sum4,#s5.sum as sum5,#s6.sum as sum6,#s7.sum as sum7,#s8.sum as sum8,#s13.sum as sum13,#s14.sum as sum14,#sumsub.summa as sum_all, bank.namebank, #curhist.acbank
from cl inner join #curhist on #curhist.regn = cl.regn
	inner join mng on #curhist.id_mng=mng.id_mng and #curhist.id_dist=mng.id_dist
	inner join insp on #curhist.id_insp=insp.id_insp and #curhist.id_dist=insp.id_dist
	inner join cert on #curhist.id_cert=cert.id_cert
	inner join fond on #curhist.id_fond=fond.id_fond
	inner join settl on cl.id_settl=settl.id_settl
	inner join own on #curhist.id_own=own.id_own
	inner join #s1 on cl.regn=#s1.reg
	inner join #s2 on cl.regn=#s2.reg
	inner join #s3 on cl.regn=#s3.reg
	inner join #s4 on cl.regn=#s4.reg
	inner join #s5 on cl.regn=#s5.reg
	inner join #s6 on cl.regn=#s6.reg
	inner join #s7 on cl.regn=#s7.reg
	inner join #s8 on cl.regn=#s8.reg
	inner join #s13 on cl.regn=#s13.reg
	inner join #s14 on cl.regn=#s14.reg
	inner join #sumsub on cl.regn=#sumsub.regn
	inner join bank on #curhist.id_bank = bank.id_bank
	inner join fam on fam.id_mem = (cast(cl.regn as char(8)) + '0')
	inner join priv on fam.id_priv = priv.id_priv
