/*
   20 окт€бр€ 2009 г. 17:39:16
   User: sa
   Server: (LOCAL)
   Database: Subsidy
   Application: MS SQLEM - Data Tools
*/

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
CREATE TABLE dbo.Tmp_Cl
	(
	regn int NOT NULL,
	fio char(41) NOT NULL,
	rdate smalldatetime NOT NULL,
	change smalldatetime NOT NULL,
	id_dist tinyint NOT NULL,
	id_street smallint NOT NULL,
	nhouse char(7) NOT NULL,
	corp char(2) NOT NULL,
	apart char(8) NOT NULL,
	tel char(10) NOT NULL,
	lsquare float(53) NULL,
	square float(53) NOT NULL,
	id_stnd tinyint NOT NULL,
	id_settl tinyint NOT NULL,
	boiler tinyint NOT NULL,
	declardate smalldatetime NULL,
	mail tinyint NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.Cl)
	 EXEC('INSERT INTO dbo.Tmp_Cl (regn, fio, rdate, change, id_dist, id_street, nhouse, corp, apart, tel, lsquare, square, id_stnd, id_settl, boiler, declardate, mail)
		SELECT regn, fio, rdate, change, id_dist, id_street, nhouse, corp, CONVERT(char(8), apart), tel, lsquare, square, id_stnd, id_settl, boiler, declardate, mail FROM dbo.Cl (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Cl
GO
EXECUTE sp_rename N'dbo.Tmp_Cl', N'Cl', 'OBJECT'
GO
ALTER TABLE dbo.Cl ADD CONSTRAINT
	pk_cl PRIMARY KEY CLUSTERED 
	(
	regn
	) ON [PRIMARY]

GO
COMMIT
