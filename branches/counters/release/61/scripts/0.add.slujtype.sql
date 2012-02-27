USE [Subsidy]
delete from SlujType
 where id_sluj > 2

insert into SlujType values (3,'Доплата',0)
insert into SlujType values (4,'Доплата по фактической оплате',1)