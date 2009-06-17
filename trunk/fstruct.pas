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
  procedure ExportClm(path,dt: string;dis: integer);
  procedure ExportHistm(path,dt: string;dis: integer);
  procedure ExportFamm(path,dt: string;dis: integer);
  procedure ExportSub(path,dt: string;dis: integer);
  procedure ExportSluj(path,dt: string;dis: integer);
  procedure ExportMin(path,dt: string);
  procedure ExportHouse(path: string;dis: integer);
  procedure ExportMng(path: string;dis: integer);
  procedure ExportDiff(path,t: string);
  procedure ExportRStnd(path,dt: string);
  procedure ExportStr(path: string);

  procedure ImportInsp(path: string;dis: integer);
  procedure ImportBank(path: string);
  procedure ImportTarif(path,t: string;dis: integer);
  procedure ImportTarifb(path,t: string;dis: integer);
  procedure ImportEl(path: string;dis: integer);
  procedure ImportCl(path: string;dis: integer);
  procedure ImportHist(path: string;dis: integer);
  procedure ImportFam(path: string;dis: integer);
  procedure ImportSub(path: string;dis: integer);
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

  function GetData(nam: string;var f: T2DString): boolean;
  function ConvertChar(s: array of char): string;

implementation

uses datamodule, sysutils, DBTables, DB,dateutils,dialogs, main,dbf;

procedure ExportCl(path,dt: string;dis: integer);
{ ��������� �������� �������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from cl');
    SQL.Add('where regn in (select regn from hist');
    SQL.Add('where');
    if dt<>'' then begin
      SQl.Add('(bdate<=CONVERT(smalldatetime, :d, 104))and');
      SQL.Add('(edate>=CONVERT(smalldatetime, :d, 104))and');
      ParamByName('d').AsString := dt;
    end;
    SQL.Add('(id_dist = :dist))');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'cl'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportHist(path,dt: string;dis: integer);
{ ��������� �������� ������� ��������� �������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hist');
    SQL.Add('where (id_dist = :dist)');
    if dt<>'' then begin
      SQl.Add('and (bdate<=CONVERT(smalldatetime, :d, 104))');
      SQL.Add('and(edate>=CONVERT(smalldatetime, :d, 104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'hist'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportFam(path,dt: string;dis: integer);
{ ��������� ��������  ����� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from fam');
    SQL.Add('where regn in (select regn from hist');
    SQL.Add('where');
    if dt<>'' then begin
      SQl.Add('(bdate<=CONVERT(smalldatetime, :d, 104))and');
      SQL.Add('(edate>CONVERT(smalldatetime, :d, 104))and');
      ParamByName('d').AsString := dt;
    end;
    SQL.Add('(id_dist = :dist))');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'fam'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportClm(path,dt: string;dis: integer);
{ ��������� �������� �������� �������� ���� ���������� ��������� ������ ������� }
var
  d: TDate;
begin
  d := StrToDate(dt);
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from cl');
    SQL.Add('where change>:d1 and change<:d2 and id_dist = :dist');
    ParamByName('dist').AsInteger := dis;
//    ParamByName('d2').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),16));
    ParamByName('d2').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),16);
    d := IncMonth(d,-1);
//    ParamByName('d1').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),15));
    ParamByName('d1').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),15);
    Open;
    FillTable(path,'cl'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportHistm(path,dt: string;dis: integer);
{ ��������� �������� ������� ��������� �������� �������� ���� ���������� ��������� ������ ������� }
var
  d: TDate;
begin
  d := StrToDate(dt);
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hist');
    SQL.Add('where regn in (select regn from cl');
    SQL.Add('where change>:d1 and change<:d2 and id_dist = :dist)');
    SQl.Add('and (bdate<=CONVERT(smalldatetime, :d, 104))');
    SQL.Add('and(edate>=CONVERT(smalldatetime, :d, 104))');
    ParamByName('d').AsString := dt;
    ParamByName('dist').AsInteger := dis;
//    ParamByName('d2').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),16));
    ParamByName('d2').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),16);
    d := IncMonth(d,-1);
//    ParamByName('d1').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),15));
    ParamByName('d1').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),15);
    Open;
    FillTable(path,'hist'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportFamm(path,dt: string;dis: integer);
{ ��������� ��������  �����  �������� ���� ���������� ��������� ������ ������� }
var
  d: TDate;
begin
  d := StrToDate(dt);
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from fam');
    SQL.Add('where regn in (select regn from cl');
    SQL.Add('where change>:d1 and change<:d2 and id_dist = :dist)');
    ParamByName('dist').AsInteger := dis;
//    ParamByName('d2').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),16));
    ParamByName('d2').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),16);
    d := IncMonth(d,-1);
//    ParamByName('d1').AsString := DateToStr(EncodeDate(YearOf(d),MonthOf(d),15));
    ParamByName('d1').AsDateTime := EncodeDate(YearOf(d),MonthOf(d),15);
    Open;
    FillTable(path,'fam'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportSub(path,dt: string;dis: integer);
{ ��������� �������� �������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sub.* from sub inner join cl on sub.regn=cl.regn');
    SQL.Add('where (cl.id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(sub.sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'sub'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportSluj(path,dt: string;dis: integer);
{ ��������� �������� ��������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sluj.* from sluj inner join cl on sluj.regn=cl.regn');
    SQL.Add('where (cl.id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(sluj.sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'sluj'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportTarif(path,dt,t: string;dis: integer);
{ ��������� �������� ������� ��� ������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from '+t);
    SQL.Add('where (id_dist = :dist)');
    if dt<>'' then begin
      SQL.Add('and(sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,t+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportRStnd(path,dt: string);
{ ��������� �������� ������������ ���������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from rstnd');
    if dt<>'' then begin
      SQL.Add('where (sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    Open;
    FillTable(path,'rstnd',Form1.codedbf);
  end;
end;

procedure ExportMin(path,dt: string);
{ ��������� �������� ����������� ��������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from lmin');
    if dt<>'' then begin
      SQL.Add('where (sdate = convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := dt;
    end;
    Open;
    FillTable(path,'lmin',Form1.codedbf);
  end;
end;

procedure ExportInsp(path: string;dis: integer;all:boolean);
{ ��������� �������� ����������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from insp');
    SQL.Add('where id_dist = :id');
    if not all then
      SQL.Add('and status=1');
    ParamByName('id').AsInteger := dis;
    Open;
    FillTable(path,'insp'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportHouse(path: string;dis: integer);
{ ��������� �������� ����� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from house');
    SQL.Add('where id_dist = :id');
    ParamByName('id').AsInteger := dis;
    Open;
    FillTable(path,'house'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportMng(path: string;dis: integer);
{ ��������� �������� �������������� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from mng');
    SQL.Add('where id_dist = :dist');
    ParamByName('dist').AsInteger := dis;
    Open;
    FillTable(path,'mng'+IntToStr(dis),Form1.codedbf);
  end;
end;

procedure ExportStr(path: string);
{ ��������� �������� ���� }
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from strt');
    SQL.Add('where status=1');
    Open;
    FillTable(path,'strt',Form1.codedbf);
  end;
end;

procedure ExportDiff(path,t: string);
{ ��������� �������� ������ �� ������ control, rel, serv, cert,own, settl,charge,
  norm,priv,dist,fond,stat,bank
}
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from '+t);
    Open;
    FillTable(path,t,Form1.codedbf);
  end;
end;

procedure ImportTarif(path,t:string;dis: integer);
{ ��������� ������� ������� ��� ������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into '+t);
    SQL.Add('values (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif)');
  end;
  if FileExists(path+t+IntToStr(dis)+'.dbf') then begin
    GetData(path+t+IntToStr(dis)+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from '+t);
        Query2.SQL.Add('where (id_'+t+'=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
        Query2.ParamByName('idd').AsString := f[i][0];
        Query2.ParamByName('d').AsString := f[i][1];
        Query2.ParamByName('id').AsString:= f[i][2];
        Query2.ExecSQL;
        Query1.ParamByName('idd').AsString := f[i][0];
        Query1.ParamByName('d').AsString := f[i][1];
        Query1.ParamByName('id').AsString := f[i][2];
        Query1.ParamByName('name').AsString := f[i][3];
        Query1.ParamByName('tarif').AsFloat := StrToFloat(f[i][4]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+t+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportTarifb(path,t:string;dis: integer);
{ ��������� ������� ������� � �������}
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into '+t);
    SQL.Add('values (:idd,convert(smalldatetime,:d,104),:id,:name,:tarif1,:tarif2)');
  end;
  if FileExists(path+t+IntToStr(dis)+'.dbf') then begin
    GetData(path+t+IntToStr(dis)+'.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from '+t);
        Query2.SQL.Add('where (id_'+t+'=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
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
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+t+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportEl(path: string;dis: integer);
{ ��������� ������� ������� �� �/�}
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into el');
    SQL.Add('values (:idd,convert(smalldatetime,:d,104),:id,:plate,:tarif1,:tarif2,:tarif3)');
  end;
  if FileExists(path+'el'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'el'+IntToStr(dis)+'.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from el');
        Query2.SQL.Add('where (id_el=:id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
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
    ShowMessage('���� '+path+'el'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportRStnd(path: string);
{ ��������� ������� ������������ ���������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into rstnd');
    SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3)');
  end;
  if FileExists(path+'rstnd.dbf') then begin
    GetData(path+'rstnd.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from rstnd');
        Query2.SQL.Add('where (id_stnd=:id)and(sdate=convert(smalldatetime,:d,104))');
        Query2.ParamByName('id').AsString := f[i][1];
        Query2.ParamByName('d').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('d').AsString := f[i][0];
        Query1.ParamByName('id').AsString := f[i][1];
        Query1.ParamByName('name').AsString := f[i][2];
        Query1.ParamByName('v1').AsFloat := StrToFloat(f[i][3]);
        Query1.ParamByName('v2').AsFloat := StrToFloat(f[i][4]);
        Query1.ParamByName('v3').AsFloat := StrToFloat(f[i][5]);
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'rstnd.dbf �� ������!');
end;

procedure ImportMin(path: string);
{ ��������� ������� ������������ ��������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into lmin');
    SQL.Add('values (convert(smalldatetime,:d,104), :id, :name, :minim)');
  end;
  if FileExists(path+'lmin.dbf') then begin
    GetData(path+'lmin.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from lmin');
        Query2.SQL.Add('where (id_min=:id)and(sdate=convert(smalldatetime,:d,104))');
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
    ShowMessage('���� '+path+'lmin.dbf �� ������!');
end;

procedure ImportCl(path: string;dis: integer);
{ ��������� ������� �������� }
var
  f: T2DString;
  i: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into cl');
    SQL.Add('values (:id,:fio,CONVERT(smalldatetime, :rdate, 104),');
    SQL.Add('CONVERT(smalldatetime, :change, 104),:dist, :str, :nh,');
    SQL.Add(':cp,:apart, :tel, :lsquare, :square,:stnd,:settl,:boil,:declar,:mail)');
  end;
  if FileExists(path+'cl'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'cl'+IntToStr(dis)+'.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from cl');
        Query2.SQL.Add('where (regn = :id)');
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
    ShowMessage('���� '+path+'cl'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportHist(path: string;dis: integer);
{ ��������� ������� ������� ��������� ��������}
var
  f: T2DString;
  i: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into hist');
    SQL.Add('values (:id,CONVERT(smalldatetime,:bdate,104),');
    SQL.Add('CONVERT(smalldatetime,:edate,104),:mcount,:quanpriv,:pmin,:income,');
    SQL.Add(':insp,:dist,:control,:reason,:own,:manager,:fond,:cert,:bank,:acbank,');
    SQL.Add(':calc,:mdd)');
  end;
  if FileExists(path+'hist'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'hist'+IntToStr(dis)+'.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from hist');
        Query2.SQL.Add('where (regn = :id)and(bdate>=convert(smalldatetime,:sd,104)');
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
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'hist'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportFam(path: string;dis: integer);
{ ��������� ������� ����� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into fam');
    SQL.Add('values (:id, :cl, :fio,');
    SQL.Add('convert(smalldatetime,:birth,104), :pol, :st, :priv,');
    SQL.Add(':mid, :rel)');
  end;

  if FileExists(path+'fam'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'fam'+IntToStr(dis)+'.dbf',f);
     With DataModule1 do begin
      for i:=0 to high(f) do begin
        f[i][1] := IntToStr(Trunc(StrToFloat(f[i][1])));
        f[i][0] := IntToStr(Trunc(StrToFloat(f[i][0])));

        if i = 0 then
        begin
          Query2.Close;
          Query2.SQL.Clear;
          Query2.SQL.Add('delete from fam');
          Query2.SQL.Add('where (regn = :id)');
          Query2.ParamByName('id').AsString := f[i][1];
          Query2.ExecSQL;
        end;
        if (i > 0) and (f[i][1] <> f[i-1][1]) then
        begin
          Query2.Close;
          Query2.SQL.Clear;
          Query2.SQL.Add('delete from fam');
          Query2.SQL.Add('where (regn = :id)');
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
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'fam'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportSub(path: string;dis: integer);
{ ��������� ������� �������� }
var
  f: T2DString;
  i: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into sub');
    SQL.Add('values (CONVERT(smalldatetime,:d,104),:id,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp)');
  end;
  if FileExists(path+'sub'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'sub'+IntToStr(dis)+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from sub');
        Query2.SQL.Add('where (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
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
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'sub'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportSluj(path: string;dis: integer);
{ ��������� ������� ��������� }
var
  f: T2DString;
  i: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into sluj');
    SQL.Add('values (CONVERT(smalldatetime,:d,104),:id,:serv,:pm,:snp,:sub)');
  end;
  if FileExists(path+'sluj'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'sluj'+IntToStr(dis)+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from sluj');
        Query2.SQL.Add('where (regn =:id)and(sdate=convert(smalldatetime,:d,104))');
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
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'sluj'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportInsp(path: string;dis: integer);
{ ��������� ������� ����������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into insp');
    SQL.Add('values (:id,:idd,:insp,:st,:l)');
  end;
  if FileExists(path+'insp'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'insp'+IntToStr(dis)+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from insp');
        Query2.SQL.Add('where (id_insp=:id)and(id_dist=:idd)');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ParamByName('idd').AsString := f[i][1];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('idd').AsString := f[i][1];
        Query1.ParamByName('insp').AsString := f[i][2];
        Query1.ParamByName('st').AsString := f[i][3];
        Query1.ParamByName('l').AsString := f[i][4];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'insp'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportMng(path: string;dis: integer);
{ ��������� ������� �������������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into mng');
    SQL.Add('values (:id, :idd,:name)');
  end;
  if FileExists(path+'mng'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'mng'+IntToStr(dis)+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from mng');
        Query2.SQL.Add('where (id_mng=:id)and(id_dist=:idd)');
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
    ShowMessage('���� '+path+'mng'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportHouse(path: string;dis: integer);
{ ��������� ������� ����� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into house');
    SQL.Add('values (:id, :idd, :str, :nh,:cp,:stnd,');
    SQL.Add(':cont, :rep, :cold, :hot,:canal, :heat, :gas,');
    SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil)');
  end;
  if FileExists(path+'house'+IntToStr(dis)+'.dbf') then begin
    GetData(path+'house'+IntToStr(dis)+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from house');
        Query2.SQL.Add('where (id_house=:id)and(id_dist=:idd)');
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
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'house'+IntToStr(dis)+'.dbf �� ������!');
end;

procedure ImportDist(path: string);
{ ��������� ������� ������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into dist');
    SQL.Add('values (:id, :name, :b)');
  end;
  if FileExists(path+'dist.dbf') then begin
    GetData(path+'dist.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from dist');
        Query2.SQL.Add('where id_dist=:id');
        Query2.ParamByName('id').AsString := f[i][0];
        Query2.ExecSQL;
        Query1.ParamByName('id').AsString := f[i][0];
        Query1.ParamByName('name').AsString := f[i][1];
        Query1.ParamByName('b').AsString := f[i][2];
        Query1.ExecSQL;
      end;
      Query1.Close;
      Query2.Close;
    end;
  end
  else
    ShowMessage('���� '+path+'dist.dbf �� ������!');
end;

procedure ImportDiff(path,t:string);
{ ��������� ������� ������ � ������� control, rel, serv, cert,own, settl }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into '+t);
    SQL.Add('values (:id, :name)');
  end;
  if FileExists(path+t+'.dbf') then begin
    GetData(path+t+'.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from '+t);
        Query2.SQL.Add('where id_'+t+'=:id');
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
    ShowMessage('���� '+path+t+'.dbf �� ������!');
end;

procedure ImportCharge(path: string);
{ ��������� ������� ������ �� ������� ����� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into charge');
    SQL.Add('values (:id, :p)');
  end;
  if FileExists(path+'charge.dbf') then begin
    GetData(path+'charge.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from charge');
        Query2.SQL.Add('where id_month=:id');
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
    ShowMessage('���� '+path+'charge.dbf �� ������!');
end;

procedure ImportNorm(path: string);
{ ��������� ������� ���� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into norm');
    SQL.Add('values (:id, :c, :s, :ps,:h, :ph)');
  end;
  if FileExists(path+'norm.dbf') then begin
    GetData(path+'norm.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from norm');
        Query2.SQL.Add('where id_norm=:id');
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
    ShowMessage('���� '+path+'norm.dbf �� ������!');
end;

procedure ImportPriv(path: string);
{ ��������� ������� ����� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into priv');
    SQL.Add('values (:id, :name, :sq, :lev,');
    SQL.Add(':pcont,:fcont,:prep,:frep,:pcold,:fcold,:phot,:fhot,:pcanal,:fcanal,');
    SQL.Add(':pheat,:fheat,:pgas,:fgas,:pel,:fel,:pwood,:fwood,:pcoal,:fcoal)');
  end;
  if FileExists(path+'priv.dbf') then begin
    GetData(path+'priv.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from priv');
        Query2.SQL.Add('where (id_priv=:id)');
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
    ShowMessage('���� '+path+'priv.dbf �� ������!');
end;

procedure ImportFond(path: string);
{ ��������� ������� �������� ������ }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into fond');
    SQL.Add('values (:id, :name)');
  end;
  if FileExists(path+'fond.dbf') then begin
    GetData(path+'fond.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from fond');
        Query2.SQL.Add('where id_fond=:id');
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
    ShowMessage('���� '+path+'fond.dbf �� ������!');
end;

procedure ImportStr(path: string);
{ ��������� ������� ���� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into strt');
    SQL.Add('values (:id, :name,:st)');
  end;
  if FileExists(path+'strt.dbf') then begin
    GetData(path+'strt.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from strt');
        Query2.SQL.Add('where id_street=:id');
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
    ShowMessage('���� '+path+'strt.dbf �� ������!');
end;

procedure ImportStat(path: string);
{ ��������� ������� ���. �������� }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into stat');
    SQL.Add('values (:id, :name, :minim)');
  end;
  if FileExists(path+'stat.dbf') then begin
    GetData(path+'stat.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from stat');
        Query2.SQL.Add('where id_status=:id');
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
    ShowMessage('���� '+path+'stat.dbf �� ������!');
end;

procedure ImportBank(path: string);
{ ��������� ������� ������ }
var
  f: T2DString;
  i: integer;
begin
  With DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into bank');
    SQL.Add('values (:id,:name,:bik)');
  end;
  if FileExists(path+'bank.dbf') then begin
    GetData(path+'bank.dbf',f);
    With DataModule1 do begin
      for i:=0 to high(f) do begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('delete from bank');
        Query2.SQL.Add('where id_bank=:id');
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
    ShowMessage('���� '+path+'bank.dbf �� ������!');
end;

function ConvertChar(s: array of char): string;
{ ��������� �������������� ������� �������� � ������ }
var
  i: integer;
begin
  i:=0;
  result := '';
  while (s[i]<>#0)and(i<Length(s)) do begin
    result := result + s[i];
    inc(i);
  end;
end;

function GetData(nam: string;var f: T2DString): boolean;
var
  i,j: integer;
begin
  With DataModule1 do begin
    if DBF1.Active then
      DBF1.Close;
    Dbf1.TableName := nam;
    DBF1.Open;
    SetLength(f,DBF1.RecordCount);
    i:=0;
    while not DBF1.Eof do begin
      SetLength(f[i],DBF1.FieldCount);
      for j:=0 to Length(f[i])-1 do
        f[i][j] := DBF1.GetFieldData(j+1);
      DBF1.Next;
      inc(i);
    end;
    if Length(f)>0 then begin
      SetLength(f[i],DBF1.FieldCount);
      for j:=0 to Length(f[i])-1 do
        f[i][j] := DBF1.GetFieldData(j+1);
    end;
    DBF1.Close;
  end;
end;

end.
