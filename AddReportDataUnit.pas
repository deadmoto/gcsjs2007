unit AddReportDataUnit;

interface

uses
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type

  TRepFiles = (rSolut, rSolutb, rSolute, rUvedom, rUvedomo);
  TRepList  = set of TRepFiles;

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
    GroupBox4: TGroupBox;
    Edit6:     TEdit;
    Panel1:    TPanel;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    Edit5:     TEdit;
    GroupBox5: TGroupBox;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RepType: TRepFiles;
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
  if (Edit6.Text <> '') then
    Form1.ARepData.zipCode := Edit6.Text;
  if (Edit7.Text <> '') then
    Form1.ARepData.StartDate := Edit7.Text;
  if CheckBox1.Checked = False then
    if (Edit5.Text <> '') then
      Form1.ARepData.spec2 := Edit5.Text;
  Form1.ARepData.insp := CheckBox1.Checked;
  Close;
end;

procedure TAddReportDataFrm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    GroupBox3.Enabled := False;
    Edit5.Text := '';
  end
  else
    GroupBox3.Enabled := True;
end;

procedure TAddReportDataFrm.FormShow(Sender: TObject);

  procedure VisibleAll;
  begin
    GroupBox1.Enabled := True;
    GroupBox2.Enabled := True;
    GroupBox4.Enabled := True;
    GroupBox5.Enabled := True;
    Panel1.Enabled := True;
  end;

begin
  case RepType of
    rSolut:
    begin
      VisibleAll();
      GroupBox5.Enabled := False;
    end;

    rSolutb:
    begin
      VisibleAll();
      GroupBox4.Enabled := False;
    end;

    rSolute:
    begin
      VisibleAll();
    end;

    rUvedomo:
    begin
      VisibleAll();
      GroupBox1.Enabled := False;
      GroupBox4.Enabled := False;
      GroupBox5.Enabled := False;
    end;
  end;
end;

end.
