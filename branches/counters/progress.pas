unit progress;               

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, jpeg, dialogs;

type
  TAboutBox1 = class(TForm)
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox1: TAboutBox1;

implementation

uses main, service;

{$R *.dfm}

procedure TAboutBox1.FormCreate(Sender: TObject);
{var
  img: TImage;}
begin
{  if (now > StrToDate('22.12.2009')) and (now < StrToDate('01.01.2010')) then
  begin
    (Sender as TAboutBox1).Height := 548;
    (Sender as TAboutBox1).Width := 561;

    img := TImage.Create(Panel1);
    LoadJPEGFromRes('MYJPEG',img.Picture);
    img.Align := alClient;
    img.Parent := Panel1;
    img.Visible := True;

    Label1.Top := Label1.Top + 100;
    Label2.Top := Label2.Top + 100;
    Label3.Top := Label3.Top + 100;
    ProgressBar1.Top := ProgressBar1.Top + 100;

    img.SendToBack;
  end;}
end;

end.

