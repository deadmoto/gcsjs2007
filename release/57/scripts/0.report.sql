USE [Subsidy]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 09/13/2011 15:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Report](
	[name] [varchar](50)  NOT NULL,
	[title] [varchar](50)  NOT NULL,
	[filename] [varchar](50)  NOT NULL,
	[type] [varchar](10)  NOT NULL,
 CONSTRAINT [PK_Report_1] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF