unit AddReportDataUnit;

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
  StdCtrls;

type
  TAddReportDataFrm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1:     TEdit;
    Label1:    TLabel;
    Edit2:     TEdit;
    Label2:    TLabel;
    Edit3:     TEdit;
    Edit4:     TEdit;
    Label3:    TLabel;
    Button1:   TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddReportDataFrm: TAddReportDataFrm;

implementation

uses
  main;

{$R *.dfm}

procedure TAddReportDataFrm.Button1Click(Sender: TObject);
begin
//  Form1.ARepData:=allocmem(sizeof(PAdditionRepData));
  if (Edit1.Text <> '') then
    Form1.ARepData.Num1 := Edit1.Text;
  if (Edit2.Text <> '') then
    Form1.ARepData.Num2 := Edit2.Text;
  if (Edit3.Text <> '') then
    Form1.ARepData.toNum := Edit3.Text;
  if (Edit4.Text <> '') then
    Form1.ARepData.soluteNum := Edit4.Text;

  Close;
end;

procedure TAddReportDataFrm.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
