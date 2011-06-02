unit uConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Registry;

type
  TConMode = (nNone, mBug);

type
  TConnectionFrm = class(TForm)
    GroupBox1:  TGroupBox;
    ComboBox1:  TComboBox;
    FlowPanel1: TFlowPanel;
    Button2:    TButton;
    Button1:    TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: char);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mode: TConMode;//string;

    procedure Changed();
  end;



var
  ConnectionFrm: TConnectionFrm;

implementation

uses
  srvinfo, ODBC_DSN, main, datamodule, md5, appregistry, service, MyTypes;

{$R *.dfm}

procedure TConnectionFrm.Button1Click(Sender: TObject);
var
  tt: TMyThread;
begin
//  if trim(LabeledEdit2.Text) = '' then
//  begin
//    MessageDlg('Error! Password can not empty!', mtError, [mbOK], 0);
//    Exit;
//  end;

  WriteRegProperty('User', LabeledEdit1.Text);
  WriteRegProperty('Password', GenMD5Password(LabeledEdit2.Text));
  WriteRegProperty('Server', ComboBox1.Text);

  if (mode = mBug) or (not Assigned(MainForm)) then
  begin
    //DModule.dbfConnection.Connected := False;
    //DModule.sqlConnection.Connected := False;
    //DModule.Database1.Connected := False;

    //sleep(100);

    tt := TMyThread.Create(True);
    tt.FreeOnTerminate := True;
    tt.Resume;

    Halt;
  end
  else
  begin
    if GetConnectionPass(ReadRegProperty('Password')) <> GetConnectionPass(GenMD5Password(LabeledEdit2.Text)) then
    begin
      MessageDlg('Error! Неверный пароль администратора!', mtError, [mbOK], 0);
      Exit;
    end;

    MainForm.curServer := ComboBox1.Text;
    //DModule.Database1.Connected := False;
    DModule.sqlConnection.Connected := False;

    if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ComboBox1.Text, 'Subsidy', ReadRegProperty('User'), ReadRegProperty('Password'), 'База данных программы Subsidy') then
      ShowMessage('Ошибка при создании DSN записи SQLSub!');

    DModule.sqlConnection.ConnectionString := DModule.SetSQLConnectStr(ReadRegProperty('Server'));

    //DModule.Database1.Connected := True;
    DModule.sqlConnection.Connected := True;

    MainForm.OnCreate(self);
    MainForm.LoginMode := lNone;
    MainForm.Show;
    MainForm.Update;
    MainForm.Reload;

    Close;
  end;
end;

procedure TConnectionFrm.Button2Click(Sender: TObject);
begin
  if mode = mBug then
    Application.Terminate
  else
    Close;
end;

procedure TConnectionFrm.Button3Click(Sender: TObject);
begin
  WriteRegProperty('User', LabeledEdit1.Text);
  WriteRegProperty('Password', GenMD5Password(LabeledEdit2.Text));
  WriteRegProperty('Server', ComboBox1.Text);

  Button3.Enabled := False;
end;

procedure TConnectionFrm.Changed();
begin
  Button3.Enabled := True;
end;

procedure TConnectionFrm.ComboBox1Change(Sender: TObject);
begin
  Changed();
end;

procedure TConnectionFrm.ComboBox1KeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    Button1.Click();
end;

procedure TConnectionFrm.FormShow(Sender: TObject);
var
  i: integer;
begin
  ComboBox1.Text := ReadRegProperty('Server');
  LabeledEdit1.Text := ReadRegProperty('User');
  ComboBox1.Items.Clear;
  
  listsqlservers;
  
  for i := 0 to length(srvlist) - 1 do
    ComboBox1.Items.Add(srvlist[i].srv_name);
end;

procedure TConnectionFrm.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then LabeledEdit2.SetFocus;
  Changed();
end;

procedure TConnectionFrm.LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1Click(Sender);
  Changed();
end;

end.
