unit SlujUnit;

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
  Grids,
  StdCtrls,
  DateUtils,
  ExtCtrls;

type
  TSlujMode = (mSum, mDetail);

type
  TForm44 = class(TForm)
    FlowPanel1: TFlowPanel;
    Button2:    TButton;
    Button1:    TButton;
    GroupBox1:  TGroupBox;
    SlujGrid:   TStringGrid;
    Button3:    TButton;
    procedure Button2Click(Sender: TObject);
    procedure SlujGridSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cl_regn: string;
    mode:    TSlujMode;
    procedure FillSlujGrid;
  end;

var
  Form44: TForm44;

implementation

uses
  datamodule,
  main,
  service;

{$R *.dfm}


procedure TForm44.FillSlujGrid;
var
  i: integer;
begin
  with DataModule1 do
  begin
    Query1.Close;
    case mode of
      mDetail:
      begin
        Query1.SQL.Text := ('SELECT Sluj.sdate, Sluj.regn, Cl.fio, Sluj.sub AS sluj_sum, Sub.sub AS Expr1, Sub.service, Serv.nameserv AS nameserv' + #13 +
          'FROM Sluj INNER JOIN' + #13 +
          'Cl ON Sluj.regn = Cl.regn INNER JOIN' + #13 +
          'Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service INNER JOIN' + #13 +
          'Serv ON Sub.service = Serv.id_serv' + #13 +
          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104))' + #13 +
          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, Sub.sub, Sub.service, Serv.nameserv, Sluj.sub' + #13 +
          'ORDER BY Cl.fio');
      end;
      mSum:
      begin
        Query1.SQL.Text := ('SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS Expr1' + #13 +
          'FROM Sluj INNER JOIN' + #13 +
          'Cl ON Sluj.regn = Cl.regn INNER JOIN' + #13 +
          'Sub ON Sluj.sdate = Sub.sdate ' + #13 +
          'AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service' + #13 +
          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104))' + #13 +
          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio' + #13 +
          'ORDER BY Cl.fio');
      end;
    end;
    Query1.ParamByName('rdt').Value := form1.rdt;
    Query1.Open;
  end;

  if DataModule1.Query1.RecordCount > 0 then
  begin
    case mode of
      mDetail:
      begin
        Form44.Width := 670;
        with SlujGrid do
        begin
          RowCount := DataModule1.Query1.RecordCount + 1;
          colcount := DataModule1.Query1.FieldCount - 1;
          Cells[0, 0] := '�����';
          Cells[1, 0] := '���. �';
          Cells[2, 0] := '���';
          Cells[3, 0] := '����. ����.';
          Cells[4, 0] := '��������';
          Cells[5, 0] := '������';
          colwidths[1] := 75;
          colwidths[2] := 240;
          colwidths[3] := 65;
          colwidths[4] := 65;
          colwidths[5] := 115;
        end;
        DataModule1.Query1.First;
        with DataModule1.Query1 do
          for i := 0 to RecordCount do
          begin
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('Expr1').Value;
            SlujGrid.Cells[5, i + 1] := FieldByName('nameserv').Value;
            DataModule1.Query1.Next;
          end;
        GroupBox1.Caption := '�������� �� �������:';
      end;
      mSum:
      begin
        Form44.Width := 580;
        with SlujGrid do
        begin
          RowCount := DataModule1.Query1.RecordCount + 1;
          colcount := DataModule1.Query1.FieldCount;
          Cells[0, 0] := '�����';
          Cells[1, 0] := '���. �';
          Cells[2, 0] := '���';
          Cells[3, 0] := '����. ����.';
          Cells[4, 0] := '��������';
          colwidths[0] := 75;
          colwidths[2] := 255;
          colwidths[1] := 75;
          colwidths[3] := 75;
        end;
        DataModule1.Query1.First;
        with DataModule1.Query1 do
          for i := 0 to RecordCount do
          begin
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('Expr1').Value;
            DataModule1.Query1.Next;
          end;
        GroupBox1.Caption := '����� ����� �� �����:';
      end;
    end;
  end
  else
  begin
    ShowMessage('� ������� ������ ��� �������� �������.');
  end;
end;

procedure TForm44.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm44.Button3Click(Sender: TObject);
begin
  ExportGridToExcel(SlujGrid, '1', Form1.reports_path + 'tmp.xls');
end;

procedure TForm44.SlujGridSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  cl_regn := SlujGrid.Cells[1, arow];
end;

procedure TForm44.Button1Click(Sender: TObject);
begin
  if MessageDlg('������� ��������� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DataModule1.Query1.Close;
    DataModule1.Query1.SQL.Text := 'DELETE FROM Sluj' + #13 +
      'WHERE (sdate = CONVERT(smalldatetime, :rdt, 104)) AND (regn = ' + cl_regn + ')';
    DataModule1.Query1.ParamByName('rdt').Value := form1.rdt;
    DataModule1.Query1.ExecSQL;
    FillSlujGrid;
  end;
end;

end.

