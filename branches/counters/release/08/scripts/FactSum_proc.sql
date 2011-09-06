if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[factSum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[factSum]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE factSum @dateB char(10),@dateE char(10), @reg char(9)
 AS

declare @dateFirst smalldatetime, @dateLast smalldatetime,@r int

set @dateFirst=convert(smalldatetime, @dateB, 104)
set @dateLast=dateadd(month,-1,convert(smalldatetime, @dateE, 104))
set @r=cast(@reg as int)

create table #c1 (sd smalldatetime,cont float, rep float, cold float, hot float, canal float, heat float, gas float, el float, wood float, 
		coal float, sumall float,conts float,reps float, colds float, hots float, canals float, heats float, gass float, els float, 
		woods float,coals float, sumalls float, accont varchar(20), acrep varchar(20), accold varchar(20), achot varchar(20), accanal varchar(20),
		acheat varchar(20), acgas varchar(20), acel varchar(20), acwood varchar(20), accoal varchar(20))

insert into #c1 (sd) 
select sub.sdate 
from cl inner join sub on cl.regn=sub.regn
where (cl.regn=@r)and(sub.sdate>=@dateFirst)and (sub.sdate <= @dateLast)
group by sub.sdate

update #c1 
set cont = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=0)and(sub.regn=@r)and(sub.sdate=sd)),
     rep = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=1)and(sub.regn=@r)and(sub.sdate=sd)),
     cold = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=2)and(sub.regn=@r)and(sub.sdate=sd)),
     hot = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=3)and(sub.regn=@r)and(sub.sdate=sd)),
     canal = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=4)and(sub.regn=@r)and(sub.sdate=sd)),
     heat = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=5)and(sub.regn=@r)and(sub.sdate=sd)),
     gas = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=6)and(sub.regn=@r)and(sub.sdate=sd)),
     el = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=7)and(sub.regn=@r)and(sub.sdate=sd)),
     wood = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=12)and(sub.regn=@r)and(sub.sdate=sd)),
     coal = (select sub.sub from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=13)and(sub.regn=@r)and(sub.sdate=sd)),
     conts = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=0) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     reps = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=1) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     colds = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=2) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     hots = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=3) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     canals = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=4) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     heats = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=5) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     gass = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=6) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     els = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=7) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     woods = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=12) and(sluj.regn=@r)and(sluj.sdate=sd)), 
     coals = (select sluj.sub from cl left join sluj on cl.regn=sluj.regn 
	     where    (sluj.service=13) and(sluj.regn=@r)and(sluj.sdate=sd)),
     accont = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=0)and(sub.regn=@r)and(sub.sdate=sd)),
     acrep = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=1)and(sub.regn=@r)and(sub.sdate=sd)),
     accold = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=2)and(sub.regn=@r)and(sub.sdate=sd)),
     achot = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=3)and(sub.regn=@r)and(sub.sdate=sd)),
     accanal = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=4)and(sub.regn=@r)and(sub.sdate=sd)),
     acheat = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=5)and(sub.regn=@r)and(sub.sdate=sd)),
     acgas = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=6)and(sub.regn=@r)and(sub.sdate=sd)),
     acel = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=7)and(sub.regn=@r)and(sub.sdate=sd)),
     acwood = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=12)and(sub.regn=@r)and(sub.sdate=sd)),
     accoal = (select sub.acservice from cl inner join sub on cl.regn=sub.regn
	     where (sub.service=13)and(sub.regn=@r)and(sub.sdate=sd))

update #c1 set cont=0 where cont is null
update #c1 set rep=0 where rep is null
update #c1 set cold=0 where cold is null
update #c1 set hot=0 where hot is null
update #c1 set canal=0 where canal is null
update #c1 set heat=0 where heat is null
update #c1 set gas=0 where gas is null
update #c1 set el=0 where el is null
update #c1 set wood=0 where wood is null
update #c1 set coal=0 where coal is null
update #c1 set sumall = cont+rep+cold+hot+canal+heat+gas+el+wood+coal
update #c1 set accont='' where accont is null
update #c1 set acrep='' where acrep is null
update #c1 set accold='' where accold is null
update #c1 set achot='' where achot is null
update #c1 set accanal='' where accanal is null
update #c1 set acheat='' where acheat is null
update #c1 set acgas='' where acgas is null
update #c1 set acel='' where acel is null
update #c1 set acwood='' where acwood is null
update #c1 set accoal='' where accoal is null
update #c1 set conts=0 where conts is null
update #c1 set reps=0 where reps is null
update #c1 set colds=0 where colds is null
update #c1 set hots=0 where hots is null
update #c1 set canals=0 where canals is null
update #c1 set heats=0 where heats is null
update #c1 set gass=0 where gass is null
update #c1 set els=0 where els is null
update #c1 set woods=0 where woods is null
update #c1 set coals=0 where coals is null
update #c1 set sumalls = conts+reps+colds+hots+canals+heats+gass+els+woods+coals

select sd, (sumall-sumalls) as sum_sub from #c1
order by sd
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

