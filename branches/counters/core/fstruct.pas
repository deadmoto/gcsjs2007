unit fstruct;

interface

uses Controls,service;

type
  T2DString = array of array of string;

  procedure ExportInsp(path: string;dis: integer;all:boolean);
  procedure ExportTarif(path,dt,t: string;dis: integer);
  procedure ExportCl(path,dt: string;dis: integer);
  procedure ExportHist(path,dt: string;dis: integer);
  procedure ExportFam(path,dt: string;dis: integer);
  procedure ExportSub(path,dt: string;dis: integer);
  procedure ExportCounters(path,dt: string;dis: integer);
  procedure ExportSluj(path,dt: string;dis: integer);
  procedure ExportMin(path,dt: string);
  procedure ExportHouse(path: string;dis: integer);
  procedure ExportMng(path: string;dis: integer);
  procedure ExportDiff(path,t: string);
  procedure ExportRStnd(path,dt: string);
  procedure ExportStr(path: string);
  procedure ExportFact(path: string;dis: integer);
  procedure ExportClm(path,dt: string;dis: integer);
  procedure ExportHistm(path,dt: string;dis: integer);
  procedure ExportFamm(path,dt: string;dis: integer);

  procedure ImportInsp(path: string;dis: integer);
  procedure ImportBank(path: string);
  procedure ImportTarif(path,t: string;dis: integer;norm:boolean = False);
  procedure ImportTarifb(path,t: string;dis: integer);
  procedure ImportEl(path: string;dis: integer);
  procedure ImportCl(path: string;dis: integer);
  procedure ImportHist(path: string;dis: integer);
  procedure ImportFam(path: string;dis: integer);
  procedure ImportSub(path: string;dis: integer);
  procedure ImportCounters(path: string;dis: integer);
  procedure ImportSluj(path: string;dis: integer);
  procedure ImportMin(path: string);
  procedure ImportStat(path: string);
  procedure ImportHouse(path: string;dis: integer);
  procedure ImportStr(path: string);
  procedure ImportMng(path: string;dis: integer);
  procedure ImportFond(path: string);
  procedure ImportDiff(path,t: string);
  procedure ImportCharge(path: string);
  procedure ImportDist(path: string);
  procedure ImportNorm(path: string);
  procedure ImportPriv(path: string);
  procedure ImportRStnd(path: string);
  procedure ImportFact(path: string;dis: integer);

  function GetData(nam: string;var f: T2DString): boolean;
  //function ConvertChar(s: array of char): string;

implementation

uses datamodule, sysutils, DBTables, DB,dateutils,dialogs, main,dbf;

procedure ExportCl(path,dt: string;dis: integer);
{ процедура экспорта клиентов }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM cl');
    SQL.Add('WHERE regn in (SELECT regn FROM hist');
    SQL.Add('WHERE');
    if dt<>'' then begin
      SQl.Add('(bdate<=CONVERT(smalldatetime, :d, 104))and');
      SQL.Add('(edate>=CONVERT(smalldatetime, :d, 104))and');
      ParamByName('d').AsString := dt;
    end;
    SQL.Add('(id_dist = :dist))');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'cl'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportHist(path,dt: string;dis: integer);
{ процедура экспорта истории изменения клиентов }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hist');
    SQL.Add('WHERE (id_dist = :dist)');
    if dt<>'' then begin
      SQl.Add('and (bdate<=CONVERT(smalldatetime, :d, 104))');
      SQL.Add('and(edate>=CONVERT(smalldatetime, :d, 104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'hist'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportFam(path,dt: string;dis: integer);
{ процедура экспорта  семей }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM fam');
    SQL.Add('WHERE regn in (SELECT regn FROM hist');
    SQL.Add('WHERE');
    if dt<>'' then begin
      SQl.Add('(bdate<=CONVERT(smalldatetime, :d, 104))and');
      SQL.Add('(edate>CONVERT(smalldatetime, :d, 104))and');
      ParamByName('d').AsString := dt;
    end;
    SQL.Add('(id_dist = :dist))');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'fam'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportClm(path,dt: string;dis: integer);
{ процедура экспорта клиентов согласно дате последнего изменения записи клиента }
var
  d: TDate;
begin
  d := StrToDate(dt);
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM cl');
    SQL.Add('WHERE change>=:d1 and change<=:d2 and id_dist = :dist');
    ParamByName('dist').AsInteger := dis;
//    ParamByName('d2').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),16));
    ParamByName('d2').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),19);
    d := IncMonth(d,-1);
//    ParamByName('d1').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),15));
    ParamByName('d1').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),20);
    Open;
    FillTable(path,'cl'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportHistm(path,dt: string;dis: integer);
{ процедура экспорта истории изменения клиентов согласно дате последнего изменения записи клиента }
var
  d: TDate;
begin
  d := StrToDate(dt);
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hist');
    SQL.Add('WHERE regn in (SELECT regn FROM cl');
    SQL.Add('WHERE change>=:d1 and change<=:d2 and id_dist = :dist)');
    SQl.Add('and (bdate<=CONVERT(smalldatetime, :d, 104))');
    SQL.Add('and(edate>=CONVERT(smalldatetime, :d, 104))');
    ParamByName('d').AsString := dt;
    ParamByName('dist').AsInteger := dis;
//    ParamByName('d2').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),16));
    ParamByName('d2').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),19);
    d := IncMonth(d,-1);
//    ParamByName('d1').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),15));
    ParamByName('d1').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),20);
    Open;
    FillTable(path,'hist'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportFamm(path,dt: string;dis: integer);
{ процедура экспорта  семей  согласно дате последнего изменения записи клиента }
var
  d: TDate;
begin
  d := StrToDate(dt);
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM fam');
    SQL.Add('WHERE regn in (SELECT regn FROM cl');
    SQL.Add('WHERE change>=:d1 and change<=:d2 and id_dist = :dist)');
    ParamByName('dist').AsInteger := dis;
//    ParamByName('d2').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),16));
    ParamByName('d2').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),19);
    d := IncMonth(d,-1);
//    ParamByName('d1').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),15));
    ParamByName('d1').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),20);
    Open;
    FillTable(path,'fam'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportSub(path,dt: string;dis: integer);
{ процедура экспорта субсидий }
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT sub.* FROM sub inner join cl on sub.regn=cl.regn');
    SQL.Add('WHERE (cl.id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(sub.sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'sub'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportCounters(path,dt: string;dis: integer);
{ процедура экспорта счетчиков }
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT counters.* FROM counters inner join cl on counters.regn=cl.regn');
    SQL.Add('WHERE (cl.id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(counters.sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'counters'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportSluj(path,dt: string;dis: integer);
{ процедура экспорта служебных }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT sluj.* FROM sluj inner join cl on sluj.regn=cl.regn');
    SQL.Add('WHERE (cl.id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(sluj.sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'sluj'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportTarif(path,dt,t: string;dis: integer);
{ Процедура экспорта тарифов без бойлера }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+t);
    SQL.Add('WHERE (id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,t+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportRStnd(path,dt: string);
{ процедура экспорта региональных стандартов }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM rstnd');
    if dt<>'' then begin
      SQL.Add('WHERE (sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    Open;
    FillTable(path,'rstnd',MainForm.codedbf);
  end;
end;

procedure ExportMin(path,dt: string);
{ процедура экспорта прожиточных минимумов }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM lmin');
    if dt<>'' then begin
      SQL.Add('WHERE (sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    Open;
    FillTable(path,'lmin',MainForm.codedbf);
  end;
end;

procedure ExportInsp(path: string;dis: integer;all:boolean);
{ процедура экспорта инспекторов }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM insp');
    SQL.Add('WHERE id_dist = :id');
    if not all then
      SQL.Add('and status=1');
    ParamByName('id').AsInteger := dis;
    Open;
    FillTable(path,'insp'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportHouse(path: string;dis: integer);
{ процедура экспорта домов }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM house');
    SQL.Add('WHERE id_dist = :id');
    ParamByName('id').AsInteger := dis;
    Open;
    FillTable(path,'house'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportMng(path: string;dis: integer);
{ процедура экспорта распорядителей }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM mng');
    SQL.Add('WHERE id_dist = :dist');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'mng'+IntToStr(dis),MainForm.codedbf);
  end;
end;

procedure ExportStr(path: string);
{ процедура экспорта улиц }
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM strt');
    SQL.Add('WHERE status=1');
    Open;
    FillTable(path,'strt',MainForm.codedbf);
  end;
end;

procedure ExportDiff(path,t: string);
{ процедура экспорта данных из таблиц control, rel, serv, cert,own, settl,charge,
  norm,priv,dist,fond,stat,bank
}
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+t);
    Open;
    FillTable(path,t,MainForm.codedbf);
  end;
end;

procedure ExportFact(path: string;dis: integer);
{ процедура экспорта фактических расходов }
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM FactSale');
    SQL.Add('WHERE id_dist=:dist');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path, 'factsale'+IntToStr(dis), MainForm.codedbf);
  end;
  //-------
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM FactBalance');
    SQL.Add('WHERE id_dist=:dist');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path, 'factbalance'+IntToStr(dis), MainForm.codedbf);
  end;

end;

procedure ImportTarif(path,t:string;dis: integer;norm: boolean);
{ процедура импорта тарифов без бойлера }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO '+t);
    if norm then
      SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif,:norm)')
    else
      SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif)');
  end;
  if FileExists(path+t+IntToStr(dis)+'.dbf') then begin
    GetData(path+t+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM '+t);
        Query2.SQL.Add('WHERE (id_'+t+'=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        Query2.ParamByName('idd').AsString := f[i][0];
        Query2.ParamByName('d').AsString := f[i][1];
        Query2.ParamByName('id').AsString:= f[i][2];
        Query2.ExecSQL;
        Query1.ParamByName('idd').AsString := f[i][0];
        Query1.ParamByName('d').AsString := f[i][1];
        Query1.ParamByName('id').AsString := f[i][2];
        Query1.ParamByName('name').AsString := f[i][3];
        Query1.ParamByName('tarif').AsFloat := StrToFloat(f[i][4]);
        if norm then
          Query1.ParamByName('norm').AsFloat := StrToFloat(f[i][5]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+t+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportTarifb(path,t:string;dis: integer);
{ процедура импорта тарифов с бойлера}
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO '+t);
    SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif1,:tarif2,:norm)');
  end;
  if FileExists(path+t+IntToStr(dis)+'.dbf') then begin
    GetData(path+t+IntToStr(dis)+'.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM '+t);
        Query2.SQL.Add('WHERE (id_'+t+'=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        Query2.ParamByName('id').AsString := f[i][2];
        Query2.ParamByName('d').AsString := f[i][1];
        Query2.ParamByName('idd').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('idd').AsString := f[i][0];
        Query1.ParamByName('d').AsString := f[i][1];
        Query1.ParamByName('id').AsString := f[i][2];
        Query1.ParamByName('name').AsString := f[i][3];
        Query1.ParamByName('tarif1').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('tarif2').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('norm').AsFloat := StrToFloat(f[i][6]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+t+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportEl(path: string;dis: integer);
{ процедура импорта тарифов на э/э}
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO el');
    SQL.Add('VALUES (:idd,convert(smalldatetime,:d,104),:id,:plate,:tarif1,:tarif2,:tarif3)');
  end;
  if FileExists(path+'el'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'el'+IntToStr(dis)+'.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM el');
        Query2.SQL.Add('WHERE (id_el=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        Query2.ParamByName('id').AsString := f[i][2];
        Query2.ParamByName('d').AsString := f[i][1];
        Query2.ParamByName('idd').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('idd').AsString := f[i][0];
        Query1.ParamByName('d').AsString := f[i][1];
        Query1.ParamByName('id').AsString := f[i][2];
        Query1.ParamByName('plate').AsString := f[i][3];
        Query1.ParamByName('tarif1').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('tarif2').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('tarif3').AsFloat := StrToFloat(f[i][6]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'el'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportFact(path: string;dis: integer);
{ процедура импорта Фактических }
var
  f: T2DString;
  i: integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO FactSale');
    SQL.Add('VALUES (convert(smalldatetime,:d,104),:id,convert(smalldatetime,:bdate,104), convert(smalldatetime,:edate,104),:sub,:factsum,:dis)');
  end;
  if FileExists(path+'factsale'+IntToStr(dis)+'.dbf') then
  begin
    GetData(path+'factsale'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM FactSale');
        Query2.SQL.Add('WHERE (regn =:id) and (sdate=convert(smalldatetime,:d,104))');
        Query2.SQL.Add('and(id_dist=:dis)');
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('dis').AsString := f[i][6];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('bdate').AsString := f[i][2];
        Query1.ParamByName('edate').AsString := f[i][3];
        Query1.ParamByName('sub').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('factsum').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('dis').AsFloat := StrToFloat(f[i][6]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'factsale'+IntToStr(dis)+'.dbf не найден!');
  //------
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO FactBalance');
    SQL.Add('VALUES (:id,convert(smalldatetime,:bdate,104), convert(smalldatetime,:edate,104),:balance,:dolg,:dis)');
  end;
  if FileExists(path+'factbalance'+IntToStr(dis)+'.dbf') then
  begin
    GetData(path+'factbalance'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM FactBalance');
        Query2.SQL.Add('WHERE (regn =:id)and(bdate=convert(smalldatetime,:bdate,104))');
        Query2.SQL.Add('and(id_dist=:dis)');
        Query2.ParamByName('bdate').AsString := f[i][1];
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ParamByName('dis').AsString := f[i][5];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('bdate').AsString := f[i][1];
        Query1.ParamByName('edate').AsString := f[i][2];
        Query1.ParamByName('balance').AsFloat := StrToFloat(f[i][3]);
        if f[i][4] = '' then
          Query1.ParamByName('dolg').AsString := ''
        else
          Query1.ParamByName('dolg').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('dis').AsFloat := StrToFloat(f[i][5]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'factbalance'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportRStnd(path: string);
{ процедура импорта региональных стандартов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO rstnd');
    SQL.Add('VALUES (convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3,:v4,:v5,:v6,:v7)');
  end;
  if FileExists(path+'rstnd.dbf') then begin
    GetData(path+'rstnd.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM rstnd');
        Query2.SQL.Add('WHERE (id_stnd=:id)and(sdate=convert(smalldatetime,:d,104))');
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('name').AsString := f[i][2];
        Query1.ParamByName('v1').AsFloat := StrToFloat(f[i][3]);
        Query1.ParamByName('v2').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('v3').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('v4').AsFloat := StrToFloat(f[i][6]);
        Query1.ParamByName('v5').AsFloat := StrToFloat(f[i][7]);
        Query1.ParamByName('v6').AsFloat := StrToFloat(f[i][8]);
        Query1.ParamByName('v7').AsFloat := StrToFloat(f[i][9]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'rstnd.dbf не найден!');
end;

procedure ImportMin(path: string);
{ процедура импорта проижиточных минимумов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO lmin');
    SQL.Add('VALUES (convert(smalldatetime,:d,104), :id, :name, :minim)');
  end;
  if FileExists(path+'lmin.dbf') then begin
    GetData(path+'lmin.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM lmin');
        Query2.SQL.Add('WHERE (id_min=:id)and(sdate=convert(smalldatetime,:d,104))');
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('name').AsString := f[i][2];
        Query1.ParamByName('minim').AsFloat := StrToFloat(f[i][3]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'lmin.dbf не найден!');
end;

procedure ImportCl(path: string;dis: integer);
{ процедура импорта клиентов }
var
  f: T2DString;
  i: integer;
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO cl');
    SQL.Add('VALUES (:id,:fio,CONVERT(smalldatetime, :rdate, 104),');
    SQL.Add('CONVERT(smalldatetime, :change, 104),:dist, :str, :nh,');
    SQL.Add(':cp,:apart, :tel, :lsquare, :square,:stnd,:settl,:boil,:declar,:mail)');
  end;
  if FileExists(path+'cl'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'cl'+IntToStr(dis)+'.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM cl');
        Query2.SQL.Add('WHERE (regn = :id)');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('fio').AsString := f[i][1];
        Query1.ParamByName('rdate').AsString := f[i][2];
        Query1.ParamByName('change').AsString := f[i][3];
        Query1.ParamByName('dist').AsString := f[i][4];
        Query1.ParamByName('str').AsString := f[i][5];
        Query1.ParamByName('nh').AsString := f[i][6];
        Query1.ParamByName('cp').AsString := f[i][7];
        Query1.ParamByName('apart').AsString := f[i][8];
        Query1.ParamByName('tel').AsString := f[i][9];
        Query1.ParamByName('lsquare').AsFloat := StrToFloat(f[i][10]);
        Query1.ParamByName('square').AsFloat := StrToFloat(f[i][11]);
        Query1.ParamByName('stnd').AsString := f[i][12];
        Query1.ParamByName('settl').AsString := f[i][13];
        Query1.ParamByName('boil').AsString := f[i][14];
        Query1.ParamByName('declar').Value:= StrToDate((f[i][15]));
        Query1.ParamByName('mail').AsString:= f[i][16];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'cl'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportHist(path: string;dis: integer);
{ процедура импорта истории изменения клиентов}
var
  f: T2DString;
  i: integer;
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO hist');
    SQL.Add('VALUES (:id,CONVERT(smalldatetime,:bdate,104),');
    SQL.Add('CONVERT(smalldatetime,:edate,104),:mcount,:quanpriv,:pmin,:income,');
    SQL.Add(':insp,:dist,:control,:reason,:own,:manager,:fond,:cert,:bank,:acbank,');
    SQL.Add(':calc,:mdd,:heating,:rmcount,:indrstnd,:indrstndval)');
  end;
  if FileExists(path+'hist'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'hist'+IntToStr(dis)+'.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM hist');
        Query2.SQL.Add('WHERE (regn = :id)and(bdate>=convert(smalldatetime,:sd,104)');
        Query2.SQL.Add(' or edate > convert(smalldatetime, :sd, 104))');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ParamByName('sd').AsString := f[i][1];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('bdate').AsString := f[i][1];
        Query1.ParamByName('edate').AsString := f[i][2];
        Query1.ParamByName('mcount').AsString := f[i][3];
        Query1.ParamByName('quanpriv').AsString := f[i][4];
        Query1.ParamByName('pmin').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('income').AsFloat := StrToFloat(f[i][6]);
        Query1.ParamByName('insp').AsString := f[i][7];
        Query1.ParamByName('dist').AsString := f[i][8];
        Query1.ParamByName('control').AsString := f[i][9];
        Query1.ParamByName('reason').AsString := f[i][10];
        Query1.ParamByName('own').AsString := f[i][11];
        Query1.ParamByName('manager').AsString := f[i][12];
        Query1.ParamByName('fond').AsString := f[i][13];
        Query1.ParamByName('cert').AsString := f[i][14];
        Query1.ParamByName('bank').AsString := f[i][15];
        Query1.ParamByName('acbank').AsString := f[i][16];
        Query1.ParamByName('calc').AsString := f[i][17];
        Query1.ParamByName('mdd').AsString := f[i][18];
        Query1.ParamByName('heating').AsString := f[i][19];
        Query1.ParamByName('rmcount').AsString := f[i][20];
        Query1.ParamByName('indrstnd').AsString := f[i][21];
        Query1.ParamByName('indrstndval').AsFloat := StrToFloat(f[i][22]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'hist'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportFam(path: string;dis: integer);
{ процедура импорта семей }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO fam');
    SQL.Add('VALUES (:id, :cl, :fio, convert(smalldatetime,:birth,104), :pol, :st, :priv, :mid, :rel, :npss)');
  end;

  if FileExists(path+'fam'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'fam'+IntToStr(dis)+'.dbf',f);
     With DModule do begin
      for i:=0 to high(f) do begin
        f[i][1] := IntToStr(Trunc(StrToFloat(f[i][1])));
        f[i][0] := IntToStr(Trunc(StrToFloat(f[i][0])));

        if i = 0 then
        begin
          Query2.Close;
          Query2.SQL.Clear;
          Query2.SQL.Add('DELETE FROM fam');
          Query2.SQL.Add('WHERE (regn = :id)');
          Query2.ParamByName('id').AsString := f[i][1];
          Query2.ExecSQL;
        end;
        if (i > 0) and (f[i][1] <> f[i-1][1]) then
        begin
          Query2.Close;
          Query2.SQL.Clear;
          Query2.SQL.Add('DELETE FROM fam');
          Query2.SQL.Add('WHERE (regn = :id)');
          Query2.ParamByName('id').AsString := f[i][1];
          Query2.ExecSQL;
        end;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('cl').AsString := f[i][1];
        Query1.ParamByName('fio').AsString := f[i][2];
        Query1.ParamByName('birth').AsString := f[i][3];
        Query1.ParamByName('pol').AsString := f[i][4];
        Query1.ParamByName('st').AsString := f[i][5];
        Query1.ParamByName('priv').AsString := f[i][6];
        Query1.ParamByName('mid').AsFloat := StrToFloat(f[i][7]);
        Query1.ParamByName('rel').AsString := f[i][8];
        Query1.ParamByName('npss').AsString := f[i][9];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'fam'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportSub(path: string;dis: integer);
{ процедура импорта субсидий }
var
  f: T2DString;
  i: integer;
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO sub');
    SQL.Add('VALUES (CONVERT(smalldatetime,:d,104),:id,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp,:stndsub)');
  end;
  if FileExists(path+'sub'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'sub'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM sub');
        Query2.SQL.Add('WHERE (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
        Query2.SQL.Add('and(service=:serv)');
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ParamByName('serv').AsString := f[i][2];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('serv').AsString := f[i][2];
        Query1.ParamByName('idserv').AsString := f[i][3];
        Query1.ParamByName('ac').AsString := f[i][4];
        Query1.ParamByName('pm').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('snp').AsFloat := StrToFloat(f[i][6]);
        Query1.ParamByName('sub').AsFloat := StrToFloat(f[i][7]);
        Query1.ParamByName('sp').AsFloat := StrToFloat(f[i][8]);
        Query1.ParamByName('stp').AsString := f[i][9];
        Query1.ParamByName('stndsub').AsFloat := StrToFloat(f[i][10]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'sub'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportCounters(path: string;dis: integer);
{ процедура импорта счетчиков }
var
  f: T2DString;
  i: integer;
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO Counters');
    SQL.Add('VALUES (CONVERT(smalldatetime,:d,104),:id,:serv,:count,:countdata,:countserv)');
  end;
  if FileExists(path+'counters'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'counters'+IntToStr(dis)+'.dbf',f);
    With DModule do
    begin
      for i:=0 to high(f) do
      begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM Counters');
        Query2.SQL.Add('WHERE (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
        Query2.SQL.Add('and(service=:serv)');
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ParamByName('serv').AsString := f[i][2];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('serv').AsString := f[i][2];
        Query1.ParamByName('count').AsString := f[i][3];
        Query1.ParamByName('countdata').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('countserv').AsString := f[i][5];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'counters'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportSluj(path: string;dis: integer);
{ процедура импорта служебных }
var
  f: T2DString;
  i: integer;
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO sluj');
    SQL.Add('VALUES (CONVERT(smalldatetime,:d,104),:id,:serv,:pm,:snp,:sub, :fact)');
  end;
  if FileExists(path+'sluj'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'sluj'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM sluj');
        Query2.SQL.Add('WHERE (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
        Query2.SQL.Add('and(service=:serv)');
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ParamByName('serv').AsString := f[i][2];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('serv').AsString := f[i][2];
        Query1.ParamByName('pm').AsFloat := StrToFloat(f[i][3]);
        Query1.ParamByName('snp').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('sub').AsFloat := StrToFloat(f[i][5]);
        Query1.ParamByName('fact').AsInteger := StrToInt(f[i][6]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'sluj'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportInsp(path: string;dis: integer);
{ процедура импорта инспекторов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO insp');
    SQL.Add('VALUES (:id,:idd,:insp,:st,:l,:pwd)');
  end;
  if FileExists(path+'insp'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'insp'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM insp');
        Query2.SQL.Add('WHERE (id_insp=:id)and(id_dist=:idd)');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ParamByName('idd').AsString := f[i][1];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('idd').AsString := f[i][1];
        Query1.ParamByName('insp').AsString := f[i][2];
        Query1.ParamByName('st').AsString := f[i][3];
        Query1.ParamByName('l').AsString := f[i][4];
        Query1.ParamByName('pwd').AsString := f[i][5];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'insp'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportMng(path: string;dis: integer);
{ процедура импорта распорядителей }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO mng');
    SQL.Add('VALUES (:id, :idd,:name)');
  end;
  if FileExists(path+'mng'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'mng'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM mng');
        Query2.SQL.Add('WHERE (id_mng=:id)and(id_dist=:idd)');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ParamByName('idd').AsString := f[i][1];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('idd').AsString := f[i][1];
        Query1.ParamByName('name').AsString := f[i][2];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'mng'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportHouse(path: string;dis: integer);
{ процедура импорта домов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO house');
    SQL.Add('VALUES (:id, :idd, :str, :nh,:cp,:stnd,');
    SQL.Add(':cont, :rep, :cold, :hot,:canal, :heat, :gas,');
    SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil,:elevator)');
  end;
  if FileExists(path+'house'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'house'+IntToStr(dis)+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM house');
        Query2.SQL.Add('WHERE (id_house=:id)and(id_dist=:idd)');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ParamByName('idd').AsString := f[i][1];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('idd').AsString := f[i][1];
        Query1.ParamByName('str').AsString := f[i][2];
        Query1.ParamByName('nh').AsString := f[i][3];
        Query1.ParamByName('cp').AsString := f[i][4];
        Query1.ParamByName('stnd').AsString := f[i][5];
        Query1.ParamByName('cont').AsString := f[i][6];
        Query1.ParamByName('rep').AsString := f[i][7];
        Query1.ParamByName('cold').AsString := f[i][8];
        Query1.ParamByName('hot').AsString := f[i][9];
        Query1.ParamByName('canal').AsString := f[i][10];
        Query1.ParamByName('heat').AsString := f[i][11];
        Query1.ParamByName('gas').AsString := f[i][12];
        Query1.ParamByName('el').AsString := f[i][13];
        Query1.ParamByName('wood').AsString := f[i][14];
        Query1.ParamByName('coal').AsString := f[i][15];
        Query1.ParamByName('mng').AsString := f[i][16];
        Query1.ParamByName('fnd').AsString := f[i][17];
        Query1.ParamByName('boil').AsString := f[i][18];
        Query1.ParamByName('elevator').AsString := f[i][19];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'house'+IntToStr(dis)+'.dbf не найден!');
end;

procedure ImportDist(path: string);
{ процедура импорта округов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO dist');
    SQL.Add('VALUES (:id, :name, :b, :adr, :tel)');
  end;
  if FileExists(path+'dist.dbf') then begin
    GetData(path+'dist.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM dist');
        Query2.SQL.Add('WHERE id_dist=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ParamByName('b').AsString := f[i][2];
        Query1.ParamByName('adr').AsString := f[i][3];
        Query1.ParamByName('tel').AsString := f[i][4];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'dist.dbf не найден!');
end;

procedure ImportDiff(path,t:string);
{ процедура импорта данных в таблицы control, rel, serv, cert,own, settl }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO '+t);
    SQL.Add('VALUES (:id, :name)');
  end;
  if FileExists(path+t+'.dbf') then begin
    GetData(path+t+'.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM '+t);
        Query2.SQL.Add('WHERE id_'+t+'=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+t+'.dbf не найден!');
end;

procedure ImportCharge(path: string);
{ процедура импорта данных по расходу тепла }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO charge');
    SQL.Add('VALUES (:id, :p)');
  end;
  if FileExists(path+'charge.dbf') then begin
    GetData(path+'charge.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM charge');
        Query2.SQL.Add('WHERE id_month=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQl;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('p').AsString := f[i][1];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'charge.dbf не найден!');
end;

procedure ImportNorm(path: string);
{ процедура импорта норм }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO norm');
    SQL.Add('VALUES (:id, :c, :s, :ps,:h, :ph)');
  end;
  if FileExists(path+'norm.dbf') then begin
    GetData(path+'norm.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM norm');
        Query2.SQL.Add('WHERE id_norm=:id');
        Query2.ParamByName('id').AsString := IntToStr(StrToInt(f[i][0]));
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('c').AsString := f[i][1];
        Query1.ParamByName('s').AsFloat := StrToFloat(f[i][2]);
        Query1.ParamByName('ps').AsFloat := StrToFloat(f[i][3]);
        Query1.ParamByName('h').AsFloat := StrToFloat(f[i][3]);
        Query1.ParamByName('ph').AsFloat := StrToFloat(f[i][5]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'norm.dbf не найден!');
end;

procedure ImportPriv(path: string);
{ процедура импорта льгот }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO priv');
    SQL.Add('VALUES (:id, :name, :sq, :lev,');
    SQL.Add(':pcont,:fcont,:prep,:frep,:pcold,:fcold,:phot,:fhot,:pcanal,:fcanal,');
    SQL.Add(':pheat,:fheat,:pgas,:fgas,:pel,:fel,:pwood,:fwood,:pcoal,:fcoal)');
  end;
  if FileExists(path+'priv.dbf') then begin
    GetData(path+'priv.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM priv');
        Query2.SQL.Add('WHERE (id_priv=:id)');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ParamByName('sq').AsString := f[i][2];
        Query1.ParamByName('lev').AsString := f[i][3];
        Query1.ParamByName('pcont').AsString := f[i][4];
        Query1.ParamByName('fcont').AsString := f[i][5];
        Query1.ParamByName('prep').AsString := f[i][6];
        Query1.ParamByName('frep').AsString := f[i][7];
        Query1.ParamByName('pcold').AsString := f[i][8];
        Query1.ParamByName('fcold').AsString := f[i][9];
        Query1.ParamByName('phot').AsString := f[i][10];
        Query1.ParamByName('fhot').AsString := f[i][11];
        Query1.ParamByName('pcanal').AsString := f[i][12];
        Query1.ParamByName('fcanal').AsString := f[i][13];
        Query1.ParamByName('pheat').AsString := f[i][14];
        Query1.ParamByName('fheat').AsString := f[i][15];
        Query1.ParamByName('pel').AsString := f[i][16];
        Query1.ParamByName('fel').AsString := f[i][17];
        Query1.ParamByName('pgas').AsString := f[i][18];
        Query1.ParamByName('fgas').AsString := f[i][19];
        Query1.ParamByName('pwood').AsString := f[i][20];
        Query1.ParamByName('fwood').AsString := f[i][21];
        Query1.ParamByName('pcoal').AsString := f[i][22];
        Query1.ParamByName('fcoal').AsString := f[i][23];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'priv.dbf не найден!');
end;

procedure ImportFond(path: string);
{ процедура импорта жилищных фондов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO fond');
    SQL.Add('VALUES (:id, :name)');
  end;
  if FileExists(path+'fond.dbf') then begin
    GetData(path+'fond.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM fond');
        Query2.SQL.Add('WHERE id_fond=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'fond.dbf не найден!');
end;

procedure ImportStr(path: string);
{ процедура импорта улиц }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO strt');
    SQL.Add('VALUES (:id, :name,:st)');
  end;
  if FileExists(path+'strt.dbf') then begin
    GetData(path+'strt.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM strt');
        Query2.SQL.Add('WHERE id_street=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ParamByName('st').AsString := f[i][2];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'strt.dbf не найден!');
end;

procedure ImportStat(path: string);
{ процедура импорта соц. статусов }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO stat');
    SQL.Add('VALUES (:id, :name, :minim)');
  end;
  if FileExists(path+'stat.dbf') then begin
    GetData(path+'stat.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM stat');
        Query2.SQL.Add('WHERE id_status=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ParamByName('minim').AsString := f[i][2];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'stat.dbf не найден!');
end;

procedure ImportBank(path: string);
{ процедура импорта банков }
var
  f: T2DString;
  i: integer;
begin
  With DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO bank');
    SQL.Add('VALUES (:id,:name,:bik)');
  end;
  if FileExists(path+'bank.dbf') then begin
    GetData(path+'bank.dbf',f);
    With DModule do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('DELETE FROM bank');
        Query2.SQL.Add('WHERE id_bank=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ParamByName('bik').AsString := f[i][2];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('Файл '+path+'bank.dbf не найден!');
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

function GetData(nam: string;var f: T2DString): boolean;
var
  i,j: integer;
begin
  try
    with DModule do
    begin
      if DBF1.Active then
        DBF1.Close;
      DBF1.TableName := nam;
      DBF1.Open;
      SetLength(f,DBF1.RecordCount);
      i:=0;
      while not DBF1.Eof do
      begin
        SetLength(f[i],DBF1.FieldCount);
        for j:=0 to Length(f[i])-1 do
          f[i][j] := DBF1.GetFieldData(j+1);
        DBF1.Next;
        inc(i);
      end;
      if Length(f)>0 then
      begin
        SetLength(f[i],DBF1.FieldCount);
        for j:=0 to Length(f[i])-1 do
          f[i][j] := DBF1.GetFieldData(j+1);
      end;
      DBF1.Close;
      Result := True;
    end;
  except
    Result := False;
    Raise;
  end;
end;

end.
