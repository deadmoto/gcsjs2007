unit fstruct;

interface

uses
  ADODB,
  DB,
  Classes,
  Controls,
  service,
  Variants;

type
  T2DString = array of array of string;

procedure ExportInsp(path: string; dis: integer; all: boolean);
procedure ExportTarif(path, dt, t: string; dis: integer);
procedure ExportCl(path, dt: string; dis: integer);
procedure ExportHist(path, dt: string; dis: integer);
procedure ExportFam(path, dt: string; dis: integer);
procedure ExportSub(path, dt: string; dis: integer);
procedure ExportCounters(path, dt: string; dis: integer);
procedure ExportSluj(path, dt: string; dis: integer);
procedure ExportMin(path, dt: string);
procedure ExportHouse(path: string; dis: integer);
procedure ExportMng(path: string; dis: integer);
procedure ExportDiff(path, t: string);
procedure ExportRStnd(path, dt: string);
procedure ExportStr(path: string);
procedure ExportFact(path: string; dis: integer);
procedure ExportClm(path, dt: string; dis: integer);
procedure ExportHistm(path, dt: string; dis: integer);
procedure ExportFamm(path, dt: string; dis: integer);
procedure ExportDebt(path: string; dis: integer);
procedure ExportOffice(path: string; dis: integer);

procedure ImportInsp(path: string; dis: integer);
procedure ImportBank(path: string);
procedure ImportTarif(path, t: string; dis: integer; norm: boolean = False);
procedure ImportTarifb(path, t: string; dis: integer);
procedure ImportEl(path: string; dis: integer);
procedure ImportCl(path: string; dis: integer);
procedure ImportHist(path: string; dis: integer);
procedure ImportFam(path: string; dis: integer);
procedure ImportSub(path: string; dis: integer);
procedure ImportCounters(path: string; dis: integer);
procedure ImportSluj(path: string; dis: integer);
procedure ImportMin(path: string);
procedure ImportStat(path: string);
procedure ImportHouse(path: string; dis: integer);
procedure ImportStr(path: string);
procedure ImportMng(path: string; dis: integer);
procedure ImportFond(path: string);
procedure ImportDiff(path, t: string);
procedure ImportCharge(path: string);
procedure ImportDist(path: string);
procedure ImportNorm(path: string);
procedure ImportPriv(path: string);
procedure ImportRStnd(path: string);
procedure ImportFact(path: string; dis: integer);
procedure ImportDebt(path: string; dis: integer);
procedure ImportOffice(path: string; dis: integer);

procedure FillTable2(path, fname: string);

function GetData(nam: string; var f: T2DString): boolean;
function DbfDataType(ftype: TFieldType): string;
//function ConvertChar(s: array of char): string;

implementation

uses
  datamodule,
  SysUtils,
  dateutils,
  Dialogs,
  main,
  dbf;

procedure ExportCl(path, dt: string; dis: integer);
{ процедура экспорта клиентов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM cl');
    SQL.Add('WHERE regn in (SELECT regn FROM hist');
    SQL.Add('WHERE');
    if dt <> '' then
    begin
      SQL.Add('(bdate<=CONVERT(smalldatetime, :d, 104))and');
      SQL.Add('(edate>=CONVERT(smalldatetime, :d, 104))and');
    end;
    SQL.Add('(id_dist = :dist))');
    Parameters.ParseSQL(SQL.Text, True);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'cl' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportHist(path, dt: string; dis: integer);
{ процедура экспорта истории изменения клиентов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hist');
    SQL.Add('WHERE (id_dist = :dist)');
    if dt <> '' then
    begin
      SQL.Add('and (bdate<=CONVERT(smalldatetime, :d, 104))');
      SQL.Add('and(edate>=CONVERT(smalldatetime, :d, 104))');
    end;
    Parameters.ParseSQL(SQL.Text, True);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'hist' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportFam(path, dt: string; dis: integer);
{ процедура экспорта  семей }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM fam');
    SQL.Add('WHERE regn in (SELECT regn FROM hist');
    SQL.Add('WHERE');
    if dt <> '' then
    begin
      SQL.Add('(bdate<=CONVERT(smalldatetime, :d, 104))and');
      SQL.Add('(edate>CONVERT(smalldatetime, :d, 104))and');
    end;
    SQL.Add('(id_dist = :dist))');
    Parameters.ParseSQL(SQL.Text, True);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'fam' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportClm(path, dt: string; dis: integer);
{ процедура экспорта клиентов согласно дате последнего изменения записи клиента }
var
  d: TDate;
begin
  d := StrToDate(dt);
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM cl');
    SQL.Add('WHERE change>=:d1 and change<=:d2 and id_dist = :dist');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    //    SetParam(Parameters, 'd2', DateToStr(EncodeDate(YearOf(d),MonthOf(d),16)));
    SetParam(Parameters, 'd2', EncodeDate(YearOf(d), MonthOf(d), 19));
    d := IncMonth(d, -1);
    //    SetParam(Parameters, 'd1', DateToStr(EncodeDate(YearOf(d),MonthOf(d),15)));
    SetParam(Parameters, 'd1', EncodeDate(YearOf(d), MonthOf(d), 20));
    Open;
    FillTable(path, 'cl' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportHistm(path, dt: string; dis: integer);
{ процедура экспорта истории изменения клиентов согласно дате последнего изменения записи клиента }
var
  d: TDate;
begin
  d := StrToDate(dt);
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hist');
    SQL.Add('WHERE regn in (SELECT regn FROM cl');
    SQL.Add('WHERE change>=:d1 and change<=:d2 and id_dist = :dist)');
    SQL.Add('and (bdate<=CONVERT(smalldatetime, :dt, 104))');
    SQL.Add('and(edate>=CONVERT(smalldatetime, :dt, 104))');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dt', dt);
    SetParam(Parameters, 'dist', dis);
    SetParam(Parameters, 'd2', EncodeDate(YearOf(d), MonthOf(d), 19));
    d := IncMonth(d, -1);
    SetParam(Parameters, 'd1', EncodeDate(YearOf(d), MonthOf(d), 20));
    //SetParam(Parameters, 'dist', dis);
    //    SetParam(Parameters, 'd2', DateToStr(EncodeDate(YearOf(d),MonthOf(d),16)));
    //SetParam(Parameters, 'd2', EncodeDate(YearOf(d), MonthOf(d), 19));
    //d := IncMonth(d, -1);
    //    SetParam(Parameters, 'd1', DateToStr(EncodeDate(YearOf(d),MonthOf(d),15)));
    //SetParam(Parameters, 'd1', EncodeDate(YearOf(d), MonthOf(d), 20));
    Open;
    FillTable(path, 'hist' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportFamm(path, dt: string; dis: integer);
{ процедура экспорта  семей  согласно дате последнего изменения записи клиента }
var
  d: TDate;
begin
  d := StrToDate(dt);
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM fam');
    SQL.Add('WHERE regn in (SELECT regn FROM cl');
    SQL.Add('WHERE change>=:d1 and change<=:d2 and id_dist = :dist)');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    //    SetParam(Parameters, 'd2', DateToStr(EncodeDate(YearOf(d),MonthOf(d),16)));
    SetParam(Parameters, 'd2', EncodeDate(YearOf(d), MonthOf(d), 19));
    d := IncMonth(d, -1);
    //    SetParam(Parameters, 'd1', DateToStr(EncodeDate(YearOf(d),MonthOf(d),15)));
    SetParam(Parameters, 'd1', EncodeDate(YearOf(d), MonthOf(d), 20));
    Open;
    FillTable(path, 'fam' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportSub(path, dt: string; dis: integer);
{ процедура экспорта субсидий }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT sub.* FROM sub inner join cl on sub.regn=cl.regn');
    SQL.Add('WHERE (cl.id_dist = :dist)');
    if dt <> '' then
    begin
      SQL.Add('and(sub.sdate = convert(smalldatetime,:d,104))');
    end;
    Parameters.ParseSQL(SQL.Text, True);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'sub' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportCounters(path, dt: string; dis: integer);
{ процедура экспорта счетчиков }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT counters.* FROM counters inner join cl on counters.regn=cl.regn');
    SQL.Add('WHERE (cl.id_dist = :dist)');
    if dt <> '' then
    begin
      SQL.Add('and(counters.sdate = convert(smalldatetime,:d,104))');
    end;
    Parameters.ParseSQL(SQL.Text, True);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'counters' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportSluj(path, dt: string; dis: integer);
{ процедура экспорта служебных }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT sluj.* FROM sluj inner join cl on sluj.regn=cl.regn');
    SQL.Add('WHERE (cl.id_dist = :dist)');
    if dt <> '' then
    begin
      SQL.Add('and(sluj.sdate = convert(smalldatetime,:d,104))');
    end;
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);
    Open;
    FillTable2(path, 'sluj' + IntToStr(dis));
  end;
end;

procedure ExportTarif(path, dt, t: string; dis: integer);
{ Процедура экспорта тарифов без бойлера }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + t);
    SQL.Add('WHERE (id_dist = :dist)');
    if dt <> '' then
    begin
      SQL.Add('and(sdate = convert(smalldatetime,:d,104))');
    end;
    Parameters.ParseSQL(SQL.Text, True);
    if dt <> '' then
      SetParam(Parameters, 'd', dt);    
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, t + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportDebt(path: string; dis: integer);
{ процедура экспорта вычетов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT Debt.* FROM Debt'#13#10 +
      'WHERE dist=:dist';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable2(path, 'debt' + IntToStr(dis));
  end;
  //-------
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT DebtPay.* FROM DebtPay INNER JOIN'#13#10 +
        'Debt ON Debt.id_debt = DebtPay.id_debt'#13#10 +
      'WHERE Debt.dist=:dist';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable2(path, 'debtpay' + IntToStr(dis));
  end;
end;

procedure ExportOffice(path: string; dis: integer);
{ процедура экспорта участков }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT Office.* FROM Office'#13#10 +
      'WHERE Office.id_dist=:dist';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable2(path, 'office' + IntToStr(dis));
  end;
end;

procedure ExportRStnd(path, dt: string);
{ процедура экспорта региональных стандартов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM rstnd');
    if dt <> '' then
    begin
      SQL.Add('WHERE (sdate = convert(smalldatetime,:d,104))');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'd', dt);
    end;
    Open;
    FillTable(path, 'rstnd', MainForm.codedbf);
  end;
end;

procedure ExportMin(path, dt: string);
{ процедура экспорта прожиточных минимумов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM lmin');
    if dt <> '' then
    begin
      SQL.Add('WHERE (sdate = convert(smalldatetime,:d,104))');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'd', dt);
    end;
    Open;
    FillTable(path, 'lmin', MainForm.codedbf);
  end;
end;

procedure ExportInsp(path: string; dis: integer; all: boolean);
{ процедура экспорта инспекторов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM insp');
    SQL.Add('WHERE id_dist = :id');
    if not all then
      SQL.Add('and status=1');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', dis);
    Open;
    FillTable(path, 'insp' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportHouse(path: string; dis: integer);
{ процедура экспорта домов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM house');
    SQL.Add('WHERE id_dist = :id');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', dis);
    Open;
    FillTable(path, 'house' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportMng(path: string; dis: integer);
{ процедура экспорта распорядителей }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM mng');
    SQL.Add('WHERE id_dist = :dist');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'mng' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ExportStr(path: string);
{ процедура экспорта улиц }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM strt');
    SQL.Add('WHERE status=1');
    Open;
    FillTable(path, 'strt', MainForm.codedbf);
  end;
end;

procedure ExportDiff(path, t: string);
{ процедура экспорта данных из таблиц control, rel, serv, cert,own, settl,charge,
  norm,priv,dist,fond,stat,bank
}
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + t);
    Open;
    FillTable(path, t, MainForm.codedbf);
  end;
end;

procedure ExportFact(path: string; dis: integer);
{ процедура экспорта фактических расходов }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM FactSale');
    SQL.Add('WHERE id_dist=:dist');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'factsale' + IntToStr(dis), MainForm.codedbf);
  end;
  //-------
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM FactBalance');
    SQL.Add('WHERE id_dist=:dist');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'dist', dis);
    Open;
    FillTable(path, 'factbalance' + IntToStr(dis), MainForm.codedbf);
  end;
end;

procedure ImportTarif(path, t: string; dis: integer; norm: boolean);
{ процедура импорта тарифов без бойлера }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO ' + t);
    if norm then
      SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif,:norm)')
    else
      SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif)');
  end;
  if FileExists(path + t + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + t + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM ' + t);
        sqlQuery2.SQL.Add('WHERE (id_' + t + '=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'idd', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'id', f[i][2]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'idd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'd', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'tarif', StrToFloat(f[i][4]));
        if norm then
          SetParam(sqlQuery1.Parameters, 'norm', StrToFloat(f[i][5]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + t + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportTarifb(path, t: string; dis: integer);
{ процедура импорта тарифов с бойлера}
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO ' + t);
    SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif1,:tarif2,:norm)');
  end;
  if FileExists(path + t + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + t + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM ' + t);
        sqlQuery2.SQL.Add('WHERE (id_' + t + '=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][2]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'idd', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'idd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'd', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'tarif1', StrToFloat(f[i][4]));
        SetParam(sqlQuery1.Parameters, 'tarif2', StrToFloat(f[i][5]));
        SetParam(sqlQuery1.Parameters, 'norm', StrToFloat(f[i][6]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + t + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportEl(path: string; dis: integer);
{ процедура импорта тарифов на э/э}
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO el');
    SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:plate,:tarif1,:tarif2,:tarif3)');
  end;
  if FileExists(path + 'el' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'el' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM el');
        sqlQuery2.SQL.Add('WHERE (id_el=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][2]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'idd', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'idd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'd', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'plate', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'tarif1', StrToFloat(f[i][4]));
        SetParam(sqlQuery1.Parameters, 'tarif2', StrToFloat(f[i][5]));
        SetParam(sqlQuery1.Parameters, 'tarif3', StrToFloat(f[i][6]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'el' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportFact(path: string; dis: integer);
{ процедура импорта Фактических }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO FactSale');
    SQL.Add('VALUES (convert(smalldatetime,:d,104),:id,convert(smalldatetime,:bdate,104), convert(smalldatetime,:edate,104),:sub,:factsum,:dis)');
  end;
  if FileExists(path + 'factsale' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'factsale' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM FactSale');
        sqlQuery2.SQL.Add('WHERE (regn =:id) and (sdate=convert(smalldatetime,:d,104))');
        sqlQuery2.SQL.Add('and(id_dist=:dis)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'dis', f[i][6]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'bdate', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'edate', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'sub', StrToFloat(f[i][4]));
        SetParam(sqlQuery1.Parameters, 'factsum', StrToFloat(f[i][5]));
        SetParam(sqlQuery1.Parameters, 'dis', StrToFloat(f[i][6]));
        try
          sqlQuery1.ExecSQL;
        except on E : Exception do
          ShowMessage(E.Message);
        end;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'factsale' + IntToStr(dis) + '.dbf не найден!');
  //------
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO FactBalance');
    SQL.Add('VALUES (:id,convert(smalldatetime,:bdate,104), convert(smalldatetime,:edate,104),:balance,:dolg,:dis)');
  end;
  if FileExists(path + 'factbalance' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'factbalance' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM FactBalance');
        sqlQuery2.SQL.Add('WHERE (regn =:id)and(bdate=convert(smalldatetime,:bdate,104))');
        sqlQuery2.SQL.Add('and(id_dist=:dis)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'bdate', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'dis', f[i][5]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'bdate', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'edate', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'balance', StrToFloat(f[i][3]));
        if f[i][4] = '' then
          begin
            SetParam(sqlQuery1.Parameters, 'dolg', Null);
            sqlQuery1.Parameters.ParamByName('dolg').DataType := ftFloat;
          end
        else
          SetParam(sqlQuery1.Parameters, 'dolg', StrToFloat(f[i][4]));

        SetParam(sqlQuery1.Parameters, 'dis', StrToFloat(f[i][5]));
        try
          sqlQuery1.ExecSQL;
        except on E : Exception do
          ShowMessage(E.Message);
        end;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'factbalance' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportRStnd(path: string);
{ процедура импорта региональных стандартов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO rstnd');
    SQL.Add('VALUES (convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3,:v4,:v5,:v6,:v7)');
  end;
  if FileExists(path + 'rstnd.dbf') then
  begin
    GetData(path + 'rstnd.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM rstnd');
        sqlQuery2.SQL.Add('WHERE (id_stnd=:id)and(sdate=convert(smalldatetime,:d,104))');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'v1', StrToFloat(f[i][3]));
        SetParam(sqlQuery1.Parameters, 'v2', StrToFloat(f[i][4]));
        SetParam(sqlQuery1.Parameters, 'v3', StrToFloat(f[i][5]));
        SetParam(sqlQuery1.Parameters, 'v4', StrToFloat(f[i][6]));
        SetParam(sqlQuery1.Parameters, 'v5', StrToFloat(f[i][7]));
        SetParam(sqlQuery1.Parameters, 'v6', StrToFloat(f[i][8]));
        SetParam(sqlQuery1.Parameters, 'v7', StrToFloat(f[i][9]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'rstnd.dbf не найден!');
end;

procedure ImportMin(path: string);
{ процедура импорта проижиточных минимумов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO lmin');
    SQL.Add('VALUES (convert(smalldatetime,:d,104), :id, :name, :minim)');
  end;
  if FileExists(path + 'lmin.dbf') then
  begin
    GetData(path + 'lmin.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM lmin');
        sqlQuery2.SQL.Add('WHERE (id_min=:id)and(sdate=convert(smalldatetime,:d,104))');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'minim', StrToFloat(f[i][3]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'lmin.dbf не найден!');
end;

procedure ImportCl(path: string; dis: integer);
{ процедура импорта клиентов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO cl');
    SQL.Add('VALUES (:id,:fio,CONVERT(smalldatetime, :rdate, 104),');
    SQL.Add('CONVERT(smalldatetime, :change, 104),:dist, :str, :nh,');
    SQL.Add(':cp,:apart, :tel, :lsquare, :square,:stnd,:settl,:boil,:declar,:mail)');
  end;
  if FileExists(path + 'cl' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'cl' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM cl');
        sqlQuery2.SQL.Add('WHERE (regn = :id)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'fio', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'rdate', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'change', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'dist', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'str', f[i][5]);
        SetParam(sqlQuery1.Parameters, 'nh', f[i][6]);
        SetParam(sqlQuery1.Parameters, 'cp', f[i][7]);
        sqlQuery1.Parameters.ParamByName('cp').DataType := ftString;
        SetParam(sqlQuery1.Parameters, 'apart', f[i][8]);
        sqlQuery1.Parameters.ParamByName('apart').DataType := ftString;
        SetParam(sqlQuery1.Parameters, 'tel', f[i][9]);
        sqlQuery1.Parameters.ParamByName('tel').DataType := ftString;
        SetParam(sqlQuery1.Parameters, 'lsquare', StrToFloat(f[i][10]));
        SetParam(sqlQuery1.Parameters, 'square', StrToFloat(f[i][11]));
        SetParam(sqlQuery1.Parameters, 'stnd', f[i][12]);
        SetParam(sqlQuery1.Parameters, 'settl', f[i][13]);
        SetParam(sqlQuery1.Parameters, 'boil', f[i][14]);
        SetParam(sqlQuery1.Parameters, 'declar', StrToDate((f[i][15])));
        SetParam(sqlQuery1.Parameters, 'mail', f[i][16]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'cl' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportHist(path: string; dis: integer);
{ процедура импорта истории изменения клиентов}
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO hist');
    SQL.Add('VALUES (:id,CONVERT(smalldatetime,:bdate,104),');
    SQL.Add('CONVERT(smalldatetime,:edate,104),:mcount,:quanpriv,:pmin,:income,');
    SQL.Add(':insp,:dist,:control,:reason,:own,:manager,:fond,:cert,:bank,:acbank,');
    SQL.Add(':calc,:mdd,:heating,:rmcount,:indrstnd,:indrstndval)');
  end;
  if FileExists(path + 'hist' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'hist' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM hist');
        sqlQuery2.SQL.Add('WHERE (regn = :id)and(bdate>=convert(smalldatetime,:sd,104)');
        sqlQuery2.SQL.Add(' or edate > convert(smalldatetime, :sd, 104))');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'sd', f[i][1]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'bdate', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'edate', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'mcount', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'quanpriv', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'pmin', StrToFloat(f[i][5]));
        SetParam(sqlQuery1.Parameters, 'income', StrToFloat(f[i][6]));
        SetParam(sqlQuery1.Parameters, 'insp', f[i][7]);
        SetParam(sqlQuery1.Parameters, 'dist', f[i][8]);
        SetParam(sqlQuery1.Parameters, 'control', f[i][9]);
        SetParam(sqlQuery1.Parameters, 'reason', f[i][10]);
        SetParam(sqlQuery1.Parameters, 'own', f[i][11]);
        SetParam(sqlQuery1.Parameters, 'manager', f[i][12]);
        SetParam(sqlQuery1.Parameters, 'fond', f[i][13]);
        SetParam(sqlQuery1.Parameters, 'cert', f[i][14]);
        SetParam(sqlQuery1.Parameters, 'bank', f[i][15]);
        SetParam(sqlQuery1.Parameters, 'acbank', f[i][16]);
        SetParam(sqlQuery1.Parameters, 'calc', f[i][17]);
        SetParam(sqlQuery1.Parameters, 'mdd', f[i][18]);
        SetParam(sqlQuery1.Parameters, 'heating', f[i][19]);
        SetParam(sqlQuery1.Parameters, 'rmcount', f[i][20]);
        SetParam(sqlQuery1.Parameters, 'indrstnd', f[i][21]);
        SetParam(sqlQuery1.Parameters, 'indrstndval', StrToFloat(f[i][22]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'hist' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportFam(path: string; dis: integer);
{ процедура импорта семей }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO fam');
    SQL.Add('VALUES (:id, :cl, :fio, convert(smalldatetime,:birth,104), :pol, :st, :priv, :mid, :rel, :npss)');
  end;

  if FileExists(path + 'fam' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'fam' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        f[i][1] := IntToStr(Trunc(StrToFloat(f[i][1])));
        f[i][0] := IntToStr(Trunc(StrToFloat(f[i][0])));

        if i = 0 then
        begin
          sqlQuery2.Close;
          sqlQuery2.SQL.Clear;
          sqlQuery2.SQL.Add('DELETE FROM fam');
          sqlQuery2.SQL.Add('WHERE (regn = :id)');
          sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
          SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
          sqlQuery2.ExecSQL;
        end;
        if (i > 0) and (f[i][1] <> f[i - 1][1]) then
        begin
          sqlQuery2.Close;
          sqlQuery2.SQL.Clear;
          sqlQuery2.SQL.Add('DELETE FROM fam');
          sqlQuery2.SQL.Add('WHERE (regn = :id)');
          sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
          SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
          sqlQuery2.ExecSQL;
        end;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'cl', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'fio', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'birth', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'pol', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'st', f[i][5]);
        SetParam(sqlQuery1.Parameters, 'priv', f[i][6]);
        SetParam(sqlQuery1.Parameters, 'mid', StrToFloat(f[i][7]));
        SetParam(sqlQuery1.Parameters, 'rel', f[i][8]);
        SetParam(sqlQuery1.Parameters, 'npss', f[i][9]);
        sqlQuery1.Parameters.ParamByName('npss').DataType := ftString;
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'fam' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportSub(path: string; dis: integer);
{ процедура импорта субсидий }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO sub');
    SQL.Add('VALUES (CONVERT(smalldatetime,:d,104),:id,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp,:stndsub)');
  end;
  if FileExists(path + 'sub' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'sub' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM sub');
        sqlQuery2.SQL.Add('WHERE (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
        sqlQuery2.SQL.Add('and(service=:serv)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'serv', f[i][2]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'serv', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'idserv', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'ac', f[i][4]);
        sqlQuery1.Parameters.ParamByName('ac').DataType := ftString;
        SetParam(sqlQuery1.Parameters, 'pm', StrToFloat(f[i][5]));
        SetParam(sqlQuery1.Parameters, 'snp', StrToFloat(f[i][6]));
        SetParam(sqlQuery1.Parameters, 'sub', StrToFloat(f[i][7]));
        SetParam(sqlQuery1.Parameters, 'sp', StrToFloat(f[i][8]));
        SetParam(sqlQuery1.Parameters, 'stp', f[i][9]);
        SetParam(sqlQuery1.Parameters, 'stndsub', StrToFloat(f[i][10]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'sub' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportCounters(path: string; dis: integer);
{ процедура импорта счетчиков }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO Counters');
    SQL.Add('VALUES (CONVERT(smalldatetime,:d,104),:id,:serv,:count,:countdata,:countserv)');
  end;
  if FileExists(path + 'counters' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'counters' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM Counters');
        sqlQuery2.SQL.Add('WHERE (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
        sqlQuery2.SQL.Add('and(service=:serv)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery2.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'serv', f[i][2]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'd', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'id', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'serv', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'count', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'countdata', StrToFloat(f[i][4]));
        SetParam(sqlQuery1.Parameters, 'countserv', f[i][5]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'counters' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportSluj(path: string; dis: integer);
{ процедура импорта служебных }
var
  i: integer;
  dbfQuery: TADOQuery;
begin
  dbfQuery := TADOQuery.Create(nil);
  dbfQuery.ConnectionString := DModule.SetDBFConnectStr(path);

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO sluj');
    SQL.Add('VALUES (:d,:id,:serv,:pm,:snp,:sub, :fact,:debt)');
  end;
  if FileExists(path + 'sluj' + IntToStr(dis) + '.dbf') then
  begin
    dbfQuery.SQL.Text := 'SELECT * FROM sluj' + IntToStr(dis);
    dbfQuery.Open;

    with DModule do
    begin
      for i := 0 to dbfQuery.RecordCount - 1 do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM sluj');
        sqlQuery2.SQL.Add('WHERE (regn =:id)and(sdate=:d)and(service=:serv)and(id_debt=:debt)');

        if VarType(dbfQuery.Fields[7].Value) = varNull then
          sqlQuery2.SQL.Text := StringReplace(sqlQuery2.SQL.Text, 'id_debt=:debt', 'id_debt is NULL', [rfReplaceAll, rfIgnoreCase]);

        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', dbfQuery.Fields[1].Value);
        SetParam(sqlQuery2.Parameters, 'd', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery2.Parameters, 'serv', dbfQuery.Fields[2].Value);

        if VarType(dbfQuery.Fields[7].Value) <> varNull then
          SetParam(sqlQuery2.Parameters, 'debt', dbfQuery.Fields[7].Value);
        //sqlQuery2.Parameters.ParamByName('debt').DataType := ftGuid;
        sqlQuery2.ExecSQL;

        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'd', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery1.Parameters, 'id', dbfQuery.Fields[1].Value);
        SetParam(sqlQuery1.Parameters, 'serv', dbfQuery.Fields[2].Value);
        SetParam(sqlQuery1.Parameters, 'pm', dbfQuery.Fields[3].Value);
        SetParam(sqlQuery1.Parameters, 'snp', dbfQuery.Fields[4].Value);
        SetParam(sqlQuery1.Parameters, 'sub', dbfQuery.Fields[5].Value);
        SetParam(sqlQuery1.Parameters, 'fact', dbfQuery.Fields[6].Value);
        SetParam(sqlQuery1.Parameters, 'debt', dbfQuery.Fields[7].Value);
//        if VarType(dbfQuery.Fields[7].Value) <> varNull then
        sqlQuery1.Parameters.ParamByName('debt').DataType := ftGuid;
        sqlQuery1.ExecSQL;
        dbfQuery.Next;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
      dbfQuery.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'sluj' + IntToStr(dis) + '.dbf не найден!');

  dbfQuery.Free;    
end;

procedure ImportInsp(path: string; dis: integer);
{ процедура импорта инспекторов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO insp');
    SQL.Add('VALUES (:id,:idd,:insp,:st,:l,:pwd,:office)');
  end;
  if FileExists(path + 'insp' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'insp' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM insp');
        sqlQuery2.SQL.Add('WHERE (id_insp=:id)and(id_dist=:idd)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'idd', f[i][1]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'idd', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'insp', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'st', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'l', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'pwd', f[i][5]);
        SetParam(sqlQuery1.Parameters, 'office', f[i][6]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'insp' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportMng(path: string; dis: integer);
{ процедура импорта распорядителей }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO mng');
    SQL.Add('VALUES (:id, :idd,:name)');
  end;
  if FileExists(path + 'mng' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'mng' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM mng');
        sqlQuery2.SQL.Add('WHERE (id_mng=:id)and(id_dist=:idd)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'idd', f[i][1]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'idd', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][2]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'mng' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportHouse(path: string; dis: integer);
{ процедура импорта домов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO house');
    SQL.Add('VALUES (:id, :idd, :str, :nh,:cp,:stnd,');
    SQL.Add(':cont, :rep, :cold, :hot,:canal, :heat, :gas,');
    SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil,:elevator)');
  end;
  if FileExists(path + 'house' + IntToStr(dis) + '.dbf') then
  begin
    GetData(path + 'house' + IntToStr(dis) + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM house');
        sqlQuery2.SQL.Add('WHERE (id_house=:id)and(id_dist=:idd)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery2.Parameters, 'idd', f[i][1]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'idd', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'str', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'nh', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'cp', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'stnd', f[i][5]);
        SetParam(sqlQuery1.Parameters, 'cont', f[i][6]);
        SetParam(sqlQuery1.Parameters, 'rep', f[i][7]);
        SetParam(sqlQuery1.Parameters, 'cold', f[i][8]);
        SetParam(sqlQuery1.Parameters, 'hot', f[i][9]);
        SetParam(sqlQuery1.Parameters, 'canal', f[i][10]);
        SetParam(sqlQuery1.Parameters, 'heat', f[i][11]);
        SetParam(sqlQuery1.Parameters, 'gas', f[i][12]);
        SetParam(sqlQuery1.Parameters, 'el', f[i][13]);
        SetParam(sqlQuery1.Parameters, 'wood', f[i][14]);
        SetParam(sqlQuery1.Parameters, 'coal', f[i][15]);
        SetParam(sqlQuery1.Parameters, 'mng', f[i][16]);
        SetParam(sqlQuery1.Parameters, 'fnd', f[i][17]);
        SetParam(sqlQuery1.Parameters, 'boil', f[i][18]);
        SetParam(sqlQuery1.Parameters, 'elevator', f[i][19]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'house' + IntToStr(dis) + '.dbf не найден!');
end;

procedure ImportDist(path: string);
{ процедура импорта округов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO dist');
    SQL.Add('VALUES (:id, :name, :b, :nameokr, :adr, :tel)');
  end;
  if FileExists(path + 'dist.dbf') then
  begin
    GetData(path + 'dist.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM dist');
        sqlQuery2.SQL.Add('WHERE id_dist=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'b', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'nameokr', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'adr', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'tel', f[i][5]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'dist.dbf не найден!');
end;

procedure ImportDiff(path, t: string);
{ процедура импорта данных в таблицы control, rel, serv, cert,own, settl }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO ' + t);
    SQL.Add('VALUES (:id, :name)');
  end;
  if FileExists(path + t + '.dbf') then
  begin
    GetData(path + t + '.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM ' + t);
        sqlQuery2.SQL.Add('WHERE id_' + t + '=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + t + '.dbf не найден!');
end;

procedure ImportCharge(path: string);
{ процедура импорта данных по расходу тепла }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO charge');
    SQL.Add('VALUES (:id, :p)');
  end;
  if FileExists(path + 'charge.dbf') then
  begin
    GetData(path + 'charge.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM charge');
        sqlQuery2.SQL.Add('WHERE id_month=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'p', f[i][1]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'charge.dbf не найден!');
end;

procedure ImportNorm(path: string);
{ процедура импорта норм }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO norm');
    SQL.Add('VALUES (:id, :c, :s, :ps,:h, :ph)');
  end;
  if FileExists(path + 'norm.dbf') then
  begin
    GetData(path + 'norm.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM norm');
        sqlQuery2.SQL.Add('WHERE id_norm=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', IntToStr(StrToInt(f[i][0])));
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'c', f[i][1]);
        SetParam(sqlQuery1.Parameters, 's', StrToFloat(f[i][2]));
        SetParam(sqlQuery1.Parameters, 'ps', StrToFloat(f[i][3]));
        SetParam(sqlQuery1.Parameters, 'h', StrToFloat(f[i][3]));
        SetParam(sqlQuery1.Parameters, 'ph', StrToFloat(f[i][5]));
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'norm.dbf не найден!');
end;

procedure ImportPriv(path: string);
{ процедура импорта льгот }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO priv');
    SQL.Add('VALUES (:id, :name, :sq, :lev,');
    SQL.Add(':pcont,:fcont,:prep,:frep,:pcold,:fcold,:phot,:fhot,:pcanal,:fcanal,');
    SQL.Add(':pheat,:fheat,:pgas,:fgas,:pel,:fel,:pwood,:fwood,:pcoal,:fcoal)');
  end;
  if FileExists(path + 'priv.dbf') then
  begin
    GetData(path + 'priv.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM priv');
        sqlQuery2.SQL.Add('WHERE (id_priv=:id)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'sq', f[i][2]);
        SetParam(sqlQuery1.Parameters, 'lev', f[i][3]);
        SetParam(sqlQuery1.Parameters, 'pcont', f[i][4]);
        SetParam(sqlQuery1.Parameters, 'fcont', f[i][5]);
        SetParam(sqlQuery1.Parameters, 'prep', f[i][6]);
        SetParam(sqlQuery1.Parameters, 'frep', f[i][7]);
        SetParam(sqlQuery1.Parameters, 'pcold', f[i][8]);
        SetParam(sqlQuery1.Parameters, 'fcold', f[i][9]);
        SetParam(sqlQuery1.Parameters, 'phot', f[i][10]);
        SetParam(sqlQuery1.Parameters, 'fhot', f[i][11]);
        SetParam(sqlQuery1.Parameters, 'pcanal', f[i][12]);
        SetParam(sqlQuery1.Parameters, 'fcanal', f[i][13]);
        SetParam(sqlQuery1.Parameters, 'pheat', f[i][14]);
        SetParam(sqlQuery1.Parameters, 'fheat', f[i][15]);
        SetParam(sqlQuery1.Parameters, 'pel', f[i][16]);
        SetParam(sqlQuery1.Parameters, 'fel', f[i][17]);
        SetParam(sqlQuery1.Parameters, 'pgas', f[i][18]);
        SetParam(sqlQuery1.Parameters, 'fgas', f[i][19]);
        SetParam(sqlQuery1.Parameters, 'pwood', f[i][20]);
        SetParam(sqlQuery1.Parameters, 'fwood', f[i][21]);
        SetParam(sqlQuery1.Parameters, 'pcoal', f[i][22]);
        SetParam(sqlQuery1.Parameters, 'fcoal', f[i][23]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'priv.dbf не найден!');
end;

procedure ImportFond(path: string);
{ процедура импорта жилищных фондов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO fond');
    SQL.Add('VALUES (:id, :name)');
  end;
  if FileExists(path + 'fond.dbf') then
  begin
    GetData(path + 'fond.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM fond');
        sqlQuery2.SQL.Add('WHERE id_fond=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'fond.dbf не найден!');
end;

procedure ImportStr(path: string);
{ процедура импорта улиц }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO strt');
    SQL.Add('VALUES (:id, :name,:st)');
  end;
  if FileExists(path + 'strt.dbf') then
  begin
    GetData(path + 'strt.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM strt');
        sqlQuery2.SQL.Add('WHERE id_street=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'st', f[i][2]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'strt.dbf не найден!');
end;

procedure ImportStat(path: string);
{ процедура импорта соц. статусов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO stat');
    SQL.Add('VALUES (:id, :name, :minim)');
  end;
  if FileExists(path + 'stat.dbf') then
  begin
    GetData(path + 'stat.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM stat');
        sqlQuery2.SQL.Add('WHERE id_status=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'minim', f[i][2]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'stat.dbf не найден!');
end;

procedure ImportBank(path: string);
{ процедура импорта банков }
var
  f: T2DString;
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO bank');
    SQL.Add('VALUES (:id,:name,:bik)');
  end;
  if FileExists(path + 'bank.dbf') then
  begin
    GetData(path + 'bank.dbf', f);
    with DModule do
    begin
      for i := 0 to high(f) do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM bank');
        sqlQuery2.SQL.Add('WHERE id_bank=:id');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id', f[i][0]);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id', f[i][0]);
        SetParam(sqlQuery1.Parameters, 'name', f[i][1]);
        SetParam(sqlQuery1.Parameters, 'bik', f[i][2]);
        sqlQuery1.ExecSQL;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'bank.dbf не найден!');
end;

 //function ConvertChar(s: array of char): string;
 //{ процедура преобразования массива символов в строку }
 //var
 //  i: integer;
 //begin
 //  i:=0;
 //  result := '';
 //  while (s[i]<>#0)and(i<Length(s)) do begin
 //    result := result + s[i];
 //    inc(i);
 //  end;
 //end;

function GetData(nam: string; var f: T2DString): boolean;
var
  i, j: integer;
begin
  try
    with DModule do
    begin
      if DBF1.Active then
        DBF1.Close;
      DBF1.TableName := nam;
      DBF1.Open;
      SetLength(f, DBF1.RecordCount);
      i := 0;
      while not DBF1.EOF do
      begin
        SetLength(f[i], DBF1.FieldCount);
        for j := 0 to Length(f[i]) - 1 do
          f[i][j] := DBF1.GetFieldData(j + 1);
        DBF1.Next;
        Inc(i);
      end;
      if Length(f) > 0 then
      begin
        SetLength(f[i], DBF1.FieldCount);
        for j := 0 to Length(f[i]) - 1 do
          f[i][j] := DBF1.GetFieldData(j + 1);
      end;
      DBF1.Close;
      Result := True;
    end;
  except
    Result := False;
    raise;
  end;
end;

procedure ImportDebt(path: string; dis: integer);
{ процедура импорта вычетов }
var
  i: integer;
  dbfQuery: TADOQuery;
begin
  dbfQuery := TADOQuery.Create(nil);
  dbfQuery.ConnectionString := DModule.SetDBFConnectStr(path);

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO Debt');
    SQL.Add('VALUES (:id_debt,:id_sluj,:dist,:regn,:bdate,:edate,:sumdebt,:closed,:closed_date)');
  end;
  if FileExists(path + 'debt' + IntToStr(dis) + '.dbf') then
  begin
    dbfQuery.SQL.Text := 'SELECT * FROM debt' + IntToStr(dis);
    dbfQuery.Open;
    with DModule do
    begin
      for i := 0 to dbfQuery.RecordCount - 1 do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM Debt');
        sqlQuery2.SQL.Add('WHERE (id_debt=:id_debt) and(dist=:dist)');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id_debt', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery2.Parameters, 'dist', dbfQuery.Fields[2].Value);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id_debt', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery1.Parameters, 'id_sluj', dbfQuery.Fields[1].Value);
        SetParam(sqlQuery1.Parameters, 'dist', dbfQuery.Fields[2].Value);
        SetParam(sqlQuery1.Parameters, 'regn', dbfQuery.Fields[3].Value);
        SetParam(sqlQuery1.Parameters, 'bdate', dbfQuery.Fields[4].Value);
        SetParam(sqlQuery1.Parameters, 'edate', dbfQuery.Fields[5].Value);
        SetParam(sqlQuery1.Parameters, 'sumdebt', dbfQuery.Fields[6].Value);
        SetParam(sqlQuery1.Parameters, 'closed', dbfQuery.Fields[7].Value);
        SetParam(sqlQuery1.Parameters, 'closed_date', dbfQuery.Fields[8].Value);
        sqlQuery1.Parameters.ParamByName('closed_date').DataType := ftDateTime;
        sqlQuery1.ExecSQL;
        dbfQuery.Next;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
      dbfQuery.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'debt' + IntToStr(dis) + '.dbf не найден!');
  //------
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO DebtPay');
    SQL.Add('VALUES (:id_debt,:sdate,:paused,:m_return)');
  end;
  if FileExists(path + 'debtpay' + IntToStr(dis) + '.dbf') then
  begin
    dbfQuery.SQL.Text := 'SELECT * FROM debtpay' + IntToStr(dis);
    dbfQuery.Open;
    with DModule do
    begin
      for i := 0 to dbfQuery.RecordCount - 1 do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM DebtPay');
        sqlQuery2.SQL.Add('WHERE (id_debt=:id_debt) ');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id_debt', dbfQuery.Fields[0].Value);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id_debt', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery1.Parameters, 'sdate', dbfQuery.Fields[1].Value);
        SetParam(sqlQuery1.Parameters, 'paused', dbfQuery.Fields[2].Value);
        SetParam(sqlQuery1.Parameters, 'm_return', dbfQuery.Fields[3].Value);
        sqlQuery1.ExecSQL;
        dbfQuery.Next;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
      dbfQuery.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'debtpay' + IntToStr(dis) + '.dbf не найден!');

  dbfQuery.Free;
end;

procedure ImportOffice(path: string; dis: integer);
{ процедура импорта участков }
var
  i: integer;
  dbfQuery: TADOQuery;
begin
  dbfQuery := TADOQuery.Create(nil);
  dbfQuery.ConnectionString := DModule.SetDBFConnectStr(path);

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO office');
    SQL.Add('VALUES (:id_dist, :id_office, :adr, :tel)');
  end;
  if FileExists(path + 'office' + IntToStr(dis) + '.dbf') then
  begin
    dbfQuery.SQL.Text := 'SELECT * FROM office' + IntToStr(dis);
    dbfQuery.Open;
    with DModule do
    begin
      for i := 0 to dbfQuery.RecordCount - 1 do
      begin
        sqlQuery2.Close;
        sqlQuery2.SQL.Clear;
        sqlQuery2.SQL.Add('DELETE FROM office');
        sqlQuery2.SQL.Add('WHERE id_dist=:id_dist AND id_office=:id_office');
        sqlQuery2.Parameters.ParseSQL(sqlQuery2.SQL.Text, True);
        SetParam(sqlQuery2.Parameters, 'id_dist', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery2.Parameters, 'id_office', dbfQuery.Fields[1].Value);
        sqlQuery2.ExecSQL;
        sqlQuery1.Parameters.ParseSQL(sqlQuery1.SQL.Text, True);
        SetParam(sqlQuery1.Parameters, 'id_dist', dbfQuery.Fields[0].Value);
        SetParam(sqlQuery1.Parameters, 'id_office', dbfQuery.Fields[1].Value);
        SetParam(sqlQuery1.Parameters, 'adr', dbfQuery.Fields[2].Value);
        SetParam(sqlQuery1.Parameters, 'tel', dbfQuery.Fields[3].Value);
        sqlQuery1.ExecSQL;
        dbfQuery.Next;
      end;
      sqlQuery1.Close;
      sqlQuery2.Close;
      dbfQuery.Close;
    end;
  end
  else
    ShowMessage('Файл ' + path + 'office' + IntToStr(dis) + '.dbf не найден!');

  dbfQuery.Free;
end;

procedure FillTable2(path, fname: string);
var
  i, curRecord: integer;
  FleldList: TStringList;
  TypeList: array of TFieldType;
  SizeList: array of Integer;
  dbfQuery: TADOQuery;
begin
  if FileExists(path + fname + '.dbf') then
    DeleteFile(path + fname + '.dbf');

  dbfQuery := TADOQuery.Create(nil);
  dbfQuery.ConnectionString := DModule.SetDBFConnectStr(path);

  FleldList := TStringList.Create;
  DModule.sqlQuery1.GetFieldNames(FleldList);

  setlength(TypeList, FleldList.Count);
  setlength(SizeList, FleldList.Count);
  for i := 0 to FleldList.Count - 1 do
  begin
    TypeList[i] := DModule.sqlQuery1.FieldByName(FleldList[i]).DataType;
    SizeList[i] := DModule.sqlQuery1.FieldByName(FleldList[i]).Size;
  end;

  dbfQuery.Close;
  dbfQuery.SQL.Clear;
  dbfQuery.SQL.Add('CREATE TABLE ' + fname + ' (');

//  for i := 0 to FleldList.Count - 1 do
//    if i <> FleldList.Count - 1 then
//      dbfQuery.SQL.Add(format(' %s %s NULL, ', [FleldList[i], DbfDataType(TypeList[i])]))
//    else
//      dbfQuery.SQL.Add(format(' %s %s NULL)', [FleldList[i], DbfDataType(TypeList[i])]));

  for i := 0 to FleldList.Count - 1 do
    if SizeList[i] = 0 then
      dbfQuery.SQL.Add(format('%s %s NULL,', [FleldList[i], DbfDataType(TypeList[i])]))
    else
      dbfQuery.SQL.Add(format('%s %s(%d) NULL,', [FleldList[i], DbfDataType(TypeList[i]), SizeList[i]]));
      
  dbfQuery.SQL.Text := copy(Trim(dbfQuery.SQL.Text), 0, Length(Trim(dbfQuery.SQL.Text)) - 1) + ')';
  dbfQuery.ExecSQL;

  with DModule do
  begin
    for curRecord := 0 to sqlQuery1.RecordCount - 1 do
    begin
      dbfQuery.Close;
      dbfQuery.SQL.Clear;
      dbfQuery.SQL.Add('INSERT INTO ' + fname);
      dbfQuery.SQL.Add('VALUES (');
      for i := 0 to FleldList.Count - 1 do
        if i <> FleldList.Count - 1 then
          dbfQuery.SQL.Add(' :' + FleldList[i] + 'P, ')
        else
          dbfQuery.SQL.Add(' :' + FleldList[i] + 'P)');
      for i := 0 to FleldList.Count - 1 do
      begin
        dbfQuery.Parameters.ParamValues[FleldList[i] + 'P'] :=
          sqlQuery1.FieldValues[FleldList[i]];

        if TypeList[i] in [ftDate, ftDateTime] then
          dbfQuery.Parameters[i].DataType := ftDate;
      end;
      dbfQuery.ExecSQL;
      sqlQuery1.Next;
    end;
  end;

  FleldList.Free;
  dbfQuery.Free;
end;

function DbfDataType(ftype: TFieldType): string;
begin
  case ftype of
    ftUnknown:
      ;
    ftString:
      Result := 'CHAR';
    ftSmallint:
      Result := 'INT';
    ftInteger:
      Result := 'INT';
    ftWord:
      Result := 'INT';
    ftBoolean:
      ;
    ftFloat:
      Result := 'FLOAT';
    ftCurrency:
      ;
    ftBCD:
      ;
    ftDate:
      Result := 'DATE';
    ftTime:
      ;
    ftDateTime:
      Result := 'DATE';
    ftBytes:
      ;
    ftVarBytes:
      ;
    ftAutoInc:
      ;
    ftBlob:
      ;
    ftMemo:
      ;
    ftGraphic:
      ;
    ftFmtMemo:
      ;
    ftParadoxOle:
      ;
    ftDBaseOle:
      ;
    ftTypedBinary:
      ;
    ftCursor:
      ;
    ftFixedChar:
      ;
    ftWideString:
      Result := 'CHAR';
    ftLargeint:
      ;
    ftADT:
      ;
    ftArray:
      ;
    ftReference:
      ;
    ftDataSet:
      ;
    ftOraBlob:
      ;
    ftOraClob:
      ;
    ftVariant:
      ;
    ftInterface:
      ;
    ftIDispatch:
      ;
    ftGuid:
      Result := 'CHAR';
    ftTimeStamp:
      ;
    ftFMTBcd:
      ;
    ftFixedWideChar:
      ;
    ftWideMemo:
      ;
    ftOraTimeStamp:
      ;
    ftOraInterval:
      ;
//    ftLongWord:
//      ;
//    ftShortint:
//      ;
//    ftByte:
//      ;
//    ftExtended:
//      ;
//    ftConnection:
//      ;
//    ftParams:
//      ;
//    ftStream:
//      ;
//    ftTimeStampOffset:
//      ;
//    ftObject:
//      ;
//    ftSingle:
//      ;
  end;
end;

end.
