USE [Subsidy]
--проставляем знаечение для лифтов
if object_id('tempdb..#cont') is not null
  DROP TABLE #cont

DECLARE @dist tinyint
SET @dist = 4 --выставляем свой округ

create table #cont (id_cont tinyint, namecont char(120))

insert into #cont
select t1.id_cont, t1.namecont
from (
select id_cont, namecont from cont where ((namecont like '% c%лиф%') or (namecont not like '%без лифт%')) or 
(namecont like '%с лиф%') or ((namecont like '%оборуд%лифт%') and (namecont not like '%не%оборуд%')) or 
((namecont like '%лифт%') and (namecont not like '%необор%лифт%')) or 
((namecont like '%включ%лифт%') and (namecont not like '%не%включ%лифт%')) or 
(namecont not like '%без лифт%') or 
(namecont not like '%кроме%лифт%')
group by id_cont, namecont
) t1
where t1.namecont like '%лифт%' and t1.namecont not like '%без лифт%' and t1.namecont not like '%не%обо%лифт%' and t1.namecont not like '%кроме%лифт%'
order by t1.id_cont

--update house set house.elevator = 0

update house set house.elevator = 1 
where house.id_cont in (select #cont.id_cont from #cont group by #cont.id_cont) and
--так же можно перечислить вручную все id тарифов на содержание жилья, где точно есть лифт, 
--потому что в автоматическом режиме могут быть не точности, нужно проверять!
--для этого закоментируйте строчку выше данной записи и уберите коментарий со строчки ниже данной записи и занесите id_cont
--where house.id_cont in (1,2,3 ???) and
house.id_dist = @dist