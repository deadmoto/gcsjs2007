unit fAppProp;

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
  IniCheckBox,
  ExtCtrls,
  IniLabeledEdit;

type
  TfAppProp = class(TFrame)
    Panel1:          TPanel;
    IniCheckBox1:    TIniCheckBox;
    IniCheckBox4:    TIniCheckBox;
    GroupBox1:       TGroupBox;
    IniCheckBox3:    TIniCheckBox;
    Panel2:          TPanel;
    Button1:         TButton;
    IniLabeledEdit1: TIniLabeledEdit;
    IniCheckBox5:    TIniCheckBox;
    Panel3:          TPanel;
    IniLabeledEdit2: TIniLabeledEdit;
    Button2:         TButton;
    IniCheckBox7: TIniCheckBox;
    IniCheckBox2: TIniCheckBox;
    procedure IniCheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IniCheckBox5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IniCheckBox6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

uses
  uSettings, WinControls;

{$R *.dfm}

procedure TfAppProp.Button1Click(Sender: TObject);
var
  dir: string;
begin
  dir := SelectDir;
  if dir <> '' then
    IniLabeledEdit1.Text := dir;
end;

procedure TfAppProp.Button2Click(Sender: TObject);
var
  dir: string;
begin
  dir := SelectDir;
  if dir <> '' then
    IniLabeledEdit2.Text := dir;
end;

procedure TfAppProp.IniCheckBox3Click(Sender: TObject);
begin
  if IniCheckBox3.Checked then
    Panel2.Enabled := True
  else
    Panel2.Enabled := False;
  IniCheckBox6Click(self);
end;

procedure TfAppProp.IniCheckBox5Click(Sender: TObject);
begin
  if IniCheckBox5.Checked then
    Panel3.Enabled := True
  else
    Panel3.Enabled := False;
  IniCheckBox6Click(self);
end;

procedure TfAppProp.IniCheckBox6Click(Sender: TObject);
begin
  if SettingsFrm.checkChanges then
  begin
    SettingsFrm.Button2.Enabled := True;
  end
  else
  begin
    SettingsFrm.Button2.Enabled := False;
  end;
end;

end.
