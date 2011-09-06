USE [Subsidy]
GO
/****** Object:  Table [dbo].[DebtPay]    Script Date: 05/03/2011 16:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebtPay](
	[id_debt] [uniqueidentifier] NOT NULL,
	[sdate] [smalldatetime] NOT NULL,
	[paused] [tinyint] NOT NULL,
	[m_return] [float] NOT NULL
) ON [PRIMARY]
