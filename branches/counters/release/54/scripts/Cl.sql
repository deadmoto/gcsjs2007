/*
   11 августа 2011 г.15:57:58
   User: sa
   Server: server
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
CREATE TABLE dbo.Tmp_Cl
	(
	regn int NOT NULL,
	fio varchar(50) NULL,
	rdate smalldatetime NOT NULL,
	change smalldatetime NOT NULL,
	id_dist tinyint NOT NULL,
	id_street smallint NOT NULL,
	nhouse varchar(7) NULL,
	corp varchar(2) NULL,
	apart varchar(8) NULL,
	tel varchar(11) NULL,
	lsquare float(53) NOT NULL,
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
		SELECT regn, fio, rdate, change, id_dist, id_street, nhouse, corp, apart, tel, lsquare, square, id_stnd, id_settl, boiler, declardate, mail FROM dbo.Cl WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Cl
GO
EXECUTE sp_rename N'dbo.Tmp_Cl', N'Cl', 'OBJECT' 
GO
COMMIT
