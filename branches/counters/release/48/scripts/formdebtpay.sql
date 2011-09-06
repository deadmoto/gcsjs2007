USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[formdebtpay]    Script Date: 05/03/2011 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 26/04/2011
-- =============================================
CREATE PROCEDURE [dbo].[formdebtpay] 
	-- Add the parameters for the stored procedure here
	@date char(10), 
	@d tinyint
AS
BEGIN
	CREATE TABLE #debt_active (id_debt uniqueidentifier, regn int, sdate smalldatetime, paused tinyint, m_return float, sumdebt float, id_sluj tinyint)
	CREATE TABLE #sluj(sdate smalldatetime, regn int, service tinyint, pm float, snpm float, sub float, factminus tinyint, id_debt uniqueidentifier) 

	--получаем список активных удержаний
	INSERT INTO #debt_active
	SELECT     DebtPay.id_debt, Debt.regn, max(DebtPay.sdate) as sdate, DebtPay.paused, DebtPay.m_return, Debt.sumdebt, SlujType.id_sluj
	FROM         Debt INNER JOIN
						  DebtPay ON Debt.id_debt = DebtPay.id_debt INNER JOIN
						  SlujType ON Debt.id_sluj = SlujType.id_sluj
	WHERE (Debt.closed = 0) AND (paused = 0) AND (Debt.regn in (SELECT cl_a.regn FROM dbo.getcl_active(@date) as cl_a)) AND (Debt.dist = @d)
	GROUP BY DebtPay.id_debt, Debt.regn, DebtPay.paused, DebtPay.m_return, Debt.sumdebt, SlujType.id_sluj

	--SELECT * FROM #debt_active

	DELETE FROM Sluj WHERE Sluj.regn in (SELECT #debt_active.regn FROM #debt_active) AND Sluj.sdate = dbo.smalldate(@date) AND Sluj.id_debt in (SELECT #debt_active.id_debt FROM #debt_active)

	DECLARE 
		@curdebt uniqueidentifier,
		@curregn int

	DECLARE db_cursor CURSOR FOR  
		SELECT #debt_active.id_debt, #debt_active.regn
		FROM #debt_active

	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @curdebt, @curregn 

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		DECLARE 
			@subsumma   float,		--сумма субсидии у клиента c учетом служебной
			@subsumma2  float,		--сумма субсидии у клиента
			@slujsumma  float,
			@slujsumma2 float,
			@nowreturn  float,		--было уже погашено по удержанию
			@balance    float,		--осталось выплатить
			@debtpay    float,		--на удержание в этот раз
			@tmp		float

		SET @subsumma2 = (SELECT sum(Sub.sub) FROM sub WHERE Sub.sdate=dbo.smalldate(@date) and Sub.regn = @curregn)
		SET @slujsumma = (SELECT sum(Sluj.sub) FROM sluj WHERE Sluj.sdate=dbo.smalldate(@date) and Sluj.regn = @curregn)
		IF @slujsumma IS NULL SET @slujsumma = 0
		SET @slujsumma2 = (SELECT sum(#sluj.sub) FROM #sluj WHERE #sluj.sdate=dbo.smalldate(@date) and #sluj.regn = @curregn)
		IF @slujsumma2 IS NULL SET @slujsumma2 = 0
		SET @subsumma = @subsumma2 - @slujsumma - @slujsumma2 

		SET @nowreturn = (SELECT sum(Sluj.sub) FROM sluj WHERE Sluj.id_debt=@curdebt and Sluj.regn = @curregn)
		IF @nowreturn IS NULL SET @nowreturn = 0 
		SET @debtpay = (SELECT #debt_active.sumdebt FROM #debt_active WHERE #debt_active.id_debt = @curdebt )
		SET @tmp = (SELECT #debt_active.m_return FROM #debt_active WHERE #debt_active.id_debt = @curdebt )
		SET @balance = @debtpay - @nowreturn

		IF @debtpay > @subsumma SET @debtpay = @subsumma
		IF @balance < @debtpay  SET @debtpay = @balance
		IF @debtpay > @tmp SET @debtpay = @tmp
		--данные для добавления удержаний
		INSERT INTO #sluj
		SELECT Sub.sdate, @curregn, Sub.service, 0, 0, ROUND((@debtpay/@subsumma2)*Sub.sub,2), 0, @curdebt
		FROM Sub
		WHERE Sub.regn = @curregn AND Sub.sdate = dbo.smalldate(@date)
		
		--исправляем округление на 1 копейку
		SET @tmp = (SELECT sum(#sluj.sub) FROM #sluj WHERE #sluj.regn = @curregn AND #sluj.id_debt = @curdebt)
		IF @tmp <> @debtpay
		BEGIN
			UPDATE #sluj SET #sluj.sub = #sluj.sub + ROUND((@debtpay - @tmp), 2)
			WHERE #sluj.regn = @curregn AND (#sluj.id_debt = @curdebt) AND #sluj.service = 7
		END
		
		FETCH NEXT FROM db_cursor INTO @curdebt, @curregn 
	END
	CLOSE db_cursor  

	--SELECT * FROM #debt_active

	--Добавляем удержания в базу
	INSERT INTO Sluj
	SELECT * FROM #sluj

	--закрываем период с переплатой, если сумма долга = сумме удержания
	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @curdebt, @curregn 

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		SET @nowreturn = (SELECT sum(Sluj.sub) FROM sluj WHERE Sluj.id_debt=@curdebt and Sluj.regn = @curregn)
		IF @nowreturn IS NULL SET @nowreturn = 0 
		SET @debtpay = (SELECT #debt_active.sumdebt FROM #debt_active WHERE #debt_active.id_debt = @curdebt)

		IF @debtpay = ROUND(@nowreturn,2)
		BEGIN
			UPDATE Debt SET closed = 1, closed_date = dbo.smalldate(@date)
			WHERE Debt.regn = @curregn AND Debt.id_debt = @curdebt
		END 
		FETCH NEXT FROM db_cursor INTO @curdebt, @curregn 
	END
	CLOSE db_cursor 
	DEALLOCATE db_cursor
END