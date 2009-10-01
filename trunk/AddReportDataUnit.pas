unit AddReportDataUnit;

interface

uses
  Classes,
  Controls,
  Dialogs,
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
    GroupBox3: TGroupBox;
    Edit5:     TEdit;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    Edit6:     TEdit;
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
    GroupBox1.Visible := True;
    GroupBox2.Visible := True;
    GroupBox3.Visible := True;
    GroupBox4.Visible := True;
    CheckBox1.Visible := True;
  end;

begin
  case RepType of
    rSolut:
    begin
      VisibleAll();
      Edit1.SetFocus;
    end;

    rSolutb:
    begin
      VisibleAll();
      GroupBox3.Visible := False;
      GroupBox4.Visible := False;
      CheckBox1.Visible := False;
      Edit1.SetFocus;
    end;

    rSolute:
    begin
      VisibleAll();
      Edit1.SetFocus;
    end;

    rUvedom:
    begin
      VisibleAll();
      GroupBox1.Visible := False;
      GroupBox2.Visible := False;
      GroupBox4.Visible := False;
      Edit5.SetFocus;
    end;

    rUvedomo:
    begin
      VisibleAll();
      GroupBox1.Visible := False;
      GroupBox4.Visible := False;
      Edit4.SetFocus;
    end;
  end;
end;

end.
