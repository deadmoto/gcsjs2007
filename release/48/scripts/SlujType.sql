USE [Subsidy]
GO
/****** Object:  Table [dbo].[SlujType]    Script Date: 05/03/2011 16:52:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlujType](
	[id_sluj] [tinyint] NOT NULL,
	[namesluj] [nvarchar](150) COLLATE SQL_Latin1_General_CP1251_CI_AS NOT NULL,
 CONSTRAINT [PK_MoneyDolg] PRIMARY KEY CLUSTERED 
(
	[id_sluj] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [dbo].[SlujType] VALUES (1, 'Переплата')
GO
INSERT INTO [dbo].[SlujType] VALUES (2, 'Переплата по фактической оплате')
