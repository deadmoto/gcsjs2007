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
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: char);
  private
    { Private declarations }
    procedure WriteConnSettings(Server: string);
  public
    { Public declarations }
    mode: TConMode;//string;
  end;

  TMyThread = class(TThread)
  protected
    procedure Execute; override;
  end;

var
  ConnectionFrm: TConnectionFrm;

implementation

uses
  srvinfo, ODBC_DSN, main, datamodule;

{$R *.dfm}

{ TMyThread }

procedure TMyThread.Execute;
begin
  WinExec(PChar(ParamStr(0)), SW_SHOW);
end;


procedure TConnectionFrm.WriteConnSettings(Server: string);
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('\Software\Subsidy\Connection', True) then
      begin
        WriteString('Server', Server);
      end;
    finally
      CloseKey;
      Free;
    end;
end;

procedure TConnectionFrm.Button1Click(Sender: TObject);
var
  tt: TMyThread;
begin
  if mode = mBug then
  begin
    WriteConnSettings(ComboBox1.Text);

    tt := TMyThread.Create(True);
    tt.FreeOnTerminate := True;
    tt.Resume;

    sleep(100);
    halt;
  end
  else
  begin
    WriteConnSettings(ComboBox1.Text);
    Form1.curServer := ComboBox1.Text;
    DModule.database1.connected := False;

    if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ComboBox1.Text, 'Subsidy', '') then
      ShowMessage('������ ��� �������� DSN ������ SQLSub!');

    DModule.database1.connected := True;

    Form1.OnCreate(self);

    Form1.Show;
    Form1.Update;
    Form1.Reload;

    Close;
  end;
end;


procedure TConnectionFrm.Button2Click(Sender: TObject);
begin
  if mode = mBug then
    halt
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
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('\Software\Subsidy\Connection', True) then
      begin
        ComboBox1.Text := ReadString('Server');
      end;
    finally
      CloseKey;
      Free;
    end;
  ComboBox1.Items.Clear;
  listsqlservers;
  for i := 0 to length(srvlist) - 1 do
    ComboBox1.Items.Add(srvlist[i].srv_name);
end;

end.