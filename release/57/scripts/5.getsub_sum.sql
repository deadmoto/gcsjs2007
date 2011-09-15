USE [Subsidy]
GO
/****** Object:  UserDefinedFunction [dbo].[getsub_sum]    Script Date: 09/14/2011 17:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[getsub_sum]
(
	@regn int
   ,@serv int
   ,@sdate smalldatetime
)
RETURNS float
AS
BEGIN
	RETURN (
	select sum(s.sub)
      from sub s
	 where (s.sdate = @sdate)
	   and (s.regn  = @regn)
	   and ((s.service  = @serv) or (@serv is null))
)

END








