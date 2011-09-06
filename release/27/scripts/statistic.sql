USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[statistic]    Script Date: 10/08/2009 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[statistic] @date char(10), @dist int, @selmode int, @mode int
AS
--@mode выриант выбора (1 - семьи, 2 - люди)
--@selmode выриант выбора (1 - льготы, 2 - статусы)

DECLARE @d smalldatetime
SET @d = CONVERT(smalldatetime, @date, 104)

CREATE TABLE #ACTCL (regn int, mcount int, fio char(55))

INSERT INTO #ACTCL
SELECT dbo.Cl.regn, dbo.Hist.mcount, dbo.Cl.fio
FROM dbo.Cl INNER JOIN
  dbo.Hist ON dbo.Cl.regn = dbo.Hist.regn INNER JOIN
  (SELECT regn, MAX(bdate) AS bdate
    FROM  hist
    WHERE  (bdate <= @d)
    GROUP BY regn) sb ON dbo.Hist.regn = sb.regn AND dbo.Hist.bdate = sb.bdate AND dbo.Hist.bdate <= @d 
  AND dbo.Hist.edate > @d
WHERE Cl.id_dist = @dist

IF @selmode = 1
BEGIN
	IF @mode = 1
	BEGIN
		SELECT priv.namepriv, count(priv.namepriv) as kolvo
		FROM #ACTCL inner join
			fam on fam.id_mem = (cast(#ACTCL.regn as char(8)) + '0')  INNER JOIN
			priv on fam.id_priv = priv.id_priv
		GROUP BY priv.namepriv
	END
	ELSE
	BEGIN
		SELECT priv.namepriv, count(priv.namepriv) as kolvo
		FROM #ACTCL inner join
			fam on fam.regn = #ACTCL.regn  INNER JOIN
			priv on fam.id_priv = priv.id_priv
		GROUP BY priv.namepriv
	END
END
ELSE
BEGIN
	IF @mode = 1
	BEGIN
		SELECT stat.namestatus, count(stat.namestatus) as kolvo
		FROM #ACTCL inner join
			fam on fam.id_mem = (cast(#ACTCL.regn as char(8)) + '0')  INNER JOIN
			stat on fam.id_status = stat.id_status
		GROUP BY stat.namestatus
	END
	ELSE
	BEGIN
		SELECT stat.namestatus, count(stat.namestatus) as kolvo 
		FROM #ACTCL inner join
			fam on fam.regn = #ACTCL.regn  INNER JOIN
			stat on fam.id_status = stat.id_status
		GROUP BY stat.namestatus
	END
END
