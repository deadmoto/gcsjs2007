USE [Subsidy]
GO
/****** Object:  UserDefinedFunction [dbo].[getsluj_sum]    Script Date: 09/14/2011 10:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[getsluj_sum]
(
	@regn int,
	@serv int,
	@sdate smalldatetime
)
RETURNS float
AS
BEGIN
	RETURN (
	select sum(s.sub)
      from sluj s
	 where (s.service  = @serv) 
	   and (s.regn  = @regn)
	   and (s.sdate = @sdate)
	   and (s.factminus = 0)
)

END






