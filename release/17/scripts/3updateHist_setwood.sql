--Если убрать коментарии в процедуре, то обновятся только активные клиенты (не рекомендуется так делать,
--могут возникнуть ошибки при пересчете за старые периоды

/*declare @curcl table (regn int)
INSERT INTO @curcl
SELECT     dbo.Cl.regn
FROM         dbo.Cl INNER JOIN
                      dbo.Hist ON dbo.Cl.regn = dbo.Hist.regn INNER JOIN
                          (SELECT     regn, MAX(bdate) AS bdate
                            FROM          hist
                            WHERE      (bdate <= CONVERT(smalldatetime, '01.07.2009', 104))
                            GROUP BY regn) sb ON dbo.Hist.regn = sb.regn AND dbo.Hist.bdate = sb.bdate AND dbo.Hist.bdate <= CONVERT(smalldatetime, '01.07.2009', 104) 
                      AND dbo.Hist.edate > CONVERT(smalldatetime, '01.07.2009', 104)
*/

declare @clwood table (regn int, id_heating int)

INSERT INTO @clwood
SELECT     dbo.Sub.regn, 2 AS id_heating
FROM         dbo.Sub /*INNER JOIN
                      #curcl ON dbo.Sub.regn = #curcl.regn*/
WHERE     (dbo.Sub.service = 12) AND (dbo.Sub.id_service <> 0)
GROUP BY dbo.Sub.regn

update Hist set
id_heating= (select id_heating from @clwood where hist.regn= regn)

UPDATE    Hist
SET              id_heating = 1
WHERE     (id_heating IS NULL)



