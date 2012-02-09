set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


ALTER   PROCEDURE [dbo].[factSum] @dateB varchar(10),@dateE varchar(10), @reg varchar(9)
 AS

DECLARE @dateFirst smalldatetime, @dateLast smalldatetime,@r int

SET @dateFirst=convert(smalldatetime, @dateB, 104)
SET @dateLast=dateadd(month,-1,convert(smalldatetime, @dateE, 104))
SET @r=cast(@reg as int)


select sdate as sd, sum(sub) as sum_sub
  from sub
 where regn = @r
   and sdate>=@dateFirst
   and sdate <= @dateLast
 group by sdate