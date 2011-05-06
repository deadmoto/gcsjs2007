unit houses;

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
  StdCtrls,
  Mask,
  DBCtrls, ExtCtrls;

type
  TForm24 = class(TForm)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox2: TComboBox;
    Edit6: TEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox8: TComboBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    elevatorCheckBox: TCheckBox;
    FlowPanel1: TFlowPanel;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure Button4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox14Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    str, mng, fnd, cont, rep, cold, hot, canal, heat, gas, wood, coal, stnd, el: array of integer;
    boiler: integer;
    procedure Clear;
    function CardEmpty: bool;          //пусты ключевые поля?
    function ExistHouse(var n: integer): bool;//существует дом?
    function SelStnd(n: integer): string;//выбрать
    function SelCont(n: integer): string;//выбрать тариф
    function SelRep(n: integer): string;//выбрать тариф
    function SelCold(n: integer): string;//выбрать тариф
    function SelHot(n: integer): string;//выбрать тариф
    function SelCanal(n: integer): string;//выбрать тариф
    function SelHeat(n: integer): string;//выбрать тариф
    function SelGas(n: integer): string;//выбрать тариф
    function SelEl(n: integer): string;//выбрать тариф
    function SelWood(n: integer): string;//выбрать тариф
    function SelCoal(n: integer): string;//выбрать тариф
    procedure SetHouse(n, c: string); overload;//установить дом
    procedure Fill;
    procedure SetHouse(n: integer); overload;
    function SearchInd(cmb: TCombobox): integer;
  public
    { Public declarations }
    sec:    integer;//0 - только для чтения, 1 - запись
    status: integer;//0 - добавить, 1 - изменить, 2 - удалить
    procedure AddHouse;//добавить
    procedure ModHouse;//изменить
    procedure DelHouse;//удалить
  end;

var
  Form24: TForm24;

implementation

uses
  datamodule,
  chhouse,
  sclient,
  main,
  service,
  shtarif;

{$R *.dfm}

procedure TForm24.SetHouse(n: integer);
{ установить дом с id=n, заполнить все необходимые компоненты }
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from house inner join');
    SQL.Add('strt on house.id_street=strt.id_street inner join');
    SQL.Add('mng on house.id_mng=mng.id_mng and house.id_dist=mng.id_dist inner join');
    SQL.Add('fond on house.id_fond=fond.id_fond');
    SQL.Add('where (house.id_house = :id) and (house.id_dist = :dist)');
    ParamByName('id').AsInteger := n;
    ParamByName('dist').AsInteger := MainForm.dist;
    Open;
    Edit3.Text := FieldByName('nhouse').AsString;
    Edit4.Text := FieldByName('corp').AsString;
    Combobox1.Text := FieldByName('namestreet').AsString;
    SetHouse(Edit3.Text, Edit4.Text);
    Combobox2.Text := SelCont(FieldByName('id_cont').AsInteger);
    Combobox3.Text := SelRep(FieldByName('id_rep').AsInteger);
    Combobox4.Text := SelCold(FieldByName('id_cold').AsInteger);
    Combobox5.Text := SelHot(FieldByName('id_hot').AsInteger);
    Combobox14.Text := SelCanal(FieldByName('id_canal').AsInteger);
    Combobox6.Text := SelHeat(FieldByName('id_heat').AsInteger);
    Combobox7.Text := SelGas(FieldByName('id_gas').AsInteger);
    Combobox8.Text := SelEl(FieldByName('id_el').AsInteger);
    Combobox9.Text := SelWood(FieldByName('id_wood').AsInteger);
    Combobox10.Text := SelCoal(FieldByName('id_coal').AsInteger);
    Combobox11.Text := FieldByName('namemng').AsString;
    Combobox12.Text := FieldByName('namefond').AsString;
    Combobox13.Text := SelStnd(FieldByName('id_stnd').AsInteger);
    boiler := FieldByName('boiler').AsInteger;
    CheckBox1.Checked := (boiler = 1);
    elevatorCheckBox.Checked := (FieldByName('elevator').AsInteger = 1) ;
    Close;
    Combobox1.OnChange(combobox1);
    Combobox2.OnChange(combobox2);
    Combobox3.OnChange(combobox3);
    Combobox4.OnChange(combobox4);
    Combobox5.OnChange(combobox5);
    Combobox14.OnChange(combobox14);
    Combobox6.OnChange(combobox6);
    Combobox7.OnChange(combobox7);
    Combobox8.OnChange(combobox8);
    Combobox9.OnChange(combobox9);
    Combobox10.OnChange(combobox10);
    Combobox11.OnChange(combobox11);
    Combobox12.OnChange(combobox12);
    Combobox13.OnChange(combobox13);
    Combobox14.OnChange(combobox13);
  end;
end;

procedure TForm24.SetHouse(n, c: string);
{ установить дом с номером n и дробью c }
begin
  Edit3.Text := n;
  Edit4.Text := c;
end;

function TForm24.ExistHouse(var n: integer): bool;
{
  Функция проверяет существует ли дом, выбранный на форме. Если существует, то
  в параметр помещается значение id дома.
}
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_house');
    SQL.Add('from house');
    SQL.Add('where (id_street = :str)and (nhouse = :nh)and(corp=:cp)');
    SQL.Add('and(id_dist = :dist)');
    ParamByName('str').AsInteger := str[Combobox1.ItemIndex];
    ParamByName('nh').AsString := Edit3.Text;
    ParamByName('cp').AsString := Edit4.Text;
    ParamByName('dist').AsInteger := MainForm.dist;
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

procedure TForm24.Clear;
{ Очищает содержимое всех компонентов }
begin
  Combobox1.Clear;
  Combobox2.Clear;
  Combobox3.Clear;
  Combobox4.Clear;
  Combobox5.Clear;
  Combobox6.Clear;
  Combobox7.Clear;
  Combobox8.Clear;
  Combobox9.Clear;
  Combobox10.Clear;
  Combobox11.Clear;
  Combobox12.Clear;
  Combobox13.Clear;
  Combobox14.Clear;
  Edit3.Text := '';
  Edit4.Text := '';
  CheckBox1.Checked := False;
end;

function TForm24.CardEmpty: bool;
  { проверяет пусты ли ключевые поля }
begin
  if (Edit3.Text = '') or
    (Combobox1.Text = '') or (Combobox2.Text = '') or
    {(Combobox3.Text='') or} (Combobox4.Text = '') or
    (Combobox5.Text = '') or (Combobox6.Text = '') or
    (Combobox7.Text = '') or (Combobox8.Text = '') or
    (Combobox9.Text = '') or (Combobox10.Text = '') or
    (Combobox11.Text = '') or (Combobox12.Text = '') or
    (Combobox13.Text = '') or (Combobox14.Text = '') then
    Result := True
  else
    Result := False;
end;

procedure TForm24.Fill;
{ заполняет все компоненты }
var
  l: integer;
begin
  with DModule.Query1 do
  begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_street, namestreet');
    SQL.Add('from strt');
    SQL.Add('where status=1');
    SQL.Add('order by namestreet');
    Open;
    First;
    Combobox1.Text := FieldByName('namestreet').AsString;
    while not EOF do
    begin
      SetLength(str, Length(str) + 1);
      Combobox1.Items.Add(FieldByName('namestreet').AsString);
      str[l] := FieldByName('id_street').AsInteger;
      Next;
      Inc(l);
    end;
    Combobox1.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_mng, namemng');
    SQL.Add('from mng');
    SQL.Add('where id_dist = :dist');
    ParamByName('dist').AsInteger := MainForm.dist;
    SQL.Add('order by namemng');
    Open;
    First;
    while not EOF do
    begin
      SetLength(mng, Length(mng) + 1);
      Combobox11.Items.Add(FieldByName('namemng').AsString);
      mng[l] := FieldByName('id_mng').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_fond, namefond');
    SQL.Add('from fond');
    SQL.Add('order by namefond');
    Open;
    First;
    while not EOF do
    begin
      SetLength(fnd, Length(fnd) + 1);
      Combobox12.Items.Add(FieldByName('namefond').AsString);
      fnd[l] := FieldByName('id_fond').AsInteger;
      Next;
      Inc(l);
    end;
  end;
  with DModule.qTarif do
  begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_stnd, sbros.namestnd');
    SQL.Add('from currstnd.dbf sbros');
    SQL.Add('order by sbros.namestnd');
    Open;
    First;
    while not EOF do
    begin
      SetLength(stnd, Length(stnd) + 1);
      Combobox13.Items.Add(FieldByName('namestnd').AsString);
      stnd[l] := FieldByName('id_stnd').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_cont, sbros.namecont');
    SQL.Add('from curcont.dbf sbros');
    SQL.Add('order by sbros.namecont');
    Open;
    First;
    while not EOF do
    begin
      SetLength(cont, Length(cont) + 1);
      Combobox2.Items.Add(FieldByName('namecont').AsString);
      cont[l] := FieldByName('id_cont').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_rep, sbros.namerep');
    SQL.Add('from currep.dbf sbros');
    SQL.Add('order by sbros.namerep');
    Open;
    First;
    while not EOF do
    begin
      SetLength(rep, Length(rep) + 1);
      Combobox3.Items.Add(FieldByName('namerep').AsString);
      rep[l] := FieldByName('id_rep').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_cold, sbros.namecold');
    SQL.Add('from curcold.dbf sbros');
    SQL.Add('order by sbros.namecold');
    Open;
    First;
    while not EOF do
    begin
      SetLength(cold, Length(cold) + 1);
      Combobox4.Items.Add(FieldByName('namecold').AsString);
      cold[l] := FieldByName('id_cold').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_hot, sbros.namehot');
    SQL.Add('from curhot.dbf sbros');
    SQL.Add('order by sbros.namehot');
    Open;
    First;
    while not EOF do
    begin
      SetLength(hot, Length(hot) + 1);
      Combobox5.Items.Add(FieldByName('namehot').AsString);
      hot[l] := FieldByName('id_hot').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_canal, sbros.namecanal');
    SQL.Add('from curcanal.dbf sbros');
    SQL.Add('order by sbros.namecanal');
    Open;
    First;
    while not EOF do
    begin
      SetLength(canal, Length(canal) + 1);
      Combobox14.Items.Add(FieldByName('namecanal').AsString);
      canal[l] := FieldByName('id_canal').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_heat, sbros.nameheat');
    SQL.Add('from curheat.dbf sbros');
    SQL.Add('order by sbros.nameheat');
    Open;
    First;
    while not EOF do
    begin
      SetLength(heat, Length(heat) + 1);
      Combobox6.Items.Add(FieldByName('nameheat').AsString);
      heat[l] := FieldByName('id_heat').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_gas, sbros.namegas');
    SQL.Add('from curgas.dbf sbros');
    SQL.Add('order by sbros.namegas');
    Open;
    First;
    while not EOF do
    begin
      SetLength(gas, Length(gas) + 1);
      Combobox7.Items.Add(FieldByName('namegas').AsString);
      gas[l] := FieldByName('id_gas').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_el, sbros.plate');
    SQL.Add('from curel.dbf sbros');
    SQL.Add('order by sbros.plate');
    Open;
    First;
    while not EOF do
    begin
      SetLength(el, Length(el) + 1);
      Combobox8.Items.Add(FieldByName('plate').AsString);
      el[l] := FieldByName('id_el').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_wood, sbros.namewood');
    SQL.Add('from curwood.dbf sbros');
    SQL.Add('order by sbros.namewood');
    Open;
    First;
    while not EOF do
    begin
      SetLength(wood, Length(wood) + 1);
      Combobox9.Items.Add(FieldByName('namewood').AsString);
      wood[l] := FieldByName('id_wood').AsInteger;
      Next;
      Inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_coal, sbros.namecoal');
    SQL.Add('from curcoal.dbf sbros');
    SQL.Add('order by sbros.namecoal');
    Open;
    First;
    while not EOF do
    begin
      SetLength(coal, Length(coal) + 1);
      Combobox10.Items.Add(FieldByName('namecoal').AsString);
      coal[l] := FieldByName('id_coal').AsInteger;
      Next;
      Inc(l);
    end;
    Close;
  end;
end;

function TForm24.SearchInd(cmb: TCombobox): integer;
  { найти индекс в cmb, который соответствует строке cmb.text }
var
  i: integer;
begin
  for i := 0 to cmb.Items.Count - 1 do
  begin
    if AnsiLowerCase(cmb.Items.Strings[i]) = AnsiLowerCase(cmb.Text) then
      break;
  end;
  if i < cmb.Items.Count then
    Result := i
  else
    Result := -1;
end;

procedure TForm24.Button4Click(Sender: TObject);
{выйти}
begin
  Form24.Close;
end;

procedure TForm24.ComboBox2Change(Sender: TObject);
{ выбрали тариф на содержание жилья }
var
  ind: integer;
begin
  ind := SearchInd(Combobox2);
  if ind <> -1 then
  begin
    Combobox2.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifcont');
      SQL.Add('from curcont.dbf sbros');
      SQL.Add('where sbros.id_cont = :id');
      Parameters.ParamByName('id').Value := integer(cont[Combobox2.ItemIndex]);
      Open;
      Edit6.Text := FieldByName('tarifcont').AsString;
      Close;
    end;
  end
  else
    Combobox2.ItemIndex := 0;
end;

procedure TForm24.ComboBox3Change(Sender: TObject);
{ выбрали тариф на текущий ремонт }
var
  ind: integer;
begin
  ind := SearchInd(Combobox3);
  if ind <> -1 then
  begin
    Combobox3.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifrep');
      SQL.Add('from currep.dbf sbros');
      SQL.Add('where sbros.id_rep = :id');
      Parameters.ParamByName('id').Value := integer(rep[Combobox3.ItemIndex]);
      Open;
      Edit7.Text := FieldByName('tarifrep').AsString;
      Close;
    end;
  end
  else
    Combobox3.ItemIndex := 0;
end;

procedure TForm24.ComboBox4Change(Sender: TObject);
{ выбрали тариф на водопотребление }
var
  ind: integer;
begin
  ind := SearchInd(Combobox4);
  if ind <> -1 then
  begin
    Combobox4.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarif' + IntToStr(boiler + 1));
      SQL.Add('from curcold.dbf sbros');
      SQL.Add('where sbros.id_cold = :id');
      Parameters.ParamByName('id').Value := integer(cold[Combobox4.ItemIndex]);
      Open;
      Edit8.Text := FieldByName('tarif' + IntToStr(boiler + 1)).AsString;
      Close;
    end;
  end
  else
    Combobox4.ItemIndex := 0;
end;

procedure TForm24.ComboBox5Change(Sender: TObject);
{ выбрали тариф на горячую воду }
var
  ind: integer;
begin
  ind := SearchInd(Combobox5);
  if ind <> -1 then
  begin
    Combobox5.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarif' + IntToStr(boiler + 1));
      SQL.Add('from curhot.dbf sbros');
      SQL.Add('where sbros.id_hot = :id');
      Parameters.ParamByName('id').Value := integer(hot[Combobox5.ItemIndex]);
      Open;
      Edit9.Text := FieldByName('tarif' + IntToStr(boiler + 1)).AsString;
      Close;
    end;
  end
  else
    Combobox5.ItemIndex := 0;
end;

procedure TForm24.ComboBox14Change(Sender: TObject);
{ выбрали тариф на водоотведение }
var
  ind: integer;
begin
  ind := SearchInd(Combobox14);
  if ind <> -1 then
  begin
    Combobox14.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifcanal');
      SQL.Add('from curcanal.dbf sbros');
      SQL.Add('where sbros.id_canal = :id');
      Parameters.ParamByName('id').Value := integer(canal[Combobox14.ItemIndex]);
      Open;
      Edit2.Text := FieldByName('tarifcanal').AsString;
      Close;
    end;
  end
  else
    Combobox14.ItemIndex := 0;
end;

procedure TForm24.ComboBox6Change(Sender: TObject);
{ выбрали тариф на отопление }
var
  ind: integer;
begin
  ind := SearchInd(Combobox6);
  if ind <> -1 then
  begin
    Combobox6.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifheat');
      SQL.Add('from curheat.dbf sbros');
      SQL.Add('where sbros.id_heat = :id');
      Parameters.ParamByName('id').Value := integer(heat[Combobox6.ItemIndex]);
      Open;
      Edit10.Text := FieldByName('tarifheat').AsString;
      Close;
    end;
  end
  else
    Combobox6.ItemIndex := 0;
end;

procedure TForm24.ComboBox7Change(Sender: TObject);
{ выбрали тариф на газ }
var
  ind: integer;
begin
  ind := SearchInd(Combobox7);
  if ind <> -1 then
  begin
    Combobox7.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifgas');
      SQL.Add('from curgas.dbf sbros');
      SQL.Add('where sbros.id_gas = :id');
      Parameters.ParamByName('id').Value := integer(gas[Combobox7.ItemIndex]);
      Open;
      Edit11.Text := FieldByName('tarifgas').AsString;
      Close;
    end;
    if gas[Combobox7.ItemIndex] <> 0 then
    begin
      combobox7.Enabled := True;
      if el[Combobox8.ItemIndex] <> 1 then
      begin
        combobox8.Text := SelEl(1);
        Combobox8.OnChange(combobox8);
      end;
    end;
    if (gas[Combobox7.ItemIndex] = 0) and combobox7.Enabled then
    begin
      combobox7.Enabled := False;
      if el[Combobox8.ItemIndex] = 1 then
      begin
        combobox8.Text := SelEl(2);
        Combobox8.OnChange(combobox8);
      end;
    end;
  end
  else
    Combobox7.ItemIndex := 0;
end;

procedure TForm24.ComboBox9Change(Sender: TObject);
{ выбрали тариф на дрова }
var
  ind: integer;
begin
  ind := SearchInd(Combobox9);
  if ind <> -1 then
  begin
    Combobox9.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifwood');
      SQL.Add('from curwood.dbf sbros');
      SQL.Add('where sbros.id_wood = :id');
      Parameters.ParamByName('id').Value := integer(wood[Combobox9.ItemIndex]);
      Open;
      Edit13.Text := FieldByName('tarifwood').AsString;
      Close;
    end;
  end
  else
    Combobox9.ItemIndex := 0;
end;

procedure TForm24.ComboBox10Change(Sender: TObject);
{ выбрали тариф на уголь }
var
  ind: integer;
begin
  ind := SearchInd(Combobox10);
  if ind <> -1 then
  begin
    Combobox10.ItemIndex := ind;
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.tarifcoal');
      SQL.Add('from curcoal.dbf sbros');
      SQL.Add('where sbros.id_coal = :id');
      Parameters.ParamByName('id').Value := integer(coal[Combobox10.ItemIndex]);
      Open;
      Edit14.Text := FieldByName('tarifcoal').AsString;
      Close;
    end;
  end
  else
    Combobox10.ItemIndex := 0;
end;

procedure TForm24.ComboBox1Change(Sender: TObject);
{ выбрали улицу }
var
  ind: integer;
begin
  ind := SearchInd(Combobox1);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else
    Combobox1.ItemIndex := 0;
end;

procedure TForm24.Button1Click(Sender: TObject);
begin
  case status of
    0: AddHouse;
    1: ModHouse;
    2: DelHouse;
  end;
  Close;
end;

procedure TForm24.Button2Click(Sender: TObject);
var
  nam, namet, capt: string;
begin
  capt := 'Тарифы на содержание жилья(руб./кв.м.)';
  nam  := 'cont';
  namet := comboBox2.Text;

  Form37 := TForm37.Create(Form24);
  Form37.Caption := capt;
  Form37.nam := nam;
  Form37.namet := namet;
  Form37.ShowModal;
  if Form37.ac then
  begin
    comboBox2.Text := Form37.namet;
    comboBox2.OnChange(comboBox2);
  end;
end;

procedure TForm24.ComboBox11Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchInd(Combobox11);
  if ind <> -1 then
    Combobox11.ItemIndex := ind
  else
    Combobox11.ItemIndex := 0;
end;

procedure TForm24.ComboBox12Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchInd(Combobox12);
  if ind <> -1 then
    Combobox12.ItemIndex := ind
  else
    Combobox12.ItemIndex := 0;
end;

procedure TForm24.ComboBox13Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchInd(Combobox13);
  if ind <> -1 then
    Combobox13.ItemIndex := ind
  else
    Combobox13.ItemIndex := 0;
end;

procedure TForm24.ComboBox8Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchInd(Combobox8);
  if ind <> -1 then
  begin
    Combobox8.ItemIndex := ind;
    if el[Combobox8.ItemIndex] = 1 then
    begin//газовая
      combobox7.Enabled := True;
      if gas[Combobox7.ItemIndex] = 0 then
      begin
        combobox7.Text := SelGas(1);
        Combobox7.OnChange(combobox7);
      end;
    end;
    if (el[Combobox8.ItemIndex] <> 1) and combobox8.Enabled then
    begin
      combobox7.Enabled := False;
      if gas[Combobox7.ItemIndex] <> 0 then
      begin
        combobox7.Text := SelGas(0);
        Combobox7.OnChange(combobox7);
      end;
    end;
  end
  else
    Combobox8.ItemIndex := 0;
end;

procedure TForm24.FormShow(Sender: TObject);
begin
  Clear;
  Fill;
  if sec = 0 then
    Button1.Enabled := False
  else
    Button1.Enabled := True;
  case status of
    0:
    begin
      Form24.Caption  := 'Добавить дом';
      Button1.Caption := 'Добавить';
    end;
    1, 2:
    begin
      if status = 1 then
      begin
        EditClForm.Caption := 'Изменить/Просмотр дом';
        Button1.Caption := 'Изменить';
      end
      else
      begin
        EditClForm.Caption := 'Удалить дом';
        Button1.Caption := 'Удалить';
      end;
      SetHouse(Form30.house);
    end;
  end;
end;

procedure TForm24.AddHouse;
{ добавить дом }
var
  maxid, n: integer;
begin
  if not CardEmpty then
  begin
    if not ExistHouse(n) then
    begin
      DModule.Database1.StartTransaction;
      try
        with DModule.Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('execute maxhouse :dist');
          ParamByName('dist').AsInteger := MainForm.dist;
          Open;
          maxid := FieldByName('mid').AsInteger;
          Inc(maxid);
          Close;
          SQL.Clear;
          SQL.Add('insert into house');
          SQL.Add('values (:id, :dist,:str,:nh,:cp,:stnd,');
          SQL.Add(':cont, :rep, :cold, :hot,:canal, :heat, :gas,');
          SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil,:elevator)');
          ParamByName('id').AsInteger := maxid;
          ParamByName('dist').AsInteger := MainForm.dist;
          ParamByName('str').AsInteger := str[Combobox1.ItemIndex];
          ParamByName('nh').AsString  := Edit3.Text;
          ParamByName('cp').AsString  := Edit4.Text;
          ParamByName('stnd').AsInteger := stnd[Combobox13.ItemIndex];
          ParamByName('cont').AsInteger := cont[Combobox2.ItemIndex];
          ParamByName('rep').AsInteger := 0;//rep[Combobox3.ItemIndex];
          ParamByName('cold').AsInteger := cold[Combobox4.ItemIndex];
          ParamByName('hot').AsInteger := hot[Combobox5.ItemIndex];
          ParamByName('canal').AsInteger := canal[Combobox14.ItemIndex];
          ParamByName('heat').AsInteger := heat[Combobox6.ItemIndex];
          ParamByName('gas').AsInteger := gas[Combobox7.ItemIndex];
          ParamByName('el').AsInteger := el[Combobox8.ItemIndex];
          ParamByName('wood').AsInteger := wood[Combobox9.ItemIndex];
          ParamByName('coal').AsInteger := coal[Combobox10.ItemIndex];
          ParamByName('mng').AsInteger := mng[Combobox11.ItemIndex];
          ParamByName('fnd').AsInteger := fnd[Combobox12.ItemIndex];
          ParamByName('boil').AsInteger := boiler;
          ParamByName('elevator').AsBoolean := elevatorCheckBox.Checked;
          ExecSQL;
          Close;
        end;
        DModule.Database1.Commit;
        Form30.AddH(maxid);
      except
        //транзакция не выполнена
        DModule.Database1.Rollback;
      end;
    end
    else
    begin
      ShowMessage('Адрес должен быть уникальным!');
      Close;
    end;
  end
  else
    ShowMessage('Поля улица, №дома, распорядитель жилья, жилищный фонд, все тарифы должны быть заполнены обязательно');
end;

procedure TForm24.ModHouse;//изменить
 { изменить дом }
var
  n: integer;
begin
  if not CardEmpty then
  begin
    n := 0;
    if not ExistHouse(n) or ExistHouse(n) and (n = Form30.house) then
    begin
      DModule.Database1.StartTransaction;
      try
        with DModule.Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update house');
          SQL.Add('set id_street = :str,nhouse = :nh,corp=:cp,id_stnd=:stnd,');
          SQL.Add('id_cont = :cont, id_rep = :rep, id_cold = :cold,');
          SQL.Add('id_hot = :hot,id_canal=:canal,id_heat = :heat, id_gas = :gas,');
          SQL.Add('id_el=:el, id_wood = :wood, id_coal = :coal,');
          SQL.Add('id_mng = :mng, id_fond = :fnd, boiler = :boil, elevator = :elevator');
          SQL.Add('where (id_house = :id)and(id_dist = :dist)');
          ParamByName('id').AsInteger := Form30.house;
          ParamByName('dist').AsInteger := MainForm.dist;
          ParamByName('str').AsInteger := str[Combobox1.ItemIndex];
          ParamByName('nh').AsString  := Edit3.Text;
          ParamByName('cp').AsString  := Edit4.Text;
          ParamByName('stnd').AsInteger := stnd[Combobox13.ItemIndex];
          ParamByName('cont').AsInteger := cont[Combobox2.ItemIndex];
          ParamByName('rep').AsInteger := 0;//rep[Combobox3.ItemIndex];
          ParamByName('cold').AsInteger := cold[Combobox4.ItemIndex];
          ParamByName('hot').AsInteger := hot[Combobox5.ItemIndex];
          ParamByName('canal').AsInteger := canal[Combobox14.ItemIndex];
          ParamByName('heat').AsInteger := heat[Combobox6.ItemIndex];
          ParamByName('gas').AsInteger := gas[Combobox7.ItemIndex];
          ParamByName('el').AsInteger := el[Combobox8.ItemIndex];
          ParamByName('wood').AsInteger := wood[Combobox9.ItemIndex];
          ParamByName('coal').AsInteger := coal[Combobox10.ItemIndex];
          ParamByName('mng').AsInteger := mng[Combobox11.ItemIndex];
          ParamByName('fnd').AsInteger := fnd[Combobox12.ItemIndex];
          ParamByName('boil').AsInteger := boiler;
          ParamByName('elevator').AsBoolean := elevatorCheckBox.Checked;
          ExecSQL;
          Close;
        end;
        DModule.Database1.Commit;
        Form30.ModH(Form30.house);
      except
        //транзакция не выполнена
        DModule.Database1.Rollback;
      end;
    end
    else
      ShowMessage('Адрес должен быть уникальным!');
  end
  else
    ShowMessage('Поля улица, №дома, распорядитель жилья, жилищный фонд, все тарифы должны быть заполнены обязательно');
end;

procedure TForm24.DelHouse;
{ удалить дом }
begin
  try
    DModule.Database1.StartTransaction;
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from house');
      SQL.Add('where (id_house = :h)and(id_dist = :dist)');
      ParamByName('h').AsInteger := Form30.house;
      ParamByName('dist').AsInteger := MainForm.dist;
      ExecSQL;
      Close;
    end;
    DModule.Database1.Commit;
    Form30.Delh(Form30.house);
  except
    //не выполнена транзакция
    DModule.Database1.Rollback;
  end;
end;

function TForm24.SelStnd(n: integer): string;//выбрать
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namestnd');
    SQL.Add('from currstnd.dbf sbros');
    SQL.Add('where sbros.id_stnd = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namestnd').AsString;
    Close;
  end;
end;

function TForm24.SelCont(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecont');
    SQL.Add('from curcont.dbf sbros');
    SQL.Add('where sbros.id_cont = :id');
    Parameters.ParamByName('id').Value := integer(n);
    Open;
    Result := FieldByName('namecont').AsString;
    Close;
  end;
end;

function TForm24.SelRep(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namerep');
    SQL.Add('from currep.dbf sbros');
    SQL.Add('where sbros.id_rep = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namerep').AsString;
    Close;
  end;
end;

function TForm24.SelCold(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecold');
    SQL.Add('from curcold.dbf sbros');
    SQL.Add('where sbros.id_cold = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namecold').AsString;
    Close;
  end;
end;

function TForm24.SelHot(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namehot');
    SQL.Add('from curhot.dbf sbros');
    SQL.Add('where sbros.id_hot = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namehot').AsString;
    Close;
  end;
end;

function TForm24.SelCanal(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecanal');
    SQL.Add('from curcanal.dbf sbros');
    SQL.Add('where sbros.id_canal = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namecanal').AsString;
    Close;
  end;
end;

function TForm24.SelHeat(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.nameheat');
    SQL.Add('from curheat.dbf sbros');
    SQL.Add('where sbros.id_heat = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('nameheat').AsString;
    Close;
  end;
end;

function TForm24.SelWood(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namewood');
    SQL.Add('from curwood.dbf sbros');
    SQL.Add('where sbros.id_wood = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namewood').AsString;
    Close;
  end;
end;

function TForm24.SelCoal(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecoal');
    SQL.Add('from curcoal.dbf sbros');
    SQL.Add('where sbros.id_coal = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namecoal').AsString;
    Close;
  end;

end;

function TForm24.SelGas(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namegas');
    SQL.Add('from curgas.dbf sbros');
    SQL.Add('where sbros.id_gas = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namegas').AsString;
    Close;
  end;
end;

function TForm24.SelEl(n: integer): string;//выбрать тариф
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.plate');
    SQL.Add('from curel.dbf sbros');
    SQL.Add('where sbros.id_el = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('plate').AsString;
    Close;
  end;
end;

procedure TForm24.CheckBox1Click(Sender: TObject);
begin
  if boiler = 0 then
    boiler := 1
  else
    boiler := 0;
  combobox4.OnChange(combobox4);
  combobox5.OnChange(combobox5);
end;

procedure TForm24.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.Query1.Close;
  DModule.qTarif.Close;
end;

procedure TForm24.Edit3Exit(Sender: TObject);
begin
  CheckRus(Edit3);
end;

procedure TForm24.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(edit3);
end;

procedure TForm24.Edit4Exit(Sender: TObject);
begin
  CheckInt(edit4);
end;

procedure TForm24.Edit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(edit4);
end;

end.
