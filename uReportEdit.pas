unit uReportEdit;

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
  TReportFiles = class
  strict private
  public
    cRepFiles: array[0..10] of string;
    constructor Create;
  end;

  TReportEditFrm = class(TForm)
    GroupBox1:  TGroupBox;
    ComboBox1:  TComboBox;
    FlowPanel1: TFlowPanel;
    Button1:    TButton;
    Button2:    TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RepFiles: TReportFiles;
  end;

var
  ReportEditFrm: TReportEditFrm;

implementation

uses
  main;

{$R *.dfm}

procedure TReportEditFrm.Button1Click(Sender: TObject);
begin
  winExec(PChar('frxdesigner.exe ' + Form1.reports_path + RepFiles.cRepFiles[ComboBox1.ItemIndex]), SW_NORMAL);
end;

procedure TReportEditFrm.Button2Click(Sender: TObject);
begin
  Close;
end;

{ TReportFiles }

constructor TReportFiles.Create;
begin
  cRepFiles[0] := 'uvedom.fr3';
  cRepFiles[1] := 'uvedomo.fr3';
  cRepFiles[2] := 'karta.fr3';
  cRepFiles[3] := 'vedomost.fr3';
  cRepFiles[4] := 'solut.fr3';
  cRepFiles[5] := 'solutb.fr3';
  cRepFiles[6] := 'solute.fr3';
  cRepFiles[7] := 'nach.fr3';
  cRepFiles[8] := 'svodsub.fr3';
  cRepFiles[9] := 'factsale.fr3';
  cRepFiles[10] := 'mintrudmount.fr3';
end;

procedure TReportEditFrm.FormShow(Sender: TObject);
begin
  RepFiles := TReportFiles.Create;
end;

end.
