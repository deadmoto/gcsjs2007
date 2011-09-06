USE [Subsidy]
GO
/****** Object:  UserDefinedFunction [dbo].[smalldate]    Script Date: 05/03/2011 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 04/28/2011
-- =============================================
CREATE FUNCTION [dbo].[smalldate]
(
	@date char(10)
)
RETURNS smalldatetime
AS
BEGIN
	RETURN convert(smalldatetime, @date, 104);
END

