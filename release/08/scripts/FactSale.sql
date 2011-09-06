if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FactSale]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FactSale]
GO

CREATE TABLE [dbo].[FactSale] (
	[sdate] [smalldatetime] NOT NULL ,
	[regn] [int] NOT NULL ,
	[bdate] [smalldatetime] NOT NULL ,
	[edate] [smalldatetime] NOT NULL ,
	[sub] [float] NOT NULL ,
	[factsum] [float] NULL 
) ON [PRIMARY]
GO

