/*
   6 мая 2011 г.9:24:55
   User: sa
   Server: MADMAN-VBOX2007
   Database: Subsidy
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Insp ADD
	id_office tinyint NOT NULL CONSTRAINT DF_Insp_id_office DEFAULT 1
GO
ALTER TABLE dbo.Insp
	DROP CONSTRAINT pk_insp
GO
ALTER TABLE dbo.Insp ADD CONSTRAINT
	pk_insp PRIMARY KEY CLUSTERED 
	(
	id_insp,
	id_dist,
	id_office
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
