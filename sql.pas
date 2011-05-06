unit SQL;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Grids,
  DBGrids,
  DB,
  DBTables,
//  FileCtrl,
  ComCtrls,
  shellapi, StrUtils ,ExtCtrls;

type
  TSQLExecForm = class(TForm)
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    TabControl1: TTabControl;
    GroupBox1:   TGroupBox;
    Memo1:       TMemo;
    Button1:     TButton;
    Button2:     TButton;
    Button4:     TButton;
    Button3:     TButton;
    Button5:     TButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
    path: string;//���� �� ���������
    function GetDosOutput(const CommandLine: string): string;
  public
    { Public declarations }
  end;

var
  SQLExecForm: TSQLExecForm;

implementation

uses
  appregistry,
  datamodule,
  main,
  service,
  dbf,
  wincontrols,
  HelpUtils;

{$R *.dfm}

procedure TSQLExecForm.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ��������� ������, ������� ������ ������������� � Memo1.
  ���� ������ ���� ��� �������� ��������� ������, �� �������� ��������������.
*******************************************************************************}
begin
  if Memo1.Lines.Count <> 0 then
    if TabControl1.TabIndex <> 2 then
    try
      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Text := Memo1.Text;

        case TabControl1.TabIndex of
          0:
          begin
            Open;
          end;
          1:
          begin
            ExecSQL;
            ShowMessage('������ ��������');
          end;
        end;
      end;
    except
      DModule.sqlQuery1.Close;
      ShowMessage('������ �������� ������!');
    end
    else
    begin
      Memo2.Clear;
      Memo1.Lines.SaveToFile(GetTempDir + 'temp.sql');
      Memo2.Text := GetDosOutput(format('sqlcmd -s%s -dSubsidy -U%s -P%s -i "%s"', [ReadRegProperty('Server'), ReadRegProperty('User'),
        GetConnectionPass(ReadRegProperty('Password')), GetTempDir + 'temp.sql']));

      DeleteFile(GetTempDir + 'temp.sql');

    end
  else
    ShowMessage('������� ������!');
end;

procedure TSQLExecForm.Button2Click(Sender: TObject);
{*******************************************************************************
  ��������� Button2Click ������� Memo1 � ������� ��������� �������.
********************************************************************************}
begin
  Memo1.Clear;
  DModule.sqlQuery1.Close;
end;

procedure TSQLExecForm.Button4Click(Sender: TObject);
{*******************************************************************************
  ��������� Button4Click ��������� ������� ���������� ������� � ���� DBase 4.0
  untitled1.dbf � ��������� ���������� ANSI ��� OEM, �� ��������� ANSI.
  ���� ��������� ������� �������, �� �������� �� ����������.
*******************************************************************************}
var
  i: integer;
begin
  SaveDialog1.Filter := 'dBase files(*.dbf)|*.dbf|��� �����(*.*)|*.*';

  if not SaveDialog1.Execute then Exit;

  with DModule do
  begin
    if Dbf1.Active then
      Dbf1.Close;
    if not sqlQuery1.IsEmpty then
    begin
      //DBGrid1.DataSource := '';
      
      //�������� �������
      for i := 0 to sqlQuery1.FieldCount - 1 do
        Dbf1.AddFieldDefs(GetName(sqlQuery1.Fields[i]), GetType(sqlQuery1.Fields[i]),
          GetSize(sqlQuery1.Fields[i]), GetPrec(sqlQuery1.Fields[i]));
      Dbf1.TableName := SaveDialog1.FileName;// path + 'untitled1.dbf';
      Dbf1.CreateTable;
      Dbf1.CodePage := MainForm.codedbf;
      //������ � ��� ������
      while not sqlQuery1.EOF do
      begin
        Dbf1.Append;
        for i := 1 to sqlQuery1.FieldCount do
          EditField(sqlQuery1.Fields[i - 1].AsString, DBF1.CodePage, i);
        Dbf1.Post;
        sqlQuery1.Next;
      end;
      Dbf1.Close;
      sqlQuery1.Close;
    end
    else
      ShowMessage('��� �������� � dbf ��������� ��������� ��������� �������!');
  end;
end;

procedure TSQLExecForm.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� sqlQuery1, ������� ������������ ��� ������
  � ���� unit. ����� ��������������� ������� ��������� ��� �����.
*******************************************************************************}
var
  rl, el: THandle;
  Layouts: array[0..7] of THandle;
  c, i: integer;
begin
  //������� ��������
  c := GetKeyboardLayoutList(High(Layouts) + 1, Layouts);
  for i := 0 to c - 1 do
  begin
    if LoWord(Layouts[i]) and $FF = Lang_Russian then
      rl := Layouts[i];
    if LoWord(Layouts[i]) and $FF = Lang_English then
      el := Layouts[i];
  end;
  if rl <> 0 then
    ActivateKeyboardLayout(rl, 0);
  DModule.sqlQuery1.Close;

  if not Assigned(MainForm) then
  begin
    DModule.dbfConnection.Connected := False;
    DModule.DataBase1.Connected := False;
    Application.Terminate;
  end;
end;

procedure TSQLExecForm.FormShow(Sender: TObject);
{*******************************************************************************
  ��������� FormShow ������������ ������� OnShow �����. ��������������� ����������
  ��������� ��� ����� �������, ���� �� ���������, ���� ����� ��������� �����
  ������� � ������ ��� ����� ���������, � ����� ���� � ��������, � ������� �����������
  ��������� �������� � dbf.
*******************************************************************************}
var
  rl, el: THandle;
  Layouts: array[0..7] of THandle;
  c, i: integer;

  adm_pass: string;
begin
  if not Assigned(MainForm) then
  begin
    adm_pass := InputPassword('������� ������ ��������������!', '������:', '');
    adm_pass := GenMD5Password(adm_pass);
    adm_pass := GetConnectionPass(adm_pass);
    if GetConnectionPass(ReadRegProperty('Password')) <> adm_pass then
    begin
      for i := 0 to GroupBox1.ControlCount - 1 do
        if (GroupBox1.Controls[i] is TButton) then
            TButton(GroupBox1.Controls[i] as TButton).Enabled := False;
      MessageDlg('Error! �������� ������ ��������������!', mtError, [mbOK], 0);
    end;
  end;

  DModule.sqlQuery1.Close;
  //���������� ���������
  c := GetKeyboardLayoutList(High(Layouts) + 1, Layouts);
  for i := 0 to c - 1 do
  begin
    if LoWord(Layouts[i]) and $FF = Lang_Russian then
      rl := Layouts[i];
    if LoWord(Layouts[i]) and $FF = Lang_English then
      el := Layouts[i];
  end;
  if el <> 0 then
    ActivateKeyboardLayout(el, 0);
  path := ExtractFilePath(Application.ExeName) + 'querys\';
  OpenDialog1.InitialDir := path;
  SaveDialog1.InitialDir := path;
  path := ExtractFilePath(Application.ExeName) + 'out\';
end;

procedure TSQLExecForm.TabControl1Change(Sender: TObject);
begin
  Memo2.Visible := False;
  DBGrid1.Visible := False;
  Button4.Visible := False;
  Memo2.Clear;
  case TabControl1.TabIndex of
    0:
    begin
      DBGrid1.Visible := True;
      Button4.Visible := True;
    end;
    1:
    begin
      Memo2.Visible := True;
    end;
    2:
    begin
      Memo2.Visible := True;
    end;
  end;
end;

procedure TSQLExecForm.Button3Click(Sender: TObject);
{*******************************************************************************
  ��������� Button3Click ��������� ����� ������� � ���� � ������, ��������� �
  ����������� �������.
*******************************************************************************}
begin
  SaveDialog1.Filter := '����� ��������(*.sql)|*.sql|��������� �����(*.txt)|*.txt|��� �����(*.*)|*.*';
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TSQLExecForm.Button5Click(Sender: TObject);
{*******************************************************************************
  ��������� Button3Click ��������� ����� ������� �� ���� � ������, ��������� �
  ����������� �������.
*******************************************************************************}
begin
  if OpenDialog1.Execute then
    begin
      Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    end;
end;

function TSQLExecForm.GetDosOutput(const CommandLine: string): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of Char;
  BytesRead: Cardinal;
  WorkDir, Line: string;
begin
  Application.ProcessMessages;
  with SA do
  begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  // �����?� ���� ��� ��������������� ������������ ������
  CreatePipe(StdOutPipeRead, // ���������� ������
    StdOutPipeWrite, // ���������� ������
    @SA, // ��������� ������������
    0 // ���������� ���� �������� ��� ����� - 0 �� ���������
    );
  try
    // �����?� �������� �������, ��������� StdOutPipeWrite � �������� ������������ ������,
    // � ��� �� ���������, ����� �� �� ����������� �� ������.
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // ����������� ���� �� ��������������
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
 
    // ��������� ���������� �� ��������� ������
    WorkDir := ExtractFilePath(CommandLine);
    WasOK := CreateProcess(nil, PChar(CommandLine), nil, nil, True, 0, nil, PChar('C:\'), SI, PI);
 
    // ������, ����� ���������� �������, ��� ������������ ��������� ������.
    // ��� �� �����, ����� ��������� ��������� ������ ��� ������.
    CloseHandle(StdOutPipeWrite);
    // ���� ������� ����� ���� ������, �� ����������, ��� ��� �����
    if not WasOK then
      raise Exception.Create('Could not execute command line!')
    else
    try
        // �������� ���� ����� �� ��� ���, ���� DOS-���������� �� ����� ���������
      Line := '';
      repeat
          // ������ ���� �������� (����� ��������� �������� ������� � �������� ������)
        WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);

          // ���� �� ���-������ ��? ��� ������?
        if BytesRead > 0 then
        begin
            // ��������� ����� PChar-��
          Buffer[BytesRead] := #0;
            // ��������� ����� � ����� �����
          Line := Line + Buffer;
        end;
      until not WasOK or (BytesRead = 0);
        // ��?�, ���� ���������� ���������� ����������
      WaitForSingleObject(PI.hProcess, INFINITE);
    finally
        // ��������� ��� ���������� �����������
      CloseHandle(PI.hThread);
      CloseHandle(PI.hProcess);
    end;
  finally
    result := Line;
    CloseHandle(StdOutPipeRead);
  end;
end;

end.
