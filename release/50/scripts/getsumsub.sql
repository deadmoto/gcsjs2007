USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[getsumsub]    Script Date: 05/30/2011 15:40:14 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO






/****** Object:  Stored Procedure dbo.getsumsub    Script Date: 06.07.2006 11:58:57 ******/

/****** Object:  Stored Procedure dbo.getsumsub    Script Date: 05.07.2006 10:25:52 ******/

/****** Object:  Stored Procedure dbo.getsumsub    Script Date: 31.03.2006 15:47:38 ******/

ALTER PROCEDURE [dbo].[getsumsub]  @idd tinyint, @d char(10)
AS

create table #c (reg int, fio varchar(51),summa float)

insert into #c (reg,fio)
select regn,fio
from cl 
where  id_dist=@idd
order by regn

update #c
set summa=(select sum(sub) as summa  from sub
		where(sdate=convert(smalldatetime,@d,104))and(regn=reg)
		group by regn)

update #c
set summa=0 where summa is null

select * from #c
order by fio




