unit srvinfo;

interface

uses
  windows;

procedure listsqlservers;

const
  sv_type_sqlserver=$00000004;

function netserverenum(servername:lpwstr;level:dword;var bufptr:pointer;
                       prefmaxlen:integer;var entriesread:dword;
                       var totalentries:dword;servertype:dword;domain:lpwstr;
                       var resume_handle:dword):dword;
         stdcall;external 'netapi32.dll' name 'NetServerEnum';

type
  _srvinfo=packed record
    srv_platform:dword;
    srv_name:lpwstr;
    srv_version_major:dword;
    srv_version_minor:dword;
    srv_type:dword;
    srv_comment:lpwstr;
  end;
  psvrinfo=^_srvinfo;

var
  srvlist:array of psvrinfo;

implementation

procedure listsqlservers;
var
  i,error,hresume,ecount,etotal:dword;
  psrvbuf:pointer;
  pincbuf:psvrinfo;
begin
  psrvbuf:=nil;
  hresume:=0;
  error:=netserverenum(nil,101,psrvbuf,-1,ecount,etotal,sv_type_sqlserver,nil,hresume);
  if error=0 then
  begin
    setlength(srvlist,ecount);
    pincbuf:=psrvbuf;
    for i:=1 to ecount do
    begin
      srvlist[i-1]:=pincbuf;
      inc(pincbuf);
    end;
  end;
end;

end.
