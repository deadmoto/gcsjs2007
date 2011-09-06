USE [Subsidy]
--����������� ��������� ��� ������
if object_id('tempdb..#cont') is not null
  DROP TABLE #cont

DECLARE @dist tinyint
SET @dist = 4 --���������� ���� �����

create table #cont (id_cont tinyint, namecont char(120))

insert into #cont
select t1.id_cont, t1.namecont
from (
select id_cont, namecont from cont where ((namecont like '% c%���%') or (namecont not like '%��� ����%')) or 
(namecont like '%� ���%') or ((namecont like '%������%����%') and (namecont not like '%��%������%')) or 
((namecont like '%����%') and (namecont not like '%������%����%')) or 
((namecont like '%�����%����%') and (namecont not like '%��%�����%����%')) or 
(namecont not like '%��� ����%') or 
(namecont not like '%�����%����%')
group by id_cont, namecont
) t1
where t1.namecont like '%����%' and t1.namecont not like '%��� ����%' and t1.namecont not like '%��%���%����%' and t1.namecont not like '%�����%����%'
order by t1.id_cont

--update house set house.elevator = 0

update house set house.elevator = 1 
where house.id_cont in (select #cont.id_cont from #cont group by #cont.id_cont) and
--��� �� ����� ����������� ������� ��� id ������� �� ���������� �����, ��� ����� ���� ����, 
--������ ��� � �������������� ������ ����� ���� �� ��������, ����� ���������!
--��� ����� �������������� ������� ���� ������ ������ � ������� ���������� �� ������� ���� ������ ������ � �������� id_cont
--where house.id_cont in (1,2,3 ???) and
house.id_dist = @dist