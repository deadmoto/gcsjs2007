USE [Subsidy]
GO
/****** Object:  UserDefinedFunction [dbo].[getcl_active]    Script Date: 04/04/2011 14:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 03/29/2011
-- =============================================
CREATE FUNCTION [dbo].[getcl_active] 
(
	@d char(10)
)
RETURNS @out TABLE (bdate smalldatetime, edate smalldatetime, regn int, fio char(43), id_dist tinyint, namedist char(20), address char(60), mcount tinyint, pmin float, income float)
AS
BEGIN
	DECLARE @date smalldatetime;
	SET @date = convert(smalldatetime, @d, 104);
	INSERT INTO @out
	SELECT #curhist.bdate, #curhist.edate, dbo.Cl.regn, dbo.Cl.fio, dbo.Cl.id_dist,dbo.Dist.namedist, 
			RTRIM(dbo.Strt.namestreet) + 
			' д.' + RTRIM(dbo.Cl.nhouse) + 
			CASE dbo.Cl.corp WHEN '' THEN '' ELSE '/' END + RTRIM(dbo.Cl.corp)	
			+ ' кв.' + RTRIM(dbo.Cl.apart) as address,
		#curhist.mcount, #curhist.pmin, #curhist.income
	FROM   dbo.Cl INNER JOIN dbo.getcurhist(@d) AS #curhist ON dbo.Cl.regn = #curhist.regn
		INNER JOIN dbo.Dist ON dbo.Cl.id_dist = dbo.Dist.id_dist
		INNER JOIN dbo.Strt ON dbo.Cl.id_street = dbo.Strt.id_street
	ORDER BY dbo.Cl.id_dist
	RETURN;
END
