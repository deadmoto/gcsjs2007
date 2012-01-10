
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 09/12/2011
-- =============================================
ALTER PROCEDURE [dbo].[cllist]  
(  
  @dist   int  
 ,@office int
 ,@date   varchar(10)
 ,@sender varchar(50) 
)  
AS
BEGIN  
  SET NOCOUNT ON;  
  
  declare @sql			nvarchar(4000)
		 ,@addition_sql nvarchar(1000)
		 ,@filter_sql   nvarchar(1000)
		 ,@d			smalldatetime
		 ,@de			smalldatetime;

  declare @result table(regn int
					   ,fio varchar(50)
					   ,address varchar(255)
					   );
  --initialize variables
  set @d = dbo.smalldate(@date);
  set @de= dateadd(month,1,@d);
  
  set @sql = N'SELECT cl.regn, cl.fio, dbo.getcl_address(cl.regn) as address
				 FROM cl 
				INNER JOIN Hist 
                   ON cl.regn=hist.regn
		 %ADDITIONAL%
				WHERE (cl.id_dist=@dist)
					  %FILTER%
				ORDER BY fio, address';

  set @addition_sql = '';
  set @filter_sql   = '';
  --body
  if @office <> -1
  begin
    set @addition_sql = 'INNER JOIN Insp ON Insp.id_insp = Hist.id_insp';
    set @filter_sql   = 'and(insp.id_dist = cl.id_dist)and(Insp.id_office = @office)';
  end;

  set @sender = lower(@sender);
  --Списки на архив
  if @sender = lower('aRepClListArch')
  begin
    set @filter_sql = @filter_sql + 'and(hist.bdate=@d)';
  end;
  --Списки на переаттестацию
  if @sender = lower('aRepClListRecalc')
  begin
    set @filter_sql = @filter_sql + 'and(hist.edate=@de)';
  end;
  --Списки без СНИЛСов
  if @sender = lower('aRepClListNoNpss')
  begin
    set @addition_sql = @addition_sql + N' inner join (select regn
														 from fam 
														where (id_rel=1)and(ISNULL(npss,'''')='''')
													  ) tFam
											  on cl.regn=tFam.regn ';
    set @filter_sql   = @filter_sql + 'and(hist.bdate<=@d)and(hist.edate>@d)';
  end;
  
  set @sql = replace(
			 replace(@sql,
				 '%ADDITIONAL%',@addition_sql)
				,'%FILTER%',@filter_sql);

  insert into @result
  exec sp_executesql @sql
					,N'@d smalldatetime, @de smalldatetime, @dist int, @office int'
					,@d
					,@de
					,@dist
					,@office
  
  select * from @result
END
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

