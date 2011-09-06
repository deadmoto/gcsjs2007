USE [Subsidy]
GO
/****** Object:  UserDefinedFunction [dbo].[getcl_address]    Script Date: 04/04/2011 14:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 03/29/2011
-- =============================================
CREATE FUNCTION [dbo].[getcl_address]
(
	@regn int
)
RETURNS nvarchar(60)
AS
BEGIN
DECLARE @adr nvarchar(60);

SET @adr = (SELECT RTRIM(dbo.Strt.namestreet) + 
			' д.' + RTRIM(dbo.Cl.nhouse) + 
			CASE dbo.Cl.corp WHEN '' THEN '' ELSE '/' END + RTRIM(dbo.Cl.corp)	
			+ ' кв.' + RTRIM(dbo.Cl.apart) 
			FROM Cl INNER JOIN dbo.Strt ON dbo.Cl.id_street = dbo.Strt.id_street
			WHERE Cl.regn = @regn
);

RETURN RTrim(LTrim(@adr));
END
