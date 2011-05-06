unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtActns, StdCtrls, ComCtrls, FileCtrl, ExtCtrls, Registry, SevenZipVCL;

const
  AppName = 'Subsidy.exe';
  releaseDir = 'updates\release\';
  SevenZipExt = '.7Z';
type
  TMainFrm = class(TForm)
    ProgressBar1: TProgressBar;
    Panel1:       TPanel;
    Label1:       TLabel;
    Panel2:       TPanel;
    Memo1:        TMemo;
    ProgressBar2: TProgressBar;
    Label2:       TLabel;
    FlowPanel1:   TFlowPanel;
    Button1:      TButton;
    Button2:      TButton;
    Panel3:       TPanel;
    CheckBox1:    TCheckBox;
    CheckBox2:    TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    SevenZip: TSevenZip;
  public
    updServer, cVersion, locVersion: string;
    verList: TStringList;
    uComplite, localUpdate: boolean;
    procedure ProgressProc(Sender: TDownLoadURL; Progress, ProgressMax: cardinal; StatusCode: TURLDownloadStatus; StatusText: string; var Cancel: boolean);
    function CheckLocVersion: boolean;
    function CopyConfirm(Source, Desk: string): boolean;
    function RenameConfirm(OldName: string; NewName: string): boolean;
  end;

var
  MainFrm: TMainFrm;

implementation

uses
  service, uChangeLog;

{$R *.dfm}


procedure TMainFrm.ProgressProc(Sender: TDownLoadURL; Progress: cardinal; ProgressMax: cardinal; StatusCode: TURLDownloadStatus; StatusText: string; var Cancel: boolean);
begin
  if (progress <> 0) and (progressmax <> 0) then
  begin
    ProgressBar1.Max := integer(progressmax);
    ProgressBar1.Position := integer(Progress);
    application.ProcessMessages;
  end;
end;

function TMainFrm.CopyConfirm(Source, Desk: string): boolean;
begin
  if FileExists(Desk) then
    DeleteFile(Desk)
  else
    try
      CopyFile(PChar(Source), PChar(Desk), True);
      Result := True;
    except
      Result := False;
    end;
end;

function TMainFrm.RenameConfirm(OldName, NewName: string): boolean;
begin
  if FileExists(NewName) then
    DeleteFile(NewName)
  else
    try
      RenameFile(OldName, NewName);
      Result := True;
    except
      Result := False;
    end;
end;

function TMainFrm.CheckLocVersion: boolean;
begin
  with TRegistry.Create do
  begin
    RootKey := HKEY_CURRENT_USER;
    if OpenKey('Software\Subsidy', True) then
      if ValueExists('svnRev') then
      begin
        locVersion := ReadString('svnRev');
        Label1.Caption := 'Текущая версия: ' + locVersion;
      end
      else
        Label1.Caption := 'Текущая версия: нет данных:(';
  end;
end;

procedure TMainFrm.Button1Click(Sender: TObject);
var
  server, protocol: string;
begin
  CheckLocVersion;
  Memo1.Clear;

{$REGION 'CheckDownloadProtocol'}
  if (pos('ftp://', getConfValue('1.Server')) <> 0) then
  begin
    protocol := 'ftp://';
    server := getConfValue('1.Server');
    Delete(server, 1, length(protocol));
    updServer := protocol + getConfValue('1.FtpName') + ':' + getConfValue('1.FtpPasswd') + '@' + server + '/';
  end
  else
  begin
    if (pos('http://', getConfValue('1.Server')) <> 0) then
    begin
      server := getConfValue('1.Server');
      updServer := server + '/';
    end;
    if (pos('\\', getConfValue('1.Server')) <> 0) or (pos(':\', getConfValue('1.Server')) <> 0) then
    begin
      localUpdate := True;
      server := getConfValue('1.Server');
      updServer := server + '\';
    end;
  end;
{$ENDREGION}

  if not DirectoryExists('updates') then
    CreateDir('updates');
  if not DownloadFile(localUpdate, updServer + 'current_version.txt', 'updates\' + 'current_version.txt', ProgressProc, Memo1.Lines) then
    Exit;
  cVersion := LoadFile('updates\' + 'current_version.txt');
  Label2.Caption := 'Версия для обновления: ' + cVersion;
  ProgressBar1.Position := 0;
  Memo1.Lines.Add('-----------------------------------');

  if locVersion = cVersion then
  begin
    Button2.Enabled := False;
    Memo1.Lines.Add('Обновление не требуется');
  end
  else
  if cVersion > locVersion then
  begin
    Button2.Enabled := True;
    if MessageDlg('Обновит до версии ' + cVersion + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Button2.Click;
  end;
end;

procedure TMainFrm.Button2Click(Sender: TObject);
var
  repFiles, scriptFiles, scriptResult, scriptError: TStringList;
  i, tmpLocVersion, tmpcVersion, countV: integer;
  curUpdFile: string;
begin
  CheckLocVersion;

  tmpcVersion := StrToInt(cVersion);
  tmpLocVersion := StrToInt(locVersion);

  verList.Clear;
  uComplite := False;

  try
    SevenZip := TSevenZip.Create(Application);
    SevenZip.ExtractOptions := [ExtractOverwrite];

    if (cVersion <> '') and (locVersion <> cVersion) then
      for countV := 1 to (tmpcVersion - tmpLocVersion) do
      begin
        if not DirectoryExists(releaseDir) then
          ForceDirectories(releaseDir);

        curUpdFile := IntToStr(tmpLocVersion + countV);
        verList.Add(curUpdFile);
        DownloadFile(localUpdate, updServer + 'release/' + curUpdFile + SevenZipExt, releaseDir + curUpdFile + SevenZipExt, ProgressProc, Memo1.Lines);
        ProgressBar2.StepIt;
        sleep(500);

        Memo1.Lines.Add('Распаковка ' + releaseDir + curUpdFile + SevenZipExt);
        SevenZip.SZFileName := releaseDir + curUpdFile + SevenZipExt;
        SevenZip.ExtrBaseDir := releaseDir;
        SevenZip.Extract();
        sleep(500);
        ProgressBar2.StepIt;

        if not DirectoryExists(releaseDir + curUpdFile) then
        begin
          Memo1.Lines.Add('Нет директории ' + releaseDir + curUpdFile + '. Возможно ошибка при распаковки');
          Exit;
        end;

        if FileExists(releaseDir + curUpdFile + '\' + AppName) then
        begin
          Memo1.Lines.Add('Обновление exe файла до ' + curUpdFile);
          UpdateExe(AppName, releaseDir + curUpdFile + '\' + AppName);
        end;
        ProgressBar2.StepIt;
        sleep(500);

        if DirectoryExists(releaseDir + curUpdFile + '\reports') then
        begin
          repFiles := TStringList.Create;
          if getFileList(releaseDir + curUpdFile + '\reports').Count <> 0 then
          begin
            repFiles.Assign(getFileList(releaseDir + curUpdFile + '\reports'));
            if repFiles.Count <> 0 then
              for i := 0 to repFiles.Count - 1 do
              begin
                if FileExists('reports\' + repFiles[i]) then
                  if RenameConfirm('reports\' + repFiles[i], 'reports\' + repFiles[i] + '.bak_' + curUpdFile) then
                    Memo1.Lines.Add('backup ' + repFiles[i])
                  else
                    Memo1.Lines.Add('failed backup ' + repFiles[i]);

                if CopyConfirm(releaseDir + curUpdFile + '\reports\' + repFiles[i], 'reports\' + repFiles[i]) then
                  Memo1.Lines.Add('Копирование нового отчета - ' + repFiles[i])
                else
                  Memo1.Lines.Add('Не удалось скопировать отчет - ' + repFiles[i]);
              end;
          end;
        end;
        ProgressBar2.StepIt;
        sleep(500);

        if CheckBox1.Checked then
          if DirectoryExists(releaseDir + curUpdFile + '\scripts') then
          begin
            scriptFiles := TStringList.Create;
            scriptFiles.Assign(getFileList(releaseDir + curUpdFile + '\scripts'));
            for i := 0 to scriptFiles.Count - 1 do
            begin
              scriptResult := TStringList.Create;
              scriptError  := TStringList.Create;
              Memo1.Lines.Add('Выполнение ' + releaseDir + curUpdFile + '\scripts\' + scriptFiles[i]);
              ExecConsoleApp('osql -H localhost -d Subsidy -U sa -P -i ' + releaseDir + curUpdFile + '\scripts\' + scriptFiles[i], scriptResult, scriptError);
              Memo1.Lines.Add('Результат выполнения: ' + scriptResult.Text);
              scriptResult.Free;
              scriptError.Free;
            end;
            ProgressBar2.StepIt;
            sleep(500);
          end;

        if CheckBox2.Checked then
        begin
          if DeleteFile(releaseDir + curUpdFile + SevenZipExt) then
            Memo1.Lines.Add('Удаление ' + releaseDir + curUpdFile + SevenZipExt)
          else
            Memo1.Lines.Add('Ошибка при удалении ' + releaseDir + curUpdFile + SevenZipExt);
          ProgressBar2.StepIt;
          sleep(500);
        end;

        Memo1.Lines.Add('-----------------------------------');
        uComplite := True;
      end;
  except
    uComplite := False;
    ProgressBar1.Position := 0;
    ProgressBar2.Position := 0;
  end;
  if uComplite then
  begin
    Memo1.Lines.Add('Обновление данных в реестре');
    with TRegistry.Create do
    begin
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('Software\Subsidy', True) then
        WriteString('svnRev', curUpdFile);
    end;

    Memo1.Lines.Add('Обновление завершено');
    ProgressBar1.Position := 0;
    ProgressBar2.Position := 0;
    CheckLocVersion;
    Button2.Enabled := False;
    if MessageDlg('Показать изменеия в релизах?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ChangeLogFrm := TChangeLogFrm.Create(MainFrm);
      ChangeLogFrm.ShowModal;
      ChangeLogFrm.Free;
    end;
  end;

end;

procedure TMainFrm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    ProgressBar2.Max := ProgressBar2.Max + 10
  else
    ProgressBar2.Max := ProgressBar2.Max - 10;
end;

procedure TMainFrm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    ProgressBar2.Max := ProgressBar2.Max + 10
  else
    ProgressBar2.Max := ProgressBar2.Max - 10;
end;

procedure TMainFrm.FormShow(Sender: TObject);
begin
  CheckLocVersion;
  cVersion := '';
  uComplite := False;
  VerList := TStringList.Create;
end;

end.
