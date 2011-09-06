USE [Subsidy]
GO
/****** Object:  UserDefinedFunction [dbo].[getcurhist]    Script Date: 04/04/2011 14:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 03/29/2011
-- =============================================
CREATE FUNCTION [dbo].[getcurhist]
(
	@d char(10)
)
RETURNS @curhist table (regn int,bdate smalldatetime,edate smalldatetime,mcount tinyint,quanpriv tinyint, pmin float,income float,id_insp smallint,id_dist tinyint,id_cntrl tinyint,reason char(60),
			id_own tinyint,id_mng smallint,id_fond tinyint,id_cert tinyint,id_bank tinyint,acbank char(20),calc tinyint,mdd tinyint, id_heating smallint, rmcount tinyint, indrstnd tinyint, indrstndval float)
AS
BEGIN
	DECLARE @date smalldatetime;
	SET @date = convert(smalldatetime, @d, 104);
	INSERT INTO @curhist
	SELECT dbo.Hist.*
	FROM dbo.Hist INNER JOIN
		  (SELECT      dbo.Hist.regn, MAX(dbo.Hist.bdate) AS bdate
			FROM          dbo.Hist
			WHERE      ( dbo.Hist.bdate <= @date)
			GROUP BY  dbo.Hist.regn) AS sb ON dbo.Hist.regn = sb.regn AND dbo.Hist.bdate = sb.bdate AND dbo.Hist.bdate <= @date AND 
	  dbo.Hist.edate > @date
	
	RETURN;
END
