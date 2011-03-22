unit HelpUtils;

interface

uses SysUtils, Windows, Classes, Graphics, jpeg;

function GetTempDir: string;
function GetSystemDir: string;
function FileVersion(AFileName: string): string;
procedure LoadJPEGFromRes(TheJPEG : string; ThePicture : TPicture);

implementation

function GetTempDir: string;
{*******************************************************************************
    Функция возвращает путь к папки %TEMP%
*******************************************************************************}
var
  Buf: array[0..1023] of char;
begin
  SetString(Result, Buf, GetTempPath(Sizeof(Buf) - 1, Buf));
end;

function GetSystemDir: string;
{*******************************************************************************
    Функция возвращает путь к папки %WINDIR%\system32
*******************************************************************************}
var
  Buf: array[0..1023] of char;
begin
  SetString(Result, Buf, GetSystemDirectory(Buf,Sizeof(Buf) - 1));
end;

function FileVersion(AFileName: string): string;
{*******************************************************************************
    Функция возвращает версию файла
*******************************************************************************}
var
  szName: array[0..255] of char;
  P: Pointer;
  Value: Pointer;
  Len: UINT;
  GetTranslationString: string;
  FFileName: PChar;
  FValid: boolean;
  FSize: DWORD;
  FHandle: DWORD;
  FBuffer: PChar;
begin
  try
    FFileName := StrPCopy(StrAlloc(Length(AFileName) + 1), AFileName);
    FValid := False;
    FSize  := GetFileVersionInfoSize(FFileName, FHandle);
    if FSize > 0 then
      try
        GetMem(FBuffer, FSize);
        FValid := GetFileVersionInfo(FFileName, FHandle, FSize, FBuffer);
      except
        FValid := False;
        raise;
      end;
    Result := '';
    if FValid then
      VerQueryValue(FBuffer, '\VarFileInfo\Translation', p, Len)
    else
      p := nil;
    if P <> nil then
      GetTranslationString := IntToHex(MakeLong(HiWord(longint(P^)),
        LoWord(longint(P^))), 8);
    if FValid then
    begin
      StrPCopy(szName, '\StringFileInfo\' + GetTranslationString +
        '\FileVersion');
      if VerQueryValue(FBuffer, szName, Value, Len) then
        Result := StrPas(PChar(Value));
    end;
  finally
    try
      if FBuffer <> nil then
        FreeMem(FBuffer, FSize);
    except
    end;
    try
      StrDispose(FFileName);
    except
    end;
  end;
end;

procedure LoadJPEGFromRes(TheJPEG : string; ThePicture : TPicture);
var
        ResHandle : THandle;
        MemHandle : THandle;
        MemStream : TMemoryStream;
        ResPtr    : PByte;
        ResSize   : Longint;
        JPEGImage : TJPEGImage;
begin
        ResHandle := FindResource(hInstance, PChar(TheJPEG), 'JPEG');
        MemHandle := LoadResource(hInstance, ResHandle);
        ResPtr    := LockResource(MemHandle);
        MemStream := TMemoryStream.Create;
        JPEGImage := TJPEGImage.Create;
        ResSize := SizeOfResource(hInstance, ResHandle);
        MemStream.SetSize(ResSize);
        MemStream.Write(ResPtr^, ResSize);
        FreeResource(MemHandle);
        MemStream.Seek(0, 0);
        JPEGImage.LoadFromStream(MemStream);
        ThePicture.Assign(JPEGImage);
        JPEGImage.Free;
        MemStream.Free;
end;



end.
