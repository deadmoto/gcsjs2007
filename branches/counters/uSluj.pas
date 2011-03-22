unit uSluj;

interface

uses
  Classes,
  Controls,
  DateUtils,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TSlujMode = (mSum, mDetail);

type
  TSlujFrm = class(TForm)
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
  SlujFrm: TSlujFrm;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TSlujFrm.FillSlujGrid;
var
  i: integer;
begin
  Button1.Enabled := True;
  with DModule do
  begin
    Query1.Close;
    case mode of
      mDetail:
      begin
        Query1.SQL.Text := ('SELECT Sluj.sdate, Sluj.regn, Cl.fio, Sluj.sub AS sluj_sum, Sub.sub AS Expr1, Serv.nameserv AS nameserv' + #13 +
          'FROM Sluj INNER JOIN' + #13 +
          'Cl ON Sluj.regn = Cl.regn INNER JOIN' + #13 +
          'Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service INNER JOIN' + #13 +
          'Serv ON Sub.service = Serv.id_serv' + #13 +
          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104) AND Cl.id_dist=:dist)' + #13 +
          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, Sub.sub, Serv.nameserv, Sluj.sub' + #13 +
          'ORDER BY Cl.fio');
      end;
      mSum:
      begin
        Query1.SQL.Text := ('SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS Expr1' + #13 +
          'FROM Sluj INNER JOIN' + #13 +
          'Cl ON Sluj.regn = Cl.regn INNER JOIN' + #13 +
          'Sub ON Sluj.sdate = Sub.sdate ' + #13 +
          'AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service' + #13 +
          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104) AND Cl.id_dist=:dist)' + #13 +
          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio' + #13 +
          'ORDER BY Cl.fio');
      end;
    end;
    Query1.ParamByName('rdt').Value := form1.rdt;
    Query1.ParamByName('dist').Value := form1.dist;
    Query1.Open;
    Query1.First;
  end;

  if DModule.Query1.RecordCount > 0 then
  begin
    case mode of
      mDetail:
      begin
        SlujFrm.Width := 670;

        FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
          'ФИО', 'Сумм. служ.', 'Субсидия', 'Услуга'),
          TIntArray.Create(64, 75, 240, 65, 65, 115), DModule.Query1.RecordCount + 1);

        with DModule.Query1 do
          for i := 0 to RecordCount do
          begin
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('Expr1').Value;
            SlujGrid.Cells[5, i + 1] := FieldByName('nameserv').Value;
            DModule.Query1.Next;
          end;

        GroupBox1.Caption := 'Подробно по тарифам:';
      end;

      mSum:
      begin
        SlujFrm.Width := 580;

        FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
          'ФИО', 'Сумм. служ.', 'Субсидия'),
          TIntArray.Create(64, 75, 255, 75, 75), DModule.Query1.RecordCount + 1);

        with DModule.Query1 do
          for i := 0 to RecordCount do
          begin
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('Expr1').Value;
            DModule.Query1.Next;
          end;
        GroupBox1.Caption := 'Общая сумма за месяц:';
      end;
    end;
    cl_regn := SlujGrid.Cells[1, SlujGrid.Row];
  end
  else
  begin
    case mode of
      mDetail:
      begin
      FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
        'ФИО', 'Сумм. служ.', 'Субсидия', 'Услуга'),
        TIntArray.Create(64, 75, 240, 65, 65, 115), 2);
      end;

      mSum:
      begin
      FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
        'ФИО', 'Сумм. служ.', 'Субсидия'),
        TIntArray.Create(64, 75, 255, 75, 75), 2);
      end;
    end;
    SlujGrid.Cells[0, 1] := '';
    SlujGrid.Cells[1, 1] := '';
    SlujGrid.Cells[2, 1] := '';
    SlujGrid.Cells[3, 1] := '';
    SlujGrid.Cells[4, 1] := '';
    Button1.Enabled := False;
    ShowMessage('В текушем месяце нет подобных записей.');
  end;
end;

procedure TSlujFrm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TSlujFrm.Button3Click(Sender: TObject);
begin
  ExportGridToExcel(SlujGrid, Form1.reports_path + 'tmp.xls');
end;

procedure TSlujFrm.SlujGridSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  cl_regn := SlujGrid.Cells[1, arow];
end;

procedure TSlujFrm.Button1Click(Sender: TObject);
begin
  if MessageDlg('Удалить выбранный период?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DModule.Query1.Close;
    DModule.Query1.SQL.Text := 'DELETE FROM Sluj' + #13 +
      'WHERE (sdate = CONVERT(smalldatetime, :rdt, 104)) AND (regn = ' + cl_regn + ')';
    DModule.Query1.ParamByName('rdt').Value := form1.rdt;
    DModule.Query1.ExecSQL;
    FillSlujGrid;
  end;
end;

end.

