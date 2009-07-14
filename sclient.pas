unit sclient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, DBGrids, Buttons, client, contnrs,
  Mask, ExtCtrls, Menus;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Edit1: TEdit;
    GroupBox6: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    TabSheet2: TTabSheet;
    Label21: TLabel;
    TabSheet3: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox7: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    GroupBox8: TGroupBox;
    Label35: TLabel;
    Label34: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    GroupBox9: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    GroupBox10: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button8: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit20: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit19: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit63: TEdit;
    Edit64: TEdit;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    Edit66: TEdit;
    Edit68: TEdit;
    ComboBox15: TComboBox;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    Edit83: TEdit;
    ComboBox19: TComboBox;
    Edit85: TEdit;
    Edit86: TEdit;
    Edit87: TEdit;
    Edit88: TEdit;
    ComboBox16: TComboBox;
    Label62: TLabel;
    Edit89: TEdit;
    Edit90: TEdit;
    Edit91: TEdit;
    Edit92: TEdit;
    Edit93: TEdit;
    Label63: TLabel;
    Label64: TLabel;
    Edit94: TEdit;
    Edit95: TEdit;
    MaskEdit2: TMaskEdit;
    CheckBox1: TCheckBox;
    Button9: TButton;
    RadioGroup1: TRadioGroup;
    LVFam: TListView;
    Label43: TLabel;
    ComboBox10: TComboBox;
    Edit9: TEdit;
    Button6: TButton;
    RadioGroup2: TRadioGroup;
    Label65: TLabel;
    ComboBox20: TComboBox;
    Edit2: TEdit;
    Label66: TLabel;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit62: TEdit;
    Edit67: TEdit;
    Label67: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    CheckBox2: TCheckBox;
    MaskEdit3: TMaskEdit;
    Memo1: TMemo;
    Label68: TLabel;
    Edit96: TEdit;
    Edit97: TEdit;
    Edit98: TEdit;
    Edit99: TEdit;
    Edit100: TEdit;
    Edit101: TEdit;
    Edit102: TEdit;
    Edit103: TEdit;
    Edit104: TEdit;
    Edit105: TEdit;
    Edit106: TEdit;
    Label69: TLabel;
    Edit65: TEdit;
    Edit84: TEdit;
    Button1: TButton;
    Label70: TLabel;
    Edit107: TEdit;
    Label71: TLabel;
    Edit108: TEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label61: TLabel;
    Label23: TLabel;
    Edit69: TEdit;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    ComboBox7: TComboBox;
    Label19: TLabel;
    Label22: TLabel;
    Label31: TLabel;
    MaskEdit1: TMaskEdit;
    Edit72: TEdit;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button7: TButton;
    Button19: TButton;
    RadioGroup3: TRadioGroup;
    UpDown1: TUpDown;
    Edit109: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label60: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Edit110: TEdit;
    Label74: TLabel;
    Label75: TLabel;
    CheckBox3: TCheckBox;
    Label76: TLabel;
    MaskEdit4: TMaskEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure Edit60Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure LVFamSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ComboBox15Change(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox14Change(Sender: TObject);
    procedure ComboBox16Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox17Change(Sender: TObject);
    procedure ComboBox18Change(Sender: TObject);
    procedure ComboBox19Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit74Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure ComboBox20Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Edit57Exit(Sender: TObject);
    procedure Edit57KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit63Exit(Sender: TObject);
    procedure Edit63KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit64Exit(Sender: TObject);
    procedure Edit64KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit66Exit(Sender: TObject);
    procedure Edit66KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit69Exit(Sender: TObject);
    procedure Edit69KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit72Exit(Sender: TObject);
    procedure Edit72KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit83Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit111Exit(Sender: TObject);
  private
    { Private declarations }
    load, fam: boolean;
    att: integer;
    curmonth: integer;//текущий месяц
    curprc: integer;//текущий процент расхода тепла
    curman: integer;//текущий член семьи
    str, mng, fnd, cntrl, settl, own, st, p, rel, bank: array of integer;
    cont, rep, cold, canal,hot, heat, gas, wood, coal, stnd: array of integer;
    function AddClient: integer;  //добавить клиента
    function ModifyClient: integer; //изменить клиента
    procedure Clear;//очистить нужные поля
    procedure Fill;//заполнить Combobox
    procedure FillLV;//заполнить List View из family
    procedure SetData;//установить все данные
    function CalcEmpty: bool;
    function CardEmpty: bool;//пусты ключевые поля?
    function CardEmptyEx: bool;//проверяет поля необходимые для изменения записи
    function ExistHouse(var n: integer): bool;//существует дом?
    function ExistClient(var n: integer): bool;
    function ExistMem: bool;
    function ExistMemEx(var n: integer): bool;
    procedure SumV;//суммировать начисления
    procedure SetVCalc;//вывести результаты расчета субсидии
    procedure SetRegn;
    procedure SetRegDate;
    procedure SetPeriod;
    procedure SetCert;
    procedure SetIncome;
    procedure SetKoef;//сд/пм & рпс/рпп
    procedure SetHouse(s: integer;n,c: string);//установить дом
    function SearchStnd(s: string): integer;
    function SearchStreet(s: string): integer;
    function SearchMng(s: string): integer;
    function SearchFnd(s: string): integer;
    function SearchSettl(s: string): integer;
    function SearchOwn(s: string): integer;
    function SearchCntrl(s: string): integer;
    function SearchSt(s: string): integer;
    function SearchPriv(s: string): integer;
    function SearchCont(s: string): integer;
    function SearchRep(s: string): integer;
    function SearchCold(s: string): integer;
    function SearchCanal(s: string): integer;
    function SearchHot(s: string): integer;
    function SearchHeat(s: string): integer;
    function SearchGas(s: string): integer;
    function SearchCoal(s: string): integer;
    function SearchWood(s: string): integer;
    function SearchBank(s: string): integer;
    function SearchRel(s: string): integer;
    function SelInsp(n: integer): string;//выбрать инспектора
    function SelStr(n: integer): string;//выбрать улицу
    function SelMng(n: integer): string;//выбрать распорядителя
    function SelFnd(n: integer): string;//выбрать фонд
    function SelSettl(n: integer): string;//выбрать тип заселения
    function SelOwn(n: integer): string;//выбрать тип владения
    function SelCntrl(n: integer): string;//выбрать тип контроля
    function SelSt(n: integer): string;//выбрать тип статуса
    function SelPriv(n: integer): string;//выбрать льготу
    function SelCont(n: integer): string;//выбрать тариф
    function SelRep(n: integer): string;//выбрать тариф
    function SelCold(n: integer): string;//выбрать тариф
    function SelCanal(n: integer): string;//выбрать тариф
    function SelHot(n: integer): string;//выбрать тариф
    function SelHeat(n: integer): string;//выбрать тариф
    function SelGas(n: integer): string;//выбрать тариф
    function SelWood(n: integer): string;//выбрать тариф
    function SelCoal(n: integer): string;//выбрать тариф
    function SelBank(n: integer): string;//выбрать банк
    function SelRel(n: integer): string;
    function SelStnd(n: integer): string;
    function SelMin(n: integer): real;
    function CheckPers: boolean;
    function CheckLS(s: string): boolean;overload;
    function CheckLS: boolean;overload;
    function CheckMems: boolean;
    function CheckCountMem: boolean;
    procedure SortFam;
    procedure NewPeriod;
    procedure SetDefault;
    function ErrorMessage: boolean;
    function IsAPeriod: boolean;
    procedure AddFamMan;
    procedure ModFamMan;
  public
    { Public declarations }
    status: integer;//0-добавить,1-изменить
  end;

var
  Form2: TForm2;
  Cl: TClient;

implementation

uses main, math, service, datamodule, dateutils, shtarif, shtarifb, chpriv,
  chinsp, FactSumUnit;

{$R *.dfm}

function TForm2.ErrorMessage: boolean;
var
  s,s1: string;
begin
  s1 := 'Недостаточно данных:'+#13;
  s := '';
  Result := false;
  if not IsRus(Edit57.Text)or(Edit57.Text='') then
    s := s+'фамилия клиента введена неверно или не введена вовсе;'+#13;
  if not IsRus(Edit60.Text)or(Edit60.Text='') or not IsNumber(Edit61.Text) then
    s := s+'адрес клиента введен неверно или не введен вовсе;'+#13;
  if not ExistMem then
    s := s+'фио клиента не существует в семье;'+#13;
  if (LVFam.Items.Count<>StrToInt(Edit68.Text))then
    s := s+'семья клиента не заполнена;'+#13;
  {if not CheckMems and not CheckBox1.Checked then
    s := s+'социальные статусы одного или нескольких членов семьи введены неправильно;'+#13;
{  if not CheckLS then
    s := s+'лицевые счета клиента введены неверно или не введены вовсе;'+#13; }
  if not CheckPers then
    s := s+'ПСС клиента введен неверно или не введен вовсе;'+#13;
  if ((Edit12.Text='') or (Edit15.Text='') or (Edit18.Text='') or//базовые данные
      (Edit21.Text='') or (Edit24.Text='') or (Edit27.Text='') or
      (Edit30.Text='') or (Edit33.Text='') or (Edit36.Text='') or
      (Edit59.Text='') or (Edit65.Text='')or
      (Edit96.Text='') or (Edit97.Text='') or (Edit98.Text='') or//текущие данные
      (Edit99.Text='') or (Edit100.Text='') or (Edit101.Text='') or
      (Edit102.Text='') or (Edit103.Text='') or (Edit104.Text='') or
      (Edit105.Text='') or (Edit84.Text=''))and CheckBox1.Checked then
    s := s+'данные для индивидуального расчета введены неверно или не введены вовсе;'+#13;
  if s<>'' then begin
    s1 := s1+s;
    ShowMessage(s1);
    Result := true;
  end;
end;

procedure TForm2.SetDefault;
begin
  if load then begin
    Cl.cdata.calc := 0;
    Cl.cdata.mdd := RadioGroup3.ItemIndex;
    Cl.data.insp := Form1.insp;
    Cl.data.dist := Form1.dist;
    Cl.data.change := Date;
    Cl.data.declar := Date;
    Cl.data.str := str[Combobox12.ItemIndex];
    Cl.cdata.rstnd := stnd[Combobox10.ItemIndex];
    Cl.data.control := cntrl[Combobox11.ItemIndex];
    Cl.data.settl := settl[Combobox14.ItemIndex];

    Cl.data.own := own[Combobox16.ItemIndex];
    Cl.data.manager := mng[Combobox15.ItemIndex];
    Cl.data.fond := fnd[Combobox13.ItemIndex];
    Cl.data.bank := bank[Combobox19.ItemIndex];
    Cl.cdata.boiler := 0;
    Cl.cdata.stop := 0;
    SetRegn;
    SetRegDate;
    SetPeriod;
    Cl.cdata.settl := settl[Combobox14.ItemIndex]; // добавил 28.12.2006
    Cl.cdata.tarifs[0] := cont[Combobox1.ItemIndex];
    Cl.cdata.tarifs[1] := rep[Combobox2.ItemIndex];
    Cl.cdata.tarifs[2] := cold[Combobox3.ItemIndex];
    Cl.cdata.tarifs[3] := hot[Combobox4.ItemIndex];
    Cl.cdata.tarifs[4] := canal[Combobox20.ItemIndex];
    Cl.cdata.tarifs[5] := heat[Combobox5.ItemIndex];
    Cl.cdata.tarifs[6] := gas[Combobox6.ItemIndex];
    Cl.cdata.tarifs[7] := RadioGroup2.ItemIndex+1;
    Cl.cdata.tarifs[12] := wood[Combobox8.ItemIndex];
    Cl.cdata.tarifs[13] := coal[Combobox9.ItemIndex];
    Cl.cdata.cost[0] := GetCostTarif(0,Cl.cdata.tarifs[0],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[1] := GetCostTarif(1,Cl.cdata.tarifs[1],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[2] := GetCostTarif(2,Cl.cdata.tarifs[2],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[3] := GetCostTarif(3,Cl.cdata.tarifs[3],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[4] := GetCostTarif(4,Cl.cdata.tarifs[4],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[5] := GetCostTarif(5,Cl.cdata.tarifs[5],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[6] := GetCostTarif(6,Cl.cdata.tarifs[6],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[7] := GetCostTarif(7,Cl.cdata.tarifs[7],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[12] := GetCostTarif(12,Cl.cdata.tarifs[12],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
    Cl.cdata.cost[13] := GetCostTarif(13,Cl.cdata.tarifs[13],Cl.cdata.begindate,Cl.cdata.boiler,0,Cl.cdata.settl);
  end;
end;

function TForm2.CalcEmpty: bool;
var
  sts: integer;
begin
  sts := Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate);
  if (//индивидуальный расчет
      ((sts=0)or(sts=4))and((Edit12.Text='')or(Edit15.Text='')or//базовые данные
      (Edit18.Text='')or(Edit21.Text='')or(Edit24.Text='')or
      (Edit27.Text='')or(Edit30.Text='')or(Edit33.Text='')or
      (Edit36.Text='')or(Edit59.Text='')or(Edit65.Text=''))or
      (sts>0)and(sts<4)and((Edit96.Text='')or (Edit97.Text='')or//текущие данные
      (Edit98.Text='')or(Edit99.Text='')or(Edit100.Text='')or
      (Edit101.Text='')or(Edit102.Text='')or(Edit103.Text='')or
      (Edit104.Text='')or(Edit105.Text='')or(Edit84.Text=''))
      )and CheckBox1.Checked or CardEmpty  or
      not ExistMem and not CheckBox1.Checked or
      not CheckCountMem and not CheckBox1.Checked then
    Result := true
  else
    Result := false;
end;

function TForm2.CardEmpty: bool;//пусты ключевые поля?
begin
  if (Edit110.Text ='') or (Edit66.Text='') or (Edit68.Text='') or (Edit95.Text='') or
     (Edit73.Text='') or (Edit94.Text='')  or
     (Combobox1.Text='') or (Combobox2.Text='') or
     (Combobox3.Text='') or (Combobox4.Text='') or
     (Combobox5.Text='') or (Combobox6.Text='') or
     (Combobox8.Text='') or (Combobox9.Text='') or
     (Combobox20.Text='') or (Combobox10.Text='') or
     (LVFam.Items.Count = 0) and not CheckBox1.Checked then
     Result := true
  else
    Result := false;
end;

function TForm2.CardEmptyEx: bool;//проверяет поля необходимые для изменения записи
begin
  if (Edit57.Text='') or (Edit60.Text='') or (Edit66.Text='') or (Edit110.Text ='') or
      (Edit73.Text='') or (Edit74.Text='') or (Edit94.Text='') or
      (Edit95.Text='') or
      (Combobox1.Text='') or {(Combobox2.Text='') or}
      (Combobox3.Text='') or (Combobox4.Text='') or
      (Combobox5.Text='') or (Combobox6.Text='') or
      (Combobox8.Text='') or (Combobox9.Text='') or
      (Combobox10.Text='') or (Combobox11.Text='') or
      (Combobox12.Text='') or (Combobox13.Text='') or
      (Combobox14.Text='') or (Combobox15.Text='') or
      (Combobox16.Text='') or (Combobox20.Text='') or
      (LVFam.Items.Count = 0)and not CheckBox1.Checked  then
      Result := true
  else
    Result := false;
end;

procedure TForm2.Clear;//очистить нужные поля
begin
  Edit12.Text := '0'; Edit13.Text := '0'; Edit14.Text := '0';
  Edit15.Text := '0'; Edit16.Text := '0'; Edit17.Text := '0';
  Edit18.Text := '0'; Edit19.Text := '0'; Edit20.Text := '0';
  Edit21.Text := '0'; Edit22.Text := '0'; Edit23.Text := '0';
  Edit24.Text := '0'; Edit25.Text := '0'; Edit26.Text := '0';
  Edit27.Text := '0'; Edit28.Text := '0'; Edit29.Text := '0';
  Edit30.Text := '0'; Edit31.Text := '0'; Edit32.Text := '0';
  Edit33.Text := '0'; Edit34.Text := '0'; Edit35.Text := '0';
  Edit36.Text := '0'; Edit37.Text := '0'; Edit38.Text := '0';
  Edit39.Text := '0'; Edit40.Text := '0'; Edit41.Text := '0';
  Edit42.Text := '0'; Edit43.Text := '0'; Edit44.Text := '0';
  Edit45.Text := '0'; Edit46.Text := '0'; Edit47.Text := '0';
  Edit48.Text := '0'; Edit49.Text := '0'; Edit50.Text := '0';
  Edit51.Text := '0'; Edit52.Text := '0'; Edit53.Text := '0';
  Edit54.Text := '0'; Edit55.Text := '0'; Edit56.Text := '0';
  Edit59.Text := '0'; Edit62.Text := '0'; Edit67.Text := '0';
  Edit70.Text := '0'; Edit71.Text := '0';
  Edit57.Text := ''; Edit58.Text := '';
  Edit60.Text := ''; Edit61.Text := ''; Edit63.Text := '';
  Edit64.Text := '';
  Edit65.Text := '0'; Edit66.Text := '0'; Edit110.Text := '0'; Edit68.Text := '0';
  Edit69.Text := '';
  Edit72.Text := '0'; Edit73.Text := '0';
  Edit74.Text := ''; Edit75.Text := ''; Edit76.Text := '';
  Edit77.Text := ''; Edit78.Text := ''; Edit79.Text := '';
  Edit80.Text := ''; Edit81.Text := ''; Edit82.Text := '';
  Edit83.Text := '';
  Edit84.Text := '0'; Edit85.Text := '0';
  Edit86.Text := ''; Edit87.Text := ''; Edit88.Text := '';
  Edit89.Text := '0';
  Edit90.Text := '0'; Edit91.Text := '0'; Edit92.Text := '0';
  Edit93.Text := '0'; Edit94.Text := '0'; Edit95.Text := '0';
  Edit96.Text := '0'; Edit97.Text := '0'; Edit98.Text := '0';
  Edit99.Text := '0';  Edit100.Text := '0'; Edit101.Text := '0';
  Edit102.Text := '0'; Edit103.Text := '0'; Edit104.Text := '0';
  Edit105.Text := '0'; Edit106.Text := '0'; MaskEdit4.Text:= '';
  Combobox1.Clear;Combobox2.Clear;Combobox3.Clear;Combobox4.Clear;
  Combobox5.Clear;Combobox6.Clear;Combobox7.Clear;Combobox8.Clear;
  Combobox9.Clear;Combobox10.Clear;Combobox11.Clear;Combobox12.Clear;
  Combobox13.Clear;Combobox14.Clear;Combobox15.Clear;Combobox16.Clear;
  Combobox17.Clear;Combobox18.Clear;Combobox19.Clear;Combobox20.Clear;
  LVFam.Items.Clear; Memo1.Clear;
  curprc := 0; curman := 0;
  RadioGroup1.Items.Clear;RadioGroup3.Items.Clear;
  SetLength(str,0);SetLength(mng,0);SetLength(fnd,0);SetLength(cntrl,0);
  SetLength(settl,0);SetLength(own,0);SetLength(st,0);SetLength(p,0);
  SetLength(rel,0);SetLength(bank,0);
  SetLength(cont,0);SetLength(rep,0);SetLength(cold,0);
  SetLength(hot,0);SetLength(heat,0);SetLength(gas,0);
  SetLength(wood,0);SetLength(coal,0);SetLength(stnd,0);
  SetLength(canal,0);
  CheckBox1.Checked := false;CheckBox2.Checked := false; CheckBox3.Checked := false;
end;

procedure TForm2.Fill;
{
  заполнить списки у combobox, выбрать radiobutton
  создать массивы, содержащие соответствующие combobox id
}
var
  l: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select pcharge');
    SQL.Add('from charge');
    SQL.Add('where id_month = :id');
    ParamByName('id').AsInteger := curmonth;
    Open;
    curprc := FieldByName('pcharge').AsInteger;
    Close;
    SQL.Clear;
    SQL.Add('select namecert');
    SQL.Add('from cert');
    SQL.Add('order by id_cert');
    Open;
    First;
    while not eof do begin
      RadioGroup1.Items.Add(FieldByName('namecert').AsString);
      Next;
    end;
    RadioGroup1.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from bank');
    SQL.Add('order by namebank');
    Open;
    First;
    while not EOF do begin
      SetLength(bank, Length(bank)+1);
      Combobox19.Items.Add(FieldByName('namebank').AsString);
      bank[l] := FieldByName('id_bank').AsInteger;
      if bank[l]=0 then
        Combobox19.ItemIndex := l;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from rel');
    SQL.Add('order by namerel');
    Open;
    First;
    while not EOF do begin
      SetLength(rel, Length(rel)+1);
      Combobox7.Items.Add(FieldByName('namerel').AsString);
      rel[l] := FieldByName('id_rel').AsInteger;
      Next;
      inc(l);
    end;
    Combobox7.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_street, namestreet');
    SQL.Add('from strt');
    SQL.Add('where status=1');
    SQL.Add('order by namestreet');
    Open;
    First;
    while not EOF do begin
      SetLength(str, Length(str)+1);
      Combobox12.Items.Add(FieldByName('namestreet').AsString);
      str[l] := FieldByName('id_street').AsInteger;
      Next;
      inc(l);
    end;
    combobox12.ItemIndex := 0;
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:dist)');
    ParamByName('id').AsInteger := Form1.insp;
    ParamByName('dist').AsInteger := Form1.dist;
    Open;
    Edit86.Text := FieldByName('nameinsp').AsString;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_cntrl, namecntrl');
    SQL.Add('from cntrl');
    SQL.Add('order by namecntrl');
    Open;
    First;
    while not EOF do begin
      SetLength(cntrl, Length(cntrl)+1);
      Combobox11.Items.Add(FieldByName('namecntrl').AsString);
      cntrl[l] := FieldByName('id_cntrl').AsInteger;
      if cntrl[l]=0 then
        Combobox11.ItemIndex := l;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_mng, namemng');
    SQL.Add('from mng');
    SQL.Add('where id_dist = :dist');
    SQL.Add('order by namemng');
    ParamByName('dist').AsInteger := Form1.dist;
    Open;
    First;
    while not EOF do begin
      SetLength(mng, Length(mng)+1);
      Combobox15.Items.Add(FieldByName('namemng').AsString);
      mng[l] := FieldByName('id_mng').AsInteger;
      Next;
      inc(l);
    end;
    Combobox15.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_fond, namefond');
    SQL.Add('from fond');
    SQL.Add('order by namefond');
    Open;
    First;
    while not EOF do begin
      SetLength(fnd, Length(fnd)+1);
      Combobox13.Items.Add(FieldByName('namefond').AsString);
      fnd[l] := FieldByName('id_fond').AsInteger;
      Next;
      inc(l);
    end;
    Combobox13.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_settl, namesettl');
    SQL.Add('from settl');
    SQL.Add('order by namesettl');
    Open;
    First;
    while not EOF do begin
      SetLength(settl, Length(settl)+1);
      Combobox14.Items.Add(FieldByName('namesettl').AsString);
      settl[l] := FieldByName('id_settl').AsInteger;
      Next;
      inc(l);
    end;
    Combobox14.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_own, nameown');
    SQL.Add('from own');
    SQL.Add('order by nameown');
    Open;
    First;
    while not EOF do begin
      SetLength(own, Length(own)+1);
      Combobox16.Items.Add(FieldByName('nameown').AsString);
      own[l] := FieldByName('id_own').AsInteger;
      Next;
      inc(l);
    end;
    Combobox16.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_status, namestatus');
    SQL.Add('from stat');
    SQL.Add('order by namestatus');
    Open;
    First;
    while not EOF do begin
      SetLength(st, Length(st)+1);
      Combobox17.Items.Add(FieldByName('namestatus').AsString);
      st[l] := FieldByName('id_status').AsInteger;
      Next;
      inc(l);
    end;
    Combobox17.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_priv, namepriv');
    SQL.Add('from priv');
    SQL.Add('order by namepriv');
    Open;
    First;
    while not EOF do begin
      SetLength(p, Length(p)+1);
      Combobox18.Items.Add(FieldByName('namepriv').AsString);
      p[l] := FieldByName('id_priv').AsInteger;
      Next;
      inc(l);
    end;
    Combobox18.ItemIndex := 0;
  end;
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from "curmdd.dbf" sbros');
    SQL.Add('order by sbros.id_mdd');
    Open;
    First;
    while not eof do begin
      RadioGroup3.Items.Add(FieldByName('vmdd').AsString);
      Next;
    end;
    RadioGroup3.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_stnd, sbros.namestnd');
    SQL.Add('from "currstnd.dbf" sbros');
    SQL.Add('order by sbros.namestnd');
    Open;
    First;
    while not EOF do begin
      SetLength(stnd, Length(stnd)+1);
      Combobox10.Items.Add(FieldByName('namestnd').AsString);
      stnd[l] := FieldByName('id_stnd').AsInteger;
      if stnd[l]=0 then
        Combobox10.ItemIndex := l;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_cont, sbros.namecont');
    SQL.Add('from "curcont.dbf" sbros');
    SQL.Add('order by sbros.namecont');
    Open;
    First;
    while not EOF do begin
      SetLength(cont, Length(cont)+1);
      Combobox1.Items.Add(FieldByName('namecont').AsString);
      cont[l] := FieldByName('id_cont').AsInteger;
      Next;
      inc(l);
    end;
    Combobox1.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_rep, sbros.namerep');
    SQL.Add('from "currep.dbf" sbros');
    SQL.Add('order by sbros.namerep');
    Open;
    First;
    while not EOF do begin
      SetLength(rep, Length(rep)+1);
      Combobox2.Items.Add(FieldByName('namerep').AsString);
      rep[l] := FieldByName('id_rep').AsInteger;
      Next;
      inc(l);
    end;
    Combobox2.ItemIndex := SearchRep(SelRep(0));
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_cold, sbros.namecold');
    SQL.Add('from "curcold.dbf" sbros');
    SQL.Add('order by sbros.namecold');
    Open;
    First;
    while not EOF do begin
      SetLength(cold, Length(cold)+1);
      Combobox3.Items.Add(FieldByName('namecold').AsString);
      cold[l] := FieldByName('id_cold').AsInteger;
      Next;
      inc(l);
    end;
    Combobox3.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from "curcanal.dbf" sbros');
    SQL.Add('order by sbros.namecanal');
    Open;
    First;
    while not EOF do begin
      SetLength(canal, Length(canal)+1);
      Combobox20.Items.Add(FieldByName('namecanal').AsString);
      canal[l] := FieldByName('id_canal').AsInteger;
      if canal[l]=8 then
        Combobox20.ItemIndex := l;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_hot, sbros.namehot');
    SQL.Add('from "curhot.dbf" sbros');
    SQL.Add('order by sbros.namehot');
    Open;
    First;
    while not EOF do begin
      SetLength(hot, Length(hot)+1);
      Combobox4.Items.Add(FieldByName('namehot').AsString);
      hot[l] := FieldByName('id_hot').AsInteger;
      Next;
      inc(l);
    end;
    Combobox4.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_heat, sbros.nameheat');
    SQL.Add('from "curheat.dbf" sbros');
    SQL.Add('order by sbros.nameheat');
    Open;
    First;
    while not EOF do begin
      SetLength(heat, Length(heat)+1);
      Combobox5.Items.Add(FieldByName('nameheat').AsString);
      heat[l] := FieldByName('id_heat').AsInteger;
      Next;
      inc(l);
    end;
    Combobox5.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from "curgas.dbf" sbros');
    SQL.Add('order by sbros.namegas');
    Open;
    First;
    while not EOF do begin
      SetLength(gas, Length(gas)+1);
      Combobox6.Items.Add(FieldByName('namegas').AsString);
      gas[l] := FieldByName('id_gas').AsInteger;
      if gas[l]=1 then
        Combobox6.ItemIndex := l;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_wood, sbros.namewood');
    SQL.Add('from "curwood.dbf" sbros');
    SQL.Add('order by sbros.namewood');
    Open;
    First;
    while not EOF do begin
      SetLength(wood, Length(wood)+1);
      Combobox8.Items.Add(FieldByName('namewood').AsString);
      wood[l] := FieldByName('id_wood').AsInteger;
      if wood[l]=0 then
        Combobox8.ItemIndex := l;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_coal, sbros.namecoal');
    SQL.Add('from "curcoal.dbf" sbros');
    SQL.Add('order by sbros.namecoal');
    Open;
    First;
    while not EOF do begin
      SetLength(coal, Length(coal)+1);
      Combobox9.Items.Add(FieldByName('namecoal').AsString);
      coal[l] := FieldByName('id_coal').AsInteger;
      if coal[l]=0 then
        Combobox9.ItemIndex := l;
      Next;
      inc(l);
    end;
    Close;
  end;
  combobox1.OnChange(combobox1);
  combobox2.OnChange(combobox2);
  combobox3.OnChange(combobox3);
  combobox4.OnChange(combobox4);
  combobox5.OnChange(combobox5);
  combobox6.OnChange(combobox6);
  combobox7.OnChange(combobox7);
  combobox8.OnChange(combobox8);
  combobox9.OnChange(combobox9);
  combobox20.OnChange(combobox20);
  combobox10.OnChange(combobox10);
  combobox11.OnChange(combobox11);
  combobox13.OnChange(combobox13);
  combobox14.OnChange(combobox14);
  combobox15.OnChange(combobox15);
  combobox16.OnChange(combobox16);
  combobox17.OnChange(combobox17);
  combobox18.OnChange(combobox18);
  combobox19.OnChange(combobox19);
end;

procedure TForm2.FillLV;//заполнить List View
var
  i: integer;
  item: TListItem;
begin
  LVFam.Items.Clear;
  for i:=0 to Cl.cdata.family.Count-1 do begin
    item := LVFam.Items.Add;
    item.Caption := TMan(Cl.cdata.family.Items[i]).fio;
    item.SubItems.Add(DateToStr(TMan(Cl.cdata.family.Items[i]).birth));
    item.SubItems.Add(FlToStr(Cl.cdata.mid[i]));
    item.SubItems.Add(FlToStr(SelMin(Cl.cdata.min[i])));
    item.SubItems.Add(SelRel(TMan(Cl.cdata.family.Items[i]).rel));
  end;
  if Cl.cdata.family.Count<>0 then
    LVFam.ItemIndex := curman;
end;

procedure TForm2.SetData;
{
  установить все данные
  используется единожды при активации формы
}
var
  i: integer;
begin
  if Cl.cdata.family.Count>0 then begin
    for i:=0 to Cl.cdata.family.Count-1 do
      if TMan(Cl.cdata.family[i]).fio=Cl.data.fio then begin
          TMan(Cl.cdata.family[i]).rel := 1;
          curman := i;
          break;
      end;
  end
  else
    curman := 0;
  if Cl.cdata.family.Count=Cl.cdata.mcount then
    fam := true
  else
    fam := false;
  SetHouse(Cl.data.str, Cl.data.nh, Cl.data.corp);
  Edit57.Text := Cl.data.fio;
  Edit85.Text := '0'+IntToStr(Cl.data.regn);
  Edit87.Text := DateToStr(Cl.data.regdate);
  Edit86.Text := SelInsp(Cl.data.insp);
  Edit88.Text := DateToStr(Cl.data.change);
  MaskEdit4.Text:= DateToStr(Cl.data.declar);
  Edit63.Text := Cl.data.apart;
  Edit64.Text := Cl.data.tel;
  Combobox15.Text := SelMng(Cl.data.manager);
  Combobox13.Text := SelFnd(Cl.data.fond);
  Combobox14.Text := SelSettl(Cl.data.settl);
  Combobox16.Text := SelOwn(Cl.data.own);
  Edit110.Text := FlToStr(Cl.cdata.lsquare);
  Edit66.Text := FlToStr(Cl.cdata.square);
  RadioGroup3.ItemIndex := Cl.cdata.mdd;
  Edit68.Text := IntToStr(Cl.cdata.mcount);
  Edit95.Text := IntToStr(Cl.cdata.quanpriv);
  MaskEdit2.Text := DateToStr(Cl.cdata.begindate);
  MaskEdit3.Text := DateToStr(Cl.cdata.enddate);
  Edit109.Text := IntToStr(Cl.cdata.period);
  Combobox11.Text := SelCntrl(Cl.data.control);
  Memo1.Text := Cl.data.reason;
  Edit73.Text := FlToStr(Cl.cdata.income);
  Edit94.Text := FlToStr(Cl.cdata.pmin);
  if Cl.cdata.family.Count>0 then begin
    Edit69.Text := TMan(Cl.cdata.family[curman]).fio;
    MaskEdit1.Text := DateToStr(TMan(Cl.cdata.family[curman]).birth);
    Combobox7.Text := SelRel(TMan(Cl.cdata.family[curman]).rel);
    Combobox17.Text := SelSt(TMan(Cl.cdata.family[curman]).status);
    Combobox18.Text := SelPriv(TMan(Cl.cdata.family[curman]).priv);
    Edit72.Text := FlToStr(TMan(Cl.cdata.family[curman]).mid);
  end;
  CheckBox2.Checked := (Cl.cdata.boiler=1);
  Combobox1.Text := SelCont(Cl.cdata.tarifs[0]);
  Combobox2.Text := SelRep(Cl.cdata.tarifs[1]);
  Combobox3.Text := SelCold(Cl.cdata.tarifs[2]);
  Combobox4.Text := SelHot(Cl.cdata.tarifs[3]);
  Combobox20.Text := SelCanal(Cl.cdata.tarifs[4]);
  Combobox5.Text := SelHeat(Cl.cdata.tarifs[5]);
  Combobox6.Text := SelGas(Cl.cdata.tarifs[6]);
  Combobox8.Text := SelWood(Cl.cdata.tarifs[12]);
  Combobox9.Text := SelCoal(Cl.cdata.tarifs[13]);
  Combobox10.Text := SelStnd(Cl.cdata.rstnd);
  Combobox19.Text := SelBank(Cl.data.bank);
  if Cl.cdata.tarifs[7]>0 then
    RadioGroup2.ItemIndex := Cl.cdata.tarifs[7]-1
  else
    RadioGroup2.ItemIndex := 0;
  Edit74.Text := Cl.cdata.accounts[0];
  Edit75.Text := Cl.cdata.accounts[1];
  Edit76.Text := Cl.cdata.accounts[2];
  Edit77.Text := Cl.cdata.accounts[3];
  Edit58.Text := Cl.cdata.accounts[4];
  Edit78.Text := Cl.cdata.accounts[5];
  Edit79.Text := Cl.cdata.accounts[6];
  Edit80.Text := Cl.cdata.accounts[7];
  Edit81.Text := Cl.cdata.accounts[12];
  Edit82.Text := Cl.cdata.accounts[13];
  Edit83.Text := Cl.data.acbank;
  CheckBox1.Checked := (Cl.cdata.calc = 1);
  //1 месяц
  Edit12.Text := FlToStr(Cl.cdata.bpm[0]);
  Edit13.Text := FlToStr(Cl.cdata.bsnpm[0]);
  Edit14.Text := FlToStr(Cl.cdata.bsub[0]);
  Edit15.Text := FlToStr(Cl.cdata.bpm[1]);
  Edit16.Text := FlToStr(Cl.cdata.bsnpm[1]);
  Edit17.Text := FlToStr(Cl.cdata.bsub[1]);
  Edit18.Text := FlToStr(Cl.cdata.bpm[2]);
  Edit19.Text := FlToStr(Cl.cdata.bsnpm[2]);
  Edit20.Text := FlToStr(Cl.cdata.bsub[2]);
  Edit21.Text := FlToStr(Cl.cdata.bpm[3]);
  Edit22.Text := FlToStr(Cl.cdata.bsnpm[3]);
  Edit23.Text := FlToStr(Cl.cdata.bsub[3]);
  Edit59.Text := FlToStr(Cl.cdata.bpm[4]);
  Edit62.Text := FlToStr(Cl.cdata.bsnpm[4]);
  Edit67.Text := FlToStr(Cl.cdata.bsub[4]);
  Edit24.Text := FlToStr(Cl.cdata.bpm[5]);
  Edit25.Text := FlToStr(Cl.cdata.bsnpm[5]);
  Edit26.Text := FlToStr(Cl.cdata.bsub[5]);
  Edit27.Text := FlToStr(Cl.cdata.bpm[6]);
  Edit28.Text := FlToStr(Cl.cdata.bsnpm[6]);
  Edit29.Text := FlToStr(Cl.cdata.bsub[6]);
  Edit30.Text := FlToStr(Cl.cdata.bpm[7]);
  Edit31.Text := FlToStr(Cl.cdata.bsnpm[7]);
  Edit32.Text := FlToStr(Cl.cdata.bsub[7]);
  Edit33.Text := FlToStr(Cl.cdata.bpm[12]);
  Edit34.Text := FlToStr(Cl.cdata.bsnpm[12]);
  Edit35.Text := FlToStr(Cl.cdata.bsub[12]);
  Edit36.Text := FlToStr(Cl.cdata.bpm[13]);
  Edit37.Text := FlToStr(Cl.cdata.bsnpm[13]);
  Edit38.Text := FlToStr(Cl.cdata.bsub[13]);
  //
  Edit96.Text := FlToStr(Cl.cdata.pm[0]);
  Edit39.Text := FlToStr(Cl.cdata.snpm[0]);
  Edit40.Text := FlToStr(Cl.cdata.sub[0]);
  Edit97.Text := FlToStr(Cl.cdata.pm[1]);
  Edit41.Text := FlToStr(Cl.cdata.snpm[1]);
  Edit42.Text := FlToStr(Cl.cdata.sub[1]);
  Edit98.Text := FlToStr(Cl.cdata.pm[2]);
  Edit43.Text := FlToStr(Cl.cdata.snpm[2]);
  Edit44.Text := FlToStr(Cl.cdata.sub[2]);
  Edit99.Text := FlToStr(Cl.cdata.pm[3]);
  Edit45.Text := FlToStr(Cl.cdata.snpm[3]);
  Edit46.Text := FlToStr(Cl.cdata.sub[3]);
  Edit100.Text := FlToStr(Cl.cdata.pm[4]);
  Edit70.Text := FlToStr(Cl.cdata.snpm[4]);
  Edit71.Text := FlToStr(Cl.cdata.sub[4]);
  Edit101.Text := FlToStr(Cl.cdata.pm[5]);
  Edit47.Text := FlToStr(Cl.cdata.snpm[5]);
  Edit48.Text := FlToStr(Cl.cdata.sub[5]);
  Edit102.Text := FlToStr(Cl.cdata.pm[6]);
  Edit49.Text := FlToStr(Cl.cdata.snpm[6]);
  Edit50.Text := FlToStr(Cl.cdata.sub[6]);
  Edit103.Text := FlToStr(Cl.cdata.pm[7]);
  Edit51.Text := FlToStr(Cl.cdata.snpm[7]);
  Edit52.Text := FlToStr(Cl.cdata.sub[7]);
  Edit104.Text := FlToStr(Cl.cdata.pm[12]);
  Edit53.Text := FlToStr(Cl.cdata.snpm[12]);
  Edit105.Text := FlToStr(Cl.cdata.pm[13]);
  Edit55.Text := FlToStr(Cl.cdata.snpm[13]);
  Edit54.Text := FlToStr(Cl.cdata.sub[12]);
  Edit56.Text := FlToStr(Cl.cdata.sub[13]);
  Cl.SetNorm;
  FillLV;
  att := Cl.data.cert-1;
  RadioGroup1.ItemIndex := att;
  combobox1.OnChange(combobox1);
  combobox2.OnChange(combobox2);
  combobox3.OnChange(combobox3);
  combobox4.OnChange(combobox4);
  combobox5.OnChange(combobox5);
  combobox6.OnChange(combobox6);
  combobox7.OnChange(combobox7);
  combobox8.OnChange(combobox8);
  combobox9.OnChange(combobox9);
  combobox20.OnChange(combobox20);
  combobox10.OnChange(combobox10);
  combobox11.OnChange(combobox11);
  combobox13.OnChange(combobox13);
  combobox14.OnChange(combobox14);
  combobox15.OnChange(combobox15);
  combobox16.OnChange(combobox16);
  combobox17.OnChange(combobox17);
  combobox18.OnChange(combobox18);
  combobox19.OnChange(combobox19);
  CheckBox3.Checked := (cl.data.mail = 1);
end;

procedure TForm2.SetVCalc;//расчет субсидии
var
  s: integer;
begin
  s := Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate);
  if (s=0) then begin //первый месяц
    if not CheckBox1.Checked then begin
      Edit12.Text:=FlToStr(Cl.cdata.bpm[0]);Edit15.Text:=FlToStr(Cl.cdata.bpm[1]);
      Edit18.Text:=FlToStr(Cl.cdata.bpm[2]);Edit21.Text:=FlToStr(Cl.cdata.bpm[3]);
      Edit59.Text:=FlToStr(Cl.cdata.bpm[4]);Edit24.Text:=FlToStr(Cl.cdata.bpm[5]);
      Edit27.Text:=FlToStr(Cl.cdata.bpm[6]);Edit30.Text:=FlToStr(Cl.cdata.bpm[7]);
      Edit33.Text:=FlToStr(Cl.cdata.bpm[12]);Edit36.Text:=FlToStr(Cl.cdata.bpm[13]);
      Edit13.Text:=FlToStr(Cl.cdata.bsnpm[0]);Edit16.Text:=FlToStr(Cl.cdata.bsnpm[1]);
      Edit19.Text:=FlToStr(Cl.cdata.bsnpm[2]);Edit22.Text:=FlToStr(Cl.cdata.bsnpm[3]);
      Edit62.Text:=FlToStr(Cl.cdata.bsnpm[4]);Edit25.Text:=FlToStr(Cl.cdata.bsnpm[5]);
      Edit28.Text:=FlToStr(Cl.cdata.bsnpm[6]);Edit31.Text:=FlToStr(Cl.cdata.bsnpm[7]);
      Edit34.Text:=FlToStr(Cl.cdata.bsnpm[12]);Edit37.Text:=FlToStr(Cl.cdata.bsnpm[13]);
    end;
    Edit14.Text:=FlToStr(Cl.cdata.bsub[0]);Edit17.Text:=FlToStr(Cl.cdata.bsub[1]);
    Edit20.Text:=FlToStr(Cl.cdata.bsub[2]);Edit23.Text:=FlToStr(Cl.cdata.bsub[3]);
    Edit67.Text:=FlToStr(Cl.cdata.bsub[4]);Edit26.Text:=FlToStr(Cl.cdata.bsub[5]);
    Edit29.Text:=FlToStr(Cl.cdata.bsub[6]);Edit32.Text:=FlToStr(Cl.cdata.bsub[7]);
    Edit35.Text:=FlToStr(Cl.cdata.bsub[12]);Edit38.Text:=FlToStr(Cl.cdata.bsub[13]);
  end;
  if (s<>3) then begin//для всех
    Edit96.Text:=FlToStr(Cl.cdata.pm[0]);Edit97.Text:=FlToStr(Cl.cdata.pm[1]);
    Edit98.Text:=FlToStr(Cl.cdata.pm[2]);Edit99.Text:=FlToStr(Cl.cdata.pm[3]);
    Edit100.Text:=FlToStr(Cl.cdata.pm[4]);Edit101.Text:=FlToStr(Cl.cdata.pm[5]);
    Edit102.Text:=FlToStr(Cl.cdata.pm[6]);Edit103.Text:=FlToStr(Cl.cdata.pm[7]);
    Edit104.Text:=FlToStr(Cl.cdata.pm[12]);Edit105.Text:=FlToStr(Cl.cdata.pm[13]);
    Edit39.Text:=FlToStr(Cl.cdata.snpm[0]);Edit41.Text:=FlToStr(Cl.cdata.snpm[1]);
    Edit43.Text:=FlToStr(Cl.cdata.snpm[2]);Edit45.Text:=FlToStr(Cl.cdata.snpm[3]);
    Edit70.Text:=FlToStr(Cl.cdata.snpm[4]);Edit47.Text:=FlToStr(Cl.cdata.snpm[5]);
    Edit49.Text:=FlToStr(Cl.cdata.snpm[6]);Edit51.Text:=FlToStr(Cl.cdata.snpm[7]);
    Edit53.Text:=FlToStr(Cl.cdata.snpm[12]);Edit55.Text:=FlToStr(Cl.cdata.snpm[13]);
    Edit40.Text:=FlToStr(Cl.cdata.sub[0]);Edit42.Text:=FlToStr(Cl.cdata.sub[1]);
    Edit44.Text:=FlToStr(Cl.cdata.sub[2]);Edit46.Text:=FlToStr(Cl.cdata.sub[3]);
    Edit71.Text:=FlToStr(Cl.cdata.sub[4]);Edit48.Text:=FlToStr(Cl.cdata.sub[5]);
    Edit50.Text:=FlToStr(Cl.cdata.sub[6]);Edit52.Text:=FlToStr(Cl.cdata.sub[7]);
    Edit54.Text := FlToStr(Cl.cdata.sub[12]);Edit56.Text := FlToStr(Cl.cdata.sub[13]);
  end;
end;

procedure TForm2.SumV;//суммировать начисления
var
  value: real;
  i: integer;
begin
  value := Cl.cdata.bpm[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.bpm[i];
  Edit89.Text := FlToStr(value);
  value := Cl.cdata.pm[0];
  for i:=1 to numbtarif-1 do
    value := value + {!}roundto(Cl.cdata.pm[i],-2);
  Edit106.Text := FlToStr(value);
  value := Cl.cdata.bsnpm[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.bsnpm[i];
  Edit90.Text := FlToStr(value);
  value := Cl.cdata.bsub[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.bsub[i];
  Edit91.Text := FlToStr(value);
  value := Cl.cdata.snpm[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.snpm[i];
  Edit92.Text := FlToStr(value);
  value := Cl.cdata.sub[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.sub[i];
  Edit93.Text := FlToStr(value);
  value := Cl.cdata.bfpm[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.bfpm[i];
  Edit65.Text := FlToStr(value);
  value := Cl.cdata.fpm[0];
  for i:=1 to numbtarif-1 do
    value := value + Cl.cdata.fpm[i];
  Edit84.Text := FlToStr(value);
  SetKoef;
end;

function TForm2.SelMin(n: integer): real;//найти min
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.minim');
    SQL.Add('from "curlmin.dbf" sbros');
    SQL.Add('where sbros.id_min = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('minim').AsFloat;
    Close;
  end;
end;

procedure TForm2.SetIncome;
var
  i:integer;
begin
  Cl.cdata.income := 0;
  for i:=0 to Cl.cdata.mcount-1 do begin
    Cl.cdata.income := Cl.cdata.income + Cl.cdata.mid[i];
  end;
  Edit73.Text := FlToStr(Cl.cdata.income);
end;

procedure TForm2.SetKoef;
var
  pm,ppm: real;
  i: integer;
begin
  //сд/пм
  if (Cl.cdata.pmin<>0)and(Cl.cdata.mcount<>0) then begin
    Cl.cdata.koef := (Cl.cdata.income/Cl.cdata.mcount)/Cl.cdata.pmin;
    Edit107.Text := FlToStr(Cl.cdata.koef);
  end
  else begin
    Cl.cdata.koef := 0;
    //ShowMessage('Расчет отношения среднедушевого дохода семьи к прожиточному минимуму семьи (СД/ПМ) невозможен! Деление на нуль!');
    Edit107.Text := '0.00';
  end;
  //рпс/рпп
  if Cl.cdata.rstnd<>0 then begin
    //оплата без учета льготы
    pm := Cl.CalcFull;
    //оплата c учетом льготы
    ppm := 0;
    for i:=0 to numbtarif-1 do
      ppm := ppm + Cl.cdata.pm[i];
    if (pm<>0)and(ppm<>0) then
      Edit108.Text := FlToStr(ppm/pm)
    else
      Edit108.Text := '';
  end
  else
    Edit108.Text := '';
end;

procedure TForm2.SetHouse(s: integer;n,c: string);
begin
  Combobox12.Text := SelStr(s);
  Combobox12.OnChange(combobox12);
  Edit61.Text := c;
  Edit60.Text := n;
end;

function TForm2.SearchStreet(s: string): integer;
var
  i: integer;
  s1: string;
begin
  for i:=0 to combobox12.Items.Count-1 do begin
    s1:=AnsiLowerCase(Combobox12.Items.Strings[i]);
    if s1=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox12.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchMng(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox15.Items.Count-1 do begin
    if AnsiLowerCase(Combobox15.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox15.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchFnd(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox13.Items.Count-1 do begin
    if AnsiLowerCase(Combobox13.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox13.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchSettl(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox14.Items.Count-1 do begin
    if AnsiLowerCase(Combobox14.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox14.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchOwn(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox16.Items.Count-1 do begin
    if AnsiLowerCase(Combobox16.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox16.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchCntrl(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox11.Items.Count-1 do begin
    if AnsiLowerCase(Combobox11.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox11.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchSt(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox17.Items.Count-1 do begin
    if AnsiLowerCase(Combobox17.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox17.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchPriv(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox18.Items.Count-1 do begin
    if AnsiLowerCase(Combobox18.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox18.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchRel(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox7.Items.Count-1 do begin
    if AnsiLowerCase(Combobox7.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox7.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchStnd(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox10.Items.Count-1 do begin
    if AnsiLowerCase(Combobox10.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox10.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchCont(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox1.Items.Count-1 do begin
    if AnsiLowerCase(Combobox1.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchRep(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox2.Items.Count-1 do begin
    if AnsiLowerCase(Combobox2.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox2.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchCold(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox3.Items.Count-1 do begin
    if AnsiLowerCase(Combobox3.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox3.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchCanal(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox20.Items.Count-1 do begin
    if AnsiLowerCase(Combobox20.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox20.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchHot(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox4.Items.Count-1 do begin
    if AnsiLowerCase(Combobox4.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox4.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchHeat(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox5.Items.Count-1 do begin
    if AnsiLowerCase(Combobox5.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox5.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchGas(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox6.Items.Count-1 do begin
    if AnsiLowerCase(Combobox6.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox6.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchCoal(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox9.Items.Count-1 do begin
    if AnsiLowerCase(Combobox9.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox9.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchWood(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox8.Items.Count-1 do begin
    if AnsiLowerCase(Combobox8.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox8.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SearchBank(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox19.Items.Count-1 do begin
    if AnsiLowerCase(Combobox19.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox19.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm2.SelInsp(n: integer): string;//выбрать инспектора
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:dist)');
    ParamByName('id').AsInteger := n;
    ParamByName('dist').AsInteger := Form1.dist;
    Open;
    Result := FieldByName('nameinsp').AsString;
    Close;
  end;
end;


function TForm2.SelStr(n: integer): string;//выбрать улицу
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelMng(n: integer): string;//выбрать распорядителя
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select namemng');
    SQL.Add('from mng');
    SQL.Add('where (id_mng = :id)and(id_dist=:dist)');
    ParamByName('id').AsInteger := n;
    ParamByName('dist').AsInteger := Form1.dist;
    Open;
    Result := FieldByName('namemng').AsString;
    Close;
  end;
end;

function TForm2.SelFnd(n: integer): string;//выбрать фонд
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelSettl(n: integer): string;//выбрать тип заселения
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelOwn(n: integer): string;//выбрать тип владения
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelCntrl(n: integer): string;//выбрать тип контроля
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelSt(n: integer): string;//выбрать тип статуса
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelPriv(n: integer): string;//выбрать льготу
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelRel(n: integer): string;
begin
  with Datamodule1.Query1 do begin
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

function TForm2.SelStnd(n: integer): string;//выбрать стандарт
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namestnd');
    SQL.Add('from "currstnd.dbf" sbros');
    SQL.Add('where sbros.id_stnd = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namestnd').AsString;
    Close;
  end;
end;

function TForm2.SelCont(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecont');
    SQL.Add('from "curcont.dbf" sbros');
    SQL.Add('where sbros.id_cont = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecont').AsString;
    Close;
  end;
end;

function TForm2.SelRep(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namerep');
    SQL.Add('from "currep.dbf" sbros');
    SQL.Add('where sbros.id_rep = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namerep').AsString;
    Close;
  end;
end;

function TForm2.SelCold(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecold');
    SQL.Add('from "curcold.dbf" sbros');
    SQL.Add('where sbros.id_cold = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecold').AsString;
    Close;
  end;
end;

function TForm2.SelCanal(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecanal');
    SQL.Add('from "curcanal.dbf" sbros');
    SQL.Add('where sbros.id_canal = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecanal').AsString;
    Close;
  end;
end;

function TForm2.SelHot(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namehot');
    SQL.Add('from "curhot.dbf" sbros');
    SQL.Add('where sbros.id_hot = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namehot').AsString;
    Close;
  end;
end;

function TForm2.SelHeat(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.nameheat');
    SQL.Add('from "curheat.dbf" sbros');
    SQL.Add('where sbros.id_heat = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('nameheat').AsString;
    Close;
  end;
end;

function TForm2.SelGas(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namegas');
    SQL.Add('from "curgas.dbf" sbros');
    SQL.Add('where sbros.id_gas = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namegas').AsString;
    Close;
  end;
end;

function TForm2.SelWood(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namewood');
    SQL.Add('from "curwood.dbf" sbros');
    SQL.Add('where sbros.id_wood = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namewood').AsString;
    Close;
  end;
end;

function TForm2.SelCoal(n: integer): string;//выбрать тариф
begin
  with Datamodule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namecoal');
    SQL.Add('from "curcoal.dbf" sbros');
    SQL.Add('where sbros.id_coal = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecoal').AsString;
    Close;
  end;
end;

function TForm2.SelBank(n: integer): string;//выбрать банк
begin
  with Datamodule1.Query1 do begin
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

function TForm2.ExistHouse(var n: integer): bool;//существует дом?
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select id_house');
    SQL.Add('from house');
    SQL.Add('where (id_street = :str)and(nhouse = :nh)and(corp=:cp)');
    SQL.Add('and(id_dist=:dist)');
    ParamByName('str').AsInteger := Cl.data.str;
    ParamByName('nh').AsString := Cl.data.nh;
    ParamByName('cp').AsString := Cl.data.corp;
    ParamByName('dist').AsInteger := Form1.dist;
    Open;
    if IsEmpty then
      Result := false
    else begin
      n := FieldByName('id_house').AsInteger;
      Result := true;
    end;
    Close;
  end;
end;

function TForm2.ExistClient(var n: integer): bool;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQl.Add('select regn');
    SQL.Add('from cl ');
    SQL.Add('where (id_street=:id)and(nhouse=:n)and(corp=:cp)and(apart=:apart)and(fio=:fio)');
    ParamByName('id').AsInteger := Cl.data.str;
    ParamByName('n').AsString := Cl.data.nh;
    ParamByName('cp').AsString := Cl.data.corp;
    ParamByName('apart').AsString := Cl.data.apart;
    ParamByName('fio').AsString := Cl.data.fio;
    Open;
    if IsEmpty then
      Result := false
    else begin
      n := FieldByName('regn').AsInteger;
      Result := true;
    end;
    Close;
  end;
end;

function tform2.existmem:bool;
var
  i:integer;
begin
  result:=false;
  for i:=0 to cl.cdata.family.count-1 do
    if tman(cl.cdata.family[i]).fio=cl.data.fio then
      begin
        result:=true;
        exit;
      end;
end;

function TForm2.ExistMemEx(var n: integer): bool;
var
  i: integer;
  flag1: bool;
begin
  flag1 := false;
  if Cl.cdata.family.Count<>0 then begin
    for i:=0 to Cl.cdata.family.Count-1 do
      if (TMan(Cl.cdata.family[i]).fio = Edit69.Text) and
        (TMan(Cl.cdata.family[i]).birth = StrToDate(MaskEdit1.Text)) then begin
        flag1 := true;
        break;
      end
      else
        if (TMan(Cl.cdata.family[i]).rel = 1)and(rel[SearchRel(Combobox7.Text)] = 1)then begin
          flag1 := true;
          break;
        end;
    if flag1 then begin
      n := i;
      Result := true;
    end
    else
      Result := false;
  end
  else
    Result := false;
end;

procedure TForm2.SortFam;
var
  m: TMan;
  mas1, mas2, i, compare: integer;
  mid1, mid2: real;
begin
  for i:=Cl.cdata.family.Count-1 downto 1 do begin
    Compare := CompareText(TMan(Cl.cdata.family[i-1]).fio,
                          TMan(Cl.cdata.family[i]).fio);
    if Compare>0 then begin
      curman := i-1;
      m := TMan(Cl.cdata.family[i]).Copy;
      Cl.cdata.family.Delete(i);
      Cl.cdata.family.Insert(i-1, m);
      mas1 := Cl.cdata.min[i];
      mas2 := Cl.cdata.min[i-1];
      Cl.cdata.min[i-1] := mas1;
      Cl.cdata.min[i] := mas2;
      mid1 := Cl.cdata.mid[i];
      mid2 := Cl.cdata.mid[i-1];
      Cl.cdata.mid[i-1] := mid1;
      Cl.cdata.mid[i] := mid2;
      mas1 := Cl.cdata.priv[i];
      mas2 := Cl.cdata.priv[i-1];
      Cl.cdata.priv[i-1] := mas1;
      Cl.cdata.priv[i] := mas2;
    end;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
{ применить изменения }
begin
  case status of
    0:
      begin
        if AddClient=0 then
          Close;
      end;
    1:
      begin
        if ModifyClient=0 then
          Close;
      end;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
{ закрытие формы }
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query2.Close;
  Datamodule1.Query4.Close;
end;

function TForm2.AddClient:integer;
{ добавить клиента }
var
  mem, i, n, maxid: integer;
begin
  result:=0;
  if not ErrorMessage then begin
    n := 0;
    if not ExistClient(n) then begin
      Datamodule1.Database1.StartTransaction;
      try
      with DataModule1.Query1 do begin
        if not ExistHouse(n) then begin//если такого дома в базе нет
          Close;
          SQL.Clear;
          SQL.Add('execute maxhouse :dist');
          ParamByName('dist').AsInteger := Cl.data.dist;
          Open;
          maxid := FieldByName('mid').AsInteger;
          inc(maxid);
          Close;
          SQL.Clear;
          SQL.Add('insert into house');
          SQL.Add('values (:id,:dist,:str,:nh,:cp,:stnd,');
          SQL.Add(':cont,:rep,:cold,:hot,:canal,:heat,:gas,');
          SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil)');
          ParamByName('id').AsInteger := maxid;
          ParamByName('dist').AsInteger := Cl.data.dist;
          ParamByName('str').AsInteger := Cl.data.str;
          ParamByName('nh').AsString := Cl.data.nh;
          ParamByName('cp').AsString := Cl.data.corp;
          ParamByName('stnd').AsInteger := Cl.cdata.rstnd;
          ParamByName('cont').AsInteger := Cl.cdata.tarifs[0];
          ParamByName('rep').AsInteger := Cl.cdata.tarifs[1];
          ParamByName('cold').AsInteger := Cl.cdata.tarifs[2];
          ParamByName('hot').AsInteger := Cl.cdata.tarifs[3];
          ParamByName('canal').AsInteger := Cl.cdata.tarifs[4];
          ParamByName('heat').AsInteger := Cl.cdata.tarifs[5];
          ParamByName('gas').AsInteger := Cl.cdata.tarifs[6];
          ParamByName('el').AsInteger := Cl.cdata.tarifs[7];
          ParamByName('wood').AsInteger := Cl.cdata.tarifs[12];
          ParamByName('coal').AsInteger := Cl.cdata.tarifs[13];
          ParamByName('mng').AsInteger := Cl.data.manager;
          ParamByName('fnd').AsInteger := Cl.data.fond;
          ParamByName('boil').AsInteger := Cl.cdata.boiler;
          ExecSQL;
        end;
        Close;
        SQL.Clear;
        SQL.Add('insert into hist');
        SQL.Add('values (:id,CONVERT(smalldatetime,:bdate,104),CONVERT(smalldatetime,:edate,104),');
        SQL.Add(':mcount,:quanpriv,:pmin,:income,:insp,:dist,:control,:reason,');
        SQL.Add(':own, :manager, :fond, :cert, :bank, :acbank,:calc,:mdd)');
        ParamByName('id').AsInteger := Cl.data.regn;
        ParamByName('mcount').AsInteger := Cl.cdata.mcount;
        ParamByName('quanpriv').AsInteger := Cl.cdata.quanpriv;
        ParamByName('pmin').AsFloat := Cl.cdata.pmin;
        ParamByName('income').AsFloat := Cl.cdata.income;
        ParamByName('insp').AsInteger := Cl.data.insp;
        ParamByName('dist').AsInteger := Cl.data.dist;
        ParamByName('control').AsInteger := Cl.data.control;
        ParamByName('reason').AsString := Cl.data.reason;
        ParamByName('own').AsInteger := Cl.data.own;
        ParamByName('manager').AsInteger := Cl.data.manager;
        ParamByName('fond').AsInteger := Cl.data.fond;
        ParamByName('cert').AsInteger := Cl.data.cert;
        ParamByName('bank').AsInteger := Cl.data.bank;
        ParamByName('acbank').AsString := Cl.data.acbank;
        ParamByName('bdate').AsString := DateToStr(Cl.cdata.begindate);
        ParamByName('edate').AsString := DateToStr(Cl.cdata.enddate);
        ParamByName('calc').AsInteger := Cl.cdata.calc;
        ParamByName('mdd').AsInteger := Cl.cdata.mdd;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('insert into cl');
        SQL.Add('values (:id,:fio,CONVERT(smalldatetime, :rdate, 104),');
        SQL.Add('CONVERT(smalldatetime, :change, 104),:dist,:str,:n,:cp,:apart,:tel,');
        SQL.Add(':lsquare, :square,:stnd,:settl,:boil,CONVERT(smalldatetime, :declar, 104),:mmail)');
        ParamByName('fio').AsString := Cl.data.fio;
        ParamByName('id').AsInteger := Cl.data.regn;
        ParamByName('rdate').AsString := DateToStr(Cl.data.regdate);
        ParamByName('change').AsString := DateToStr(Cl.data.change);
        ParamByName('dist').AsInteger := Cl.data.dist;
        ParamByName('str').AsInteger := Cl.data.str;
        ParamByName('n').AsString := Cl.data.nh;
        ParamByName('cp').AsString := Cl.data.corp;
        ParamByName('apart').AsString := Cl.data.apart;
        ParamByName('tel').AsString := Cl.data.tel;
        ParamByName('lsquare').AsFloat := Cl.cdata.lsquare;
        ParamByName('square').AsFloat := Cl.cdata.square;
        ParamByName('stnd').AsInteger := Cl.cdata.rstnd;
        ParamByName('settl').AsInteger := Cl.data.settl;
        ParamByName('boil').AsInteger := Cl.cdata.boiler;
        ParamByName('declar').value:=formatdatetime('YYYYMMDD',strtodate(MaskEdit4.Text));
        if checkbox3.Checked then
          ParamByName('mmail').AsInteger := 1
        else
          ParamByName('mmail').AsInteger := 0;

        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('insert into sub');
        SQL.Add('values (CONVERT(smalldatetime,:d,104),:id,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp)');
        ParamByName('d').AsString := DateToStr(Cl.cdata.begindate);
        ParamByName('id').AsInteger := Cl.data.regn;
        ParamByName('stp').AsInteger := Cl.cdata.stop;
        for i:=0 to numbtarif-1 do begin
          if (i<8)or(i>11) then begin
            ParamByName('serv').AsInteger := i;
            ParamByName('idserv').AsInteger := Cl.cdata.tarifs[i];
            ParamByName('ac').AsString := Cl.cdata.accounts[i];
            ParamByName('pm').AsFloat := Cl.cdata.pm[i];
            ParamByName('snp').AsFloat := Cl.cdata.snpm[i];
            ParamByName('sub').AsFloat := Cl.cdata.sub[i];
            ParamByName('sp').AsFloat := Cl.cdata.fpm[i];
            ExecSQL;
          end;
        end;
        Close;
        mem := 0;
        for i:=0 to Cl.cdata.family.Count-1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into fam');
          SQL.Add('values (:id, :cl, :fio,convert(smalldatetime,:birth,104),');
          SQL.Add(':pol, :st, :priv,:mid, :rel)');
          ParamByName('id').AsInteger := StrToInt(IntToStr(Cl.data.regn)+IntToStr(mem));
          ParamByName('cl').AsInteger := Cl.data.regn;
          ParamByName('fio').AsString := TMan(Cl.cdata.family[i]).fio;
          ParamByName('birth').AsString := DateToStr(TMan(Cl.cdata.family[i]).birth);
          ParamByName('pol').AsInteger := TMan(Cl.cdata.family[i]).pol;
          ParamByName('st').AsInteger := TMan(Cl.cdata.family[i]).status;
          ParamByName('priv').AsInteger := TMan(Cl.cdata.family[i]).priv;
          ParamByName('mid').AsFloat := TMan(Cl.cdata.family[i]).mid;
          ParamByName('rel').AsInteger := TMan(Cl.cdata.family[i]).rel;
          ExecSQL;
          inc(mem);
        end;
        Close;
        SQL.Clear;
        SQL.Add('update insp');
        SQL.Add('set lastnum = :num');
        SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
        ParamByName('id').AsInteger := cl.data.insp;
        ParamByName('idd').AsInteger := Cl.data.dist;
        ParamByName('num').AsInteger := StrToInt(Edit85.Text);
        try
          ExecSQL;
        except
          Datamodule1.Database1.Close;
          try
            Datamodule1.Database1.Open;
            ExecSQL;
          except
            ShowMessage('Нет соединения с сервером! Обратитесь к специалисту');
          end;
        end;
      end;
      Datamodule1.Database1.Commit;
      Result := 0;
      except
        //транзакция не выполнена
        Datamodule1.Database1.Rollback;
        Result := -1;
      end;
      if Result=0 then
        Form1.AddCl(Cl.data.regn);
    end
    else
      ShowMessage('Клиент с указанными данными уже существует!');
  end;
end;

function TForm2.ModifyClient: integer;
{ изменить клиента }
var n, i, mem, maxid: integer;
    dt: string;
begin
  result:=0;
if IsAPeriod then begin
  if not ErrorMessage then begin
    n := 0;
    if (not ExistClient(n) or ExistClient(n)and(n=Form1.client))then begin
      Datamodule1.Database1.StartTransaction;
      try
      with DataModule1.Query1 do begin
        if not ExistHouse(n) then begin//если такого дома в базе нет
          Close;
          SQL.Clear;
          SQL.Add('execute maxhouse :dist');
          ParamByName('dist').AsInteger := Cl.data.dist;
          Open;
          maxid := FieldByName('mid').AsInteger;
          inc(maxid);
          Close;
          SQL.Clear;
          SQL.Add('insert into house');
          SQL.Add('values (:id, :dist,:str, :nh, :cp, :stnd,');
          SQL.Add(':cont, :rep, :cold, :hot,:canal, :heat, :gas,');
          SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil)');
          ParamByName('id').AsInteger := maxid;
          ParamByName('dist').AsInteger := Cl.data.dist;
          ParamByName('str').AsInteger := Cl.data.str;
          ParamByName('nh').AsString := Cl.data.nh;
          ParamByName('cp').AsString := Cl.data.corp;
          ParamByName('stnd').AsInteger := Cl.cdata.rstnd;
          ParamByName('cont').AsInteger := Cl.cdata.tarifs[0];
          ParamByName('rep').AsInteger := Cl.cdata.tarifs[1];
          ParamByName('cold').AsInteger := Cl.cdata.tarifs[2];
          ParamByName('hot').AsInteger := Cl.cdata.tarifs[3];
          ParamByName('canal').AsInteger := Cl.cdata.tarifs[4];
          ParamByName('heat').AsInteger := Cl.cdata.tarifs[5];
          ParamByName('gas').AsInteger := Cl.cdata.tarifs[6];
          ParamByName('el').AsInteger := Cl.cdata.tarifs[7];
          ParamByName('wood').AsInteger := Cl.cdata.tarifs[12];
          ParamByName('coal').AsInteger := Cl.cdata.tarifs[13];
          ParamByName('mng').AsInteger := Cl.data.manager;
          ParamByName('fnd').AsInteger := Cl.data.fond;
          ParamByName('boil').AsInteger := Cl.cdata.boiler;
          ExecSQL;
        end;
        if (att<>RadioGroup1.ItemIndex)and(RadioGroup1.ItemIndex=2) then begin//внеплановая
          Close;
          SQL.Clear;
          SQL.Add('update hist');
          SQL.Add('set edate=CONVERT(smalldatetime, :edate, 104)');
          SQL.Add('where regn=:id and bdate<=CONVERT(smalldatetime, :d, 104)');
          SQL.Add('and edate>CONVERT(smalldatetime, :d, 104)');
          ParamByName('id').AsInteger := Cl.data.regn;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('edate').AsString := Form1.rdt;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('delete from sub');
          SQL.Add('where (regn = :id)and(sdate>=CONVERT(smalldatetime, :s, 104))');
          ParamByName('id').AsInteger := cl.data.regn;
          ParamByName('s').AsString := Form1.rdt;
          ExecSQL;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select regn from hist');
        SQL.Add('where regn=:r and bdate=CONVERT(smalldatetime,:d,104)');
        ParamByName('r').AsInteger := Cl.data.regn;
        ParamByName('d').AsString := DateToStr(Cl.cdata.begindate);
        Open;
        if isEmpty then begin
          Close;
          SQL.Clear;
          SQL.Add('insert into hist');
          SQL.Add('values (:id,CONVERT(smalldatetime,:bdate,104),');
          SQL.Add('CONVERT(smalldatetime,:edate,104),:mcount,:quanpriv,:pmin,:income,:insp,');
          SQL.Add(':idd,:control,:reason,:own, :manager, :fond,:cert,:bank,:acbank,:calc,:mdd)');
        end
        else begin
          Close;
          SQL.Clear;
          SQL.Add('update hist');
          SQL.Add('set edate=CONVERT(smalldatetime,:edate,104),mcount=:mcount,');
          SQL.Add('quanpriv=:quanpriv,pmin=:pmin,income=:income,id_insp=:insp,id_dist=:idd,');
          SQL.Add('id_cntrl=:control,reason=:reason,id_own=:own,id_mng=:manager,');
          SQL.Add('id_fond=:fond,id_cert=:cert,id_bank=:bank,acbank=:acbank,calc=:calc,mdd=:mdd');
          SQL.Add('where regn=:id and bdate=CONVERT(smalldatetime,:bdate,104)');
        end;
        ParamByName('id').AsInteger := Cl.data.regn;
        ParamByName('mcount').AsInteger := Cl.cdata.mcount;
        ParamByName('quanpriv').AsInteger := Cl.cdata.quanpriv;
        ParamByName('pmin').AsFloat := Cl.cdata.pmin;
        ParamByName('income').AsFloat := Cl.cdata.income;
        ParamByName('insp').AsInteger := cl.data.insp;
        ParamByName('idd').AsInteger := cl.data.dist;
        ParamByName('control').AsInteger := Cl.data.control;
        ParamByName('reason').AsString := Cl.data.reason;
        ParamByName('own').AsInteger := Cl.data.own;
        ParamByName('manager').AsInteger := Cl.data.manager;
        ParamByName('fond').AsInteger := Cl.data.fond;
        ParamByName('cert').AsInteger := Cl.data.cert;
        ParamByName('bank').AsInteger := Cl.data.bank;
        ParamByName('acbank').AsString := Cl.data.acbank;
        ParamByName('bdate').AsString := DateToStr(Cl.cdata.begindate);
        ParamByName('edate').AsString := DateToStr(Cl.cdata.enddate);
        ParamByName('calc').AsInteger := Cl.cdata.calc;
        ParamByName('mdd').AsInteger := Cl.cdata.mdd;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('update cl');
        SQL.Add('set fio=:fio,change=CONVERT(smalldatetime, :change, 104),declardate=CONVERT(smalldatetime, :declar, 104),');
        SQL.Add('id_street=:str,nhouse=:n,corp=:cp,apart=:apart,tel=:tel,');
        SQL.Add('lsquare=:lsquare, square=:square,id_stnd=:stnd,id_settl=:settl,boiler=:boil,mail=:mmail');
        SQL.Add('where regn = :id');
        ParamByName('id').AsInteger := Cl.data.regn;
        ParamByName('fio').AsString := Cl.data.fio;
        Form1.SetPer2(Form1.rdt,dt);
        ParamByName('change').AsString := IntToStr(DayOf(Date))+'.'+Copy(dt,3,2)+'.20'+Copy(dt,1,2);
        ParamByName('str').AsInteger := Cl.data.str;
        ParamByName('n').AsString := Cl.data.nh;
        ParamByName('cp').AsString := Cl.data.corp;
        ParamByName('apart').AsString := Cl.data.apart;
        ParamByName('tel').AsString := Cl.data.tel;
        ParamByName('lsquare').AsFloat := Cl.cdata.lsquare;
        ParamByName('square').AsFloat := Cl.cdata.square;
        ParamByName('stnd').AsInteger := Cl.cdata.rstnd;
        ParamByName('settl').AsInteger := Cl.data.settl;
        ParamByName('boil').AsInteger := Cl.cdata.boiler;
        ParamByName('declar').value:=formatdatetime('YYYYMMDD',strtodate(MaskEdit4.Text));//.AsString :=  Edit111.Text;
        ParamByName('mmail').AsInteger := Cl.data.mail;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('delete from sub');
        SQL.Add('where (regn=:r)and(sdate>=CONVERT(smalldatetime,:s,104))');
        ParamByName('s').AsString := Form1.rdt;
        ParamByName('r').AsInteger := Form1.client;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('insert into  sub');
        SQL.Add('values (CONVERT(smalldatetime,:s,104),:r,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp)');
        ParamByName('s').AsString := Form1.rdt;
        ParamByName('r').AsInteger := Form1.client;
        ParamByName('stp').AsInteger := Cl.cdata.stop;
        for i:=0 to numbtarif-1 do begin
          if (i<8)or(i>11) then begin
            Close;
            ParamByName('serv').AsInteger := i;
            ParamByName('idserv').AsInteger := Cl.cdata.tarifs[i];
            ParamByName('ac').AsString := Cl.cdata.accounts[i];
            ParamByName('pm').AsFloat := Cl.cdata.pm[i];
            ParamByName('snp').AsFloat := Cl.cdata.snpm[i];
            ParamByName('sub').AsFloat := Cl.cdata.sub[i];
            ParamByName('sp').AsFloat := Cl.cdata.fpm[i];

        try
          ExecSQL;
        except
          Datamodule1.Database1.Close;
          try
            Datamodule1.Database1.Open;
            ExecSQL;
          except
            ShowMessage('Нет соединения с сервером! Обратитесь к специалисту');
          end;
        end;

          end;
        end;
        Close;
        SQL.Clear;
        SQL.Add('delete from fam');
        SQL.Add('where regn = :id');
        ParamByName('id').AsInteger := Form1.client;
        ExecSQL;
        mem := 0;
        for i:=0 to Cl.cdata.family.Count-1 do begin
          Close;
          SQL.Clear;
//          if mem > 9 then mem := 9;
          SQL.Add('insert into fam');
          SQL.Add('values (:id, :cl, :fio,convert(smalldatetime,:birth,104),');
          SQL.Add(':pol, :st, :priv,:mid, :rel)');
          ParamByName('id').AsCurrency := StrToCurr(IntToStr(Cl.data.regn)+IntToStr(mem));
          ParamByName('cl').AsInteger := Form1.client;
          ParamByName('fio').AsString := TMan(Cl.cdata.family[i]).fio;
          ParamByName('birth').AsString := DateToStr(TMan(Cl.cdata.family[i]).birth);
          ParamByName('pol').AsInteger := TMan(Cl.cdata.family[i]).pol;
          ParamByName('st').AsInteger := TMan(Cl.cdata.family[i]).status;
          ParamByName('priv').AsInteger := TMan(Cl.cdata.family[i]).priv;
          ParamByName('mid').AsFloat := TMan(Cl.cdata.family[i]).mid;
          ParamByName('rel').AsInteger := TMan(Cl.cdata.family[i]).rel;
          ExecSQL;
          inc(mem);
        end;
      end;
      Datamodule1.Database1.Commit;
      Result := 0;
      if cl.data.cert<>1 then FactSumFrm.ShowModal; //Фактический расход
      except
        //транзакция не выполнена
        Datamodule1.Database1.Rollback;
        Result := -1;
      end;
      if Result=0 then
        Form1.ModCl(Form1.client);
    end
    else
      ShowMessage('Клиент с указанными данными уже существует!');
  end;
end
else
  ShowMessage('Выберите новый срок субсидии, чтобы сохранить изменения!');
end;

procedure TForm2.SetRegn;
var
  num: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select lastnum');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
    ParamByName('id').AsInteger := Cl.data.insp;
    ParamByName('idd').AsInteger := Cl.data.dist;
    Open;
    num := FieldByName('lastnum').AsInteger;
    Close;
    inc(num);
  end;
  if Form1.dist < 10 then
    Edit85.Text := '0' + IntToStr(num)
  else
    Edit85.Text := IntToStr(num);
  Cl.data.regn := num;
end;

procedure TForm2.SetRegDate;
begin
  Edit87.Text := DateToStr(Date);
  Cl.data.regdate := StrToDate(Edit87.Text);
end;

procedure TForm2.SetPeriod;
begin
  MaskEdit2.Text := Form1.rdt;
  MaskEdit3.Text := DateToStr(IncMonth(StrToDate(Form1.rdt),StrToInt(Edit109.Text)));
  SetCert;
  Cl.cdata.period := StrToInt(Edit109.Text);
  Cl.cdata.begindate := StrToDate(MaskEdit2.Text);
  Cl.cdata.enddate := StrToDate(MaskEdit3.Text);
end;

procedure TForm2.NewPeriod;
begin
  SetPeriod;
  Edit86.Text := SelInsp(Form1.insp);
  Edit88.Text := DateToStr(Date);
  Cl.cdata.stop := 0;
  Cl.data.insp := Form1.insp;
  Cl.data.change := Date;
  MaskEdit4.Text:= DateToStr(Date);
  CheckBox3.Checked:= FALSE;
  Cl.data.mail := 0;
  Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
  SetVCalc;
  SumV;
end;

function TForm2.IsAPeriod: boolean;
begin
  if (Cl.cdata.begindate<=StrToDate(Form1.rdt))and
     (Cl.cdata.enddate>=StrToDate(Form1.rdt)) then
     Result := true
  else
    Result := false;
end;

procedure TForm2.SetCert;
var
  c: integer;
  p1: TDate;
begin
  c  := Cl.data.cert;
  if load then begin
    p1 := StrToDate(MaskEdit2.Text);
    if (p1>=IncMonth(Cl.cdata.enddate))or((p1=Cl.cdata.begindate) and (cl.data.cert <> 2)) then
      c := 1;//первичная аттестация
    if (Cl.cdata.enddate=p1)then
      c := 2;//переаттестация
    if (Cl.cdata.begindate<p1)and(p1<Cl.cdata.enddate) then
      c := 3;//внеплановая аттестация
    Cl.data.cert := c;
    RadioGroup1.ItemIndex := c-1;
  end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
{ выбрали тариф на содержание жилья }
var
  ind: integer;
begin
  ind := SearchCont(Combobox1.Text);
  if ind <> -1 then begin
    Combobox1.ItemIndex := ind;
    Edit3.Text := FlToStr(GetCostTarif(0,cont[Combobox1.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox1.ItemIndex := 0;
    Combobox1.Text := SelCont(cont[0]);
    combobox1.OnChange(combobox1);
  end;
  if load then begin
    Cl.cdata.tarifs[0] := cont[Combobox1.ItemIndex];
    Cl.cdata.cost[0] := GetCostTarif(0,cont[Combobox1.ItemIndex],Cl.cdata.begindate,0,0,Cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServSq(0);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
{ выбрали тариф на текущий ремонт }
var
  ind: integer;
begin
  ind := SearchRep(Combobox2.Text);
  if ind <> -1 then begin
    Combobox2.ItemIndex := ind;
    Edit4.Text := FlToStr(GetCostTarif(1,rep[Combobox2.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox2.ItemIndex := 0;
    Combobox2.Text := SelRep(rep[0]);
    combobox2.OnChange(combobox2);
  end;
  if load then begin
    Cl.cdata.tarifs[1] := rep[Combobox2.ItemIndex];
    Cl.cdata.cost[1] := GetCostTarif(1,rep[Combobox2.ItemIndex],cl.cdata.begindate,0,0,cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServe(1);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox3Change(Sender: TObject);
{ выбрали тариф на холодную воду }
var
  ind,b: integer;
begin
  if not CheckBox2.Checked then
    b := 0
  else
    b := 1;
  ind := SearchCold(Combobox3.Text);
  if ind <> -1 then begin
    Combobox3.ItemIndex := ind;
    Edit5.Text := FlToStr(GetCostTarif(2,cold[Combobox3.ItemIndex],StrToDate(Form1.rdt),b,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox3.ItemIndex := 0;
    Combobox3.Text := SelCold(cold[0]);
    combobox3.OnChange(combobox3);
  end;
  if load then begin
    Cl.cdata.tarifs[2] := cold[Combobox3.ItemIndex];
    Cl.cdata.cost[2] := GetCostTarif(2,cold[Combobox3.ItemIndex],cl.cdata.begindate,b,0,cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServ(2);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox4Change(Sender: TObject);
{ выбрали тариф на горячую воду }
var
  ind,b: integer;
begin
  if not CheckBox2.Checked then
    b := 0
  else
    b := 1;
  ind := SearchHot(Combobox4.Text);
  if ind <> -1 then begin
    Combobox4.ItemIndex := ind;
    Edit6.Text := FlToStr(GetCostTarif(3,hot[Combobox4.ItemIndex],StrToDate(Form1.rdt),b,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox4.ItemIndex := 0;
    Combobox4.Text := SelHot(hot[0]);
    combobox4.OnChange(combobox4);
  end;
  if load then begin
    Cl.cdata.tarifs[3] := hot[Combobox4.ItemIndex];
    Cl.cdata.cost[3] := GetCostTarif(3,hot[Combobox4.ItemIndex],cl.cdata.begindate,b,0,cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServ(3);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox20Change(Sender: TObject);
{ выбрали тариф на водоотведение }
var
  ind: integer;
begin
  ind := SearchCanal(Combobox20.Text);
  if ind <> -1 then begin
    Combobox20.ItemIndex := ind;
    Edit2.Text := FlToStr(GetCostTarif(4,canal[Combobox20.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox20.ItemIndex := 0;
    Combobox20.Text := SelCanal(canal[0]);
    combobox20.OnChange(combobox20);
  end;
  if load then begin
    Cl.cdata.tarifs[4] := canal[Combobox20.ItemIndex];
    Cl.cdata.cost[4] := GetCostTarif(4,canal[Combobox20.ItemIndex],cl.cdata.begindate,0,0,cl.cdata.settl)
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServ(4);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox5Change(Sender: TObject);
{ выбрали тариф на отопление  }
var
  ind: integer;
begin
  ind := SearchHeat(Combobox5.Text);
  if ind <> -1 then begin
    Combobox5.ItemIndex := ind;
    Edit7.Text := FlToStr(GetCostTarif(5,heat[Combobox5.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox5.ItemIndex := 0;
    Combobox5.Text := SelHeat(heat[0]);
    combobox5.OnChange(combobox5);
  end;
  if load then begin
    Cl.cdata.tarifs[5] := heat[Combobox5.ItemIndex];
    Cl.cdata.cost[5] := GetCostTarif(5,heat[Combobox5.ItemIndex],cl.cdata.begindate,0,0,cl.cdata.settl)
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServSq(5,StrToInt(Copy(Form1.rdt,4,2)));
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox6Change(Sender: TObject);
{ выбрали тариф на газ }
var
  ind: integer;
begin
  ind := SearchGas(Combobox6.Text);
  if ind <> -1 then begin
    Combobox6.ItemIndex := ind;
    Edit8.Text := FlToStr(GetCostTarif(6,gas[Combobox6.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex]));
  end
  else begin
    Combobox6.ItemIndex := 0;
    Combobox6.Text := SelGas(gas[0]);
    combobox6.OnChange(combobox6);
  end;
  if load then begin
    Cl.cdata.tarifs[6] := gas[Combobox6.ItemIndex];
    Cl.cdata.cost[6] := GetCostTarif(6,gas[Combobox6.ItemIndex],cl.cdata.begindate,0,0,cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServ(6);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox8Change(Sender: TObject);
{ выбрали тариф на дрова }
var
  ind: integer;
begin
  ind := SearchWood(Combobox8.Text);
  if ind <> -1 then begin
    Combobox8.ItemIndex := ind;
    Edit10.Text := FlToStr((GetCostTarif(12,wood[Combobox8.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex])*Form1.normw)/12);
  end
  else begin
    Combobox8.ItemIndex := 0;
    Combobox8.Text := SelWood(wood[0]);
    combobox8.OnChange(combobox8);
  end;
  if load then begin
    Cl.cdata.tarifs[12] := wood[Combobox8.ItemIndex];
    Cl.cdata.cost[12] := GetCostTarif(12,wood[Combobox8.ItemIndex],cl.cdata.begindate,0,0,cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServWC(12);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox9Change(Sender: TObject);
{ выбрали тариф на уголь }
var
  ind: integer;
begin
  ind := SearchCoal(Combobox9.Text);
  if ind <> -1 then begin
    Combobox9.ItemIndex := ind;
    Edit11.Text := FlToStr((GetCostTarif(13,coal[Combobox9.ItemIndex],StrToDate(Form1.rdt),0,0,settl[Combobox14.ItemIndex])*Form1.normc)/12);
  end
  else begin
    Combobox9.ItemIndex := 0;
    Combobox9.Text := SelCoal(coal[0]);
    combobox9.OnChange(combobox9);
  end;
  if load then begin
    Cl.cdata.tarifs[13] := coal[Combobox9.ItemIndex];
    Cl.cdata.cost[13] := GetCostTarif(13,coal[Combobox9.ItemIndex],cl.cdata.begindate,0,0,cl.cdata.settl);
  end;
  if load and not CalcEmpty then begin
    Cl.CalcServWC(13);
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox10Change(Sender: TObject);
{ выбрали региональный стандарт}
var
  ind,c: integer;
begin
  if Edit68.Text<>'' then
    c := StrToInt(Edit68.Text)
  else
    c := 0;
  if c=0 then
    c := 1;
  if c>3 then
    c := 3;
  ind := SearchStnd(Combobox10.Text);
  if (ind <> -1) then begin
    Combobox10.ItemIndex := ind;
    with DataModule1.Query4 do begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.value'+IntToStr(c));
      SQL.Add('from "currstnd.dbf" sbros');
      SQL.Add('where sbros.id_stnd = :id');
      ParamByName('id').AsInteger := stnd[Combobox10.ItemIndex];
      Open;
      Edit9.Text := FieldByName('value'+IntToStr(c)).AsString;
      Close;
    end;
  end
  else begin
    Combobox10.ItemIndex := 0;
    Combobox10.Text := SelStnd(stnd[0]);
    combobox10.OnChange(combobox10);
  end;
  if load then
    Cl.cdata.rstnd := stnd[Combobox10.ItemIndex];
  if load and not CalcEmpty then begin
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox12Change(Sender: TObject);
{ выбрали улицу }
var
  ind: integer;
begin
   ind := SearchStreet(Combobox12.Text);
  if ind <> -1 then
    Combobox12.ItemIndex := ind
  else begin
    Combobox12.ItemIndex := 0;
    Combobox12.Text := SelStr(str[0]);
  end;
  if load then
    Cl.data.str := str[Combobox12.ItemIndex];
end;

procedure TForm2.Edit60Change(Sender: TObject);
{ выбрали дом }
var
  b: integer;
begin
  if IsRus(Edit60.Text) and IsInt(Edit61.Text) and (Combobox12.Text <> '') then
    with Datamodule1.Query1 do begin
      if load then begin
        Cl.data.nh := Edit60.Text;
        Cl.data.corp := Edit61.Text;
      end;
      Close;
      SQL.Clear;
      SQL.Add('select *');
      SQL.Add('from house inner join');
      SQL.Add('strt on house.id_street=strt.id_street inner join');
      SQL.Add('mng on house.id_mng=mng.id_mng and house.id_dist=mng.id_dist inner join');
      SQL.Add('fond on house.id_fond=fond.id_fond');
      SQL.Add('where (strt.id_street = :str) and(house.nhouse = :numb)');
      SQL.Add('and(house.corp=:cp)and(house.id_dist=:dist)');
      ParamByName('str').AsInteger := str[Combobox12.ItemIndex];
      ParamByName('numb').AsString := Edit60.Text;
      ParamByName('cp').AsString := Edit61.Text;
      ParamByName('dist').AsInteger := Form1.dist;
      Open;
      if not eof then begin
        b :=FieldByName('boiler').AsInteger;
        Combobox15.Text := FieldByName('namemng').AsString;
        Combobox13.Text := FieldByName('namefond').AsString;
        Combobox10.Text := SelStnd(FieldByName('id_stnd').AsInteger);
        Combobox1.Text := SelCont(FieldByName('id_cont').AsInteger);
        Combobox2.Text := SelRep(FieldByName('id_rep').AsInteger);
        Combobox3.Text := SelCold(FieldByName('id_cold').AsInteger);
        Combobox4.Text := SelHot(FieldByName('id_hot').AsInteger);
        Combobox20.Text := SelCanal(FieldByName('id_canal').AsInteger);
        Combobox5.Text := SelHeat(FieldByName('id_heat').AsInteger);
        Combobox6.Text := SelGas(FieldByName('id_gas').AsInteger);
        Combobox8.Text := SelWood(FieldByName('id_wood').AsInteger);
        Combobox9.Text := SelCoal(FieldByName('id_coal').AsInteger);
        if load then begin
          Cl.cdata.boiler := b;
          cl.cdata.tarifs[7] := FieldByName('id_el').AsInteger;
        end;
        RadioGroup2.ItemIndex := FieldByName('id_el').AsInteger-1;
        Close;
        CheckBox2.Checked := (b=1);
        Combobox1.OnChange(combobox1);
        Combobox2.OnChange(combobox2);
        Combobox3.OnChange(combobox3);
        Combobox4.OnChange(combobox4);
        Combobox5.OnChange(combobox5);
        Combobox6.OnChange(combobox6);
        Combobox8.OnChange(combobox8);
        Combobox9.OnChange(combobox9);
        Combobox10.OnChange(combobox10);
        Combobox13.OnChange(combobox13);
        Combobox15.OnChange(combobox15);
      end;
    end;
end;

procedure TForm2.AddFamMan;
var
  man: TMan;
  item: TListItem;
  s:integer;
begin
  s:=0;
  if RadioButton7.Checked then
    s := 1;
  if RadioButton8.Checked then
    s := 2;
  man := TMan.Create(Edit69.Text, StrToDate(MaskEdit1.Text), s,
                    st[Combobox17.ItemIndex], p[Combobox18.ItemIndex],
                    StrToFloat(Edit72.Text),rel[Combobox7.ItemIndex]);
  Cl.cdata.family.Add(man);
  if Cl.cdata.family.Count>Cl.cdata.mcount then
    inc(Cl.cdata.mcount);
  Edit68.Text := IntToStr(Cl.cdata.mcount);
  SetLength(Cl.cdata.mid, Cl.cdata.mcount);
  SetLength(Cl.cdata.min, Cl.cdata.mcount);
  SetLength(Cl.cdata.priv, Cl.cdata.mcount);
  curman := Cl.cdata.family.count-1;
  Cl.cdata.mid[curman] := man.mid;
  Cl.cdata.min[curman] := FromSt(man.status);
  Cl.cdata.priv[curman] := man.priv;
  if man.pol=1 then
    RadioButton7.Checked := true;
  if man.pol=2 then
    RadioButton8.Checked := true;
  if Cl.cdata.priv[curman] <> 0 then
    inc(Cl.cdata.quanpriv);
  Edit95.Text := IntToStr(cl.cdata.quanpriv);
  Cl.SetNorm;
  Cl.SetMin;
  Edit94.Text := FlToStr(Cl.cdata.pmin);
  SetIncome;
  SetKoef;
  SortFam;
  item := LVFam.Items.Insert(curman);
  item.Caption := TMan(Cl.cdata.family.Items[curman]).fio;
  item.SubItems.Add(DateToStr(TMan(Cl.cdata.family.Items[curman]).birth));
  item.SubItems.Add(FlToStr(Cl.cdata.mid[curman]));
  item.SubItems.Add(FlToStr(SelMin(Cl.cdata.min[curman])));
  item.SubItems.Add(SelRel(TMan(Cl.cdata.family.Items[curman]).rel));
  Cl.cdata.tarifs[7] := RadioGroup2.ItemIndex+1;
  Cl.cdata.cost[7] := GetCostTarif(7,RadioGroup2.ItemIndex+1,Cl.cdata.begindate,0,Cl.cdata.mcount,cl.cdata.settl);
  if load and not CalcEmpty then begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ModFamMan;
var
  man: TMan;
  s,pr: integer;
  item: TListItem;
begin
  s:=0;
  if RadioButton7.Checked then
    s := 1;
  if RadioButton8.Checked then
    s := 2;
  man := TMan.Create(Edit69.Text, StrToDate(MaskEdit1.Text), s,
                    st[Combobox17.ItemIndex], p[Combobox18.ItemIndex],
                    StrToFloat(Edit72.Text),rel[Combobox7.ItemIndex]);
  pr := TMan(Cl.cdata.family[curman]).priv;//старая льгота
  Cl.cdata.family.Extract(Cl.cdata.family[curman]);
  Cl.cdata.family.Insert(curman,man);
  Cl.cdata.mid[curman] := man.mid;
  Cl.cdata.min[curman] := FromSt(man.status);
  Cl.cdata.priv[curman] := man.priv;//новая льгота
  Cl.cdata.tarifs[7] := RadioGroup2.ItemIndex+1;
  if (pr<>0)and(man.priv=0) then
    dec(Cl.cdata.quanpriv);
  if (pr=0)and(man.priv<>0) then
    inc(Cl.cdata.quanpriv);
  Edit95.Text := IntToStr(cl.cdata.quanpriv);
  Cl.SetMin;
  Edit94.Text := FlToStr(Cl.cdata.pmin);
  SetIncome;
  SetKoef;
  Cl.CalcPriv;
  Combobox17.OnChange(combobox17);
  LVFam.Items.Delete(curman);
  SortFam;
  item := LVFam.Items.Insert(curman);
  item.Caption := TMan(Cl.cdata.family.Items[curman]).fio;
  item.SubItems.Clear;
  item.SubItems.Add(DateToStr(TMan(Cl.cdata.family.Items[curman]).birth));
  item.SubItems.Add(FlToStr(Cl.cdata.mid[curman]));
  item.SubItems.Add(FlToStr(SelMin(Cl.cdata.min[curman])));
  item.SubItems.Add(SelRel(TMan(Cl.cdata.family.Items[curman]).rel));
  if load and not CalcEmpty then begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
{ добавить члена семьи }
var
  y, yc, m, mc, d, dc: word;
  n,mn: integer;
begin
  n := 0;
  if (Edit69.Text <> '') and (MaskEdit1.Text <> '') and
    (combobox7.Text <> '') and (Edit72.Text <> '') and
    (Combobox17.Text <> '') and (Combobox18.Text <> '') and
    not ExistMemEx(n) and IsRus(Edit69.Text) then begin
    DecodeDate(StrToDate(MaskEdit1.Text), y, m, d);//дата рождения
    DecodeDate(Date, yc, mc, dc);//текущая дата
    y := yc-y;//возраст
    if (m>mc)or(m=mc)and(d>dc) then
      y := y-1;
    mn := FromSt(st[Combobox17.ItemIndex]);
    if RadioButton7.Checked and
      ( (y<16)and(mn=1) or
        (y>=16)and(y<55)and(mn=3) or
        (y>=55)and(mn=2)or
        (y<55)and(mn=2)and(p[Combobox18.ItemIndex]<>0)
      ) or
      RadioButton8.Checked and
      ( (y<16)and(mn=1) or
        (y>=16)and(y<60)and(mn=3) or
        (y>=60)and(mn=2)or
        (y<60)and(mn=2)and(p[Combobox18.ItemIndex]<>0)
      )then
      AddFamMan
    else begin
      if MessageBox(Form2.Handle,PChar('Выбранный социальный статус не соответствует указанному возрасту.'+#13+
                'Вы настаиваете на нем?'),PChar('Несоответствие'),
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL)=IDYES	then
        AddFamMan
      else begin
        Combobox17.Text := '';
        Combobox17.OnChange(combobox17);
      end;
    end;
  end
  else
    ShowMessage('Введите другие данные!');
end;

procedure TForm2.Button4Click(Sender: TObject);
{ изменить сведения о члене семьи }
var
  y, yc, m, mc, d, dc: word;
  n,mn: integer;
begin
  n := 0;
  if (Edit69.Text <> '') and (MaskEdit1.Text <> '') and
    (Combobox7.Text <> '') and (Edit72.Text <> '') and IsRus(Edit69.Text) and 
    (Combobox17.Text <> '') and (Combobox18.Text <> '') and (Cl.cdata.mcount <> 0)
    and (not ExistMemEx(n) or ExistMemEx(n) and
    (TMan(Cl.cdata.family[n]).fio = TMan(Cl.cdata.family[curman]).fio) and
    (TMan(Cl.cdata.family[n]).birth = TMan(Cl.cdata.family[curman]).birth)) then begin
    DecodeDate(StrToDate(MaskEdit1.Text), y, m, d);//дата рождения
    DecodeDate(Date, yc, mc, dc);//текущая дата
    y := yc-y;//возраст
    if (m>mc)or(m=mc)and(d>dc) then
      y := y-1;
    mn := FromSt(st[Combobox17.ItemIndex]);
    if RadioButton7.Checked and
      ((y<16)and(mn=1) or
        (y>=16)and(y<55)and(mn=3) or
        (y>=55)and(mn=2)or
        (y<55)and(mn=2)and(p[Combobox18.ItemIndex]<>0)
      ) or
      RadioButton8.Checked and
      ((y<16)and(mn=1) or
        (y>=16)and(y<60)and(mn=3) or
        (y>=60)and(mn=2)or
        (y<60)and(mn=2)and(p[Combobox18.ItemIndex]<>0)
      )then
      ModFamMan
    else begin
      if MessageBox(Form2.Handle,PChar('Выбранный социальный статус не соответствует указанному возрасту.'+#13+
                'Вы настаиваете на нем?'),PChar('Несоответствие'),
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL)=IDYES	then
        ModFamMan
      else begin
        Combobox17.Text := '';
        Combobox17.OnChange(combobox17);
      end;
    end;
  end
  else
    ShowMessage('Введите другие данные!');
end;

procedure TForm2.Button5Click(Sender: TObject);
{ удалить сведения о члене семьи }
var
  i,pr: integer;
begin
  pr := TMan(Cl.cdata.family[curman]).priv;//льгота человека, которого удаляем
  if (pr<>0)and(Cl.cdata.quanpriv <> 0) then
    dec(Cl.cdata.quanpriv);
  Edit95.Text := IntToStr(cl.cdata.quanpriv);
  Cl.cdata.family.Extract(Cl.cdata.family[curman]);
  LVFam.Items.Delete(curman);
  if Cl.cdata.family.Count+1=Cl.cdata.mcount then
    dec(Cl.cdata.mcount);
  if curman=0 then
    for i:=0 to Cl.cdata.mcount-2 do begin
      Cl.cdata.min[i] := Cl.cdata.min[i+1];
      Cl.cdata.mid[i] := Cl.cdata.mid[i+1];
      Cl.cdata.priv[i] := Cl.cdata.priv[i+1];
    end;
  if (curman>0)and(curman<Cl.cdata.mcount-1) then
    for i:=curman to Cl.cdata.mcount-2 do begin
      Cl.cdata.min[i] := Cl.cdata.min[i+1];
      Cl.cdata.mid[i] := Cl.cdata.mid[i+1];
      Cl.cdata.priv[i] := Cl.cdata.priv[i+1];
    end;
  SetLength(Cl.cdata.mid, Cl.cdata.mcount);
  SetLength(Cl.cdata.min, Cl.cdata.mcount);
  SetLength(Cl.cdata.priv, Cl.cdata.mcount);
  Edit68.Text := IntToStr(Cl.cdata.mcount);
  if Cl.cdata.family.Count<>0 then
    curman := Cl.cdata.family.Count-1
  else begin
    curman := 0;
    Edit69.Text := '';
    Edit72.Text := '';
    Edit73.Text := '';
    Edit94.Text := '';
    MaskEdit1.Text := '';
    Combobox7.Text := '';
    Combobox17.Text := '';
    Combobox18.Text := '';
    Combobox7.OnChange(combobox7);
    Combobox17.OnChange(combobox17);
    Combobox18.OnChange(combobox18);
  end;
  Cl.SetNorm;
  Cl.SetMin;
  Cl.CalcPriv;
  Edit94.Text := FlToStr(Cl.cdata.pmin);
  SetIncome;
  SetKoef;
  Cl.cdata.tarifs[7] := RadioGroup2.ItemIndex+1;
  Cl.cdata.cost[7] := GetCostTarif(7,RadioGroup2.ItemIndex+1,Cl.cdata.begindate,0,Cl.cdata.mcount,cl.cdata.settl);
  if load and not CalcEmpty then begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.LVFamSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  i: integer;
begin
  if selected and (LVFam.Items.Count<>0) then begin
    i := LVFam.ItemIndex;
    curman := i;
    Edit69.Text := TMan(Cl.cdata.family[i]).fio;
    MaskEdit1.Text := DateToStr(TMan(Cl.cdata.family[i]).birth);
    if TMan(Cl.cdata.family[i]).pol=1 then
      RadioButton7.Checked := true;
    if TMan(Cl.cdata.family[i]).pol=2 then
      RadioButton8.Checked := true;
    Edit72.Text := FlToStr(TMan(Cl.cdata.family[i]).mid);
    Combobox17.Text := SelSt(TMan(Cl.cdata.family[i]).status);
    Combobox18.Text := SelPriv(TMan(Cl.cdata.family[i]).priv);
    Combobox7.Text := SelRel(TMan(Cl.cdata.family[i]).rel);
    Combobox7.OnChange(combobox7);
    Combobox17.OnChange(combobox17);
    Combobox18.OnChange(combobox18);
  end;
end;

procedure TForm2.ComboBox15Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchMng(Combobox15.Text);
  if ind <> -1 then
    Combobox15.ItemIndex := ind
  else begin
    Combobox15.ItemIndex := 0;
    Combobox15.Text := SelMng(mng[0]);
  end;
  if load then
    Cl.data.manager := mng[Combobox15.ItemIndex];
end;

procedure TForm2.ComboBox13Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchFnd(Combobox13.Text);
  if ind <> -1 then
    Combobox13.ItemIndex := ind
  else begin
    Combobox13.ItemIndex := 0;
    Combobox13.Text := SelFnd(fnd[0]);
  end;
  if load then
    Cl.data.fond := fnd[Combobox13.ItemIndex];
end;

procedure TForm2.ComboBox14Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchSettl(Combobox14.Text);
  if ind <> -1 then
    Combobox14.ItemIndex := ind
  else begin
    Combobox14.ItemIndex := 0;
    Combobox14.Text := SelSettl(settl[0]);
  end;
  if load then begin
    Cl.data.settl := settl[Combobox14.ItemIndex];
    Cl.cdata.settl := settl[Combobox14.ItemIndex];  //добавил эту строку 28.12.2006
    end;
end;

procedure TForm2.ComboBox16Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchOwn(Combobox16.Text);
  if ind <> -1 then
    Combobox16.ItemIndex := ind
  else begin
    Combobox16.ItemIndex := 0;
    Combobox16.Text := SelOwn(own[0]);
  end;
  if load then
    Cl.data.own := own[Combobox16.ItemIndex];
end;

procedure TForm2.ComboBox11Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchCntrl(Combobox11.Text);
  if ind <> -1 then
    Combobox11.ItemIndex := ind
  else begin
    Combobox11.ItemIndex := 0;
    Combobox11.Text := SelCntrl(cntrl[0]);
  end;
  if load then
    Cl.data.control := cntrl[Combobox11.ItemIndex];
end;

procedure TForm2.ComboBox17Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchSt(Combobox17.Text);
  if ind <> -1 then
    Combobox17.ItemIndex := ind
  else begin
    Combobox17.ItemIndex := 0;
    Combobox17.Text := SelSt(st[0]);
  end;
end;

procedure TForm2.ComboBox18Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchPriv(Combobox18.Text);
  if ind <> -1 then
    Combobox18.ItemIndex := ind
  else begin
    Combobox18.ItemIndex := 0;
    Combobox18.Text := SelPriv(p[0]);
  end;
end;

procedure TForm2.ComboBox19Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchBank(Combobox19.Text);
  if ind <> -1 then
    Combobox19.ItemIndex := ind
  else begin
    Combobox19.Text := SelBank(bank[0]);
    Combobox19.ItemIndex := 0;
  end;
  if load then
    Cl.data.bank := bank[Combobox19.ItemIndex];
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
var
  sts: integer;
begin
  sts := Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate);
  if not load then begin
    Edit12.ReadOnly := true;Edit15.ReadOnly := true;Edit18.ReadOnly := true;
    Edit21.ReadOnly := true;Edit24.ReadOnly := true;Edit27.ReadOnly := true;
    Edit30.ReadOnly := true;Edit33.ReadOnly := true;Edit36.ReadOnly := true;
    Edit59.ReadOnly := true;Edit65.ReadOnly := true;
    Edit13.ReadOnly := true;Edit16.ReadOnly := true;Edit19.ReadOnly := true;
    Edit22.ReadOnly := true;Edit25.ReadOnly := true;Edit28.ReadOnly := true;
    Edit31.ReadOnly := true;Edit34.ReadOnly := true;Edit37.ReadOnly := true;
    Edit62.ReadOnly := true;
    Edit96.ReadOnly := true;Edit97.ReadOnly := true;Edit98.ReadOnly := true;
    Edit99.ReadOnly := true;Edit100.ReadOnly := true;Edit101.ReadOnly := true;
    Edit102.ReadOnly := true;Edit103.ReadOnly := true;Edit104.ReadOnly := true;
    Edit105.ReadOnly := true;Edit84.ReadOnly := true;
    Edit39.ReadOnly := true;Edit41.ReadOnly := true;Edit43.ReadOnly := true;
    Edit45.ReadOnly := true;Edit47.ReadOnly := true;Edit49.ReadOnly := true;
    Edit51.ReadOnly := true;Edit53.ReadOnly := true;Edit55.ReadOnly := true;
    Edit70.ReadOnly := true;
    Edit12.Color := clBtnFace;Edit15.Color := clBtnFace;Edit18.Color := clBtnFace;
    Edit21.Color := clBtnFace;Edit24.Color := clBtnFace;Edit27.Color := clBtnFace;
    Edit30.Color := clBtnFace;Edit33.Color := clBtnFace;Edit36.Color := clBtnFace;
    Edit59.Color := clBtnFace;Edit65.Color := clBtnFace;
    Edit13.Color := clBtnFace;Edit16.Color := clBtnFace;Edit19.Color := clBtnFace;
    Edit22.Color := clBtnFace;Edit25.Color := clBtnFace;Edit28.Color := clBtnFace;
    Edit31.Color := clBtnFace;Edit34.Color := clBtnFace;Edit37.Color := clBtnFace;
    Edit62.Color := clBtnFace;
    Edit96.Color := clBtnFace;Edit97.Color := clBtnFace;Edit98.Color := clBtnFace;
    Edit99.Color := clBtnFace;Edit100.Color := clBtnFace;Edit101.Color := clBtnFace;
    Edit102.Color := clBtnFace;Edit103.Color := clBtnFace;Edit104.Color := clBtnFace;
    Edit105.Color := clBtnFace;Edit84.Color := clBtnFace;
    Edit39.Color := clBtnFace;Edit41.Color := clBtnFace;Edit43.Color := clBtnFace;
    Edit45.Color := clBtnFace;Edit47.Color := clBtnFace;Edit49.Color := clBtnFace;
    Edit51.Color := clBtnFace;Edit53.Color := clBtnFace;Edit55.Color := clBtnFace;
    Edit70.Color := clBtnFace;
    Combobox1.Enabled := true; Combobox2.Enabled := true;
    Combobox3.Enabled := true; Combobox4.Enabled := true;
    Combobox5.Enabled := true; Combobox6.Enabled := true;
    Combobox8.Enabled := true; Combobox9.Enabled := true;
    Combobox20.Enabled := true;
    RadioGroup2.Enabled := true;RadioGroup3.Enabled := true;
  end;
  if CheckBox1.Checked then begin
    if (sts=0) then begin
      if Cl.cdata.rstnd<>0 then begin
        Edit12.ReadOnly := false;Edit15.ReadOnly := false;
        Edit18.ReadOnly := false;Edit21.ReadOnly := false;
        Edit24.ReadOnly := false;Edit27.ReadOnly := false;
        Edit30.ReadOnly := false;Edit33.ReadOnly := false;
        Edit36.ReadOnly := false;Edit59.ReadOnly := false;
        Edit65.ReadOnly := false;
        Edit12.Color := clWindow;Edit15.Color := clWindow;
        Edit18.Color := clWindow;Edit21.Color := clWindow;
        Edit24.Color := clWindow;Edit27.Color := clWindow;
        Edit30.Color := clWindow;Edit33.Color := clWindow;
        Edit36.Color := clWindow;Edit59.Color := clWindow;
        Edit65.Color := clWindow;
      end
      else begin
        Edit13.ReadOnly := false;Edit16.ReadOnly := false;
        Edit19.ReadOnly := false;Edit22.ReadOnly := false;
        Edit25.ReadOnly := false;Edit28.ReadOnly := false;
        Edit31.ReadOnly := false;Edit34.ReadOnly := false;
        Edit37.ReadOnly := false;Edit62.ReadOnly := false;
        Edit13.Color := clWindow;Edit16.Color := clWindow;
        Edit19.Color := clWindow;Edit22.Color := clWindow;
        Edit25.Color := clWindow;Edit28.Color := clWindow;
        Edit31.Color := clWindow;Edit34.Color := clWindow;
        Edit37.Color := clWindow;Edit62.Color := clWindow;
      end;
    end
    else begin
      if Cl.cdata.rstnd<>0 then begin
        Edit96.ReadOnly := false;Edit97.ReadOnly := false;
        Edit98.ReadOnly := false;Edit99.ReadOnly := false;
        Edit100.ReadOnly := false;Edit101.ReadOnly := false;
        Edit102.ReadOnly := false;Edit103.ReadOnly := false;
        Edit104.ReadOnly := false;Edit105.ReadOnly := false;
        Edit84.ReadOnly := false;
        Edit96.Color := clWindow;Edit97.Color := clWindow;
        Edit98.Color := clWindow;Edit99.Color := clWindow;
        Edit100.Color := clWindow;Edit101.Color := clWindow;
        Edit102.Color := clWindow;Edit103.Color := clWindow;
        Edit104.Color := clWindow;Edit105.Color := clWindow;
        Edit84.Color := clWindow;
      end
      else begin
        Edit39.ReadOnly := false;Edit41.ReadOnly := false;
        Edit43.ReadOnly := false;Edit45.ReadOnly := false;
        Edit47.ReadOnly := false;Edit49.ReadOnly := false;
        Edit51.ReadOnly := false;Edit53.ReadOnly := false;
        Edit55.ReadOnly := false;Edit70.ReadOnly := false;
        Edit39.Color := clWindow;Edit41.Color := clWindow;
        Edit43.Color := clWindow;Edit45.Color := clWindow;
        Edit47.Color := clWindow;Edit49.Color := clWindow;
        Edit51.Color := clWindow;Edit53.Color := clWindow;
        Edit55.Color := clWindow;Edit70.Color := clWindow;
      end;
    end;
    Combobox1.Enabled := false; Combobox2.Enabled := false;
    Combobox3.Enabled := false; Combobox4.Enabled := false;
    Combobox5.Enabled := false; Combobox6.Enabled := false;
    Combobox8.Enabled := false; Combobox9.Enabled := false;
    Combobox20.Enabled := false;
    RadioGroup2.Enabled := false;RadioGroup3.Enabled := false;
  end
  else begin
    if (sts=0) then begin
      if Cl.cdata.rstnd<>0 then begin
        Edit12.ReadOnly := true;Edit15.ReadOnly := true;
        Edit18.ReadOnly := true;Edit21.ReadOnly := true;
        Edit24.ReadOnly := true;Edit27.ReadOnly := true;
        Edit30.ReadOnly := true;Edit33.ReadOnly := true;
        Edit36.ReadOnly := true;Edit59.ReadOnly := true;
        Edit65.ReadOnly := true;
        Edit12.Color := clBtnFace;Edit15.Color := clBtnFace;
        Edit18.Color := clBtnFace;Edit21.Color := clBtnFace;
        Edit24.Color := clBtnFace;Edit27.Color := clBtnFace;
        Edit30.Color := clBtnFace;Edit33.Color := clBtnFace;
        Edit36.Color := clBtnFace;Edit59.Color := clBtnFace;
        Edit65.Color := clBtnFace;
      end
      else begin
        Edit13.ReadOnly := true;Edit16.ReadOnly := true;
        Edit19.ReadOnly := true;Edit22.ReadOnly := true;
        Edit25.ReadOnly := true;Edit28.ReadOnly := true;
        Edit31.ReadOnly := true;Edit34.ReadOnly := true;
        Edit37.ReadOnly := true;Edit62.ReadOnly := true;
        Edit13.Color := clBtnFace;Edit16.Color := clBtnFace;
        Edit19.Color := clBtnFace;Edit22.Color := clBtnFace;
        Edit25.Color := clBtnFace;Edit28.Color := clBtnFace;
        Edit31.Color := clBtnFace;Edit34.Color := clBtnFace;
        Edit37.Color := clBtnFace;Edit62.Color := clBtnFace;
      end;
    end
    else begin
      if Cl.cdata.rstnd<>0 then begin
        Edit96.ReadOnly := true;Edit97.ReadOnly := true;
        Edit98.ReadOnly := true;Edit99.ReadOnly := true;
        Edit100.ReadOnly := true;Edit101.ReadOnly := true;
        Edit102.ReadOnly := true;Edit103.ReadOnly := true;
        Edit104.ReadOnly := true;Edit105.ReadOnly := true;
        Edit84.ReadOnly := true;
        Edit96.Color := clBtnFace;Edit97.Color := clBtnFace;
        Edit98.Color := clBtnFace;Edit99.Color := clBtnFace;
        Edit100.Color := clBtnFace;Edit101.Color := clBtnFace;
        Edit102.Color := clBtnFace;Edit103.Color := clBtnFace;
        Edit104.Color := clBtnFace;Edit105.Color := clBtnFace;
        Edit84.Color := clBtnFace;
      end
      else begin
        Edit39.ReadOnly := true;Edit41.ReadOnly := true;
        Edit43.ReadOnly := true;Edit45.ReadOnly := true;
        Edit47.ReadOnly := true;Edit49.ReadOnly := true;
        Edit51.ReadOnly := true;Edit53.ReadOnly := true;
        Edit55.ReadOnly := true;Edit70.ReadOnly := true;
        Edit39.Color := clBtnFace;Edit41.Color := clBtnFace;
        Edit43.Color := clBtnFace;Edit45.Color := clBtnFace;
        Edit47.Color := clBtnFace;Edit49.Color := clBtnFace;
        Edit51.Color := clBtnFace;Edit53.Color := clBtnFace;
        Edit55.Color := clBtnFace;Edit70.Color := clBtnFace;
      end;
    end;
    Combobox1.Enabled := true; Combobox2.Enabled := true;
    Combobox3.Enabled := true; Combobox4.Enabled := true;
     Combobox5.Enabled := true; Combobox6.Enabled := true;
    Combobox8.Enabled := true; Combobox9.Enabled := true;
    Combobox20.Enabled := true;
    RadioGroup2.Enabled := true;RadioGroup3.Enabled := true;
  end;
  if load then begin
    if (Cl.cdata.calc=0) then
      Cl.cdata.calc := 1
    else
      Cl.cdata.calc := 0;
  end;
  if load and not CalcEmpty then begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  curmonth := StrToInt(Copy(Form1.rdt,4,2));
  PageControl1.TabIndex := 0;
  load := false;
  att := 0;
  Clear;
  Fill;
  Edit57.SetFocus;
  Cl := TClient.Create(Empty,EmptyC);
  Button2.Enabled := false;
  case status of
  0://добавить клиента
    begin
      load := true;
      Form2.Caption := 'Добавить клиента';
      Button2.Caption := 'Добавить клиента';
      SetDefault;
      Edit86.Text := SelInsp(Cl.data.insp);
      Edit88.Text := DateToStr(Date);
      MaskEdit4.Text:= DateToStr(Date);
    end;
  1://изменить/просмотр клиента
    begin
      Form2.Caption := 'Изменить/Просмотр клиента';
      Button2.Caption := 'Изменить клиента';
      Cl.SetClient(Form1.client,Form1.rdt);
      Cl.SetCalc(Form1.client,Form1.rdt);
      SetData;
      load := true;
      SumV;
      if not fam then //семья загрузилась неполностью
        ShowMessage('Семья загрузилась некорректно! Указанное число членов семьи на совпадает с фактическим! Производить расчеты невозможно!');
    end;
  end;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  if load and not CalcEmpty then begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.ComboBox7Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchRel(Combobox7.Text);
  if ind <> -1 then
    Combobox7.ItemIndex := ind
  else begin
    Combobox7.Text := SelRel(rel[0]);
    Combobox7.ItemIndex := 0;
  end;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  NewPeriod;
end;

procedure TForm2.PageControl1Change(Sender: TObject);
begin
  if Edit57.Text='' then
    PageControl1.TabIndex := 0
  else
  begin
    if PageControl1.TabIndex=4 then begin
      if Form1.CheckP2 then
        Button2.Enabled := true;
  end
  else begin
        Button2.Enabled := false;
          if PageControl1.TabIndex=1 then
            begin
              if Cl.cdata.family.Count=0 then
                begin
                  Edit69.Text := Edit57.Text;
                  MaskEdit1.Text := '01.01.1940';
                  RadioButton7.Checked := true;
                  Edit72.Text := '0';
                  Combobox17.Text := SelSt(8);
                  Combobox18.Text := SelPriv(0);
                  Combobox7.Text := SelRel(1);
                  Combobox17.OnChange(combobox17);
                  Combobox18.OnChange(combobox18);
                  Combobox7.OnChange(combobox7);
                end;
            end;
       end;
  end;
end;

function TForm2.CheckPers: boolean;
var
  v: array[0..19] of integer;
  koef: array[0..19] of integer;
  s: string;
  i, k: integer;
begin
  if (Length(Edit83.Text)=20)and(cl.data.bank<>0)and(cl.data.bank<>78)and
      (cl.data.bank<>79)and(cl.data.bank<>83)and IsNumber(Edit83.Text) then begin
    s := Edit83.Text;
    for i:=0 to 19 do
      v[i] := StrToInt(s[i+1]);
    i := 0;
    while i<17 do begin
      koef[i] := 7;
      koef[i+1] := 1;
      koef[i+2] := 3;
      i := i+3;
    end;
    koef[18] := 7;
    koef[19] := 1;
    k := 0;
    for i:=0 to 19 do begin
      if i<>8 then
        k := k + (v[i]*koef[i] mod 10);
    end;
    k := (((k + 18) mod 10)*3) mod 10;
    if k=v[8] then
      result := true
    else
      result := false;
  end
  else begin
    if IsInt(Edit83.Text)and(Length(Edit83.Text)=6)and(cl.data.bank=83)or
      (Length(Edit83.Text)<=12)and((cl.data.bank=78)or(cl.data.bank=79)) or
      (Edit83.Text='')and(cl.data.bank=0) then
      Result := true
    else
      Result := false;
  end;
end;

function TForm2.CheckLS(s: string): boolean;
var
  v: array[0..10] of integer;
  koef: array[0..9] of integer;
  i, k: integer;
begin
  if (s<>'') then begin
    if IsNumber(s)and(Length(s)=11) then begin
      for i:=1 to 11 do
        v[i-1] := StrToInt(s[i]);
      i := 0;
      while i<7 do begin
        koef[i] := 7;
        koef[i+1] := 1;
        koef[i+2] := 3;
        i := i+3;
      end;
      koef[i] := 7;
      k := 0;
      for i:=0 to 9 do
        k := k + (v[i]*koef[i] mod 10);
      k := (k mod 10)*3 mod 10;
      if k=v[10] then
        result := true
      else
        result := false;
    end
    else
      result := true;
  end
  else
    result := false;
end;

function TForm2.CheckLS: boolean;
var
  res: boolean;
begin
  if CheckLS(Edit74.Text)and {CheckLS(Edit75.Text)and} CheckLS(Edit76.Text)and
     CheckLS(Edit77.Text)and CheckLS(Edit78.Text)and CheckLS(Edit79.Text)and
     CheckLS(Edit80.Text) then
    res := true
  else
    res := false;
  if ((Edit81.Text<>'')and(Edit82.Text<>'')and CheckLS(Edit81.Text)and
      CheckLS(Edit82.Text) or (Edit81.Text='')and(Edit82.Text=''))and res then
    Result := true
  else
    Result := false;
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  if (Edit74.Text<>'') then begin
    Edit75.Text := Edit74.Text;
    Edit76.Text := Edit74.Text;
    Edit58.Text := Edit74.Text;
    Edit77.Text := Edit74.Text;
    Edit78.Text := Edit74.Text;
    Edit79.Text := Edit74.Text;
    Edit80.Text := Edit74.Text;
    Edit81.Text := Edit74.Text;
    Edit82.Text := Edit74.Text;
    Edit75.OnChange(edit75);Edit76.OnChange(edit76);Edit77.OnChange(edit77);
    Edit78.OnChange(edit78);Edit79.OnChange(edit79);Edit80.OnChange(edit80);
    Edit81.OnChange(edit81);Edit82.OnChange(edit82);Edit58.OnChange(edit58);
  end;
end;

procedure TForm2.TabSheet4Exit(Sender: TObject);
begin
  if Edit83.Font.Color=clRed then
    Pagecontrol1.TabIndex := 3;
end;

procedure TForm2.TabSheet1Exit(Sender: TObject);
begin
  if Edit57.Text='' then
    Pagecontrol1.TabIndex := 0;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  if load then
    RadioGroup1.ItemIndex := Cl.data.cert-1;
end;

procedure TForm2.Edit74Change(Sender: TObject);
begin
  with Sender as TEdit do begin
    if load then begin
      if IsNumber(Copy(Text,1,1)) then begin
        try
          if CheckLS(Text) then
            Font.Color := clWindowText
          else
            Font.Color := clRed;
        except
            Font.Color := clRed;
        end;
      end
      else
        Font.Color := clRed;
      if Sender=Edit74 then Cl.cdata.accounts[0] := Edit74.Text;
      if Sender=Edit75 then Cl.cdata.accounts[1] := Edit75.Text;
      if Sender=Edit76 then Cl.cdata.accounts[2] := Edit76.Text;
      if Sender=Edit77 then Cl.cdata.accounts[3] := Edit77.Text;
      if Sender=Edit58 then Cl.cdata.accounts[4] := Edit58.Text;
      if Sender=Edit78 then Cl.cdata.accounts[5] := Edit78.Text;
      if Sender=Edit79 then Cl.cdata.accounts[6] := Edit79.Text;
      if Sender=Edit80 then Cl.cdata.accounts[7] := Edit80.Text;
      if Sender=Edit81 then Cl.cdata.accounts[12] := Edit81.Text;
      if Sender=Edit82 then Cl.cdata.accounts[13] := Edit82.Text;
    end;
  end;
end;

function TForm2.CheckMems: boolean;
var
  i,mn: integer;
  y, m, d, yc, mc, dc: word;
begin
  if not CheckBox1.Checked then begin
    DecodeDate(Date, yc, mc, dc);//текущая дата
    for i:=0 to Cl.cdata.family.Count-1 do begin
      DecodeDate(TMan(cl.cdata.family[i]).birth, y, m, d);//дата рождения
      y := yc-y;//возраст
      if (m>mc)or(m=mc)and(d>dc) then
        y := y-1;
      mn := FromSt(TMan(Cl.cdata.family[i]).status);
      if (TMan(Cl.cdata.family[i]).pol=1) and
        ( (y<16)and(mn=1) or
          (y>=16)and(y<55)and(mn=3) or
          (y>=55)and(mn=2)or
          (y<55)and(mn=2)and(TMan(Cl.cdata.family[i]).priv<>0)
        ) or
        (TMan(Cl.cdata.family[i]).pol=2) and
        ( (y<16)and(mn=1) or
          (y>=16)and(y<60)and(mn=3) or
          (y>=60)and(mn=2)or
          (y<60)and(mn=2)and(TMan(Cl.cdata.family[i]).priv<>0)
        )then
        Result := true
      else begin
        Result := false;
        exit;
      end;
      if (TMan(Cl.cdata.family[i]).rel=1)and ExistMem or
          (TMan(Cl.cdata.family[i]).rel<>1) then
        Result := true
      else begin
        Result := false;
        exit;
      end;
    end;
  end
  else
    Result := true;
end;

function TForm2.CheckCountMem: boolean;
begin
  Result := (Cl.cdata.mcount=Cl.cdata.family.Count);
end;

procedure TForm2.RadioGroup2Click(Sender: TObject);
begin
  if load then begin
    Cl.cdata.tarifs[7] := RadioGroup2.ItemIndex+1;
    Cl.cdata.cost[7] := GetCostTarif(7,RadioGroup2.ItemIndex+1,Cl.cdata.begindate,0,Cl.cdata.mcount,cl.cdata.settl);
  end;
  case RadioGroup2.ItemIndex of
  0://газовая
    begin
      if load and not CalcEmpty then begin
        Cl.CalcServ(7);
        Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
        SetVCalc;
        SumV;
      end;
    end;
  1://электрическая
    begin
      if load and not CalcEmpty then begin
        Cl.CalcServ(7);
        Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
        SetVCalc;
        SumV;
      end;
    end;
  2://прочие
    begin
      if load and not CalcEmpty then begin
        Cl.CalcServ(7);
        Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
        SetVCalc;
        SumV;
      end;
    end;
  end;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  if Checkbox2.Checked then begin
    if load then
      Cl.cdata.boiler := 1;
  end
  else begin
    if load then
      Cl.cdata.boiler := 0;
  end;
  if (Length(cold)>0)and(Length(hot)>0) then begin
    combobox3.OnChange(combobox3);
    combobox4.OnChange(combobox4);
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.Memo1Change(Sender: TObject);
begin
  if IsRus(Memo1.Text) then begin
    Memo1.Font.Color := clWindowText;
    if load then
      Cl.data.reason := Memo1.Text;
  end
  else begin
    Memo1.Font.Color := clRed;
    ShowMessage('Можно использовать буквы только кириллицы!');
  end;
end;

procedure TForm2.Button10Click(Sender: TObject);
var
  nam,namet,capt: string;
begin
  if Sender=Button10 then begin
    capt := 'Тарифы на содержание жилья(руб./кв.м.)';
    nam := 'cont';
    namet := Combobox1.Text;
  end;
  if Sender=Button11 then begin
    capt := 'Тарифы на ремонт жилья(руб./кв.м.)';
    nam := 'rep';
    namet := Combobox2.Text;
  end;
  if Sender=Button12 then begin
    capt := 'Тарифы на водопотребление с откр/закр водоразбором(руб./чел.)';
    nam := 'cold';
    namet := Combobox3.Text;
  end;
  if Sender=Button13 then begin
    capt := 'Тарифы на го.воду с откр/закр водоразбором(руб./чел.)';
    nam := 'hot';
    namet := Combobox4.Text;
  end;
  if Sender=Button14 then begin
    capt := 'Тарифы на водоотведение(руб./чел.)';
    nam := 'canal';
    namet := Combobox20.Text;
  end;
  if Sender=Button15 then begin
    capt := 'Тарифы на отопление(руб./кв.м.)';
    nam := 'heat';
    namet := Combobox5.Text;
  end;
  if Sender=Button16 then begin
    capt := 'Тарифы на газ(руб./чел.)';
    nam := 'gas';
    namet := Combobox6.Text;
  end;
  if Sender=Button17 then begin
    capt := 'Тарифы на дрова(руб./кв.м.)';
    nam := 'wood';
    namet := Combobox8.Text;
  end;
  if Sender=Button18 then begin
    capt := 'Тарифы на уголь(руб./кв.м.)';
    nam := 'coal';
    namet := Combobox9.Text;
  end;
  if (Sender=Button12) or (Sender=Button13) then begin
    Form39.Caption := capt;
    Form39.nam := nam;
    Form39.namet := namet;
    Form39.ShowModal;
    if Form39.ac then begin
      if Sender=Button12 then begin
        Combobox3.Text := Form39.namet;
        Combobox3.OnChange(combobox3);
      end
      else begin
        Combobox4.Text := Form39.namet;
        Combobox4.OnChange(combobox4);
      end;
    end;
  end;
  if (Sender=Button10) or (Sender=Button11) or (Sender=Button14) or
    (Sender=Button15) or (Sender=Button16) or (Sender=Button17) or
    (Sender=Button18)then begin
    Form37.Caption := capt;
    Form37.nam := nam;
    Form37.namet := namet;
    Form37.ShowModal;
    if Form37.ac then begin
      if Sender=Button10 then begin
        Combobox1.Text := Form37.namet;
        Combobox1.OnChange(combobox1);
      end;
      if Sender=Button11 then begin
        Combobox2.Text := Form37.namet;
        Combobox2.OnChange(combobox2);
      end;
      if Sender=Button14 then begin
        Combobox20.Text := Form37.namet;
        Combobox20.OnChange(combobox20);
      end;
      if Sender=Button15 then begin
        Combobox5.Text := Form37.namet;
        Combobox5.OnChange(combobox5);
      end;
      if Sender=Button16 then begin
        Combobox6.Text := Form37.namet;
        Combobox6.OnChange(combobox6);
      end;
      if Sender=Button17 then begin
        Combobox8.Text := Form37.namet;
        Combobox8.OnChange(combobox8);
      end;
      if Sender=Button18 then begin
        Combobox9.Text := Form37.namet;
        Combobox9.OnChange(combobox9);
      end;
    end;
  end;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  Form11.status := 0;
  Form11.ShowModal;
end;

procedure TForm2.Button19Click(Sender: TObject);
//сменить текущего инспектора
begin
  Form17.ShowModal;
  if Form17.ac and (Cl.data.insp<>Form1.insp) then begin
    Cl.data.insp := Form1.insp;
    Edit86.Text := Form17.nameinsp;
    if (status=0) then
      SetRegn;
  end;
end;

procedure TForm2.RadioGroup3Click(Sender: TObject);
begin
  if load then
    Cl.cdata.mdd := RadioGroup3.ItemIndex;
  if load and not CalcEmpty then begin
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TForm2.Edit57Exit(Sender: TObject);
begin
  if CheckRus(edit57) and load then
    Cl.data.fio := Edit57.Text;
end;

procedure TForm2.Edit57KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then begin
    if CheckRus(edit57) and load then
      Cl.data.fio := Edit57.Text;
  end;
end;

procedure TForm2.Edit63Exit(Sender: TObject);
begin
  if CheckRus(edit63) and load then
    Cl.data.apart := Edit63.Text;
end;

procedure TForm2.Edit63KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then begin
    if CheckRus(edit63) and load then
      Cl.data.apart := Edit63.Text;
  end;
end;

procedure TForm2.Edit64Exit(Sender: TObject);
begin
  if CheckInt(edit64) and load then
    Cl.data.tel := Edit64.Text;
end;

procedure TForm2.Edit64KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then begin
    if CheckInt(edit64) and load then
      Cl.data.tel := Edit64.Text;
  end;
end;

procedure TForm2.Edit66Exit(Sender: TObject);
begin
  if CheckNumb(TEdit(Sender))and load then begin
    if Sender=Edit66 then begin
      SetPoint(Edit66);
      Cl.cdata.square := StrToFloat(Edit66.Text);
      Cl.cdata.lsquare := Cl.cdata.square;
      Edit110.Text := FloatToStr(Cl.cdata.lsquare);
    end;
    if Sender=Edit110 then begin
      SetPoint(Edit110);
      Cl.cdata.lsquare := StrToFloat(Edit110.Text);
    end;
    if Cl.cdata.calc=1 then begin
      if TEdit(Sender).Enabled then
        SetPoint(TEdit(Sender));
      if Sender=Edit12 then Cl.cdata.bpm[0] := StrToFloat(Edit12.Text);
      if Sender=Edit15 then Cl.cdata.bpm[1] := StrToFloat(Edit15.Text);
      if Sender=Edit18 then Cl.cdata.bpm[2] := StrToFloat(Edit18.Text);
      if Sender=Edit21 then Cl.cdata.bpm[3] := StrToFloat(Edit21.Text);
      if Sender=Edit59 then Cl.cdata.bpm[4] := StrToFloat(Edit59.Text);
      if Sender=Edit24 then Cl.cdata.bpm[5] := StrToFloat(Edit24.Text);
      if Sender=Edit27 then Cl.cdata.bpm[6] := StrToFloat(Edit27.Text);
      if Sender=Edit30 then Cl.cdata.bpm[7] := StrToFloat(Edit30.Text);
      if Sender=Edit33 then Cl.cdata.bpm[12] := StrToFloat(Edit33.Text);
      if Sender=Edit36 then Cl.cdata.bpm[13] := StrToFloat(Edit36.Text);
      if Sender=Edit13 then Cl.cdata.bsnpm[0] := StrToFloat(Edit13.Text);
      if Sender=Edit16 then Cl.cdata.bsnpm[1] := StrToFloat(Edit16.Text);
      if Sender=Edit19 then Cl.cdata.bsnpm[2] := StrToFloat(Edit19.Text);
      if Sender=Edit22 then Cl.cdata.bsnpm[3] := StrToFloat(Edit22.Text);
      if Sender=Edit62 then Cl.cdata.bsnpm[4] := StrToFloat(Edit62.Text);
      if Sender=Edit25 then Cl.cdata.bsnpm[5] := StrToFloat(Edit25.Text);
      if Sender=Edit28 then Cl.cdata.bsnpm[6] := StrToFloat(Edit28.Text);
      if Sender=Edit31 then Cl.cdata.bsnpm[7] := StrToFloat(Edit31.Text);
      if Sender=Edit34 then Cl.cdata.bsnpm[12] := StrToFloat(Edit34.Text);
      if Sender=Edit37 then Cl.cdata.bsnpm[13] := StrToFloat(Edit37.Text);
      if Sender=Edit96 then Cl.cdata.pm[0] := StrToFloat(Edit96.Text);
      if Sender=Edit97 then Cl.cdata.pm[1] := StrToFloat(Edit97.Text);
      if Sender=Edit98 then Cl.cdata.pm[2] := StrToFloat(Edit98.Text);
      if Sender=Edit99 then Cl.cdata.pm[3] := StrToFloat(Edit99.Text);
      if Sender=Edit100 then Cl.cdata.pm[4] := StrToFloat(Edit100.Text);
      if Sender=Edit101 then Cl.cdata.pm[5] := StrToFloat(Edit101.Text);
      if Sender=Edit102 then Cl.cdata.pm[6] := StrToFloat(Edit102.Text);
      if Sender=Edit103 then Cl.cdata.pm[7] := StrToFloat(Edit103.Text);
      if Sender=Edit104 then Cl.cdata.pm[12] := StrToFloat(Edit104.Text);
      if Sender=Edit105 then Cl.cdata.pm[13] := StrToFloat(Edit105.Text);
      if Sender=Edit39 then Cl.cdata.snpm[0] := StrToFloat(Edit39.Text);
      if Sender=Edit41 then Cl.cdata.snpm[1] := StrToFloat(Edit41.Text);
      if Sender=Edit43 then Cl.cdata.snpm[2] := StrToFloat(Edit43.Text);
      if Sender=Edit45 then Cl.cdata.snpm[3] := StrToFloat(Edit45.Text);
      if Sender=Edit70 then Cl.cdata.snpm[4] := StrToFloat(Edit70.Text);
      if Sender=Edit47 then Cl.cdata.snpm[5] := StrToFloat(Edit47.Text);
      if Sender=Edit49 then Cl.cdata.snpm[6] := StrToFloat(Edit49.Text);
      if Sender=Edit51 then Cl.cdata.snpm[7] := StrToFloat(Edit51.Text);
      if Sender=Edit53 then Cl.cdata.snpm[12] := StrToFloat(Edit53.Text);
      if Sender=Edit55 then Cl.cdata.snpm[13] := StrToFloat(Edit55.Text);
      if Sender=Edit65 then Cl.cdata.bfpm[0] := StrToFloat(Edit65.Text);
      if Sender=Edit84 then Cl.cdata.fpm[0] := StrToFloat(Edit84.Text);
    end;
    if not CalcEmpty then begin
      Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
      SetVCalc;
      SumV;
    end;
  end;
end;

procedure TForm2.Edit66KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then begin
    if CheckNumb(TEdit(Sender))and load then begin
      if Sender=Edit66 then begin
        SetPoint(Edit66);
        Cl.cdata.square := StrToFloat(Edit66.Text);
        Cl.cdata.lsquare := Cl.cdata.square;
        Edit110.Text := FloatToStr(Cl.cdata.lsquare);
      end;
      if Sender=Edit110 then begin
        SetPoint(Edit110);
        Cl.cdata.lsquare := StrToFloat(Edit110.Text);
      end;
      if Cl.cdata.calc=1 then begin
        if TEdit(Sender).Enabled then
          SetPoint(TEdit(Sender));
        if Sender=Edit12 then Cl.cdata.bpm[0] := StrToFloat(Edit12.Text);
        if Sender=Edit15 then Cl.cdata.bpm[1] := StrToFloat(Edit15.Text);
        if Sender=Edit18 then Cl.cdata.bpm[2] := StrToFloat(Edit18.Text);
        if Sender=Edit21 then Cl.cdata.bpm[3] := StrToFloat(Edit21.Text);
        if Sender=Edit59 then Cl.cdata.bpm[4] := StrToFloat(Edit59.Text);
        if Sender=Edit24 then Cl.cdata.bpm[5] := StrToFloat(Edit24.Text);
        if Sender=Edit27 then Cl.cdata.bpm[6] := StrToFloat(Edit27.Text);
        if Sender=Edit30 then Cl.cdata.bpm[7] := StrToFloat(Edit30.Text);
        if Sender=Edit33 then Cl.cdata.bpm[12] := StrToFloat(Edit33.Text);
        if Sender=Edit36 then Cl.cdata.bpm[13] := StrToFloat(Edit36.Text);
        if Sender=Edit13 then Cl.cdata.bsnpm[0] := StrToFloat(Edit13.Text);
        if Sender=Edit16 then Cl.cdata.bsnpm[1] := StrToFloat(Edit16.Text);
        if Sender=Edit19 then Cl.cdata.bsnpm[2] := StrToFloat(Edit19.Text);
        if Sender=Edit22 then Cl.cdata.bsnpm[3] := StrToFloat(Edit22.Text);
        if Sender=Edit62 then Cl.cdata.bsnpm[4] := StrToFloat(Edit62.Text);
        if Sender=Edit25 then Cl.cdata.bsnpm[5] := StrToFloat(Edit25.Text);
        if Sender=Edit28 then Cl.cdata.bsnpm[6] := StrToFloat(Edit28.Text);
        if Sender=Edit31 then Cl.cdata.bsnpm[7] := StrToFloat(Edit31.Text);
        if Sender=Edit34 then Cl.cdata.bsnpm[12] := StrToFloat(Edit34.Text);
        if Sender=Edit37 then Cl.cdata.bsnpm[13] := StrToFloat(Edit37.Text);
        if Sender=Edit96 then Cl.cdata.pm[0] := StrToFloat(Edit96.Text);
        if Sender=Edit97 then Cl.cdata.pm[1] := StrToFloat(Edit97.Text);
        if Sender=Edit98 then Cl.cdata.pm[2] := StrToFloat(Edit98.Text);
        if Sender=Edit99 then Cl.cdata.pm[3] := StrToFloat(Edit99.Text);
        if Sender=Edit100 then Cl.cdata.pm[4] := StrToFloat(Edit100.Text);
        if Sender=Edit101 then Cl.cdata.pm[5] := StrToFloat(Edit101.Text);
        if Sender=Edit102 then Cl.cdata.pm[6] := StrToFloat(Edit102.Text);
        if Sender=Edit103 then Cl.cdata.pm[7] := StrToFloat(Edit103.Text);
        if Sender=Edit104 then Cl.cdata.pm[12] := StrToFloat(Edit104.Text);
        if Sender=Edit105 then Cl.cdata.pm[13] := StrToFloat(Edit105.Text);
        if Sender=Edit39 then Cl.cdata.snpm[0] := StrToFloat(Edit39.Text);
        if Sender=Edit41 then Cl.cdata.snpm[1] := StrToFloat(Edit41.Text);
        if Sender=Edit43 then Cl.cdata.snpm[2] := StrToFloat(Edit43.Text);
        if Sender=Edit45 then Cl.cdata.snpm[3] := StrToFloat(Edit45.Text);
        if Sender=Edit70 then Cl.cdata.snpm[4] := StrToFloat(Edit70.Text);
        if Sender=Edit47 then Cl.cdata.snpm[5] := StrToFloat(Edit47.Text);
        if Sender=Edit49 then Cl.cdata.snpm[6] := StrToFloat(Edit49.Text);
        if Sender=Edit51 then Cl.cdata.snpm[7] := StrToFloat(Edit51.Text);
        if Sender=Edit53 then Cl.cdata.snpm[12] := StrToFloat(Edit53.Text);
        if Sender=Edit55 then Cl.cdata.snpm[13] := StrToFloat(Edit55.Text);
        if Sender=Edit65 then Cl.cdata.bfpm[0] := StrToFloat(Edit65.Text);
        if Sender=Edit84 then Cl.cdata.fpm[0] := StrToFloat(Edit84.Text);
      end;
      if not CalcEmpty then begin
        Cl.Calc(Form1.GetStatus(cl.cdata.begindate,cl.cdata.enddate));
        SetVCalc;
        SumV;
      end;
    end;
  end;
end;

procedure TForm2.Edit69Exit(Sender: TObject);
begin
  CheckRus(Edit69);
end;

procedure TForm2.Edit69KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(Edit69);
end;

procedure TForm2.MaskEdit1Exit(Sender: TObject);
begin
  CheckDate(maskedit1);
end;

procedure TForm2.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckDate(maskedit1); 
end;

procedure TForm2.Edit72Exit(Sender: TObject);
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm2.Edit72KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    SetPoint(TEdit(Sender));
end;

procedure TForm2.Edit83Change(Sender: TObject);
begin
  if load then begin
    if bank[Combobox19.ItemIndex]<>0 then begin
      try
      if CheckPers then begin
        Cl.data.acbank := Edit83.Text;
        Edit83.Font.Color := clWindowText;
      end
      else
        Edit83.Font.Color := clRed;
      except
        Edit83.Font.Color := clRed;
      end;
    end
    else begin
      Edit83.Text := '';
      Cl.data.acbank := '';
    end;
  end;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
  if Checkbox3.Checked then begin
    if load then
      Cl.data.mail := 1;
  end
  else begin
    if load then
      Cl.data.mail := 0;
  end;
end;

procedure TForm2.Edit111Exit(Sender: TObject);
begin
if StrToDate(MaskEdit4.Text) < Form1.Idate then
    begin
      ShowMessage('Указанная дата выходит за рамки доступного периода!');
      MaskEdit4.Text:= Edit87.Text;
    end;
end;

end.
