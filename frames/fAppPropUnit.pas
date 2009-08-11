unit fAppPropUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniCheckBox, ExtCtrls, FileCtrl, IniLabeledEdit;

type
  TfAppProp = class(TFrame)
    Panel1: TPanel;
    IniCheckBox1: TIniCheckBox;
    IniCheckBox2: TIniCheckBox;
    IniCheckBox4: TIniCheckBox;
    GroupBox1: TGroupBox;
    IniCheckBox3: TIniCheckBox;
    Panel2: TPanel;
    Button1: TButton;
    IniLabeledEdit1: TIniLabeledEdit;
    IniCheckBox5: TIniCheckBox;
    Panel3: TPanel;
    IniLabeledEdit2: TIniLabeledEdit;
    Button2: TButton;
    IniCheckBox6: TIniCheckBox;
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

uses ConfigPropertiesUnit;

{$R *.dfm}

procedure TfAppProp.Button1Click(Sender: TObject);
var dir: string;
begin
  if SelectDirectory('Select directory', '', dir, [sdShowShares, sdNewUI, sdValidateDir])
    then if (dir[length(dir)]<>'\') then IniLabeledEdit1.Text:= dir+'\'
      else IniLabeledEdit1.Text:= dir;
end;

procedure TfAppProp.Button2Click(Sender: TObject);
var dir: string;
begin
  if SelectDirectory('Select directory', '', dir, [sdShowShares, sdNewUI, sdValidateDir, sdNewFolder])
    then if (dir[length(dir)]<>'\') then IniLabeledEdit2.Text:= dir+'\'
      else IniLabeledEdit2.Text:= dir;
end;

procedure TfAppProp.IniCheckBox3Click(Sender: TObject);
begin
  if IniCheckBox3.Checked then Panel2.Enabled:= TRUE
    else Panel2.Enabled:= FALSE;
  IniCheckBox6Click(self);
end;

procedure TfAppProp.IniCheckBox5Click(Sender: TObject);
begin
  if IniCheckBox5.Checked then Panel3.Enabled:= TRUE
    else Panel3.Enabled:= FALSE;
  IniCheckBox6Click(self);
end;

procedure TfAppProp.IniCheckBox6Click(Sender: TObject);
begin
  if ConfigFrm.checkChanges then begin
    ConfigFrm.Button2.Enabled:= TRUE;
//    ConfigFrm.Button3.Enabled:= TRUE;
  end
    else
    begin
      ConfigFrm.Button2.Enabled:= FALSE;
//      ConfigFrm.Button3.Enabled:= FALSE;
    end;
end;

end.
