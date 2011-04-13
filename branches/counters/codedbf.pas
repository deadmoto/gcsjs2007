unit codedbf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm41 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form41: TForm41;

implementation

uses main, dbf;

{$R *.dfm}

procedure TForm41.FormShow(Sender: TObject);
begin
  if MainForm.codedbf=OEM then
    RadioButton2.Checked := true
  else
    RadioButton1.Checked := true;
end;

procedure TForm41.Button1Click(Sender: TObject);
begin
  if RadioButton2.Checked then
    MainForm.codedbf := OEM
  else
    MainForm.codedbf := ANSI;
  Close;
end;

end.
