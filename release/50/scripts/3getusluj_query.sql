USE [Subsidy]
GO
/****** Object:  StoredProcedure [dbo].[getusluj_query]    Script Date: 05/31/2011 18:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 20110531
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[getusluj_query] 
	@d varchar(10), 
	@idd int,
	@mode varchar(10)
AS
BEGIN
	IF @mode = 'mDetail' 
	BEGIN 
		SELECT sdate, regn, service, pm, snpm, sub, factminus INTO #cursluj_query_detail FROM sluj WHERE sdate = dbo.smalldate(@d) AND id_debt is NULL

		ALTER TABLE #cursluj_query_detail ADD CONSTRAINT
			PK_CurSluj PRIMARY KEY CLUSTERED 
			(
			sdate,
			regn,
			service
			) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

          SELECT cursluj.sdate, cursluj.regn, Cl.fio, cursluj.sub AS sluj_sum, Sub.sub AS sub_sum, Serv.nameserv AS nameserv
          FROM #cursluj_query_detail as cursluj INNER JOIN
            Cl ON cursluj.regn = Cl.regn INNER JOIN
            Sub ON cursluj.sdate = Sub.sdate AND cursluj.regn = Sub.regn AND cursluj.service = Sub.service INNER JOIN
            Serv ON Sub.service = Serv.id_serv
          WHERE (Cl.id_dist=@idd)
          GROUP BY cursluj.sdate, cursluj.regn, Cl.fio, Sub.sub,cursluj.service, Serv.nameserv, cursluj.sub
          ORDER BY Cl.fio, cursluj.service 
		
		RETURN;
	END
	
	IF @mode = 'mSum' 
	BEGIN
		SELECT sdate, regn, service, pm, snpm, sub, factminus INTO #cursluj_query_sum FROM sluj WHERE sdate = dbo.smalldate(@d) AND id_debt is NULL

		ALTER TABLE #cursluj_query_sum ADD CONSTRAINT
			PK_CurSluj PRIMARY KEY CLUSTERED 
			(
			sdate,
			regn,
			service
			) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

		  SELECT cursluj.sdate, cursluj.regn, Cl.fio, SUM(cursluj.sub) AS sluj_sum, SUM(Sub.sub) AS sub_sum
		  FROM #cursluj_query_sum as cursluj INNER JOIN
			Cl ON cursluj.regn = Cl.regn INNER JOIN
			Sub ON cursluj.sdate = Sub.sdate 
			AND cursluj.regn = Sub.regn AND cursluj.service = Sub.service
		  WHERE (Cl.id_dist=@idd)
		  GROUP BY cursluj.sdate, cursluj.regn, Cl.fio
		  ORDER BY Cl.fio
		
		RETURN;
	END
	
	IF @mode = 'mDebt' 
	BEGIN 
		SELECT sdate, regn, service, pm, snpm, sub, factminus, id_debt INTO #cursluj_query_debt FROM sluj WHERE sdate = dbo.smalldate(@d) AND id_debt is NOT NULL

		ALTER TABLE #cursluj_query_debt ALTER COLUMN id_debt uniqueidentifier NOT NULL
		ALTER TABLE #cursluj_query_debt ADD CONSTRAINT
			PK_CurSlujDebt PRIMARY KEY CLUSTERED 
			(
			sdate,
			regn,
			service,
			id_debt
			) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

		SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS sub_sum, SlujType.namesluj, Sluj.id_debt, dbo.getcl_address(Sluj.regn) as address
		FROM Sluj INNER JOIN
		Cl ON Sluj.regn = Cl.regn INNER JOIN
		Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn
		  AND Sluj.service = Sub.service INNER JOIN
		Debt ON Sluj.id_debt = Debt.id_debt INNER JOIN
		SlujType ON SlujType.id_sluj = Debt.id_sluj
		WHERE (Sluj.sdate = dbo.smalldate(@d) AND Cl.id_dist=@idd) and(Sluj.id_debt IS NOT NULL)
		GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, SlujType.namesluj, Sluj.id_debt
		ORDER BY Cl.fio;
		
		RETURN;
	END

END
