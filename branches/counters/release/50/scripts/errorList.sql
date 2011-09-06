USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[errorList]    Script Date: 06/02/2011 12:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Igant
-- Create date: 20110602
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[errorList] 
	-- Add the parameters for the stored procedure here
	@date char(10), 
	@dist int
AS
BEGIN
	CREATE TABLE #final (fio varchar(50), address varchar(255), nameinsp  varchar(80), bdate smalldatetime, edate smalldatetime, acbank varchar(20), error varchar(255))

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, NULL as acbank, 'Внеплановые клиенты' as error
	FROM Cl INNER JOIN
		Hist ON cl.regn = Hist.regn INNER JOIN
		Insp ON Insp.id_insp = Hist.id_insp AND Cl.id_dist = Insp.id_dist
	WHERE (Hist.id_cert = 3) AND (Hist.bdate = dbo.smalldate(@date)) AND (Cl.id_dist = @dist)
	ORDER BY Cl.fio

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, NULL as acbank, 'Проверить на закрытие дела' as error
	FROM Cl INNER JOIN
		Hist ON cl.regn = Hist.regn INNER JOIN
		Insp ON Insp.id_insp = Hist.id_insp AND Cl.id_dist = Insp.id_dist
	WHERE (Cl.id_dist = @dist) AND (Hist.edate = dbo.smalldate(@date)) AND (CONVERT(integer, Hist.edate - Hist.bdate) < 180)
	ORDER BY Cl.fio

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, NULL as acbank, 'Неправильная аттестация' as error
	FROM Cl INNER JOIN
		Hist ON cl.regn = Hist.regn INNER JOIN
		Insp ON Insp.id_insp = Hist.id_insp AND Cl.id_dist = Insp.id_dist
	WHERE (Cl.id_dist = @dist) AND (Hist.bdate = dbo.smalldate(@date)) AND (Hist.id_cert <> 1)
		 AND (Hist.regn NOT IN
			  (SELECT  Hist.regn
				FROM Hist
				WHERE  Hist.edate = dbo.smalldate(@date)))
	ORDER BY Cl.fio

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, sb2.acbank as acbank, 'Одинаковые персонифицированные счета' as error
	FROM Hist INNER JOIN
	  (SELECT sb1.acbank, COUNT(sb1.regn) AS c
	   FROM  (SELECT  hist.acbank, hist.regn FROM Hist GROUP BY hist.acbank, hist.regn) sb1
	   GROUP BY sb1.acbank) sb2 ON Hist.acbank = sb2.acbank AND sb2.c > 1 INNER JOIN
	  
	  Cl ON Cl.regn = Hist.regn INNER JOIN
	  Insp ON Insp.id_insp = Hist.id_insp 
	WHERE     (Cl.id_dist = @dist) AND (Insp.id_dist = Cl.id_dist) and (Hist.bdate = dbo.smalldate(@date))
	ORDER BY Cl.fio, sb2.acbank

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, Hist.acbank, 'Неправильный слеш в персонифицированном счете(ОПСБ)' as error
	FROM  Cl INNER JOIN
		Hist ON Cl.regn = Hist.regn INNER JOIN
		Insp ON Insp.id_insp = Hist.id_insp AND Cl.id_dist = Insp.id_dist
	WHERE (Cl.id_dist = @dist) AND (Hist.bdate = dbo.smalldate(@date)) AND (PATINDEX('%"+"\\"+"%', RTRIM(Hist.acbank)) > 0)
	ORDER BY Cl.fio

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, NULL as acbank, 'Не введен номер персонифицированного счета (ПСС)' as error
	FROM  Cl INNER JOIN
		  Hist ON Cl.regn = Hist.regn INNER JOIN
		  Insp ON Insp.id_insp = Hist.id_insp
	WHERE     (Insp.id_dist = @dist) AND (Cl.id_dist = Insp.id_dist) AND (Hist.acbank = '') and (Hist.bdate = dbo.smalldate(@date))
	ORDER BY Cl.fio

	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, Hist.acbank, 'Номер персонифицированного счета (ПСС) меньше 20 символов' as error
	FROM  Cl INNER JOIN
		  Hist ON Cl.regn = Hist.regn INNER JOIN
		  Insp ON Insp.id_insp = Hist.id_insp
	WHERE cl.id_dist=@dist and Insp.id_dist=cl.id_dist and hist.Bdate = dbo.smalldate(@date) and Hist.acbank <> ''
	and LEN(hist.acbank) < 20 and hist.id_bank<>78 and hist.id_bank<>79 and hist.id_bank<>83
	ORDER BY Cl.fio


	INSERT INTO #final
	SELECT Cl.fio, dbo.getcl_address(Cl.regn) as address, Insp.nameinsp, Hist.bdate, Hist.edate, NULL as acbank, 'Проверка на уголь, дрова' as error
	FROM Cl INNER JOIN
		Hist ON cl.regn = Hist.regn INNER JOIN
		Insp ON Insp.id_insp = Hist.id_insp AND Cl.id_dist = Insp.id_dist INNER JOIN
		Sub on cl.regn=sub.regn

	WHERE cl.id_dist=@dist  and (insp.id_dist=cl.id_dist)
	and hist.edate>dbo.smalldate(@date) and sub.sdate>hist.bdate and (sub.service=12 or sub.service=13) and sub.sub<>0
	GROUP BY cl.regn,cl.fio,dbo.getcl_address(Cl.regn),hist.bdate,hist.edate,insp.nameinsp
	ORDER BY Cl.fio


	SELECT * FROM #final
END
