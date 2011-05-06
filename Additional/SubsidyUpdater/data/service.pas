unit service;

interface

uses
  SysUtils, Classes, Controls, Forms, ExtActns, Registry, Windows, Dialogs, shellapi;

procedure updateExe(exeName, exeNew: string);
procedure DeleteDir(dir: string);
procedure ExecConsoleApp(CommandLine: ansistring; Output: TStringList; Errors: TStringList);

function DownloadFile(downType: boolean; Source, Dest: string; OnProgress: TDownloadProgressEvent; Log: TStrings): boolean;
function LoadFile(const FileName: TFileName): string;
function getFileList(dir: string): TStringList;
function getConfValue(str: string): variant;
function DosToWin(const S: string): string;
function WinToDos(const S: string): string;

implementation

function DownloadFile(downType: boolean; Source, Dest: string; OnProgress: TDownloadProgressEvent; Log: TStrings): boolean;
begin
  if downType then
  begin
    if FileExists(Source) then
      try
        CopyFile(PChar(Source), PChar(Dest), True);
        Result := True;
      except
        Result := False;
      end
    else
      Result := False;
  end
  else
    with TDownloadURL.Create(Application) do
      try
        URL := Source;
        FileName := Dest;
        OnDownloadProgress := OnProgress;
        try
          ExecuteTarget(nil);
          Result := True;
        except
          Result := False;
        end;
      finally
        Free;
      end;
  if Result then
    Log.Add('Скачивание ' + Source)
  else
    Log.Add('Не удалось скачать ' + Source);
end;

function LoadFile(const FileName: TFileName): string;
begin
  with TFileStream.Create(FileName,
      fmOpenRead or fmShareDenyWrite) do
  begin
    try
      SetLength(Result, Size);
      Read(Pointer(Result)^, Size);
    except
      Result := '';  // Deallocates memory
      Free;
      raise;
    end;
    Free;
  end;
end;

function getFileList(dir: string): TStringList;
var
  sr: tsearchrec;
  tempList: TStringList;
begin
  tempList := TStringList.Create;
  Result := tempList;
  if FindFirst(dir + '\*.*', faAnyFile - faDirectory {- faDirectory - faVolumeId}, sr) = 0 then
  begin
    repeat
      tempList.Add(sr.Name);
    until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
    Result := tempList;
  end;
end;

function getConfValue(str: string): variant;
{*******************************************************************************
    Функция getConfValue возвращает значение переменной в реестре, которое
    соответсвует определенному свойству компонента.
*******************************************************************************}
begin
  with TRegistry.Create do
  begin
    RootKey := System.cardinal($80000001);// HKEY_CURRENT_USER;
    if OpenKey('Software\Subsidy\Config', True) then
      if ValueExists(str) then
        Result := ReadString(str)
      else
        WriteString(str, '0');
  end;
end;

procedure updateExe(exeName, exeNew: string);
var
  iFileName:  string;
  iFileNameBak: string;
  iFileNameR: string;
  //  iLDate, iRDate: TDateTime;
begin
  Sleep(100);
  iFileName := exeName;
  iFileNameBak := iFileName + '.bak';
  if FileExists(iFileNameBak) then
    DeleteFile(PChar(iFileNameBak));
  if FileExists(iFileNameBak + '1') then
    DeleteFile(PChar(iFileNameBak + '1'));
  iFileNameR := exeNew;
  if not FileExists(iFileNameR) then
    Exit;
{  iLDate := FileDateToDateTime(FileAge(iFileName));
  iRDate := FileDateToDateTime(FileAge(iFileNameR));
  if iLDate >= iRDate then
    Exit;                                           }
  if not CopyFile(PChar(iFileNameR), PChar(iFileNameBak), False) then
    Exit;
  Sleep(1000);
  if not MoveFile(PChar(iFileName), PChar(iFileNameBak + '1')) then
    Exit;
  Sleep(100);
  if not MoveFile(PChar(iFileNameBak), PChar(iFileName)) then
    Exit;
  Sleep(100);
  if not MoveFile(PChar(iFileNameBak + '1'), PChar(iFileNameBak)) then
    Exit;
end;

procedure DeleteDir(dir: string);
var
  lpFileOp: TSHFileOpStruct;
begin
  FillChar(lpFileOp, SizeOf(lpFileOp), 0);
  lpFileOp.Wnd := Application.Handle;
  lpFileOp.wFunc := FO_DELETE;
  lpFileOp.pFrom := PChar(dir);
  lpFileOp.fFlags := FOF_NOCONFIRMATION;
  SHFileOperation(lpFileOp);
end;

procedure ExecConsoleApp(CommandLine: ansistring; Output: TStringList; Errors: TStringList);
var
  sa:  TSECURITYATTRIBUTES;
  si:  TSTARTUPINFO;
  pi:  TPROCESSINFORMATION;
  hPipeOutputRead: THANDLE;
  hPipeOutputWrite: THANDLE;
  hPipeErrorsRead: THANDLE;
  hPipeErrorsWrite: THANDLE;
  Res, bTest: boolean;
  env: array[0..100] of char;
  szBuffer: array[0..256] of char;
  dwNumberOfBytesRead: DWORD;
  Stream: TMemoryStream;
begin
  sa.nLength := sizeof(sa);
  sa.bInheritHandle := True;
  sa.lpSecurityDescriptor := nil;
  CreatePipe(hPipeOutputRead, hPipeOutputWrite, @sa, 0);
  CreatePipe(hPipeErrorsRead, hPipeErrorsWrite, @sa, 0);
  ZeroMemory(@env, SizeOf(env));
  ZeroMemory(@si, SizeOf(si));
  ZeroMemory(@pi, SizeOf(pi));
  si.cb := SizeOf(si);
  si.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  si.wShowWindow := SW_HIDE;
  si.hStdInput := 0;
  si.hStdOutput := hPipeOutputWrite;
  si.hStdError := hPipeErrorsWrite;

  (* Remember that if you want to execute an app with no parameters you nil the
     second parameter and use the first, you can also leave it as is with no
     problems.                                                                 *)
  Res := CreateProcess(nil, PChar(CommandLine), nil, nil, True,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, @env, nil, si, pi);

  // Procedure will exit if CreateProcess fail
  if not Res then
  begin
    CloseHandle(hPipeOutputRead);
    CloseHandle(hPipeOutputWrite);
    CloseHandle(hPipeErrorsRead);
    CloseHandle(hPipeErrorsWrite);
    Exit;
  end;
  CloseHandle(hPipeOutputWrite);
  CloseHandle(hPipeErrorsWrite);

  //Read output pipe
  Stream := TMemoryStream.Create;
  try
    while True do
    begin
      bTest := ReadFile(hPipeOutputRead, szBuffer, 256, dwNumberOfBytesRead,
        nil);
      if not bTest then
      begin
        break;
      end;
      Stream.Write(szBuffer, dwNumberOfBytesRead);
    end;
    Stream.Position := 0;
    Output.LoadFromStream(Stream);
    Output.Text := DosToWin(Output.Text);
  finally
    Stream.Free;
  end;

  //Read error pipe
  Stream := TMemoryStream.Create;
  try
    while True do
    begin
      bTest := ReadFile(hPipeErrorsRead, szBuffer, 256, dwNumberOfBytesRead,
        nil);
      if not bTest then
      begin
        break;
      end;
      Stream.Write(szBuffer, dwNumberOfBytesRead);
    end;
    Stream.Position := 0;
    Errors.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;

  WaitForSingleObject(pi.hProcess, INFINITE);
  CloseHandle(pi.hProcess);
  CloseHandle(hPipeOutputRead);
  CloseHandle(hPipeErrorsRead);
end;

function DosToWin(const S: string): string;
  { Конвертирует строку из кодировки DOS в Windows кодировку }
begin
  SetLength(Result, Length(S));
  if Length(S) <> 0 then
    OemToChar(PChar(S), PChar(Result));
end;

function WinToDos(const S: string): string;
  { Конвертирует строку из кодировки Windows в DOS кодировку }
begin
  SetLength(Result, Length(S));
  if Length(S) <> 0 then
    CharToOem(PChar(S), PChar(Result));
end;

end.

