unit uShade;
 
interface
 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
Forms,
  Dialogs;
 
type
  TShadeForm = class(TForm)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    class function Execute(aHostform: TForm): TForm;
  end;
 
implementation
 
{$R *.dfm}
 
procedure TShadeForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := (Owner as Twincontrol).Handle;
  Params.ExStyle := Params.ExStyle or WS_EX_NOACTIVATE;
end;
 
class function TShadeForm.Execute(aHostform: TForm): TForm;
begin
  Assert(Assigned(aHostform));
  Result := TShadeForm.Create(aHostform);
  Result.BoundsRect := aHostform.BoundsRect;
  ShowWindow(Result.Handle, SW_SHOWNOACTIVATE);
end;
 
end.
