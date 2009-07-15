unit ConnectUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Registry;

type TConMode = (nNone, mBug);

type
  TForm45 = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure WriteConnSettings(Server: string);
  public
    { Public declarations }
    mode: TConMode;//string;
  end;
  TMyThread = class(TThread)
    protected
    procedure execute; override;
  end;
var
  Form45: TForm45;

implementation

  uses srvinfo, ODBC_DSN, main, datamodule;

{$R *.dfm}

{ TMyThread }

procedure TMyThread.execute;
begin
  WinExec(PChar(paramstr(0)),SW_SHOW);
end;


procedure TForm45.WriteConnSettings(Server: string);
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('\Software\Subsidy\Connection', TRUE) then
      begin
        WriteString('Server',Server);
      end;
    finally
      CloseKey;
      Free;
    end;
end;

procedure TForm45.Button1Click(Sender: TObject);
var tt: TMyThread;
begin
if mode=mBug then
begin
  WriteConnSettings(ComboBox1.Text);

  tt:= TMyThread.Create(TRUE);
  tt.FreeOnTerminate:= TRUE;
  tt.Resume;

  sleep(100);
  halt;
end
else
begin
  WriteConnSettings(ComboBox1.Text);

  datamodule1.database1.connected:=FALSE;
  datamodule1.database2.connected:=FALSE;

  if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ComboBox1.Text, 'Subsidy',  '') then
    ShowMessage('Ошибка при создании DSN записи!');

  datamodule1.database1.connected:=true;
  datamodule1.database2.connected:=true;

  Form1.OnCreate(self);
  Form1.Show;
  Form1.Update;
  Form1.Reload;

  close;
end;
end;


procedure TForm45.Button2Click(Sender: TObject);
begin
if mode=mBug then
  halt
else
  close;
end;

procedure TForm45.FormShow(Sender: TObject);
var i: integer;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('\Software\Subsidy\Connection', TRUE) then
      begin
        ComboBox1.Text:= ReadString('Server');
      end;
    finally
      CloseKey;
      Free;
    end;
  ComboBox1.Items.Clear;
  listsqlservers;
  for i:= 0 to length(srvlist) - 1 do
    ComboBox1.Items.Add(srvlist[i].srv_name);
end;

end.
