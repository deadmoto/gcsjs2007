if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getpriv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[getpriv]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE getpriv 
AS

create table #c1 (pr tinyint,p1 varchar(10),p2 varchar(10),p3 varchar(10))

insert into #c1
select id_priv, cast(pcont as varchar(3)), cast(pcold as varchar(3)),cast(pcoal as varchar(3)) from priv

update #c1
set p1=p1 +( case when (select fcont from priv where  (id_priv=pr))=1 then  '*' 
		when (select fcont from priv where  (id_priv=pr))=0 then  '' 
		end),
     p2=p2 +( case when (select fcold from priv where  (id_priv=pr))=1 then  '*' 
		when (select fcold from priv where  (id_priv=pr))=0 and (select fheat from priv where  (id_priv=pr))=0 then  '' 
		when (select fcold from priv where  (id_priv=pr))=0 and (select fheat from priv where  (id_priv=pr))=1  then  '(*отопл)' 
		end),
     p3=p3 +( case when (select fcoal from priv where  (id_priv=pr))=1 then  '*' 
		when (select fcoal from priv where  (id_priv=pr))=0 then  '' 
		end)

select priv.id_priv,priv.namepriv,priv.square,priv.levelp,#c1.p1 as p1,#c1.p2 as p2,#c1.p3 as p3
from #c1 inner join priv on #c1.pr=priv.id_priv
order by id_priv --priv.namepriv
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

