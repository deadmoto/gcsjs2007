USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[CreateSubUser]    Script Date: 06/02/2011 12:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 20110530
-- =============================================
CREATE PROCEDURE [dbo].[CreateSubUser]
AS
BEGIN
DECLARE @SQLScript nvarchar(1000)
SET @SQLScript = 
N'
	/*Delete*/
	USE [master]

	IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N''subuser'')
	DROP LOGIN [subuser]

	USE [Subsidy]

	IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N''subuser'')
	DROP SCHEMA [subuser]

	IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N''subuser'')
	DROP USER [subuser]

	/*Create*/
	USE [master]

	CREATE LOGIN [subuser] WITH PASSWORD=N''DFFEEFDDBECFB'', DEFAULT_DATABASE=[Subsidy], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON

	USE [Subsidy]

	CREATE USER [subuser] FOR LOGIN [subuser]

	EXEC sp_addrolemember N''db_owner'', N''subuser''
'

EXECUTE sp_executesql @SQLScript
END
