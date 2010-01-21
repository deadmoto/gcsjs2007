unit stat;

interface

uses
  Classes,
  ComCtrls,
  Controls,
  Dialogs,
  ExcelXP,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Math,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TStats = class(TForm)
    TabControl1: TTabControl;
    StringGrid1: TStringGrid;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    GroupBox1:   TGroupBox;
    CheckBox1:   TCheckBox;
    Edit1:       TEdit;
    Label3:      TLabel;
    Edit2:       TEdit;
    Label4:      TLabel;
    Label5:      TLabel;
    GroupBox2:   TGroupBox;
    Label6:      TLabel;
    Label7:      TLabel;
    Label8:      TLabel;
    Edit3:       TEdit;
    Edit4:       TEdit;
    Label1:      TLabel;
    Label9:      TLabel;
    Label11:     TLabel;
    Label12:     TLabel;
    Button4:     TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stats: TStats;

implementation

{$R *.dfm}

uses
  DataModule,
  main,
  service;

procedure TStats.Button1Click(Sender: TObject);
var
  i: integer;
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := ('exec statistic :date, :dist, :selmode, :mode');
    Params.ParamValues['date'] := Form1.rdt;
    Params.ParamValues['dist'] := Form1.dist;

    if CheckBox1.Checked then
      Params.ParamValues['mode'] := 2
    else
      Params.ParamValues['mode'] := 1;

    case TabControl1.TabIndex of
      0:
        Params.ParamValues['selmode'] := 1;
      1:
        Params.ParamValues['selmode'] := 2;
    end;

    Open;
    First;
  end;

  case TabControl1.TabIndex of
    0:
    begin
      FormerStringGrid(StringGrid1, TStringArray.Create('Льгота', 'Кол-во'),
        TIntArray.Create(280, 45), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount - 1 do
      begin
        StringGrid1.Cells[0, i + 1] := Datamodule1.Query1.FieldByName('namepriv').Value;
        StringGrid1.Cells[1, i + 1] := Datamodule1.Query1.FieldByName('kolvo').Value;
        Datamodule1.Query1.Next;
      end;
    end;
    1:
    begin
      FormerStringGrid(StringGrid1, TStringArray.Create('Соц. статус', 'Кол-во'),
        TIntArray.Create(280, 45), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount - 1 do
      begin
        StringGrid1.Cells[0, i + 1] := Datamodule1.Query1.FieldByName('namestatus').Value;
        StringGrid1.Cells[1, i + 1] := Datamodule1.Query1.FieldByName('kolvo').Value;
        Datamodule1.Query1.Next;
      end;
    end;
  end;
end;

procedure TStats.Button2Click(Sender: TObject);
begin
  ExportGridToExcel(StringGrid1, '1', Form1.reports_path + 'stats.xlt');
end;

procedure TStats.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TStats.Button4Click(Sender: TObject);
var
  summ: real;
  i: integer;
begin
  //Субсидия
  summ := 0;
  with DataModule1.Query1 do
  begin
    Close;
    SQL.Text := (
      'SELECT Cl.regn, sb1.summa' + #13 +
      'FROM Cl INNER JOIN' + #13 +
      'Hist ON Cl.regn = Hist.regn INNER JOIN' + #13 +
      '(SELECT regn, MAX(bdate) AS bdate' + #13 +
      'FROM  hist' + #13 +
      'WHERE  (bdate <= convert(smalldatetime, :d, 104))' + #13 +
      'GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate AND Hist.bdate <= convert(smalldatetime, :d, 104)' + #13 +
      'AND Hist.edate > convert(smalldatetime, :d, 104) LEFT JOIN' + #13 +
      '(SELECT regn, sum(Sub.sub) AS summa' + #13 +
      'FROM Sub' + #13 +
      'WHERE Sub.sdate = convert(smalldatetime, :d, 104)' + #13 +
      'GROUP BY Sub.regn' + #13 +
      ') sb1 ON sb1.regn = cl.regn' + #13 +
      'WHERE Cl.id_dist = :idd AND sb1.summa >= :limsub1 AND sb1.summa <= :limsub2'
      );
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('idd').Value := Form1.dist;
    ParamByName('limsub1').Value := Edit3.Text;
    ParamByName('limsub2').Value := Edit4.Text;
    Open;
    First;
    for i := 1 to RecordCount do
    begin
      summ := summ + FieldByName('summa').Value;
      Next;
    end;
  end;
  Label11.Caption := IntToStr(DataModule1.Query1.RecordCount);
  if DataModule1.Query1.RecordCount = 0 then
    Label12.Caption := '0'
  else
    Label12.Caption := FloatToStr(RoundTo(summ / StrToFloat(Label11.Caption), -2));

  //Доход
  with DataModule1.Query1 do
  begin
    Close;
    SQL.Text := (
      'SELECT Cl.regn , hist.income' + #13 +
      'FROM Cl INNER JOIN' + #13 +
      'Hist ON Cl.regn = Hist.regn INNER JOIN' + #13 +
      '(SELECT regn, MAX(bdate) AS bdate' + #13 +
      'FROM  hist' + #13 +
      'WHERE  (bdate <= convert(smalldatetime, :d, 104))' + #13 +
      'GROUP BY regn) sb ON Hist.regn = sb.regn AND Hist.bdate = sb.bdate AND Hist.bdate <= convert(smalldatetime, :d, 104)' + #13 +
      'AND Hist.edate > convert(smalldatetime, :d, 104)' + #13 +
      'WHERE Cl.id_dist = :idd AND hist.income >= :inclim1 AND hist.income <= :inclim2'
      );
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('idd').Value := Form1.dist;
    ParamByName('inclim1').Value := Edit1.Text;
    ParamByName('inclim2').Value := Edit2.Text;
    Open;
    First;
  end;
  Label9.Caption := IntToStr(DataModule1.Query1.RecordCount);
end;

procedure TStats.Edit1Exit(Sender: TObject);
begin
  ReplacePoint(TEdit(Sender).Text);
end;

end.
