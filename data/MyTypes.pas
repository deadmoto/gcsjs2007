unit MyTypes;

interface

uses
  Classes,
  Math,
  SysUtils,
  Windows;

type
  TStringArray = array of string;
  TIntArray    = array of integer;

  TMyThread = class(TThread)
  protected
    procedure Execute; override;
  end;

//function FlToStr(n: real): string;
function BoolToStr(const Value: boolean): string;

implementation

 //function FlToStr(n: real): string;
 //{*******************************************************************************
//  Функция FlToStr переводит число в строку. Число, представленное строкой, должно
 //  содержать не более 2 знаков после запятой.
 //*******************************************************************************}
 //var
 //  p: integer;
 //begin
 //  Result := FloatToStr(RoundTo(n, -2));
 //  p := Pos(',', Result);
 //  if p <> 0 then
 //  begin
 //    if p = Length(Result) - 1 then//125.2
 //      Result := Result + '0';
 //  end
 //  else//125
 //    Result := Result + ',00';
 //end;

function BoolToStr(const Value: boolean): string;
const
  Values: array [boolean] of string = ('Нет', 'Да');
begin
  Result := Values[Value];
end;

{ TMyThread }

procedure TMyThread.Execute;
begin
  WinExec(PChar(ParamStr(0)), SW_SHOW);//перезапуск приложения
end;

end.
