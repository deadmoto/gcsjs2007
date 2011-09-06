USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[getcurhist_query]    Script Date: 05/31/2011 18:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 20110531
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[getcurhist_query]
	@d char(10),
	@idd tinyint
AS
BEGIN
	SELECT sdate, regn, service, pm, snpm, sub, factminus INTO #curhist_query FROM sluj WHERE sdate = dbo.smalldate(@d) AND id_debt is NULL

	ALTER TABLE #curhist_query ADD CONSTRAINT
		PK_CurSluj PRIMARY KEY CLUSTERED 
		(
		sdate,
		regn,
		service
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	select sum(sub.sub) as s1,sum(ssluj.sub) as s2,sub.regn, cl.fio
	from sub left join 
		#curhist_query as ssluj  on sub.regn=ssluj.regn and sub.sdate=ssluj.sdate and sub.service=ssluj.service inner join cl on cl.regn=sub.regn
	where (sub.sdate=dbo.smalldate(@d))and(cl.id_dist=@idd)and(sub.stop<2)
	group by sub.regn, cl.fio
	ORDER BY cl.fio
END
