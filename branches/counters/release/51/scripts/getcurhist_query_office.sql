USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[getcurhist_query_office]    Script Date: 06/15/2011 18:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 20110531
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[getcurhist_query_office]
	@d char(10),
	@idd tinyint,
	@office tinyint
AS
BEGIN
	SELECT hh.* INTO #curhist 
	FROM dbo.getcurhist(@d) as hh INNER JOIN Insp ON Insp.id_insp = hh.id_insp
	WHERE Insp.id_office = @office

	SELECT sluj.sdate, sluj.regn, sluj.service, sluj.pm, sluj.snpm, sluj.sub, sluj.factminus INTO #curhist_query 
	FROM sluj INNER JOIN #curhist ON #curhist.regn = sluj.regn
	WHERE sluj.sdate = dbo.smalldate(@d) AND sluj.id_debt is NULL 

	ALTER TABLE #curhist_query ADD CONSTRAINT
		PK_CurSluj PRIMARY KEY CLUSTERED 
		(
		sdate,
		regn,
		service
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SELECT sub.* INTO #sub 
	FROM sub INNER JOIN #curhist ON #curhist.regn = sub.regn
	WHERE sub.sdate = dbo.smalldate(@d)
	
	select sum(#sub.sub) as s1,sum(ssluj.sub) as s2,#sub.regn, cl.fio
	from #sub left join 
		#curhist_query as ssluj  on #sub.regn=ssluj.regn and #sub.sdate=ssluj.sdate and #sub.service=ssluj.service inner join cl on cl.regn=#sub.regn
	where (#sub.sdate=dbo.smalldate(@d))and(cl.id_dist=@idd)and(#sub.stop<2)
	group by #sub.regn, cl.fio
	ORDER BY cl.fio
END

