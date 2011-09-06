USE [Subsidy]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 05/06/2011 12:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[id_dist] [tinyint] NOT NULL,
	[id_office] [tinyint] NOT NULL,
	[adr] [nvarchar](100) COLLATE SQL_Latin1_General_CP1251_CI_AS NOT NULL,
	[tel] [nvarchar](100) COLLATE SQL_Latin1_General_CP1251_CI_AS NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[id_dist] ASC,
	[id_office] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
