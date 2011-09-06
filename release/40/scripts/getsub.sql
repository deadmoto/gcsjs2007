if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getsub]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[getsub]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO




CREATE  PROCEDURE getsub @id int, @d char(10)
AS

select sub.regn,sub.service,sub.acservice,sub.pm,sub.snpm,sub.sub,serv.nameserv,sub.stndsub
from sub inner join serv on sub.service=serv.id_serv
where regn=@id and sdate=convert(smalldatetime,@d,104)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

