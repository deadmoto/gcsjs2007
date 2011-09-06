USE [Subsidy]
GO
/****** Object:  Table [dbo].[Debt]    Script Date: 05/03/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debt](
	[id_debt] [uniqueidentifier] NOT NULL,
	[id_sluj] [tinyint] NOT NULL,
	[dist] [tinyint] NOT NULL,
	[regn] [int] NOT NULL,
	[bdate] [smalldatetime] NOT NULL,
	[edate] [smalldatetime] NOT NULL,
	[sumdebt] [float] NOT NULL,
	[closed] [tinyint] NOT NULL CONSTRAINT [DF_MoneyDolgClient_closed]  DEFAULT ((0)),
	[closed_date] [smalldatetime] NULL,
 CONSTRAINT [PK_Debt] PRIMARY KEY CLUSTERED 
(
	[id_debt] ASC,
	[id_sluj] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
