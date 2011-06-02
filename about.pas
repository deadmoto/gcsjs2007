unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses HelpUtils;

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
var A: array [0..78] of Char;
begin
  StrPCopy(A, ParamStr(0));
  ProgramIcon.Picture.Icon.Handle := ExtractIcon(HInstance, A, 0);
  Version.Caption:= 'Версия: '+FileVersion(paramstr(0))
end;

procedure TAboutBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close;
end;

procedure TAboutBox.Panel1Click(Sender: TObject);
begin
  close;
end;

end.

