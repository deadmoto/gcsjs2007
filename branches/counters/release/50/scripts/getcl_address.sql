USE [Subsidy]
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 03/29/2011
-- =============================================
ALTER FUNCTION [dbo].[getcl_address]
(
	@regn int
)
RETURNS nvarchar(60)
AS
BEGIN
DECLARE @adr nvarchar(60);

SET @adr = (SELECT RTRIM(dbo.Strt.namestreet) + 
			' д.' + RTRIM(dbo.Cl.nhouse) + 
			CASE dbo.Cl.corp WHEN '' THEN '' ELSE '/' END + RTRIM(dbo.Cl.corp)	+
			CASE dbo.Cl.apart WHEN '' THEN '' ELSE ' кв.' + RTRIM(dbo.Cl.apart) END 			
 
			FROM Cl INNER JOIN dbo.Strt ON dbo.Cl.id_street = dbo.Strt.id_street
			WHERE Cl.regn = @regn
);

RETURN RTrim(LTrim(@adr));
END

