unit connection_module;

interface

  uses SysUtils, Windows, Dialogs, Registry;

  const
    CONN_KEY = '\Software\Subsidy\Connection';

  procedure WriteRegProperty(_property, _value: string);
  function CheckRegProperty(_property: string; autoadd: boolean = False): boolean;
  function ReadRegProperty(_property: string): string;
  
  function GenMD5Password(pass:string): string;
  function GetConnectionPass(pass: string): string;
implementation

uses md5, wincontrols, VBScript_RegExp_55_TLB;

function CheckRegProperty(_property: string; autoadd: boolean = False): boolean;

  function AddProperty: boolean;
  var
    _value: string;
  begin
    if _property = 'Password' then
    begin
      _value := InputPassword('Input Proporty Value', _property, '');
      _value := GenMD5Password(_value);
    end
    else
      _value := InputBox('Input Proporty Value', _property, '');
    WriteRegProperty(_property, _value);
    Result := True;
  end;

begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(CONN_KEY, True) then
        if ValueExists(_property) then
          Result := True
        else
          Result := False;
    finally
      CloseKey;
      Free;
    end;
    if (autoadd) and (Result = False) then  Result := True and AddProperty;
end;

procedure WriteRegProperty(_property, _value: string);
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(CONN_KEY, True) then
      begin
        WriteString(_property, _value);
      end;
    finally
      CloseKey;
      Free;
    end;
end;

function ReadRegProperty(_property: string): string;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(CONN_KEY, True) then
      begin
        Result := ReadString(_property);
      end;
    finally
      CloseKey;
      Free;
    end;
end;

function GetConnectionPass(pass: string): string;
var
  re : TRegExp;
  tmp : string;
begin
  re := TRegExp.Create(nil); //создаЄм класс
  try
    re.Pattern := '[0-9]'; //записываем регул€рное выражение
    re.Global := True;
    tmp := re.Replace(pass, '');
    Result := tmp;
  finally
    re.Free;
  end;
end;

function GenMD5Password(pass:string): string;
begin
  Result := MD5DigestToStr(MD5String(pass));
end;

end.
