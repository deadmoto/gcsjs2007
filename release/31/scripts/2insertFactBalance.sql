USE [Subsidy]
--добавление среднего фактического расхода
INSERT INTO FactBalance
SELECT regn, bdate, edate, (sum(factsum)/DATEDIFF(month, bdate, edate)), null
FROM FactSale
GROUP BY regn, bdate, edate
