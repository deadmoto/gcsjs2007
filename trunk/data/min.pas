unit min;

interface

uses
  dbtables;

function getmin(query:tquery;id_min:integer):real;

implementation

function getmin(query:tquery;id_min:integer):real;
begin
  result:=0;
  if id_min<>0 then
    begin
      query.sql.text:='SELECT * FROM LMin'+#13+
                      'WHERE (sdate=(SELECT MAX(sdate) FROM LMin'+#13+
                      'WHERE id_min=:id_min)) AND (id_min=:id_min)';
      query.parambyname('id_min').value:=id_min;
      query.open;
      result:=query.fieldbyname('minim').value;
    end;      
end;

end.
