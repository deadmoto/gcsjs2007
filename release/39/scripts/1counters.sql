if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Counters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Counters]
GO

CREATE TABLE [dbo].[Counters] (
	[sdate] [smalldatetime] NOT NULL ,
	[regn] [int] NOT NULL ,
	[service] [tinyint] NOT NULL ,
	[counter] [tinyint] NOT NULL ,
	[counterdata] [int] NOT NULL 
) ON [PRIMARY]
GO

