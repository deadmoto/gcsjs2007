if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SlujWC]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[SlujWC]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION SlujWC
(
	@regn int,
	@serv int,
	@sdate nvarchar(10)
)
RETURNS float
AS
BEGIN
	RETURN (SELECT     Sluj.sub
FROM         Cl LEFT OUTER JOIN
                      Sluj ON Cl.regn = Sluj.regn
WHERE     (Sluj.service = @serv) AND (Sluj.regn = @regn) AND (Sluj.sdate = CONVERT(smalldatetime, @sdate, 104)))

END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

