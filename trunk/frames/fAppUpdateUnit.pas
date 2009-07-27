unit fAppUpdateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, IniCheckBox;

type
  TfAppUpdate = class(TFrame)
    Panel1: TPanel;
    IniCheckBox1: TIniCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
