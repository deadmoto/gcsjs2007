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
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: char);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    mode: TConMode;//string;
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
//    exit;
//  end;

  WriteRegProperty('User', LabeledEdit1.Text);
  WriteRegProperty('Password', GenMD5Password(LabeledEdit2.Text));
  WriteRegProperty('Server', ComboBox1.Text);
  
  if mode = mBug then
  begin
    tt := TMyThread.Create(True);
    tt.FreeOnTerminate := True;
    tt.Resume;

    sleep(100);

    DModule.dbfConnection.Connected := False;
    DModule.Database1.Connected := False;

    sleep(1000);

    Application.Terminate;
  end
  else
  begin
    Form1.curServer := ComboBox1.Text;
    DModule.Database1.Connected := False;

    if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ComboBox1.Text, 'Subsidy', ReadRegProperty('User'), ReadRegProperty('Password'), 'База данных программы Subsidy') then
      ShowMessage('Ошибка при создании DSN записи SQLSub!');

    DModule.Database1.Connected := True;

    Form1.OnCreate(self);
    Form1.LoginMode := lNone;
    Form1.Show;
    Form1.Update;
    Form1.Reload;

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

procedure TConnectionFrm.ComboBox1KeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    Button1.Click;
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
end;

procedure TConnectionFrm.LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1Click(Sender);
end;

end.
