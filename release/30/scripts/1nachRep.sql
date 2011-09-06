if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nachRep]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[nachRep]
GO

CREATE TABLE [dbo].[nachRep] (
	[sdate] [smalldatetime] NULL ,
	[dist] [smallint] NULL ,
	[fond] [smallint] NULL ,
	[mng] [smallint] NULL ,
	[num] [smallint] NULL ,
	[cont] [float] NULL ,
	[rep] [float] NULL ,
	[cold] [float] NULL ,
	[hot] [float] NULL ,
	[canal] [float] NULL ,
	[heat] [float] NULL ,
	[gas] [float] NULL ,
	[el] [float] NULL ,
	[wood] [float] NULL ,
	[coal] [float] NULL ,
	[sumall] [float] NULL ,
	[conts] [float] NULL ,
	[reps] [float] NULL ,
	[colds] [float] NULL ,
	[hots] [float] NULL ,
	[canals] [float] NULL ,
	[heats] [float] NULL ,
	[gass] [float] NULL ,
	[els] [float] NULL ,
	[woods] [float] NULL ,
	[coals] [float] NULL ,
	[sumalls] [float] NULL 
) ON [PRIMARY]
GO

