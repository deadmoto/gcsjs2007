USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[nachnew_office]    Script Date: 06/15/2011 17:44:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE     PROCEDURE [dbo].[nachnew_office] @date char(10), @dist char(1), @office int
AS

DECLARE @curdate smalldatetime
SET @curdate = CONVERT(smalldatetime, @date, 104)

DECLARE @firstdate smalldatetime
SET @firstdate = CONVERT(smalldatetime, '01.01.'+str(year(@date)), 104)


DECLARE @d smallint
SET @d = cast(@dist as smallint)

CREATE TABLE #curhist (regn int, bdate smalldatetime, fond smallint, mng smallint)

CREATE TABLE #curnach (sdate smalldatetime, dist smallint, fond smallint, mng smallint, num smallint,
	cont float, rep float, cold float, hot float, canal float, heat float, gas float, el float, wood float, coal float,sumall float,
	conts float,reps float, colds float, hots float, canals float, heats float, gass float, els float, woods float,coals float,sumalls float)

CREATE TABLE #curnach2 (fond smallint, mng smallint, num smallint,
	cont float, rep float, cold float, hot float, canal float, heat float, gas float, el float, wood float, coal float,sumall float,
	conts float,reps float, colds float, hots float, canals float, heats float, gass float, els float, woods float,coals float,sumalls float,
	conty float, repy float, coldy float, hoty float, canaly float, heaty float, gasy float, ely float, woody float, coaly float,sumally float,
	contys float, repys float, coldys float, hotys float, canalys float, heatys float, gasys float, elys float, woodys float, coalys float,sumallys float)


--активные клиенты за месяц
INSERT INTO #curhist
SELECT     Cl.regn, hist.bdate, hist.id_fond, hist.id_mng
FROM         Cl INNER JOIN
                      Hist ON Cl.regn = Hist.regn INNER JOIN
                          (SELECT     regn, MAX(bdate) AS bdate
                            FROM          hist
                            WHERE      (bdate <= @curdate)
                            GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate AND Hist.bdate <= @curdate
                      AND Hist.edate > @curdate
	INNER JOIN Insp ON Insp.id_insp = Hist.id_insp
WHERE     (Cl.id_dist = @d) and Insp.id_office = @office

----------------------------------------------------------

INSERT INTO #curnach (sdate, dist, fond, mng, num)
SELECT @curdate, @d, #curhist.fond, #curhist.mng, 0
FROM #curhist
GROUP BY #curhist.fond, #curhist.mng

--начисленные суммы по распорядителям
UPDATE #curnach
SET num = (select count(distinct #curhist.regn) from #curhist inner join sub on #curhist.regn=sub.regn
	     where (sub.sdate = @curdate) and (#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)),
     cont = (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=0) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),

     rep = (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=1) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),

     cold = (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=2) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),

     hot = (select sum(sub.sub) from #curhist  inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=3) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),

     canal = (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=4) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),

     heat = (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=5) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond) and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),
     gas = (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=6) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),
     el = (select sum(sub.sub) from #curhist  inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=7) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),
     wood =  (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=12) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),
     coal =  (select sum(sub.sub) from #curhist inner join sub on #curhist.regn=sub.regn
	     where    (sub.sdate = @curdate) and (sub.service=13) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)and (sub.stop<2)
	     group by #curhist.fond,#curhist.mng),


     conts = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=0) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	    group by #curhist.fond,#curhist.mng),
     reps = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=1) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng),
     colds = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=2) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng),
     hots = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=3) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng),
     canals = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=4) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng),
     heats =(select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=5) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng),
     gass = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=6) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	    group by #curhist.fond,#curhist.mng),
     els =(select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=7) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	    group by #curhist.fond,#curhist.mng),
     woods = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=12) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng),
     coals = (select sum(sluj.sub) from #curhist inner join sluj on #curhist.regn=sluj.regn
	     where    (sluj.sdate = @curdate) and (sluj.service=13) and(#curhist.mng=#curnach.mng)and(#curhist.fond=#curnach.fond)
	     group by #curhist.fond,#curhist.mng)

----------------------------------------------------------

update #curnach set cont=0 where cont is null
update #curnach set rep=0 where rep is null
update #curnach set cold=0 where cold is null
update #curnach set hot=0 where hot is null
update #curnach set canal=0 where canal is null
update #curnach set heat=0 where heat is null
update #curnach set gas=0 where gas is null
update #curnach set el=0 where el is null
update #curnach set wood=0 where wood is null
update #curnach set coal=0 where coal is null
update #curnach set sumall = cont+rep+cold+hot+canal+heat+gas+el+wood+coal

update #curnach set conts=0 where conts is null
update #curnach set reps=0 where reps is null
update #curnach set colds=0 where colds is null
update #curnach set hots=0 where hots is null
update #curnach set canals=0 where canals is null
update #curnach set heats=0 where heats is null
update #curnach set gass=0 where gass is null
update #curnach set els=0 where els is null
update #curnach set woods=0 where woods is null
update #curnach set coals=0 where coals is null
update #curnach set sumalls = conts+reps+colds+hots+canals+heats+gass+els+woods+coals

----------------------------------------------------------
--удаляем из таблицы данные за месяц
--DELETE FROM #curnach
--WHERE #curnach.sdate = @curdate AND dist = @d
--добавляем таблицу за месяц
--INSERT INTO #curnach
--SELECT * FROM #curnach
----------------------------------------------------------

--таблица для вывода отчета
INSERT INTO #curnach2 (fond, mng)
SELECT fond, mng
FROM #curnach
WHERE sdate <= @curdate AND dist = @d
GROUP BY fond, mng

UPDATE #curnach2
SET
	num = (SELECT #curnach.num from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	cont = (SELECT #curnach.cont from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	rep  = (SELECT #curnach.rep from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	cold  = (SELECT #curnach.cold from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	hot  = (SELECT #curnach.hot from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	canal  = (SELECT #curnach.canal from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	heat  = (SELECT #curnach.heat from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	gas  = (SELECT #curnach.gas from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	el  = (SELECT #curnach.el from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	wood  = (SELECT #curnach.wood from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	coal  = (SELECT #curnach.coal from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	sumall  = (SELECT #curnach.sumall from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),

	conts = (SELECT #curnach.conts from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	reps  = (SELECT #curnach.reps from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	colds  = (SELECT #curnach.colds from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	hots  = (SELECT #curnach.hots from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	canals  = (SELECT #curnach.canals from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	heats  = (SELECT #curnach.heats from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	gass  = (SELECT #curnach.gass from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	els  = (SELECT #curnach.els from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	woods  = (SELECT #curnach.woods from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	coals  = (SELECT #curnach.coals from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),
	sumalls  = (SELECT #curnach.sumalls from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate = @curdate AND #curnach.dist = @d),

	conty = (SELECT sum(#curnach.cont) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	repy  = (SELECT sum(#curnach.rep) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	coldy  = (SELECT sum(#curnach.cold) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	hoty  = (SELECT sum(#curnach.hot) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	canaly  = (SELECT sum(#curnach.canal) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	heaty  = (SELECT sum(#curnach.heat) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	gasy  = (SELECT sum(#curnach.gas) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	ely  = (SELECT sum(#curnach.el) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	woody  = (SELECT sum(#curnach.wood) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	coaly  = (SELECT sum(#curnach.coal) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	sumally  = (SELECT sum(#curnach.sumall) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),

	contys = (SELECT sum(#curnach.conts) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	repys  = (SELECT sum(#curnach.reps) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	coldys  = (SELECT sum(#curnach.colds) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	hotys  = (SELECT sum(#curnach.hots) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	canalys  = (SELECT sum(#curnach.canals) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	heatys  = (SELECT sum(#curnach.heats) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	gasys  = (SELECT sum(#curnach.gass) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	elys  = (SELECT sum(#curnach.els) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	woodys  = (SELECT sum(#curnach.woods) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	coalys  = (SELECT sum(#curnach.coals) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d),
	sumallys  = (SELECT sum(#curnach.sumalls) from #curnach WHERE #curnach.fond = #curnach2.fond AND #curnach.mng = #curnach2.mng AND #curnach.sdate <= @curdate AND #curnach.sdate >= @firstdate AND #curnach.dist = @d)

----------------------------------------------------------

update #curnach2 set num=0 where num is null

update #curnach2 set cont=0 where cont is null
update #curnach2 set rep=0 where rep is null
update #curnach2 set cold=0 where cold is null
update #curnach2 set hot=0 where hot is null
update #curnach2 set canal=0 where canal is null
update #curnach2 set heat=0 where heat is null
update #curnach2 set gas=0 where gas is null
update #curnach2 set el=0 where el is null
update #curnach2 set wood=0 where wood is null
update #curnach2 set coal=0 where coal is null
update #curnach2 set sumall=0 where sumall is null

update #curnach2 set conts=0 where conts is null
update #curnach2 set reps=0 where reps is null
update #curnach2 set colds=0 where colds is null
update #curnach2 set hots=0 where hots is null
update #curnach2 set canals=0 where canals is null
update #curnach2 set heats=0 where heats is null
update #curnach2 set gass=0 where gass is null
update #curnach2 set els=0 where els is null
update #curnach2 set woods=0 where woods is null
update #curnach2 set coals=0 where coals is null
update #curnach2 set sumalls=0 where sumalls is null

update #curnach2 set conty=0 where conty is null
update #curnach2 set repy=0 where repy is null
update #curnach2 set coldy=0 where coldy is null
update #curnach2 set hoty=0 where hoty is null
update #curnach2 set canaly=0 where canaly is null
update #curnach2 set heaty=0 where heaty is null
update #curnach2 set gasy=0 where gasy is null
update #curnach2 set ely=0 where ely is null
update #curnach2 set woody=0 where woody is null
update #curnach2 set coaly=0 where coaly is null
update #curnach2 set sumally=0 where sumally is null

update #curnach2 set contys=0 where contys is null
update #curnach2 set repys=0 where repys is null
update #curnach2 set coldys=0 where coldys is null
update #curnach2 set hotys=0 where hotys is null
update #curnach2 set canalys=0 where canalys is null
update #curnach2 set heatys=0 where heatys is null
update #curnach2 set gasys=0 where gasys is null
update #curnach2 set elys=0 where elys is null
update #curnach2 set woodys=0 where woodys is null
update #curnach2 set coalys=0 where coalys is null
update #curnach2 set sumallys=0 where sumallys is null

----------------------------------------------------------

select #curnach2.*, fond.namefond, mng.namemng
from #curnach2  inner join fond on #curnach2.fond=fond.id_fond
               inner join mng on #curnach2.mng=mng.id_mng and mng.id_dist=@d
order by fond.namefond,mng.namemng





