use [Subsidy]
alter table SlujType add factminus int null
go
update SlujType set factminus=0 where id_sluj=1
update SlujType set factminus=1 where id_sluj=2
go
alter table SlujType alter column factminus int not null