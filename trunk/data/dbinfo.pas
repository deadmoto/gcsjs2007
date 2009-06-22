unit dbinfo;

interface

uses
  adodb;

procedure listsqldb(srv,usr,pwd:string);

var
  dblist:array of string;

implementation

procedure listsqldb;
var
  i:integer;
  dbcon:tadoconnection;
  adoq:tadoquery;
begin
  dbcon:=tadoconnection.create(nil);
  adoq:=tadoquery.create(nil);
  dbcon.connectionstring:='Provider=SQLOLEDB.1;'+#13+
                          'Password="'+pwd+'";'+#13+
                          'Persist Security Info=True;'+#13+
                          'User ID='+usr+';'+#13+
                          'Initial Catalog=master;'+#13+
                          'Data Source='+srv+';';
  dbcon.loginprompt:=false;
  adoq.connection:=dbcon;
  adoq.sql.text:='select name from sysdatabases';
  adoq.open;
  setlength(dblist,adoq.recordcount);
  for i:=0 to adoq.recordcount-1 do
    begin
      dblist[i]:=adoq.fieldbyname('name').value;
      adoq.next;
    end;
  adoq.free;
  dbcon.free;
end;

end.
