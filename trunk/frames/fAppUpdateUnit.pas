unit fAppUpdateUnit;

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
  ExtCtrls,
  StdCtrls,
  IniCheckBox,
  IniLabeledEdit;

type
  TfAppUpdate = class(TFrame)
    Panel1:          TPanel;
    IniLabeledEdit1: TIniLabeledEdit;
    GroupBox1:       TGroupBox;
    IniLabeledEdit3: TIniLabeledEdit;
    IniLabeledEdit2: TIniLabeledEdit;
    Button1: TButton;
    procedure IniLabeledEdit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  ConfigPropertiesUnit, service;

{$R *.dfm}

procedure TfAppUpdate.Button1Click(Sender: TObject);
var
  dir: string;
begin
  dir := SelectDir;
  if dir <> '' then
    IniLabeledEdit1.Text := dir;
end;

procedure TfAppUpdate.IniLabeledEdit1Click(Sender: TObject);
begin
  if ConfigFrm.checkChanges then
  begin
    ConfigFrm.Button2.Enabled := True;
  end
  else
  begin
    ConfigFrm.Button2.Enabled := False;
  end;
end;

end.
