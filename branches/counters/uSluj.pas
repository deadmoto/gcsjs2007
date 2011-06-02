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
  Windows,
  TypInfo;

type
  TSlujMode = (mSum, mDetail, mDebt);

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
    procedure SlujGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    debtcl : array of Variant;
  public
    { Public declarations }
    cl_regn: string;
    mode:    TSlujMode;
    procedure FillSlujFrm;
  end;

var
  SlujFrm: TSlujFrm;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

//id_debt в запросах означает что запись в базе смотриться только по ручному удержанию (занесенному через эту форму)

procedure TSlujFrm.FillSlujFrm;
var
  i, cols: integer;
begin
  cols := 4;
  Button1.Enabled := True;
  with DModule do
  begin
    sqlQuery1.Close;
    sqlQuery1.SQL.Text := 'exec getusluj_query ' + quotedstr(MainForm.rdt) + ', ' +
      IntToStr(MainForm.dist) + ', ' +  quotedstr(GetEnumName(TypeInfo(TSlujMode),Ord(mode)));
//    case mode of
//      mDetail:
//      begin
//        sqlQuery1.SQL.Text := 'exec getusluj_query ' + quotedstr(MainForm.rdt) + ', ' + IntToStr(MainForm.dist) + ', ' +  mode;
//          'SELECT Sluj.sdate, Sluj.regn, Cl.fio, Sluj.sub AS sluj_sum, Sub.sub AS sub_sum, Serv.nameserv AS nameserv'#13#10 +
//          'FROM Sluj INNER JOIN'#13#10 +
//            'Cl ON Sluj.regn = Cl.regn INNER JOIN'#13#10 +
//            'Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service INNER JOIN'#13#10 +
//            'Serv ON Sub.service = Serv.id_serv'#13#10 +
//          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104) AND Cl.id_dist=:dist) and(id_debt is NULL)'#13#10 +
//          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, Sub.sub, Serv.nameserv, Sluj.sub'#13#10 +
//          'ORDER BY Cl.fio';
//      end;
//
//      mSum:
//      begin
//        sqlQuery1.SQL.Text :=
//          'SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS sub_sum'#13#10 +
//          'FROM Sluj INNER JOIN'#13#10 +
//            'Cl ON Sluj.regn = Cl.regn INNER JOIN'#13#10 +
//            'Sub ON Sluj.sdate = Sub.sdate '#13#10 +
//            'AND Sluj.regn = Sub.regn AND Sluj.service = Sub.service'#13#10 +
//          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104) AND Cl.id_dist=:dist) and(id_debt is NULL)'#13#10 +
//          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio'#13#10 +
//          'ORDER BY Cl.fio';
//      end;

//      mDebt:
//      begin
//        sqlQuery1.SQL.Text :=
//          'SELECT Sluj.sdate, Sluj.regn, Cl.fio, SUM(Sluj.sub) AS sluj_sum, SUM(Sub.sub) AS sub_sum, SlujType.namesluj, Sluj.id_debt, dbo.getcl_address(Sluj.regn) as address'#13#10+
//          'FROM Sluj INNER JOIN'#13#10+
//            'Cl ON Sluj.regn = Cl.regn INNER JOIN'#13#10+
//            'Sub ON Sluj.sdate = Sub.sdate AND Sluj.regn = Sub.regn'#13#10+
//              'AND Sluj.service = Sub.service INNER JOIN'#13#10+
//            'Debt ON Sluj.id_debt = Debt.id_debt INNER JOIN'#13#10+
//            'SlujType ON SlujType.id_sluj = Debt.id_sluj'#13#10+
//          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104) AND Cl.id_dist=:dist) and(Sluj.id_debt IS NOT NULL)'#13#10+
//          'GROUP BY Sluj.sdate, Sluj.regn, Cl.fio, SlujType.namesluj, Sluj.id_debt'#13#10+
//          'ORDER BY Cl.fio';
//      end;

//    end;
//    sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
//    SetParam(sqlQuery1.Parameters, 'rdt', MainForm.rdt);
//    SetParam(sqlQuery1.Parameters, 'dist', MainForm.dist);
    sqlQuery1.Open;
    sqlQuery1.First;
  end;

  if DModule.sqlQuery1.RecordCount > 0 then
  begin
    case mode of
      mDetail:
      begin
        inc(cols);
        SlujFrm.Width := 670;

        FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
          'ФИО', 'Сумм. служ.', 'Субсидия', 'Услуга'),
          TIntArray.Create(60, 55, 235, 70, 70, 115), DModule.sqlQuery1.RecordCount + 1);

        with DModule.sqlQuery1 do
          for i := 0 to RecordCount do
          begin
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('sub_sum').Value;
            SlujGrid.Cells[5, i + 1] := FieldByName('nameserv').Value;
            DModule.sqlQuery1.Next;
          end;

        GroupBox1.Caption := 'Подробно по тарифам:';
      end;

      mSum:
      begin
        SlujFrm.Width := 580;

        FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
          'ФИО', 'Сумм. служ.', 'Субсидия'),
          TIntArray.Create(60, 55, 235, 70, 70), DModule.sqlQuery1.RecordCount + 1);

        with DModule.sqlQuery1 do
          for i := 0 to RecordCount do
          begin
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('sub_sum').Value;
            DModule.sqlQuery1.Next;
          end;
        GroupBox1.Caption := 'Общая сумма за месяц:';
      end;

      mDebt:
      begin
        inc(cols);
        SlujFrm.Width := 670;

        FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
          'ФИО', 'Удержание', 'Субсидия', 'Описание', 'Адрес'),
          TIntArray.Create(60, 55, 235, 70, 70, 130, 130), DModule.sqlQuery1.RecordCount + 1);

        SetLength(debtcl, 0);
        with DModule.sqlQuery1 do
          for i := 0 to RecordCount do
          begin
            SetLength(debtcl, Length(debtcl) + 1);
            debtcl[i] := FieldValues['id_debt'];
            SlujGrid.Cells[0, i + 1] := FieldByName('sdate').Value;
            SlujGrid.Cells[1, i + 1] := FieldByName('regn').Value;
            SlujGrid.Cells[2, i + 1] := FieldByName('fio').Value;
            SlujGrid.Cells[3, i + 1] := FieldByName('sluj_sum').Value;
            SlujGrid.Cells[4, i + 1] := FieldByName('sub_sum').Value;
            SlujGrid.Cells[5, i + 1] := FieldByName('namesluj').Value;
            SlujGrid.Cells[6, i + 1] := FieldByName('address').Value;
            DModule.sqlQuery1.Next;
          end;
        GroupBox1.Caption := 'Удержания:';
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

      mDebt:
      begin
          FormerStringGrid(SlujGrid, TStringArray.Create('Месяц', 'Рег. №',
            'ФИО', 'Удержание', 'Субсидия', 'Описание'),
            TIntArray.Create(64, 75, 255, 75, 75, 115), 2);
      end;
    end;

    for i := 0 to cols do
    begin
      SlujGrid.Cells[i, 1] := '';
    end;
    Button1.Enabled := False;
  end;

  if not MainForm.CheckP2 then
    Button1.Enabled := False;
end;

procedure TSlujFrm.FormShow(Sender: TObject);
begin
  FillSlujFrm;
end;

procedure TSlujFrm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TSlujFrm.Button3Click(Sender: TObject);
begin
  ExportGridToExcel(SlujGrid, MainForm.reports_path + 'tmp.xls');
end;

procedure TSlujFrm.SlujGridKeyPress(Sender: TObject; var Key: Char);
var
  s: word;
begin
  //поиск клиента по набору символов
  if (Key in ['а'..'я']) or (Key in ['А'..'Я']) then
  begin
    s := MilliSecondsBetween(Time, LastTime);
    if (s > 1000) then//новый поиск
      searchbuf := Key
    else
    begin
      Dec(ItemIndex);
      searchbuf := searchbuf + Key;
    end;
    LastTime  := Time;
    ItemIndex := SG_Find(SlujGrid, searchbuf, 2);
    if (ItemIndex <> -1) then
      SlujGrid.Row := ItemIndex;
  end;
end;

procedure TSlujFrm.SlujGridSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  cl_regn := SlujGrid.Cells[1, arow];
end;

procedure TSlujFrm.Button1Click(Sender: TObject);
begin
  if MessageDlg('Удалить выбранное?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DModule.sqlQuery1.Close;
    case mode of
      mDebt:
      begin
        DModule.sqlQuery1.SQL.Text :=
          'DELETE FROM Sluj'#13#10 +
          'WHERE (Sluj.sdate = CONVERT(smalldatetime, :rdt, 104)) AND (Sluj.regn = ' + cl_regn + ')and(Sluj.id_debt=:id0);'#13#10 +
          'IF (SELECT Debt.closed FROM Debt WHERE Debt.id_debt = :id1) = 1'#13#10 +
          'BEGIN'#13#10 +
          ' UPDATE Debt SET Debt.closed = 0, Debt.closed_date = 0 WHERE Debt.id_debt = :id2'#13#10 +
          'END';

        SetParam(DModule.sqlQuery1.Parameters, 'rdt', MainForm.rdt);
        SetParam(DModule.sqlQuery1.Parameters, 'id0', debtcl[SlujGrid.Row - 1]);
        SetParam(DModule.sqlQuery1.Parameters, 'id1', debtcl[SlujGrid.Row - 1]);
        SetParam(DModule.sqlQuery1.Parameters, 'id2', debtcl[SlujGrid.Row - 1]);
        DModule.sqlQuery1.ExecSQL;
      end
    else
      begin
        DModule.sqlQuery1.Close;
        DModule.sqlQuery1.SQL.Text :=
          'DELETE FROM Sluj'#13#10 +
          'WHERE (sdate = CONVERT(smalldatetime, :rdt, 104)) AND (regn = ' + cl_regn + ')and(id_debt is NULL);';
        SetParam(DModule.sqlQuery1.Parameters, 'rdt', MainForm.rdt);
        DModule.sqlQuery1.ExecSQL;
      end;
    end;

    FillSlujFrm;
  end;
end;

end.

