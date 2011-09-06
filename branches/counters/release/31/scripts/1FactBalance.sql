if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FactBalance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FactBalance]
GO

CREATE TABLE [dbo].[FactBalance] (
	[regn] [int] NOT NULL ,
	[bdate] [smalldatetime] NOT NULL ,
	[edate] [smalldatetime] NOT NULL ,
	[balance] [float] NOT NULL ,
	[dolg] [float] NULL 
) ON [PRIMARY]
GO

