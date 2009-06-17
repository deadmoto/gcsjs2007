unit progress;               

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type
  TAboutBox1 = class(TForm)
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox1: TAboutBox1;

implementation

uses main;

{$R *.dfm}

end.

