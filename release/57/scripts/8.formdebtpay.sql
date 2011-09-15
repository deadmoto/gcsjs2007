use [Subsidy]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- author:		Sazhaev Ignat
-- create date: 26/04/2011
-- modify date: 14/09/2011
-- =============================================
ALTER procedure [dbo].[formdebtpay] 
	-- add the parameters for the stored procedure here
	@date varchar(10), 
	@d tinyint
as
begin
	create table #debt_active(id_debt  uniqueidentifier
							 ,regn	   int
							 ,sdate	   smalldatetime
							 ,paused   tinyint
							 ,m_return float
							 ,sumdebt  float
							 ,id_sluj  tinyint
	)
	create table #sluj(sdate	 smalldatetime
				      ,regn		 int
					  ,service   tinyint
					  ,pm		 float
					  ,snpm		 float
					  ,sub		 float
					  ,factminus tinyint
					  ,id_debt   uniqueidentifier
	) 

	--получаем список активных удержаний
	insert into #debt_active
	select dp.id_debt
		  ,debt.regn
		  ,dp.sdate
		  ,dp.paused
		  ,dp.m_return
		  ,debt.sumdebt
		  ,slujtype.id_sluj
	  from debt 
     inner join (select *,row_number() over (partition by id_debt order by sdate desc) as 'rn' from debtpay) dp 
        on debt.id_debt = dp.id_debt and dp.rn = 1
     inner join slujtype 
        on debt.id_sluj = slujtype.id_sluj
	 where (debt.closed = 0) 
       and (paused = 0) 
       and (debt.dist = @d)
       and (debt.regn in (select cl_a.regn from dbo.getcl_active(@date) as cl_a))

	--select * from #debt_active

	delete from sluj 
     where sluj.sdate = dbo.smalldate(@date) 
       and sluj.regn	in (select #debt_active.regn from #debt_active) 
       and sluj.id_debt in (select #debt_active.id_debt from #debt_active)

	declare 
		@curdebt uniqueidentifier
	   ,@curregn int

	declare db_cursor cursor for  
		select #debt_active.id_debt, #debt_active.regn
		from #debt_active

	open db_cursor  
	fetch next from db_cursor into @curdebt, @curregn 

	while @@fetch_status = 0  
	begin
		declare @subsumma   float		--сумма субсидии у клиента c учетом служебной
			   ,@subsumma2  float		--сумма субсидии у клиента
		       ,@slujsumma  float
			   ,@slujsumma2 float
			   ,@nowreturn  float		--было уже погашено по удержанию
			   ,@balance    float		--осталось выплатить
			   ,@debtpay    float		--на удержание в этот раз
			   ,@tmp		float
			   ,@fminus     int			--удержание по фактическим расходам(0/1)
			   ,@id_sluj      int         --вид переплаты(1/2)

		set @subsumma2 = isnull(
							(select dbo.getsub_sum(@curregn, null, dbo.smalldate(@date)))
						 ,0)
		set @slujsumma = isnull((select sum(sluj.sub)
								   from sluj
								  where sluj.sdate=dbo.smalldate(@date)
								    and sluj.regn = @curregn)
						 ,0)

		set @slujsumma2 = isnull((select sum(#sluj.sub)
								    from #sluj
							       where #sluj.sdate = dbo.smalldate(@date)
								     and #sluj.regn	 = @curregn)
						 ,0)

		
		set @subsumma = @subsumma2 - @slujsumma - @slujsumma2 

		set @nowreturn = isnull((select sum(sluj.sub)
								   from sluj
								  where sluj.id_debt = @curdebt
								    and sluj.regn	 = @curregn)
						 ,0)

		set @debtpay = (select #debt_active.sumdebt  from #debt_active where #debt_active.id_debt = @curdebt)
		set @tmp	 = (select #debt_active.m_return from #debt_active where #debt_active.id_debt = @curdebt)
		set @id_sluj   = (select #debt_active.id_sluj  from #debt_active where #debt_active.id_debt = @curdebt)
		set @fminus  = (select factminus from slujtype where id_sluj = @id_sluj)
		set @balance = @debtpay - @nowreturn

		if @debtpay > @subsumma set @debtpay = @subsumma
		if @balance < @debtpay  set @debtpay = @balance
		if @debtpay > @tmp set @debtpay = @tmp
		--данные для добавления удержаний
		insert into #sluj
		select sub.sdate, @curregn, sub.service, 0, 0, round((@debtpay/@subsumma2)*sub.sub,2), @fminus, @curdebt
		  from sub
		 where sub.regn = @curregn and sub.sdate = dbo.smalldate(@date)
		
		--исправляем округление на 1 копейку
		set @tmp = (select sum(#sluj.sub) from #sluj where #sluj.regn = @curregn and #sluj.id_debt = @curdebt)
		if @tmp <> @debtpay
		begin
			update #sluj set #sluj.sub = #sluj.sub + round((@debtpay - @tmp), 2)
			 where #sluj.regn = @curregn 
               and (#sluj.id_debt = @curdebt)
               and #sluj.service = 7
		end
		
		fetch next from db_cursor into @curdebt, @curregn 
	end
	close db_cursor  

	--select * from #debt_active
	select * from #sluj
	--добавляем удержания в базу
    insert into sluj
	select * from #sluj

	--закрываем период с переплатой, если сумма долга = сумме удержания
	open db_cursor  
	fetch next from db_cursor into @curdebt, @curregn 

	while @@fetch_status = 0  
	begin
		set @nowreturn = isnull((select sum(sluj.sub)
								   from sluj
								  where sluj.id_debt=@curdebt
							        and sluj.regn = @curregn)
						 ,0)

		set @debtpay = (select #debt_active.sumdebt from #debt_active where #debt_active.id_debt = @curdebt)

		if @debtpay = round(@nowreturn,2)
		begin
			update debt set closed = 1
						   ,closed_date = dbo.smalldate(@date)
			 where debt.regn	= @curregn
			   and debt.id_debt = @curdebt
		end 
		fetch next from db_cursor into @curdebt, @curregn 
	end
	close db_cursor 
	deallocate db_cursor
end
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

