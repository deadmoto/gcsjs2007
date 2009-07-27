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
    IniCheckBox3: TIniCheckBox;
    Panel2: TPanel;
    Button1: TButton;
    IniLabeledEdit1: TIniLabeledEdit;
    IniCheckBox4: TIniCheckBox;
    procedure IniCheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

{function SelectDirectory(const Caption: string; const Root: WideString;
 var Directory: string; Options: TSelectDirExtOpts = [sdNewUI]; Parent: TWinControl = nil): Boolean; overload;
 }
implementation

{$R *.dfm}

procedure TfAppProp.Button1Click(Sender: TObject);
var dir: string;
begin
  if SelectDirectory('', '', dir, [sdShowShares, sdNewUI, sdShowFiles, sdValidateDir])
    then IniLabeledEdit1.Text:= dir+'\';
end;

procedure TfAppProp.IniCheckBox3Click(Sender: TObject);
begin
  if IniCheckBox3.Checked then Panel2.Enabled:= TRUE
    else Panel2.Enabled:= FALSE;
end;

end.
