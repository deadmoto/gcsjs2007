if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SubWC]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[SubWC]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION SubWC
(
	@regn int,
	@serv int,
	@sdate smalldatetime
)
RETURNS float
AS
BEGIN
	RETURN (SELECT Sub.sub
FROM         Cl INNER JOIN
                      Sub ON Cl.regn = Sub.regn
WHERE     (Sub.service = @serv) AND (Sub.regn = @regn) AND (Sub.sdate = @sdate))
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

