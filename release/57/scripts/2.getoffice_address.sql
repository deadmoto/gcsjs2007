use [Subsidy]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sazhaev Ignat
-- Create date: 09/12/2011
-- =============================================
ALTER FUNCTION [dbo].[getoffice_address]
(
	@dist   int
   ,@office int
   ,@tel   int
   ,@cover nvarchar(2) = ''
)
RETURNS nvarchar(255)
AS
BEGIN
	declare @adr nvarchar(255);

	if @office = -1 
    begin 
	  set @adr = ''
    end
	else
    begin
	  set @adr = (select left(@cover,1) + o.adr + case @tel when 1 then ', тел.' + o.tel else '' end + right(@cover,1)
					from office o
				   where o.id_office = @office and o.id_dist = @dist);
	end;

	return rtrim(ltrim(@adr));
END
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

