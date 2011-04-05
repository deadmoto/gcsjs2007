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
  ComCtrls;

type
  TSQLExecForm = class(TForm)
    DBGrid1:     TDBGrid;
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
  public
    { Public declarations }
  end;

var
  SQLExecForm: TSQLExecForm;

implementation

uses
  datamodule,
  main,
  service,
  dbf;

{$R *.dfm}

procedure TSQLExecForm.Button1Click(Sender: TObject);
{*******************************************************************************
  ��������� Button1Click ��������� ������, ������� ������ ������������� � Memo1.
  ���� ������ ���� ��� �������� ��������� ������, �� �������� ��������������.
*******************************************************************************}
begin
  if Memo1.Lines.Count <> 0 then
    try
      with DModule.Query1 do
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
      DModule.Query1.Close;
      ShowMessage('������ �������� ������!');
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
  DModule.Query1.Close;
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
    if not Query1.IsEmpty then
    begin
      //DBGrid1.DataSource := '';
      
      //�������� �������
      for i := 0 to Query1.FieldCount - 1 do
        Dbf1.AddFieldDefs(GetName(Query1.Fields[i]), GetType(Query1.Fields[i]),
          GetSize(Query1.Fields[i]), GetPrec(Query1.Fields[i]));
      Dbf1.TableName := SaveDialog1.FileName;// path + 'untitled1.dbf';
      Dbf1.CreateTable;
      Dbf1.CodePage := Form1.codedbf;
      //������ � ��� ������
      while not Query1.EOF do
      begin
        Dbf1.Append;
        for i := 1 to Query1.FieldCount do
          EditField(Query1.Fields[i - 1].AsString, DBF1.CodePage, i);
        Dbf1.Post;
        Query1.Next;
      end;
      Dbf1.Close;
      Query1.Close;
      //DBGrid1.DataSource := DataSource1;
    end
    else
      ShowMessage('��� �������� � dbf ��������� ��������� ��������� �������!');
  end;
end;

procedure TSQLExecForm.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  ��������� FormClose ��������� Query1, ������� ������������ ��� ������
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
  DModule.Query1.Close;

  if not Assigned(Form1) then
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
begin
  DModule.Query1.Close;
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
  case TabControl1.TabIndex of
    0:
    begin
      Button4.Visible := True;
    end;
    1:
    begin
      Button4.Visible := False;
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

end.
