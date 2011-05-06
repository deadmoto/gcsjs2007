unit service2;

interface
uses
  SysUtils,
  Client,
  ADODB,
  Forms;
  
function SelStr(n: integer): string;     //выбрать улицу
function SelMng(n: integer): string;     //выбрать распорядителя
function SelFnd(n: integer): string;     //выбрать фонд
function SelSettl(n: integer): string;   //выбрать тип заселения
function SelOwn(n: integer): string;     //выбрать тип владения
function SelCntrl(n: integer): string;   //выбрать тип контроля
function SelSt(n: integer): string;      //выбрать тип статуса
function SelPriv(n: integer): string;    //выбрать льготу
function SelCont(n: integer): string;    //выбрать тариф
function SelRep(n: integer): string;     //выбрать тариф
function SelCold(n: integer): string;    //выбрать тариф
function SelCanal(n: integer): string;   //выбрать тариф
function SelHot(n: integer): string;     //выбрать тариф
function SelHeat(n: integer): string;    //выбрать тариф
function SelHeating(n: integer): string; //выбрать тип отопления
function SelGas(n: integer): string;     //выбрать тариф
function SelWood(n: integer): string;    //выбрать тариф
function SelCoal(n: integer): string;    //выбрать тариф
function SelBank(n: integer): string;    //выбрать банк
function SelRel(n: integer): string;
function SelStnd(n: integer): string;
function SelMin(n: integer): real;
function SelInsp(n: integer): string;    //выбрать инспектора
function SelCert(n: integer): string;    //выбрать аттестацию
function SelDist(n: integer): string;    //выбрать округ
function SelBoss(n: integer): string;    
function ExistHouse(var n: integer; cl: TClient): boolean;//существует дом?
implementation

uses
  datamodule,
  main,
  service;

function SelStr(n: integer): string;//выбрать улицу
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namestreet');
    SQL.Add('from strt');
    SQL.Add('where id_street = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namestreet').AsString;
    Close;
  end;
end;

function SelMng(n: integer): string;//выбрать распорядителя
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namemng');
    SQL.Add('from mng');
    SQL.Add('where (id_mng = :id)and(id_dist=:dist)');
    ParamByName('id').AsInteger := n;
    ParamByName('dist').AsInteger := MainForm.dist;
    Open;
    Result := FieldByName('namemng').AsString;
    Close;
  end;
end;

function SelFnd(n: integer): string;//выбрать фонд
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namefond');
    SQL.Add('from fond');
    SQL.Add('where id_fond = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namefond').AsString;
    Close;
  end;
end;

function SelSettl(n: integer): string;//выбрать тип заселения
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namesettl');
    SQL.Add('from settl');
    SQL.Add('where id_settl = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namesettl').AsString;
    Close;
  end;
end;

function SelOwn(n: integer): string;//выбрать тип владения
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select nameown');
    SQL.Add('from own');
    SQL.Add('where id_own = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('nameown').AsString;
    Close;
  end;
end;

function SelCntrl(n: integer): string;//выбрать тип контроля
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namecntrl');
    SQL.Add('from cntrl');
    SQL.Add('where id_cntrl = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecntrl').AsString;
    Close;
  end;
end;

function SelSt(n: integer): string;//выбрать тип статуса
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namestatus');
    SQL.Add('from stat');
    SQL.Add('where id_status = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namestatus').AsString;
    Close;
  end;
end;

function SelPriv(n: integer): string;//выбрать льготу
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namepriv');
    SQL.Add('from priv');
    SQL.Add('where id_priv = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namepriv').AsString;
    Close;
  end;
end;

function SelRel(n: integer): string;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namerel');
    SQL.Add('from rel');
    SQL.Add('where id_rel = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namerel').AsString;
    Close;
  end;
end;

function SelStnd(n: integer): string;//выбрать стандарт
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namestnd');
    SQL.Add('from "currstnd.dbf" sbros');
    SQL.Add('where sbros.id_stnd = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namestnd').AsString;
    Close;
  end;
end;

function SelCont(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecont');
    SQL.Add('from "curcont.dbf" sbros');
    SQL.Add('where sbros.id_cont = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namecont').AsString;
    Close;
  end;
end;

function SelRep(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namerep');
    SQL.Add('from "currep.dbf" sbros');
    SQL.Add('where sbros.id_rep = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namerep').AsString;
    Close;
  end;
end;

function SelCold(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecold');
    SQL.Add('from "curcold.dbf" sbros');
    SQL.Add('where sbros.id_cold = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namecold').AsString;
    Close;
  end;
end;

function SelCanal(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecanal');
    SQL.Add('from "curcanal.dbf" sbros');
    SQL.Add('where sbros.id_canal = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namecanal').AsString;
    Close;
  end;
end;

function SelHot(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namehot');
    SQL.Add('from "curhot.dbf" sbros');
    SQL.Add('where sbros.id_hot = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namehot').AsString;
    Close;
  end;
end;

function SelHeat(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.nameheat');
    SQL.Add('from "curheat.dbf" sbros');
    SQL.Add('where sbros.id_heat = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('nameheat').AsString;
    Close;
  end;
end;

function SelHeating(n: integer): string; //выбрать тип отопления
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Text :=
      'select nameheating'#13#10 +
      'from heating'#13#10 +
      'where (id_heating = :id)';
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('nameheating').AsString;
    Close;
  end;

end;

function SelGas(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namegas');
    SQL.Add('from "curgas.dbf" sbros');
    SQL.Add('where sbros.id_gas = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namegas').AsString;
    Close;
  end;
end;

function SelWood(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namewood');
    SQL.Add('from "curwood.dbf" sbros');
    SQL.Add('where sbros.id_wood = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namewood').AsString;
    Close;
  end;
end;

function SelCoal(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecoal');
    SQL.Add('from "curcoal.dbf" sbros');
    SQL.Add('where sbros.id_coal = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namecoal').AsString;
    Close;
  end;
end;

function SelBank(n: integer): string;//выбрать банк
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namebank');
    SQL.Add('from bank');
    SQL.Add('where id_bank = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namebank').AsString;
    Close;
  end;
end;

function SelMin(n: integer): real;//найти min
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.minim');
    SQL.Add('from "curlmin.dbf" sbros');
    SQL.Add('where sbros.id_min = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('minim').AsFloat;
    Close;
  end;
end;

function SelInsp(n: integer): string;//выбрать инспектора
begin
  with TADOQuery.Create(Application) do
  begin
    Connection := DModule.sqlConnection;
    SQL.Text :=
      'select nameinsp'#13#10 +
      'from insp'#13#10 +
      'where (id_insp = :id)and(id_dist=:dist)';
    Parameters.ParamByName('id').Value := n;
    Parameters.ParamByName('dist').Value := MainForm.dist;
    Open;
    Result := FieldByName('nameinsp').AsString;
    Close;
  end;
end;

function SelCert(n: integer): string;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Text := 'select namecert'#13#10 +
      'from cert'#13#10 +
      'where (id_cert = :id)';
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecert').AsString;
    Close;
  end;
end;

function SelDist(n: integer): string;
begin
  with TADOQuery.Create(Application) do
  begin
    Connection := DModule.sqlConnection;
    SQL.Text :=
      'select namedist'#13#10 +
      'from dist'#13#10 +
      'where (id_dist = :id)';
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namedist').AsString;
    Close;
  end;
end;

function SelBoss(n: integer): string;
begin
  with TADOQuery.Create(Application) do
  begin
    Connection := DModule.sqlConnection;
    SQL.Text :=
      'SELECT boss '#13#10 +
      'FROM Dist '#13#10 +
      'WHERE id_dist = :id';
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('boss').AsString;
    Close;
  end;
end;

function ExistHouse(var n: integer; cl: TClient): boolean;//существует дом?
begin
  with TADOQuery.Create(Application) do
  begin
    Connection := DModule.sqlConnection;
    SQL.Clear;
    SQL.Add('select id_house');
    SQL.Add('from house');
    SQL.Add('where (id_street = :str)and(nhouse = :nh)and(corp=:cp)');
    SQL.Add('and(id_dist=:dist)');
    Parameters.ParamByName('str').Value := Cl.Data.str;
    Parameters.ParamByName('nh').Value := Cl.Data.nh;
    Parameters.ParamByName('cp').Value := Cl.Data.corp;
    Parameters.ParamByName('dist').Value := MainForm.dist;
    Open;
    if IsEmpty then
      Result := False
    else
    begin
      n := FieldByName('id_house').AsInteger;
      Result := True;
    end;
    Close;
  end;
end;

end.
