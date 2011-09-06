USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[backupdatabase]    Script Date: 05/03/2011 17:00:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 29/04/2011
-- =============================================
CREATE PROCEDURE [dbo].[backupdatabase] 
	-- Add the parameters for the stored procedure here
	@path nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @name VARCHAR(50) -- database name  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)

SET @name = (SELECT name FROM MASTER.dbo.sysdatabases WHERE lower(name) = 'subsidy') 
SET @fileName = @path + @name + '_' + @fileDate + '.BAK'  
BACKUP DATABASE @name TO DISK = @fileName  
END
