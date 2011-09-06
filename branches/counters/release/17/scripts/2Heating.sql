if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Heating]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Heating]
GO

CREATE TABLE [dbo].[Heating] (
	[id_heating] [smallint] NULL ,
	[nameheating] [char] (20) COLLATE SQL_Latin1_General_CP1251_CI_AS NULL 
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Heating]
VALUES(1,'Центральное')
GO
INSERT INTO [dbo].[Heating]
VALUES(2,'Твердое топливо')
GO
INSERT INTO [dbo].[Heating]
VALUES(3,'Газовое')
GO
INSERT INTO [dbo].[Heating]
VALUES(4,'Электирическое')
