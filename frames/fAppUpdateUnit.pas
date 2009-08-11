unit fAppUpdateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, IniCheckBox, IniLabeledEdit;

type
  TfAppUpdate = class(TFrame)
    Panel1: TPanel;
    IniLabeledEdit1: TIniLabeledEdit;
    GroupBox1: TGroupBox;
    IniLabeledEdit3: TIniLabeledEdit;
    IniLabeledEdit2: TIniLabeledEdit;
    procedure IniLabeledEdit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses ConfigPropertiesUnit;

{$R *.dfm}

procedure TfAppUpdate.IniLabeledEdit1Click(Sender: TObject);
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
