USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[factSum]    Script Date: 09/14/2011 10:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE   PROCEDURE [dbo].[factSum] @dateB varchar(10),@dateE varchar(10), @reg varchar(9)
 AS

DECLARE @dateFirst smalldatetime, @dateLast smalldatetime,@r int

SET @dateFirst=convert(smalldatetime, @dateB, 104)
SET @dateLast=dateadd(month,-1,convert(smalldatetime, @dateE, 104))
SET @r=cast(@reg as int)

create table #c1 (sd smalldatetime,cont float, rep float, cold float, hot float, canal float, heat float, gas float, el float, wood float, 
		coal float, sumall float,conts float,reps float, colds float, hots float, canals float, heats float, gass float, els float, 
		woods float,coals float, sumalls float)

INSERT INTO #c1 (sd) 
SELECT sub.sdate 
FROM cl INNER join sub ON cl.regn=sub.regn
WHERE (cl.regn=@r)and(sub.sdate>=@dateFirst)and (sub.sdate <= @dateLast)
GROUP BY sub.sdate

UPDATE #c1 
SET cont = (SELECT dbo.getsub_sum(@r,0,sd)),
     rep = (SELECT dbo.getsub_sum(@r,1,sd)),
     cold = (SELECT dbo.getsub_sum(@r,2,sd)),
     hot = (SELECT dbo.getsub_sum(@r,3,sd)),
     canal = (SELECT dbo.getsub_sum(@r,4,sd)),
     heat = (SELECT dbo.getsub_sum(@r,5,sd)),
     gas = (SELECT dbo.getsub_sum(@r,6,sd)),
     el = (SELECT dbo.getsub_sum(@r,7,sd)),
     wood = (SELECT dbo.getsub_sum(@r,12,@dateFirst)),
     coal = (SELECT dbo.getsub_sum(@r,13,@dateFirst)),
     --служебные		
     conts = (SELECT dbo.getsluj_sum(@r,0,sd)), 
     reps = (SELECT dbo.getsluj_sum(@r,1,sd)), 
     colds = (SELECT dbo.getsluj_sum(@r,2,sd)), 
     hots = (SELECT dbo.getsluj_sum(@r,3,sd)), 
     canals = (SELECT dbo.getsluj_sum(@r,4,sd)), 
     heats = (SELECT dbo.getsluj_sum(@r,5,sd)), 
     gass = (SELECT dbo.getsluj_sum(@r,6,sd)), 
     els = (SELECT dbo.getsluj_sum(@r,7,sd)), 
     woods = (SELECT dbo.getsluj_sum(@r,12,@dateFirst)), 
     coals = (SELECT dbo.getsluj_sum(@r,13,@dateFirst))

UPDATE #c1 SET cont=0 WHERE cont IS null
UPDATE #c1 SET rep=0 WHERE rep IS null
UPDATE #c1 SET cold=0 WHERE cold IS null
UPDATE #c1 SET hot=0 WHERE hot IS null
UPDATE #c1 SET canal=0 WHERE canal IS null
UPDATE #c1 SET heat=0 WHERE heat IS null
UPDATE #c1 SET gas=0 WHERE gas IS null
UPDATE #c1 SET el=0 WHERE el IS null
UPDATE #c1 SET wood=0 WHERE wood IS null
UPDATE #c1 SET coal=0 WHERE coal IS null
UPDATE #c1 SET sumall = cont+rep+cold+hot+canal+heat+gas+el+wood+coal
--служебные
UPDATE #c1 SET conts=0 WHERE conts IS null
UPDATE #c1 SET reps=0 WHERE reps IS null
UPDATE #c1 SET colds=0 WHERE colds IS null
UPDATE #c1 SET hots=0 WHERE hots IS null
UPDATE #c1 SET canals=0 WHERE canals IS null
UPDATE #c1 SET heats=0 WHERE heats IS null
UPDATE #c1 SET gass=0 WHERE gass IS null
UPDATE #c1 SET els=0 WHERE els IS null
UPDATE #c1 SET woods=0 WHERE woods IS null
UPDATE #c1 SET coals=0 WHERE coals IS null
UPDATE #c1 SET sumalls = conts+reps+colds+hots+canals+heats+gass+els+woods+coals

SELECT sd, (sumall-sumalls) AS sum_sub FROM #c1
ORDER BY sd



