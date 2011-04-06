unit sclient;

interface

uses
  Buttons,
  Classes,
  client,
  ComCtrls,
  contnrs,
  Controls,
  DateUtils,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Mask,
  Math,
  Menus,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TViewMode = (vEdit, vAdd);
  TCalcMode = (cServ, cServe, cServSq, cServWC);

  TEditClForm = class(TForm)
    PageControl1:    TPageControl;
    TabSheet1:       TTabSheet;
    Label1:          TLabel;
    Label2:          TLabel;
    Label3:          TLabel;
    Label5:          TLabel;
    Label6:          TLabel;
    Label7:          TLabel;
    Label8:          TLabel;
    Label11:         TLabel;
    Label9:          TLabel;
    Label10:         TLabel;
    Label12:         TLabel;
    Label13:         TLabel;
    Label14:         TLabel;
    Label15:         TLabel;
    Label16:         TLabel;
    Label17:         TLabel;
    GroupBox2:       TGroupBox;
    Label4:          TLabel;
    Edit1:           TEdit;
    GroupBox6:       TGroupBox;
    Label32:         TLabel;
    Label33:         TLabel;
    TabSheet2:       TTabSheet;
    Label21:         TLabel;
    TabSheet3:       TTabSheet;
    TabSheet4:       TTabSheet;
    TabSheet5:       TTabSheet;
    GroupBox7:       TGroupBox;
    Label36:         TLabel;
    Label37:         TLabel;
    Label38:         TLabel;
    Label39:         TLabel;
    Label40:         TLabel;
    Label41:         TLabel;
    Label42:         TLabel;
    Label44:         TLabel;
    Label45:         TLabel;
    GroupBox8:       TGroupBox;
    Label35:         TLabel;
    Label34:         TLabel;
    Label46:         TLabel;
    Label47:         TLabel;
    Label48:         TLabel;
    Label49:         TLabel;
    Label50:         TLabel;
    Label51:         TLabel;
    Label52:         TLabel;
    Label53:         TLabel;
    Label54:         TLabel;
    GroupBox9:       TGroupBox;
    Label55:         TLabel;
    Label56:         TLabel;
    Label57:         TLabel;
    GroupBox10:      TGroupBox;
    Button2:         TButton;
    Button3:         TButton;
    Button4:         TButton;
    Button5:         TButton;
    Button8:         TButton;
    Edit12:          TEdit;
    Edit13:          TEdit;
    Edit14:          TEdit;
    Edit15:          TEdit;
    Edit16:          TEdit;
    Edit17:          TEdit;
    Edit18:          TEdit;
    Edit20:          TEdit;
    Edit24:          TEdit;
    Edit25:          TEdit;
    Edit26:          TEdit;
    Edit27:          TEdit;
    Edit28:          TEdit;
    Edit29:          TEdit;
    Edit19:          TEdit;
    Edit30:          TEdit;
    Edit31:          TEdit;
    Edit32:          TEdit;
    Edit33:          TEdit;
    Edit34:          TEdit;
    Edit35:          TEdit;
    Edit36:          TEdit;
    Edit37:          TEdit;
    Edit38:          TEdit;
    Edit39:          TEdit;
    Edit40:          TEdit;
    Edit41:          TEdit;
    Edit42:          TEdit;
    Edit43:          TEdit;
    Edit44:          TEdit;
    Edit45:          TEdit;
    Edit46:          TEdit;
    Edit47:          TEdit;
    Edit48:          TEdit;
    Edit49:          TEdit;
    Edit50:          TEdit;
    Edit51:          TEdit;
    Edit52:          TEdit;
    Edit53:          TEdit;
    Edit54:          TEdit;
    Edit55:          TEdit;
    Edit56:          TEdit;
    Edit57:          TEdit;
    ComboBox11:      TComboBox;
    ComboBox12:      TComboBox;
    Edit60:          TEdit;
    Edit61:          TEdit;
    Edit63:          TEdit;
    Edit64:          TEdit;
    ComboBox13:      TComboBox;
    ComboBox14:      TComboBox;
    Edit66:          TEdit;
    Edit68:          TEdit;
    ComboBox15:      TComboBox;
    Edit73:          TEdit;
    Edit74:          TEdit;
    Edit75:          TEdit;
    Edit76:          TEdit;
    Edit77:          TEdit;
    Edit78:          TEdit;
    Edit79:          TEdit;
    Edit80:          TEdit;
    Edit81:          TEdit;
    Edit82:          TEdit;
    Edit83:          TEdit;
    ComboBox19:      TComboBox;
    Edit85:          TEdit;
    Edit86:          TEdit;
    Edit87:          TEdit;
    Edit88:          TEdit;
    ComboBox16:      TComboBox;
    Label62:         TLabel;
    Edit89:          TEdit;
    Edit90:          TEdit;
    Edit91:          TEdit;
    Edit92:          TEdit;
    Edit93:          TEdit;
    Label63:         TLabel;
    Label64:         TLabel;
    Edit94:          TEdit;
    Edit95:          TEdit;
    MaskEdit2:       TMaskEdit;
    CheckBox1:       TCheckBox;
    Button9:         TButton;
    RadioGroup1:     TRadioGroup;
    LVFam:           TListView;
    Label43:         TLabel;
    ComboBox10:      TComboBox;
    Edit9:           TEdit;
    Button6:         TButton;
    Label66:         TLabel;
    Edit58:          TEdit;
    Edit59:          TEdit;
    Edit62:          TEdit;
    Edit67:          TEdit;
    Label67:         TLabel;
    Edit21:          TEdit;
    Edit22:          TEdit;
    Edit23:          TEdit;
    Edit70:          TEdit;
    Edit71:          TEdit;
    CheckBox2:       TCheckBox;
    MaskEdit3:       TMaskEdit;
    Memo1:           TMemo;
    Edit96:          TEdit;
    Edit97:          TEdit;
    Edit98:          TEdit;
    Edit99:          TEdit;
    Edit100:         TEdit;
    Edit101:         TEdit;
    Edit102:         TEdit;
    Edit103:         TEdit;
    Edit104:         TEdit;
    Edit105:         TEdit;
    Edit106:         TEdit;
    Label69:         TLabel;
    Edit65:          TEdit;
    Edit84:          TEdit;
    Button1:         TButton;
    Label70:         TLabel;
    Edit107:         TEdit;
    Label71:         TLabel;
    Edit108:         TEdit;
    Label18:         TLabel;
    Label20:         TLabel;
    Label61:         TLabel;
    Label23:         TLabel;
    Edit69:          TEdit;
    ComboBox17:      TComboBox;
    ComboBox18:      TComboBox;
    ComboBox7:       TComboBox;
    Label19:         TLabel;
    Label22:         TLabel;
    Label31:         TLabel;
    MaskEdit1:       TMaskEdit;
    Edit72:          TEdit;
    RadioButton7:    TRadioButton;
    RadioButton8:    TRadioButton;
    Button7:         TButton;
    Button19:        TButton;
    RadioGroup3:     TRadioGroup;
    UpDown1:         TUpDown;
    Edit109:         TEdit;
    Label28:         TLabel;
    Label73:         TLabel;
    Edit110:         TEdit;
    Label74:         TLabel;
    Label75:         TLabel;
    CheckBox3:       TCheckBox;
    Label76:         TLabel;
    MaskEdit4:       TMaskEdit;
    GroupBox1:       TGroupBox;
    ComboBox21:      TComboBox;
    GroupBox3:       TGroupBox;
    ComboBox22:      TComboBox;
    Bevel1:          TBevel;
    TabSheet6:       TTabSheet;
    TabControl1:     TTabControl;
    Panel1:          TPanel;
    GroupBox4:       TGroupBox;
    ComboBox23:      TComboBox;
    GroupBox5:       TGroupBox;
    StringGrid1:     TStringGrid;
    Panel2:          TPanel;
    Label77:         TLabel;
    Button20:        TButton;
    Button21:        TButton;
    Label78:         TLabel;
    Label80:         TLabel;
    Label79:         TLabel;
    Label81:         TLabel;
    Edit111:         TEdit;
    Edit112:         TEdit;
    Edit113:         TEdit;
    Edit114:         TEdit;
    Label82:         TLabel;
    GroupBox11:      TGroupBox;
    GroupBox12:      TGroupBox;
    MaskEdit5:       TMaskEdit;
    MaskEdit6:       TMaskEdit;
    Label85:         TLabel;
    Label83:         TLabel;
    Label86:         TLabel;
    Edit115:         TEdit;
    Edit116:         TEdit;
    Label84:         TLabel;
    Edit117:         TEdit;
    PageControl2:    TPageControl;
    TabSheet7:       TTabSheet;
    TabSheet8:       TTabSheet;
    comboBoxCont:    TComboBox;
    Label24:         TLabel;
    Button10:        TButton;
    Edit3:           TEdit;
    Label25:         TLabel;
    comboBoxMOP: TComboBox;
    Button11:        TButton;
    Edit4:           TEdit;
    Label26:         TLabel;
    comboBoxCold:    TComboBox;
    Button12:        TButton;
    Edit5:           TEdit;
    Label27:         TLabel;
    comboBoxHot:     TComboBox;
    Button13:        TButton;
    Edit6:           TEdit;
    Bevel6:          TBevel;
    Label87:         TLabel;
    Label65:         TLabel;
    comboBoxCanal:   TComboBox;
    Button14:        TButton;
    Edit2:           TEdit;
    Label29:         TLabel;
    comboBoxHeat:    TComboBox;
    Button15:        TButton;
    Edit7:           TEdit;
    Label30:         TLabel;
    comboBoxGas:     TComboBox;
    Button16:        TButton;
    Edit8:           TEdit;
    Label60:         TLabel;
    comboBoxWood:    TComboBox;
    Button17:        TButton;
    Edit10:          TEdit;
    Label72:         TLabel;
    comboBoxCoal:    TComboBox;
    Button18:        TButton;
    Edit11:          TEdit;
    Label88:         TLabel;
    comboBoxColdCounter: TComboBox;
    btnColdCounter:  TButton;
    Edit124:         TEdit;
    Edit125:         TEdit;
    btnHotCounter:   TButton;
    comboBoxHotCounter: TComboBox;
    Label89:         TLabel;
    Label90:         TLabel;
    comboBoxCanalCounter: TComboBox;
    btnCanalCounter: TButton;
    Edit126:         TEdit;
    Edit127:         TEdit;
    btnHeatCounter:  TButton;
    comboBoxHeatCounter: TComboBox;
    Label91:         TLabel;
    Label92:         TLabel;
    comboBoxGasCounter: TComboBox;
    btnGasCounter:   TButton;
    Edit128:         TEdit;
    CheckBox4:       TCheckBox;
    Edit118:         TEdit;
    CheckBox5:       TCheckBox;
    Edit119:         TEdit;
    CheckBox6:       TCheckBox;
    Edit120:         TEdit;
    CheckBox7:       TCheckBox;
    Edit121:         TEdit;
    CheckBox8:       TCheckBox;
    Edit122:         TEdit;
    CheckBox9:       TCheckBox;
    Edit123:         TEdit;
    Edit129:         TEdit;
    Edit130:         TEdit;
    Edit131:         TEdit;
    Edit132:         TEdit;
    Edit133:         TEdit;
    Edit134:         TEdit;
    Edit135:         TEdit;
    Edit136:         TEdit;
    Edit137:         TEdit;
    Edit138:         TEdit;
    Edit139:         TEdit;
    Edit140:         TEdit;
    Edit141:         TEdit;
    Edit142:         TEdit;
    Edit143:         TEdit;
    Edit144:         TEdit;
    Edit145:         TEdit;
    Edit146:         TEdit;
    Edit147:         TEdit;
    Edit148:         TEdit;
    Edit149:         TEdit;
    Edit150:         TEdit;
    Label93:         TLabel;
    Label58:         TLabel;
    Label59:         TLabel;
    Label68:         TLabel;
    Label94:         TLabel;
    CheckBox10:      TCheckBox;
    elevatorCheckBox: TCheckBox;
    Label95:         TLabel;
    npssEdit:        TEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure comboBoxContChange(Sender: TObject);
    procedure comboBoxMOPChange(Sender: TObject);
    procedure comboBoxColdChange(Sender: TObject);
    procedure comboBoxHotChange(Sender: TObject);
    procedure comboBoxHeatChange(Sender: TObject);
    procedure comboBoxGasChange(Sender: TObject);
    procedure comboBoxWoodChange(Sender: TObject);
    procedure comboBoxCoalChange(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure Edit60Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure LVFamSelectItem(Sender: TObject; Item: TListItem; Selected: boolean);
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
    procedure comboBoxCanalChange(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Edit57Exit(Sender: TObject);
    procedure Edit57KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit63Exit(Sender: TObject);
    procedure Edit63KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit64Exit(Sender: TObject);
    procedure Edit64KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit66Exit(Sender: TObject);
    procedure Edit66KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit69Exit(Sender: TObject);
    procedure Edit69KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit72Exit(Sender: TObject);
    procedure Edit72KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit83Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit111Exit(Sender: TObject);
    procedure ComboBox21Change(Sender: TObject);
    procedure ComboBox22Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure ComboBox23KeyPress(Sender: TObject; var Key: char);
    procedure ComboBox23Change(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
    procedure PageControl1DrawTab(Control: TCustomTabControl; TabIndex: integer; const Rect: TRect; Active: boolean);
    procedure StringGrid1MouseLeave(Sender: TObject);
    procedure Edit117Exit(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: integer; const Value: string);
    procedure CheckBox4Click(Sender: TObject);
    procedure Edit118Exit(Sender: TObject);
    procedure comboBoxColdCounterChange(Sender: TObject);
    procedure comboBoxHotCounterChange(Sender: TObject);
    procedure comboBoxCanalCounterChange(Sender: TObject);
    procedure comboBoxHeatCounterChange(Sender: TObject);
    procedure comboBoxGasCounterChange(Sender: TObject);
    procedure btnColdCounterClick(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
  private
    { Private declarations }
    load, fam: boolean;
    att:       integer;
    curmonth:  integer;//текущий месяц
    curprc:    integer;//текущий процент расхода тепла
    curman:    integer;//текущий член семьи
    str, mng, fnd, cntrl, settl, own, st, p, rel, bank: array of integer;
    cont, mop, cold, canal, hot, heat, gas, wood, coal, stnd: array of integer;

    fbegindate, fenddate: TDateTime;
    function AddClient: integer;  //добавить клиента
    function ModifyClient: integer; //изменить клиента
    procedure Clear;  //очистить нужные поля
    procedure Fill;   //заполнить Combobox
    procedure FillLV; //заполнить List View из family
    procedure SetData;//установить все данные
    function CalcEmpty: bool;
    function CardEmpty: bool;//пусты ключевые поля?
    function ExistHouse(var n: integer): bool;//существует дом?
    function ExistClient(var n: integer): bool;
    function ExistMem: bool;
    function ExistMemEx(var n: integer): bool;
    procedure SumV;    //суммировать начисления
    procedure SetVCalc;//вывести результаты расчета субсидии
    procedure SetRegn;
    procedure SetRegDate;
    procedure SetPeriod;
    procedure SetCert;
    procedure SetIncome;
    procedure SetKoef;//сд/пм & рпс/рпп
    procedure SetHouse(s: integer; n, c: string);//установить дом

    function SearchStreet(s: string): integer;
    function SearchMng(s: string): integer;
    function SearchFnd(s: string): integer;
    function SearchSettl(s: string): integer;
    function SearchOwn(s: string): integer;
    function SearchCntrl(s: string): integer;
    function SearchSt(s: string): integer;
    function SearchPriv(s: string): integer;
    function SearchBank(s: string): integer;
    function SearchRel(s: string): integer;
    function SearchStnd(s: string): integer;
    function SearchServIndex(ComboBox: TComboBox): integer; overload;
    function SearchServIndex(ComboBox: TComboBox; s: string): integer; overload;

    function CheckPers: boolean;
    function CheckLS(s: string): boolean; overload;
    function CheckLS: boolean; overload;

    function CheckCountMem: boolean;
    procedure SortFam;
    procedure NewPeriod;
    procedure SetDefault;
    function ErrorMessage: boolean;
    function IsAPeriod: boolean;
    procedure AddFamMan;
    procedure ModFamMan;

    procedure RecalcOneServ(s: integer; mode: TCalcMode);

    procedure ClearFactGrids;
    procedure ChangeFactPeriod(BD, ED: TDateTime);
    procedure CheckDifferenceFactSum;
    procedure UpdateFactInfo();
    function AddAnyMonth(BD, ED: TDateTime): TStringList;
    function GetColSum(StrGrid: TStringGrid; Col: integer): string;
    function calcMDiff(sub, fact: string): string;
    //procedure ChangePeriod(BD, ED: TDateTime);
  public
    { Public declarations }
    mode: TViewMode;//0-добавить,1-изменить
  end;

var
  EditClForm: TEditClForm;
  Cl:         TClient;

implementation

uses
  main,
  service,
  service2,
  datamodule,
  shtarif,
  shtarifb,
  chpriv,
  chinsp,
  MyTypes;

{$R *.dfm}

function TEditClForm.ErrorMessage: boolean;
var
  s, s1: string;
begin
  s1 := 'Недостаточно данных:' + #13;
  s  := '';
  Result := False;
  if not IsRus(Edit57.Text) or (Edit57.Text = '') then
    s := s + 'фамилия клиента введена неверно или не введена вовсе;' + #13;
  if not IsRus(Edit60.Text) or (Edit60.Text = '') or not IsNumber(Edit61.Text) then
    s := s + 'адрес клиента введен неверно или не введен вовсе;' + #13;
  if not ExistMem then
    s := s + 'фио клиента не существует в семье;' + #13;
  if (LVFam.Items.Count <> StrToInt(Edit68.Text)) then
    s := s + 'семья клиента не заполнена;' + #13;
  if not CheckPers then
    s := s + 'ПСС клиента введен неверно или не введен вовсе;' + #13;
  if ((Edit12.Text = '') or (Edit15.Text = '') or (Edit18.Text = '') or//базовые данные
    (Edit21.Text = '') or (Edit24.Text = '') or (Edit27.Text = '') or
    (Edit30.Text = '') or (Edit33.Text = '') or (Edit36.Text = '') or
    (Edit59.Text = '') or (Edit65.Text = '') or
    (Edit96.Text = '') or (Edit97.Text = '') or (Edit98.Text = '') or//текущие данные
    (Edit99.Text = '') or (Edit100.Text = '') or (Edit101.Text = '') or
    (Edit102.Text = '') or (Edit103.Text = '') or (Edit104.Text = '') or
    (Edit105.Text = '') or (Edit84.Text = '')) and CheckBox1.Checked then
    s := s + 'данные для индивидуального расчета введены неверно или не введены вовсе;' + #13;
  if s <> '' then
  begin
    s1 := s1 + s;
    ShowMessage(s1);
    Result := True;
  end;
end;

procedure TEditClForm.SetDefault;
var
  i: integer;
begin
  if load then
  begin
    Cl.cdata.calc := 0;
    Cl.cdata.mdd := RadioGroup3.ItemIndex;
    Cl.Data.insp := Form1.insp;
    Cl.Data.dist := Form1.dist;
    Cl.Data.change := Date;
    Cl.Data.declar := Date;
    Cl.Data.str := str[Combobox12.ItemIndex];
    Cl.cdata.rstnd := stnd[Combobox10.ItemIndex];
    Cl.cdata.indrstnd := False;
    Cl.cdata.indrstndval := 0;
    Cl.Data.control := cntrl[Combobox11.ItemIndex];
    Cl.Data.settl := settl[Combobox14.ItemIndex];

    Cl.Data.own  := own[Combobox16.ItemIndex];
    Cl.Data.manager := mng[Combobox15.ItemIndex];
    Cl.Data.fond := fnd[Combobox13.ItemIndex];
    Cl.Data.bank := bank[Combobox19.ItemIndex];
    Cl.cdata.boiler := 0;
    Cl.cdata.stop := 0;
    Cl.cdata.heating := 1;
    //------
    Cl.cdata.prevbegindate := 0;
    Cl.cdata.prevenddate := 0;
    Cl.cdata.averageFact := 0;
    Cl.cdata.dolgFact := 0;
    //------
    SetRegn;
    SetRegDate;
    SetPeriod;
    //------
    Cl.cdata.settl := settl[Combobox14.ItemIndex];
    Cl.cdata.tarifs[0] := cont[comboBoxCont.ItemIndex];
    Cl.cdata.tarifs[1] := mop[comboBoxMOP.ItemIndex];
    Cl.cdata.tarifs[2] := cold[comboBoxCold.ItemIndex];
    Cl.cdata.tarifs[3] := hot[comboBoxHot.ItemIndex];
    Cl.cdata.tarifs[4] := canal[comboBoxCanal.ItemIndex];
    Cl.cdata.tarifs[5] := heat[comboBoxHeat.ItemIndex];
    Cl.cdata.tarifs[6] := gas[comboBoxGas.ItemIndex];
    Cl.cdata.tarifs[7] := ComboBox21.ItemIndex + 1;
    Cl.cdata.tarifs[12] := wood[comboBoxWood.ItemIndex];
    Cl.cdata.tarifs[13] := coal[comboBoxCoal.ItemIndex];

    for i := 0 to numbtarif - 1 do
    begin
      Cl.cdata.cost[i] := GetCostTarif(i, Cl.cdata.tarifs[i], Cl.cdata.begindate, Cl.cdata.boiler, 0, Cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
      if i in [2..6] then
        Cl.cdata.tarifnorm[i] := GetNormTarif(i, Cl.cdata.tarifs[i], Cl.cdata.begindate, Cl.cdata.boiler, 0, Cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    end;
    //счетчики
    Edit118.Text := '0';
    Edit119.Text := '0';
    Edit120.Text := '0';
    Edit121.Text := '0';
    Edit122.Text := '0';
    Edit123.Text := '0';
    CheckBox4.Checked := False;
    CheckBox5.Checked := False;
    CheckBox6.Checked := False;
    CheckBox7.Checked := False;
    CheckBox8.Checked := False;
    CheckBox9.Checked := False;

    Cl.cdata.countertarifs[2] := cold[comboBoxCold.ItemIndex];
    Cl.cdata.countertarifs[3] := hot[comboBoxHot.ItemIndex];
    Cl.cdata.countertarifs[4] := canal[comboBoxCanal.ItemIndex];
    Cl.cdata.countertarifs[5] := heat[comboBoxHeat.ItemIndex];
    Cl.cdata.countertarifs[6] := gas[comboBoxGas.ItemIndex];
    Cl.cdata.countertarifs[7] := ComboBox21.ItemIndex + 1;

    for i := 0 to numbtarif - 1 do
      if Cl.cdata.counter[i] then
      begin
        Cl.cdata.countercost[i] := GetCostTarif(i, Cl.cdata.countertarifs[i], Cl.cdata.begindate, Cl.cdata.boiler, 0, Cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
        if i in [2..6] then
          Cl.cdata.counternorm[i] := GetNormTarif(i, Cl.cdata.countertarifs[i], Cl.cdata.begindate, Cl.cdata.boiler, 0, Cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
      end;
  end;
end;

function TEditClForm.CalcEmpty: bool;
var
  sts: integer;
begin
  sts := Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate);
  if (//индивидуальный расчет
    ((sts = 0) or (sts = 4)) and ((Edit12.Text = '') or (Edit15.Text = '') or//базовые данные
    (Edit18.Text = '') or (Edit21.Text = '') or (Edit24.Text = '') or
    (Edit27.Text = '') or (Edit30.Text = '') or (Edit33.Text = '') or
    (Edit36.Text = '') or (Edit59.Text = '') or (Edit65.Text = '')) or
    (sts > 0) and (sts < 4) and ((Edit96.Text = '') or (Edit97.Text = '') or//текущие данные
    (Edit98.Text = '') or (Edit99.Text = '') or (Edit100.Text = '') or
    (Edit101.Text = '') or (Edit102.Text = '') or (Edit103.Text = '') or
    (Edit104.Text = '') or (Edit105.Text = '') or (Edit84.Text = ''))
    ) and CheckBox1.Checked or CardEmpty or not ExistMem and not CheckBox1.Checked or not CheckCountMem and not CheckBox1.Checked then
    Result := True
  else
    Result := False;
end;

function TEditClForm.calcMDiff(sub, fact: string): string;
var
  mountDiff: double;
begin
  mountDiff := StrToFloat(sub) - StrToFloat(fact);
  if mountDiff < 0 then
    mountDiff := 0;
  Result := FloatToStr(mountDiff);
end;

function TEditClForm.CardEmpty: bool;//пусты ключевые поля?
begin
  if (Edit110.Text = '') or (Edit66.Text = '') or (Edit68.Text = '') or (Edit95.Text = '') or
    (Edit73.Text = '') or (Edit94.Text = '') or
    (comboBoxCont.Text = '') or (comboBoxMOP.Text = '') or
    (comboBoxCold.Text = '') or (comboBoxHot.Text = '') or
    (comboBoxHeat.Text = '') or (comboBoxGas.Text = '') or
    (comboBoxWood.Text = '') or (comboBoxCoal.Text = '') or
    (comboBoxCanal.Text = '') or (Combobox10.Text = '') or
    (LVFam.Items.Count = 0) and not CheckBox1.Checked then
    Result := True
  else
    Result := False;
end;

procedure TEditClForm.Clear;//очистить нужные поля
begin
  Edit9.Text  := '0';
  Edit12.Text := '0';
  Edit13.Text := '0';
  Edit14.Text := '0';
  Edit15.Text := '0';
  Edit16.Text := '0';
  Edit17.Text := '0';
  Edit18.Text := '0';
  Edit19.Text := '0';
  Edit20.Text := '0';
  Edit21.Text := '0';
  Edit22.Text := '0';
  Edit23.Text := '0';
  Edit24.Text := '0';
  Edit25.Text := '0';
  Edit26.Text := '0';
  Edit27.Text := '0';
  Edit28.Text := '0';
  Edit29.Text := '0';
  Edit30.Text := '0';
  Edit31.Text := '0';
  Edit32.Text := '0';
  Edit33.Text := '0';
  Edit34.Text := '0';
  Edit35.Text := '0';
  Edit36.Text := '0';
  Edit37.Text := '0';
  Edit38.Text := '0';
  Edit39.Text := '0';
  Edit40.Text := '0';
  Edit41.Text := '0';
  Edit42.Text := '0';
  Edit43.Text := '0';
  Edit44.Text := '0';
  Edit45.Text := '0';
  Edit46.Text := '0';
  Edit47.Text := '0';
  Edit48.Text := '0';
  Edit49.Text := '0';
  Edit50.Text := '0';
  Edit51.Text := '0';
  Edit52.Text := '0';
  Edit53.Text := '0';
  Edit54.Text := '0';
  Edit55.Text := '0';
  Edit56.Text := '0';
  Edit59.Text := '0';
  Edit62.Text := '0';
  Edit67.Text := '0';
  Edit70.Text := '0';
  Edit71.Text := '0';
  Edit57.Text := '';
  Edit58.Text := '';
  Edit60.Text := '';
  Edit61.Text := '';
  Edit63.Text := '';
  Edit64.Text := '';
  Edit65.Text := '0';
  Edit66.Text := '0';
  Edit110.Text := '0';
  Edit68.Text := '0';
  Edit117.Text := '0';
  Edit69.Text := '';
  Edit72.Text := '0';
  Edit73.Text := '0';
  Edit74.Text := '';
  Edit75.Text := '';
  Edit76.Text := '';
  Edit77.Text := '';
  Edit78.Text := '';
  Edit79.Text := '';
  Edit80.Text := '';
  Edit81.Text := '';
  Edit82.Text := '';
  Edit83.Text := '';
  Edit84.Text := '0';
  Edit85.Text := '0';
  Edit86.Text := '';
  Edit87.Text := '';
  Edit88.Text := '';
  Edit89.Text := '0';
  Edit90.Text := '0';
  Edit91.Text := '0';
  Edit92.Text := '0';
  Edit93.Text := '0';
  Edit94.Text := '0';
  Edit95.Text := '0';
  Edit96.Text := '0';
  Edit97.Text := '0';
  Edit98.Text := '0';
  Edit99.Text := '0';
  Edit100.Text := '0';
  Edit101.Text := '0';
  Edit102.Text := '0';
  Edit103.Text := '0';
  Edit104.Text := '0';
  Edit105.Text := '0';
  Edit106.Text := '0';
  //------
  Edit129.Text := '0';
  Edit140.Text := '0';
  Edit130.Text := '0';
  Edit141.Text := '0';
  Edit131.Text := '0';
  Edit142.Text := '0';
  Edit132.Text := '0';
  Edit143.Text := '0';
  Edit133.Text := '0';
  Edit144.Text := '0';
  Edit134.Text := '0';
  Edit145.Text := '0';
  Edit135.Text := '0';
  Edit146.Text := '0';
  Edit136.Text := '0';
  Edit147.Text := '0';
  Edit137.Text := '0';
  Edit148.Text := '0';
  Edit138.Text := '0';
  Edit149.Text := '0';
  Edit139.Text := '0';
  Edit150.Text := '0';
  //------
  Edit115.Text := '0';
  Edit116.Text := '0';
  npssEdit.Text := '';
  MaskEdit5.Text := '';
  MaskEdit6.Text := '';
  MaskEdit4.Text := '';
  //------
  comboBoxCont.Clear;
  comboBoxMOP.Clear;
  comboBoxCold.Clear;
  comboBoxColdCounter.Clear;
  comboBoxHot.Clear;
  comboBoxHotCounter.Clear;
  comboBoxCanal.Clear;
  comboBoxCanalCounter.Clear;
  comboBoxHeat.Clear;
  comboBoxHeatCounter.Clear;
  comboBoxGas.Clear;
  comboBoxGasCounter.Clear;
  comboBoxWood.Clear;
  comboBoxCoal.Clear;

  Combobox7.Clear;
  Combobox10.Clear;
  Combobox11.Clear;
  Combobox12.Clear;
  Combobox13.Clear;
  Combobox14.Clear;
  Combobox15.Clear;
  Combobox16.Clear;
  Combobox17.Clear;
  Combobox18.Clear;
  Combobox19.Clear;
  LVFam.Items.Clear;
  Memo1.Clear;
  curprc := 0;
  curman := 0;
  RadioGroup1.Items.Clear;
  RadioGroup3.Items.Clear;
  SetLength(str, 0);
  SetLength(mng, 0);
  SetLength(fnd, 0);
  SetLength(cntrl, 0);
  SetLength(settl, 0);
  SetLength(own, 0);
  SetLength(st, 0);
  SetLength(p, 0);
  SetLength(rel, 0);
  SetLength(bank, 0);
  SetLength(cont, 0);
  SetLength(mop, 0);
  SetLength(cold, 0);
  SetLength(hot, 0);
  SetLength(heat, 0);
  SetLength(gas, 0);
  SetLength(wood, 0);
  SetLength(coal, 0);
  SetLength(stnd, 0);
  SetLength(canal, 0);
  CheckBox1.Checked  := False;
  CheckBox2.Checked  := False;
  elevatorCheckBox.Checked := False;
  CheckBox3.Checked  := False;
  CheckBox10.Checked := False;
end;

procedure TEditClForm.ClearFactGrids;
var
  i: integer;
begin
  with StringGrid1 do
  begin
    for i := 0 to RowCount - 1 do
      Rows[i].Clear;
    Cells[0, 0] := 'Месяц';
    Cells[1, 0] := 'Субсидия';
    Cells[2, 0] := 'Ф. расход';
    Cells[3, 0] := 'М. разница';
    Cells[0, 1] := '';
    Cells[1, 1] := '0';
    Cells[2, 1] := '0';
    Cells[3, 1] := '0';
    RowCount := 2;
    Repaint;
  end;

  Label77.Caption := '';
  ComboBox23.Text := '';
  Edit111.Text := '0';
  Edit112.Text := '0';
  Edit113.Text := '0';
  Edit114.Text := '0';
end;

procedure TEditClForm.Fill;
{
  заполнить списки у combobox, выбрать radiobutton
  создать массивы, содержащие соответствующие combobox id
}
var
  l: integer;
begin
  with DModule.Query1 do
  begin
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
    while not EOF do
    begin
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
    while not EOF do
    begin
      SetLength(bank, Length(bank) + 1);
      Combobox19.Items.Add(FieldByName('namebank').AsString);
      bank[l] := FieldByName('id_bank').AsInteger;
      if bank[l] = 0 then
        Combobox19.ItemIndex := l;
      Next;
      Inc(l);
    end;
{******************************************************************************
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from Heating');
    SQL.Add('order by nameheating');
    Open;
    First;
    while not EOF do begin
      SetLength(heating, Length(heating)+1);
      Combobox22.Items.Add(FieldByName('nameheating').AsString);
      heating[l] := FieldByName('id_heating').AsInteger;
      if heating[l]=1 then
        Combobox22.ItemIndex := l;
      Next;
      inc(l);
    end;
******************************************************************************}
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from rel');
    SQL.Add('order by namerel');
    Open;
    First;
    while not EOF do
    begin
      SetLength(rel, Length(rel) + 1);
      Combobox7.Items.Add(FieldByName('namerel').AsString);
      rel[l] := FieldByName('id_rel').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(str, Length(str) + 1);
      Combobox12.Items.Add(FieldByName('namestreet').AsString);
      str[l] := FieldByName('id_street').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(cntrl, Length(cntrl) + 1);
      Combobox11.Items.Add(FieldByName('namecntrl').AsString);
      cntrl[l] := FieldByName('id_cntrl').AsInteger;
      if cntrl[l] = 0 then
        Combobox11.ItemIndex := l;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(mng, Length(mng) + 1);
      Combobox15.Items.Add(FieldByName('namemng').AsString);
      mng[l] := FieldByName('id_mng').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(fnd, Length(fnd) + 1);
      Combobox13.Items.Add(FieldByName('namefond').AsString);
      fnd[l] := FieldByName('id_fond').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(settl, Length(settl) + 1);
      Combobox14.Items.Add(FieldByName('namesettl').AsString);
      settl[l] := FieldByName('id_settl').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(own, Length(own) + 1);
      Combobox16.Items.Add(FieldByName('nameown').AsString);
      own[l] := FieldByName('id_own').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(st, Length(st) + 1);
      Combobox17.Items.Add(FieldByName('namestatus').AsString);
      st[l] := FieldByName('id_status').AsInteger;
      Next;
      Inc(l);
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
    while not EOF do
    begin
      SetLength(p, Length(p) + 1);
      Combobox18.Items.Add(FieldByName('namepriv').AsString);
      p[l] := FieldByName('id_priv').AsInteger;
      Next;
      Inc(l);
    end;
    Combobox18.ItemIndex := 0;
  end;
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from "curmdd.dbf" sbros');
    SQL.Add('order by sbros.id_mdd');
    Open;
    First;
    while not EOF do
    begin
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
    while not EOF do
    begin
      SetLength(stnd, Length(stnd) + 1);
      Combobox10.Items.Add(FieldByName('namestnd').AsString);
      stnd[l] := FieldByName('id_stnd').AsInteger;
      if stnd[l] = 0 then
        Combobox10.ItemIndex := l;
      Next;
      Inc(l);
    end;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_cont, sbros.namecont');
    SQL.Add('from "curcont.dbf" sbros');
    SQL.Add('order by sbros.namecont');
    Open;
    First;
    while not EOF do
    begin
      SetLength(cont, Length(cont) + 1);
      comboBoxCont.Items.Add(FieldByName('namecont').AsString);
      cont[l] := FieldByName('id_cont').AsInteger;
      Next;
      Inc(l);
    end;
    comboBoxCont.ItemIndex := 0;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_rep, sbros.namerep');
    SQL.Add('from "currep.dbf" sbros');
    SQL.Add('order by sbros.namerep');
    Open;
    First;
    while not EOF do
    begin
      SetLength(mop, Length(mop) + 1);
      comboBoxMOP.Items.Add(FieldByName('namerep').AsString);
      mop[l] := FieldByName('id_rep').AsInteger;
      Next;
      Inc(l);
    end;
    comboBoxMOP.ItemIndex := SearchServIndex(comboBoxMOP, SelRep(0));

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_cold, sbros.namecold');
    SQL.Add('from "curcold.dbf" sbros');
    SQL.Add('order by sbros.namecold');
    Open;
    First;
    while not EOF do
    begin
      SetLength(cold, Length(cold) + 1);
      comboBoxCold.Items.Add(FieldByName('namecold').AsString);
      cold[l] := FieldByName('id_cold').AsInteger;
      Next;
      Inc(l);
    end;
    comboBoxCold.ItemIndex := 0;
    comboBoxColdCounter.Items.Assign(comboBoxCold.Items);
    comboBoxColdCounter.ItemIndex := 0;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from "curcanal.dbf" sbros');
    SQL.Add('order by sbros.namecanal');
    Open;
    First;
    while not EOF do
    begin
      SetLength(canal, Length(canal) + 1);
      comboBoxCanal.Items.Add(FieldByName('namecanal').AsString);
      canal[l] := FieldByName('id_canal').AsInteger;
      if canal[l] = 8 then
        comboBoxCanal.ItemIndex := l;
      Next;
      Inc(l);
    end;
    comboBoxCanal.ItemIndex := 0;
    comboBoxCanalCounter.Items.Assign(comboBoxCanal.Items);
    comboBoxCanalCounter.ItemIndex := 0;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_hot, sbros.namehot');
    SQL.Add('from "curhot.dbf" sbros');
    SQL.Add('order by sbros.namehot');
    Open;
    First;
    while not EOF do
    begin
      SetLength(hot, Length(hot) + 1);
      comboBoxHot.Items.Add(FieldByName('namehot').AsString);
      hot[l] := FieldByName('id_hot').AsInteger;
      Next;
      Inc(l);
    end;
    comboBoxHot.ItemIndex := 0;
    comboBoxHotCounter.Items.Assign(comboBoxHot.Items);
    comboBoxHotCounter.ItemIndex := 0;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_heat, sbros.nameheat');
    SQL.Add('from "curheat.dbf" sbros');
    SQL.Add('order by sbros.nameheat');
    Open;
    First;
    while not EOF do
    begin
      SetLength(heat, Length(heat) + 1);
      comboBoxHeat.Items.Add(FieldByName('nameheat').AsString);
      heat[l] := FieldByName('id_heat').AsInteger;
      Next;
      Inc(l);
    end;
    comboBoxHeat.ItemIndex := 0;
    comboBoxHeatCounter.Items.Assign(comboBoxHeat.Items);
    comboBoxHeatCounter.ItemIndex := 0;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from "curgas.dbf" sbros');
    SQL.Add('order by sbros.namegas');
    Open;
    First;
    while not EOF do
    begin
      SetLength(gas, Length(gas) + 1);
      comboBoxGas.Items.Add(FieldByName('namegas').AsString);
      gas[l] := FieldByName('id_gas').AsInteger;
      if gas[l] = 1 then
        comboBoxGas.ItemIndex := l;
      Next;
      Inc(l);
    end;
    comboBoxGasCounter.Items.Assign(comboBoxGas.Items);
    comboBoxGasCounter.ItemIndex := comboBoxGas.ItemIndex;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_wood, sbros.namewood');
    SQL.Add('from "curwood.dbf" sbros');
    SQL.Add('order by sbros.namewood');
    Open;
    First;
    while not EOF do
    begin
      SetLength(wood, Length(wood) + 1);
      comboBoxWood.Items.Add(FieldByName('namewood').AsString);
      wood[l] := FieldByName('id_wood').AsInteger;
      if wood[l] = 0 then
        comboBoxWood.ItemIndex := l;
      Next;
      Inc(l);
    end;

    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_coal, sbros.namecoal');
    SQL.Add('from "curcoal.dbf" sbros');
    SQL.Add('order by sbros.namecoal');
    Open;
    First;
    while not EOF do
    begin
      SetLength(coal, Length(coal) + 1);
      comboBoxCoal.Items.Add(FieldByName('namecoal').AsString);
      coal[l] := FieldByName('id_coal').AsInteger;
      if coal[l] = 0 then
        comboBoxCoal.ItemIndex := l;
      Next;
      Inc(l);
    end;
    Close;
  end;

  comboBoxCont.OnChange(comboBoxCont);
  comboBoxMOP.OnChange(comboBoxMOP);
  comboBoxCold.OnChange(comboBoxCold);
  comboBoxHot.OnChange(comboBoxHot);
  comboBoxHeat.OnChange(comboBoxHeat);
  comboBoxGas.OnChange(comboBoxGas);
  combobox7.OnChange(combobox7);
  comboBoxWood.OnChange(comboBoxWood);
  comboBoxCoal.OnChange(comboBoxCoal);
  comboBoxCanal.OnChange(comboBoxCanal);
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

procedure TEditClForm.FillLV;//заполнить List View
var
  i: integer;
  item: TListItem;
begin
  LVFam.Items.Clear;
  for i := 0 to Cl.cdata.family.Count - 1 do
  begin
    item := LVFam.Items.Add;
    item.Caption := TMan(Cl.cdata.family.Items[i]).fio;
    item.SubItems.Add(DateToStr(TMan(Cl.cdata.family.Items[i]).birth));
    item.SubItems.Add(FormatFloat('0.00', Cl.cdata.mid[i]));
    item.SubItems.Add(FormatFloat('0.00', SelMin(Cl.cdata.min[i])));
    item.SubItems.Add(SelRel(TMan(Cl.cdata.family.Items[i]).rel));
  end;
  if Cl.cdata.family.Count <> 0 then
    LVFam.ItemIndex := curman;
end;

procedure TEditClForm.SetData;
{
  установить все данные
  используется единожды при активации формы
}
var
  i: integer;
begin
  if Cl.cdata.family.Count > 0 then
  begin
    for i := 0 to Cl.cdata.family.Count - 1 do
      if TMan(Cl.cdata.family[i]).fio = Cl.Data.fio then
      begin
        TMan(Cl.cdata.family[i]).rel := 1;
        curman := i;
        break;
      end;
  end
  else
    curman := 0;
  if Cl.cdata.family.Count = Cl.cdata.mcount then
    fam := True
  else
    fam := False;
  SetHouse(Cl.Data.str, Cl.Data.nh, Cl.Data.corp);
  Edit57.Text := Cl.Data.fio;
  Edit85.Text := '0' + IntToStr(Cl.Data.regn);
  Edit87.Text := DateToStr(Cl.Data.regdate);
  Edit86.Text := SelInsp(Cl.Data.insp);
  Edit88.Text := DateToStr(Cl.Data.change);
  MaskEdit4.Text := DateToStr(Cl.Data.declar);
  Edit63.Text := Cl.Data.apart;
  Edit64.Text := Cl.Data.tel;
  Combobox15.Text := SelMng(Cl.Data.manager);
  Combobox13.Text := SelFnd(Cl.Data.fond);
  Combobox14.Text := SelSettl(Cl.Data.settl);
  Combobox16.Text := SelOwn(Cl.Data.own);
  Edit110.Text := FormatFloat('0.00', Cl.cdata.lsquare);
  Edit66.Text := FormatFloat('0.00', Cl.cdata.square);
  RadioGroup3.ItemIndex := Cl.cdata.mdd;
  Edit68.Text := IntToStr(Cl.cdata.mcount);
  Edit117.Text := IntToStr(Cl.cdata.rmcount);
  Edit95.Text := IntToStr(Cl.cdata.quanpriv);
  MaskEdit2.Text := DateToStr(Cl.cdata.begindate);
  MaskEdit3.Text := DateToStr(Cl.cdata.enddate);
  //------
  MaskEdit5.Text := DateToStr(Cl.cdata.prevbegindate);
  MaskEdit6.Text := DateToStr(Cl.cdata.prevenddate);
  Edit115.Text := FloatToStr(Cl.cdata.dolgFact);
  Edit116.Text := FloatToStr(Cl.cdata.averageFact);
  //------
  Edit109.Text := IntToStr(Cl.cdata.period);
  Combobox11.Text := SelCntrl(Cl.Data.control);
  Memo1.Text  := Cl.Data.reason;
  Edit73.Text := FormatFloat('0.00', Cl.cdata.income);
  Edit94.Text := FormatFloat('0.00', Cl.cdata.pmin);
  if Cl.cdata.family.Count > 0 then
  begin
    Edit69.Text := TMan(Cl.cdata.family[curman]).fio;
    npssEdit.Text := TMan(Cl.cdata.family[curman]).npss;
    MaskEdit1.Text := DateToStr(TMan(Cl.cdata.family[curman]).birth);
    Combobox7.Text := SelRel(TMan(Cl.cdata.family[curman]).rel);
    Combobox17.Text := SelSt(TMan(Cl.cdata.family[curman]).status);
    Combobox18.Text := SelPriv(TMan(Cl.cdata.family[curman]).priv);
    Edit72.Text := FormatFloat('0.00', TMan(Cl.cdata.family[curman]).mid);
  end;
  CheckBox2.Checked := (Cl.cdata.boiler = 1);
  elevatorCheckBox.Checked := (Cl.cdata.elevator = 1);
  comboBoxCont.Text := SelCont(Cl.cdata.tarifs[0]);
  comboBoxMOP.Text := SelRep(Cl.cdata.tarifs[1]);
  comboBoxCold.Text := SelCold(Cl.cdata.tarifs[2]);
  comboBoxHot.Text := SelHot(Cl.cdata.tarifs[3]);
  comboBoxCanal.Text := SelCanal(Cl.cdata.tarifs[4]);
  comboBoxHeat.Text := SelHeat(Cl.cdata.tarifs[5]);
  comboBoxGas.Text := SelGas(Cl.cdata.tarifs[6]);
  comboBoxWood.Text := SelWood(Cl.cdata.tarifs[12]);
  comboBoxCoal.Text := SelCoal(Cl.cdata.tarifs[13]);
  Combobox10.Text := SelStnd(Cl.cdata.rstnd);

  CheckBox10.Checked := Cl.cdata.indrstnd;
  if (Cl.cdata.indrstnd) then
  begin
    Edit9.Text  := FloatToStr(Cl.cdata.indrstndval);
    Edit9.ReadOnly := False;
    Edit9.Color := clWindow;
  end;

  Combobox19.Text := SelBank(Cl.Data.bank);
  if Cl.cdata.tarifs[7] > 0 then
    ComboBox21.ItemIndex := Cl.cdata.tarifs[7] - 1
  else
    ComboBox21.ItemIndex := 0;
  ComboBox22.ItemIndex := Cl.cdata.heating - 1;
  Edit74.Text  := Cl.cdata.accounts[0];
  Edit75.Text  := Cl.cdata.accounts[1];
  Edit76.Text  := Cl.cdata.accounts[2];
  Edit77.Text  := Cl.cdata.accounts[3];
  Edit58.Text  := Cl.cdata.accounts[4];
  Edit78.Text  := Cl.cdata.accounts[5];
  Edit79.Text  := Cl.cdata.accounts[6];
  Edit80.Text  := Cl.cdata.accounts[7];
  Edit81.Text  := Cl.cdata.accounts[12];
  Edit82.Text  := Cl.cdata.accounts[13];
  Edit83.Text  := Cl.Data.acbank;
  CheckBox1.Checked := (Cl.cdata.calc = 1);
  //1 месяц
  Edit12.Text  := FormatFloat('0.00', Cl.cdata.bpm[0]);
  Edit13.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[0]);
  Edit14.Text  := FormatFloat('0.00', Cl.cdata.bsub[0]);
  Edit15.Text  := FormatFloat('0.00', Cl.cdata.bpm[1]);
  Edit16.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[1]);
  Edit17.Text  := FormatFloat('0.00', Cl.cdata.bsub[1]);
  Edit18.Text  := FormatFloat('0.00', Cl.cdata.bpm[2]);
  Edit19.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[2]);
  Edit20.Text  := FormatFloat('0.00', Cl.cdata.bsub[2]);
  Edit21.Text  := FormatFloat('0.00', Cl.cdata.bpm[3]);
  Edit22.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[3]);
  Edit23.Text  := FormatFloat('0.00', Cl.cdata.bsub[3]);
  Edit59.Text  := FormatFloat('0.00', Cl.cdata.bpm[4]);
  Edit62.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[4]);
  Edit67.Text  := FormatFloat('0.00', Cl.cdata.bsub[4]);
  Edit24.Text  := FormatFloat('0.00', Cl.cdata.bpm[5]);
  Edit25.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[5]);
  Edit26.Text  := FormatFloat('0.00', Cl.cdata.bsub[5]);
  Edit27.Text  := FormatFloat('0.00', Cl.cdata.bpm[6]);
  Edit28.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[6]);
  Edit29.Text  := FormatFloat('0.00', Cl.cdata.bsub[6]);
  Edit30.Text  := FormatFloat('0.00', Cl.cdata.bpm[7]);
  Edit31.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[7]);
  Edit32.Text  := FormatFloat('0.00', Cl.cdata.bsub[7]);
  Edit33.Text  := FormatFloat('0.00', Cl.cdata.bpm[12]);
  Edit34.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[12]);
  Edit35.Text  := FormatFloat('0.00', Cl.cdata.bsub[12]);
  Edit36.Text  := FormatFloat('0.00', Cl.cdata.bpm[13]);
  Edit37.Text  := FormatFloat('0.00', Cl.cdata.bsnpm[13]);
  Edit38.Text  := FormatFloat('0.00', Cl.cdata.bsub[13]);
  Edit129.Text := FormatFloat('0.00', Cl.cdata.bstndsub[0]);
  Edit130.Text := FormatFloat('0.00', Cl.cdata.bstndsub[1]);
  Edit131.Text := FormatFloat('0.00', Cl.cdata.bstndsub[2]);
  Edit132.Text := FormatFloat('0.00', Cl.cdata.bstndsub[3]);
  Edit133.Text := FormatFloat('0.00', Cl.cdata.bstndsub[4]);
  Edit134.Text := FormatFloat('0.00', Cl.cdata.bstndsub[5]);
  Edit135.Text := FormatFloat('0.00', Cl.cdata.bstndsub[6]);
  Edit136.Text := FormatFloat('0.00', Cl.cdata.bstndsub[7]);
  Edit137.Text := FormatFloat('0.00', Cl.cdata.bstndsub[12]);
  Edit138.Text := FormatFloat('0.00', Cl.cdata.bstndsub[13]);

  //
  Edit96.Text  := FormatFloat('0.00', Cl.cdata.pm[0]);
  Edit39.Text  := FormatFloat('0.00', Cl.cdata.snpm[0]);
  Edit40.Text  := FormatFloat('0.00', Cl.cdata.sub[0]);
  Edit97.Text  := FormatFloat('0.00', Cl.cdata.pm[1]);
  Edit41.Text  := FormatFloat('0.00', Cl.cdata.snpm[1]);
  Edit42.Text  := FormatFloat('0.00', Cl.cdata.sub[1]);
  Edit98.Text  := FormatFloat('0.00', Cl.cdata.pm[2]);
  Edit43.Text  := FormatFloat('0.00', Cl.cdata.snpm[2]);
  Edit44.Text  := FormatFloat('0.00', Cl.cdata.sub[2]);
  Edit99.Text  := FormatFloat('0.00', Cl.cdata.pm[3]);
  Edit45.Text  := FormatFloat('0.00', Cl.cdata.snpm[3]);
  Edit46.Text  := FormatFloat('0.00', Cl.cdata.sub[3]);
  Edit100.Text := FormatFloat('0.00', Cl.cdata.pm[4]);
  Edit70.Text  := FormatFloat('0.00', Cl.cdata.snpm[4]);
  Edit71.Text  := FormatFloat('0.00', Cl.cdata.sub[4]);
  Edit101.Text := FormatFloat('0.00', Cl.cdata.pm[5]);
  Edit47.Text  := FormatFloat('0.00', Cl.cdata.snpm[5]);
  Edit48.Text  := FormatFloat('0.00', Cl.cdata.sub[5]);
  Edit102.Text := FormatFloat('0.00', Cl.cdata.pm[6]);
  Edit49.Text  := FormatFloat('0.00', Cl.cdata.snpm[6]);
  Edit50.Text  := FormatFloat('0.00', Cl.cdata.sub[6]);
  Edit103.Text := FormatFloat('0.00', Cl.cdata.pm[7]);
  Edit51.Text  := FormatFloat('0.00', Cl.cdata.snpm[7]);
  Edit52.Text  := FormatFloat('0.00', Cl.cdata.sub[7]);
  Edit104.Text := FormatFloat('0.00', Cl.cdata.pm[12]);
  Edit53.Text  := FormatFloat('0.00', Cl.cdata.snpm[12]);
  Edit105.Text := FormatFloat('0.00', Cl.cdata.pm[13]);
  Edit55.Text  := FormatFloat('0.00', Cl.cdata.snpm[13]);
  Edit54.Text  := FormatFloat('0.00', Cl.cdata.sub[12]);
  Edit56.Text  := FormatFloat('0.00', Cl.cdata.sub[13]);

  Edit140.Text := FormatFloat('0.00', Cl.cdata.stndsub[0]);
  Edit141.Text := FormatFloat('0.00', Cl.cdata.stndsub[1]);
  Edit142.Text := FormatFloat('0.00', Cl.cdata.stndsub[2]);
  Edit143.Text := FormatFloat('0.00', Cl.cdata.stndsub[3]);
  Edit144.Text := FormatFloat('0.00', Cl.cdata.stndsub[4]);
  Edit145.Text := FormatFloat('0.00', Cl.cdata.stndsub[5]);
  Edit146.Text := FormatFloat('0.00', Cl.cdata.stndsub[6]);
  Edit147.Text := FormatFloat('0.00', Cl.cdata.stndsub[7]);
  Edit148.Text := FormatFloat('0.00', Cl.cdata.stndsub[12]);
  Edit149.Text := FormatFloat('0.00', Cl.cdata.stndsub[13]);
  Cl.SetNorm;
  FillLV;
  att := Cl.Data.cert - 1;
  RadioGroup1.ItemIndex := att;
  Edit9.Text := FloatToStr(Cl.GetStandard);

  CheckBox3.Checked := (cl.Data.mail = 1);
  //------счетчики
  Edit118.Text := FloatToStr(cl.cdata.counterdata[2]);
  Edit119.Text := FloatToStr(cl.cdata.counterdata[3]);
  Edit120.Text := FloatToStr(cl.cdata.counterdata[4]);
  Edit121.Text := FloatToStr(cl.cdata.counterdata[5]);
  Edit122.Text := FloatToStr(cl.cdata.counterdata[6]);
  Edit123.Text := FloatToStr(cl.cdata.counterdata[7]);

  CheckBox4.Checked := cl.cdata.counter[2];
  CheckBox5.Checked := cl.cdata.counter[3];
  CheckBox6.Checked := cl.cdata.counter[4];
  CheckBox7.Checked := cl.cdata.counter[5];
  CheckBox8.Checked := cl.cdata.counter[6];
  CheckBox9.Checked := cl.cdata.counter[7];


  comboBoxColdCounter.Text := SelCold(Cl.cdata.countertarifs[2]);
  comboBoxHotCounter.Text  := SelHot(Cl.cdata.countertarifs[3]);
  comboBoxCanalCounter.Text := SelCanal(Cl.cdata.countertarifs[4]);
  comboBoxHeatCounter.Text := SelHeat(Cl.cdata.countertarifs[5]);
  comboBoxGasCounter.Text  := SelGas(Cl.cdata.countertarifs[6]);
  //------
  comboBoxCont.OnChange(comboBoxCont);
  comboBoxMOP.OnChange(comboBoxMOP);
  comboBoxCold.OnChange(comboBoxCold);
  comboBoxColdCounter.OnChange(comboBoxColdCounter);
  comboBoxHot.OnChange(comboBoxHot);
  comboBoxHotCounter.OnChange(comboBoxHotCounter);
  comboBoxCanal.OnChange(comboBoxCanal);
  comboBoxCanalCounter.OnChange(comboBoxCanalCounter);
  comboBoxHeat.OnChange(comboBoxHeat);
  comboBoxHeatCounter.OnChange(comboBoxHeatCounter);
  comboBoxGas.OnChange(comboBoxGas);
  comboBoxGasCounter.OnChange(comboBoxGasCounter);

  comboBoxWood.OnChange(comboBoxWood);
  comboBoxCoal.OnChange(comboBoxCoal);

  combobox7.OnChange(combobox7);
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

procedure TEditClForm.SetVCalc;//расчет субсидии
var
  s: integer;
begin
  s := Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate);
  if (s = 0) then
  begin //первый месяц
    if not CheckBox1.Checked then
    begin
      Edit12.Text := FormatFloat('0.00', Cl.cdata.bpm[0]);
      Edit15.Text := FormatFloat('0.00', Cl.cdata.bpm[1]);
      Edit18.Text := FormatFloat('0.00', Cl.cdata.bpm[2]);
      Edit21.Text := FormatFloat('0.00', Cl.cdata.bpm[3]);
      Edit59.Text := FormatFloat('0.00', Cl.cdata.bpm[4]);
      Edit24.Text := FormatFloat('0.00', Cl.cdata.bpm[5]);
      Edit27.Text := FormatFloat('0.00', Cl.cdata.bpm[6]);
      Edit30.Text := FormatFloat('0.00', Cl.cdata.bpm[7]);
      Edit33.Text := FormatFloat('0.00', Cl.cdata.bpm[12]);
      Edit36.Text := FormatFloat('0.00', Cl.cdata.bpm[13]);

      Edit13.Text := FormatFloat('0.00', Cl.cdata.bsnpm[0]);
      Edit16.Text := FormatFloat('0.00', Cl.cdata.bsnpm[1]);
      Edit19.Text := FormatFloat('0.00', Cl.cdata.bsnpm[2]);
      Edit22.Text := FormatFloat('0.00', Cl.cdata.bsnpm[3]);
      Edit62.Text := FormatFloat('0.00', Cl.cdata.bsnpm[4]);
      Edit25.Text := FormatFloat('0.00', Cl.cdata.bsnpm[5]);
      Edit28.Text := FormatFloat('0.00', Cl.cdata.bsnpm[6]);
      Edit31.Text := FormatFloat('0.00', Cl.cdata.bsnpm[7]);
      Edit34.Text := FormatFloat('0.00', Cl.cdata.bsnpm[12]);
      Edit37.Text := FormatFloat('0.00', Cl.cdata.bsnpm[13]);
    end;
    Edit14.Text := FormatFloat('0.00', Cl.cdata.bsub[0]);
    Edit17.Text := FormatFloat('0.00', Cl.cdata.bsub[1]);
    Edit20.Text := FormatFloat('0.00', Cl.cdata.bsub[2]);
    Edit23.Text := FormatFloat('0.00', Cl.cdata.bsub[3]);
    Edit67.Text := FormatFloat('0.00', Cl.cdata.bsub[4]);
    Edit26.Text := FormatFloat('0.00', Cl.cdata.bsub[5]);
    Edit29.Text := FormatFloat('0.00', Cl.cdata.bsub[6]);
    Edit32.Text := FormatFloat('0.00', Cl.cdata.bsub[7]);
    Edit35.Text := FormatFloat('0.00', Cl.cdata.bsub[12]);
    Edit38.Text := FormatFloat('0.00', Cl.cdata.bsub[13]);

    Edit129.Text := FormatFloat('0.00', Cl.cdata.bstndsub[0]);
    Edit130.Text := FormatFloat('0.00', Cl.cdata.bstndsub[1]);
    Edit131.Text := FormatFloat('0.00', Cl.cdata.bstndsub[2]);
    Edit132.Text := FormatFloat('0.00', Cl.cdata.bstndsub[3]);
    Edit133.Text := FormatFloat('0.00', Cl.cdata.bstndsub[4]);
    Edit134.Text := FormatFloat('0.00', Cl.cdata.bstndsub[5]);
    Edit135.Text := FormatFloat('0.00', Cl.cdata.bstndsub[6]);
    Edit136.Text := FormatFloat('0.00', Cl.cdata.bstndsub[7]);
    Edit137.Text := FormatFloat('0.00', Cl.cdata.bstndsub[12]);
    Edit138.Text := FormatFloat('0.00', Cl.cdata.bstndsub[13]);
  end;
  if (s <> 3) then
  begin//для всех
    Edit96.Text  := FormatFloat('0.00', Cl.cdata.pm[0]);
    Edit97.Text  := FormatFloat('0.00', Cl.cdata.pm[1]);
    Edit98.Text  := FormatFloat('0.00', Cl.cdata.pm[2]);
    Edit99.Text  := FormatFloat('0.00', Cl.cdata.pm[3]);
    Edit100.Text := FormatFloat('0.00', Cl.cdata.pm[4]);
    Edit101.Text := FormatFloat('0.00', Cl.cdata.pm[5]);
    Edit102.Text := FormatFloat('0.00', Cl.cdata.pm[6]);
    Edit103.Text := FormatFloat('0.00', Cl.cdata.pm[7]);
    Edit104.Text := FormatFloat('0.00', Cl.cdata.pm[12]);
    Edit105.Text := FormatFloat('0.00', Cl.cdata.pm[13]);

    Edit39.Text := FormatFloat('0.00', Cl.cdata.snpm[0]);
    Edit41.Text := FormatFloat('0.00', Cl.cdata.snpm[1]);
    Edit43.Text := FormatFloat('0.00', Cl.cdata.snpm[2]);
    Edit45.Text := FormatFloat('0.00', Cl.cdata.snpm[3]);
    Edit70.Text := FormatFloat('0.00', Cl.cdata.snpm[4]);
    Edit47.Text := FormatFloat('0.00', Cl.cdata.snpm[5]);
    Edit49.Text := FormatFloat('0.00', Cl.cdata.snpm[6]);
    Edit51.Text := FormatFloat('0.00', Cl.cdata.snpm[7]);
    Edit53.Text := FormatFloat('0.00', Cl.cdata.snpm[12]);
    Edit55.Text := FormatFloat('0.00', Cl.cdata.snpm[13]);

    Edit40.Text := FormatFloat('0.00', Cl.cdata.sub[0]);
    Edit42.Text := FormatFloat('0.00', Cl.cdata.sub[1]);
    Edit44.Text := FormatFloat('0.00', Cl.cdata.sub[2]);
    Edit46.Text := FormatFloat('0.00', Cl.cdata.sub[3]);
    Edit71.Text := FormatFloat('0.00', Cl.cdata.sub[4]);
    Edit48.Text := FormatFloat('0.00', Cl.cdata.sub[5]);
    Edit50.Text := FormatFloat('0.00', Cl.cdata.sub[6]);
    Edit52.Text := FormatFloat('0.00', Cl.cdata.sub[7]);
    Edit54.Text := FormatFloat('0.00', Cl.cdata.sub[12]);
    Edit56.Text := FormatFloat('0.00', Cl.cdata.sub[13]);

    Edit140.Text := FormatFloat('0.00', Cl.cdata.stndsub[0]);
    Edit141.Text := FormatFloat('0.00', Cl.cdata.stndsub[1]);
    Edit142.Text := FormatFloat('0.00', Cl.cdata.stndsub[2]);
    Edit143.Text := FormatFloat('0.00', Cl.cdata.stndsub[3]);
    Edit144.Text := FormatFloat('0.00', Cl.cdata.stndsub[4]);
    Edit145.Text := FormatFloat('0.00', Cl.cdata.stndsub[5]);
    Edit146.Text := FormatFloat('0.00', Cl.cdata.stndsub[6]);
    Edit147.Text := FormatFloat('0.00', Cl.cdata.stndsub[7]);
    Edit148.Text := FormatFloat('0.00', Cl.cdata.stndsub[12]);
    Edit149.Text := FormatFloat('0.00', Cl.cdata.stndsub[13]);
  end;
end;

procedure TEditClForm.SumV;//суммировать начисления
var
  Value: real;
  i: integer;
begin
  Edit89.Text := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.bpm));

  Value := Cl.cdata.pm[0];
  for i := 1 to numbtarif - 1 do
    Value := Value + {!}roundto(Cl.cdata.pm[i], -2);
  Edit106.Text := FormatFloat('0.00', Value);

  Edit90.Text  := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.bsnpm));
  Edit91.Text  := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.bsub));
  Edit92.Text  := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.snpm));
  Edit93.Text  := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.sub));
  Edit65.Text  := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.bfpm));
  Edit84.Text  := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.fpm));
  Edit139.Text := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.bstndsub));
  Edit150.Text := FormatFloat('0.00', Cl.CalcFull(Cl.cdata.stndsub));

  SetKoef;
end;

procedure TEditClForm.SetIncome;
var
  i: integer;
begin
  Cl.cdata.income := 0;
  for i := 0 to Cl.cdata.mcount - 1 do
  begin
    Cl.cdata.income := Cl.cdata.income + Cl.cdata.mid[i];
  end;
  Edit73.Text := FormatFloat('0.00', Cl.cdata.income);
end;

procedure TEditClForm.SetKoef;
var
  pm, ppm: real;
  //  i: integer;
begin
  //сд/пм
  if (Cl.cdata.pmin <> 0) and (Cl.cdata.mcount <> 0) then
  begin
    Cl.cdata.koef := rnd((Cl.cdata.income / Cl.cdata.mcount) / Cl.cdata.pmin);
    Edit107.Text  := FormatFloat('0.00', Cl.cdata.koef);
  end
  else
  begin
    Cl.cdata.koef := 0;
    //ShowMessage('Расчет отношения среднедушевого дохода семьи к прожиточному минимуму семьи (СД/ПМ) невозможен! Деление на нуль!');
    Edit107.Text  := '0.00';
  end;
  //рпс/рпп
  if Cl.cdata.rstnd <> 0 then
  begin
    //оплата без учета льготы
    pm  := Cl.CalcFull(Cl.cdata.fpm);
    //оплата c учетом льготы
    ppm := Cl.CalcFull(Cl.cdata.pm);

    if (pm <> 0) and (ppm <> 0) then
      Edit108.Text := FormatFloat('0.00', rnd(ppm / pm))
    else
      Edit108.Text := '';
  end
  else
    Edit108.Text := '';
end;

procedure TEditClForm.SetHouse(s: integer; n, c: string);
begin
  Combobox12.Text := SelStr(s);
  Combobox12.OnChange(combobox12);
  Edit61.Text := c;
  Edit60.Text := n;
end;

function TEditClForm.SearchStreet(s: string): integer;
var
  i:  integer;
  s1: string;
begin
  for i := 0 to combobox12.Items.Count - 1 do
  begin
    s1 := AnsiLowerCase(Combobox12.Items.Strings[i]);
    if s1 = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox12.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchMng(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox15.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox15.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox15.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchFnd(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox13.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox13.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox13.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchSettl(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox14.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox14.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox14.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchOwn(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox16.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox16.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox16.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchCntrl(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox11.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox11.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox11.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchSt(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox17.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox17.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox17.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchStnd(s: string): integer;
var
  i: integer;
begin
  for i := 0 to ComboBox10.Items.Count - 1 do
  begin
    if AnsiLowerCase(ComboBox10.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < ComboBox10.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchPriv(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox18.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox18.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox18.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchRel(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox7.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox7.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox7.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchServIndex(ComboBox: TComboBox): integer;
var
  i: integer;
begin
  for i := 0 to ComboBox.Items.Count - 1 do
  begin
    if AnsiLowerCase(ComboBox.Items.Strings[i]) = AnsiLowerCase(ComboBox.Text) then
      break;
  end;
  if i < ComboBox.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchServIndex(ComboBox: TComboBox; s: string): integer;
var
  i: integer;
begin
  for i := 0 to ComboBox.Items.Count - 1 do
  begin
    if AnsiLowerCase(ComboBox.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < ComboBox.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TEditClForm.SearchBank(s: string): integer;
var
  i: integer;
begin
  for i := 0 to combobox19.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox19.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox19.Items.Count then
    Result := i
  else
    Result := -1;
end;



function TEditClForm.ExistHouse(var n: integer): bool;//существует дом?
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_house');
    SQL.Add('from house');
    SQL.Add('where (id_street = :str)and(nhouse = :nh)and(corp=:cp)');
    SQL.Add('and(id_dist=:dist)');
    ParamByName('str').AsInteger := Cl.Data.str;
    ParamByName('nh').AsString := Cl.Data.nh;
    ParamByName('cp').AsString := Cl.Data.corp;
    ParamByName('dist').AsInteger := Form1.dist;
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

function TEditClForm.ExistClient(var n: integer): bool;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select regn');
    SQL.Add('from cl ');
    SQL.Add('where (id_street=:id)and(nhouse=:n)and(corp=:cp)and(apart=:apart)and(fio=:fio)');
    ParamByName('id').AsInteger := Cl.Data.str;
    ParamByName('n').AsString  := Cl.Data.nh;
    ParamByName('cp').AsString := Cl.Data.corp;
    ParamByName('apart').AsString := Cl.Data.apart;
    ParamByName('fio').AsString := Cl.Data.fio;
    Open;
    if IsEmpty then
      Result := False
    else
    begin
      n := FieldByName('regn').AsInteger;
      Result := True;
    end;
    Close;
  end;
end;

function TEditClForm.existmem: bool;
var
  i: integer;
begin
  Result := False;
  for i := 0 to cl.cdata.family.Count - 1 do
    if tman(cl.cdata.family[i]).fio = cl.Data.fio then
    begin
      Result := True;
      exit;
    end;
end;

function TEditClForm.ExistMemEx(var n: integer): bool;
var
  i: integer;
  flag1: bool;
begin
  flag1 := False;
  if Cl.cdata.family.Count <> 0 then
  begin
    for i := 0 to Cl.cdata.family.Count - 1 do
      if (TMan(Cl.cdata.family[i]).fio = Edit69.Text) and
        (TMan(Cl.cdata.family[i]).birth = StrToDate(MaskEdit1.Text)) then
      begin
        flag1 := True;
        break;
      end
      else
      if (TMan(Cl.cdata.family[i]).rel = 1) and (rel[SearchRel(Combobox7.Text)] = 1) then
      begin
        flag1 := True;
        break;
      end;
    if flag1 then
    begin
      n := i;
      Result := True;
    end
    else
      Result := False;
  end
  else
    Result := False;
end;

procedure TEditClForm.SortFam;
var
  m: TMan;
  mas1, mas2, i, compare: integer;
  mid1, mid2: real;
begin
  for i := Cl.cdata.family.Count - 1 downto 1 do
  begin
    Compare := CompareText(TMan(Cl.cdata.family[i - 1]).fio,
      TMan(Cl.cdata.family[i]).fio);
    if Compare > 0 then
    begin
      curman := i - 1;
      m := TMan(Cl.cdata.family[i]).Copy;
      Cl.cdata.family.Delete(i);
      Cl.cdata.family.Insert(i - 1, m);
      mas1 := Cl.cdata.min[i];
      mas2 := Cl.cdata.min[i - 1];
      Cl.cdata.min[i - 1] := mas1;
      Cl.cdata.min[i] := mas2;
      mid1 := Cl.cdata.mid[i];
      mid2 := Cl.cdata.mid[i - 1];
      Cl.cdata.mid[i - 1] := mid1;
      Cl.cdata.mid[i] := mid2;
      mas1 := Cl.cdata.priv[i];
      mas2 := Cl.cdata.priv[i - 1];
      Cl.cdata.priv[i - 1] := mas1;
      Cl.cdata.priv[i] := mas2;
    end;
  end;
end;

procedure TEditClForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
{var
  Buf: array[byte] of char;}
begin
{  if TabControl1.TabIndex=1 then
    if aRow= StringGrid1.RowCount-1 then
      with StringGrid1 do begin
        Canvas.Font := Font;
        Canvas.Font.Color := clWindowText;
        Canvas.Brush.Color := clMoneyGreen;
        Canvas.FillRect(Rect);
        StrPCopy(Buf, Cells[ACol, ARow]);
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end;}
end;

procedure TEditClForm.StringGrid1MouseLeave(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to StringGrid1.RowCount - 2 do
    StringGrid1.Cells[3, i + 1] := calcMDiff(StringGrid1.Cells[1, i + 1], StringGrid1.Cells[2, i + 1]);
  UpdateFactInfo();
end;

procedure TEditClForm.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{var
  i: integer;}
begin
  if (ACol = 0) then
    StringGrid1.Options := StringGrid1.Options - [goEditing, goAlwaysShowEditor]
  else
    StringGrid1.Options := StringGrid1.Options + [goEditing, goAlwaysShowEditor];

  if ARow <> 0 then
    StringGrid1.Cells[3, ARow] := calcMDiff(StringGrid1.Cells[1, ARow], StringGrid1.Cells[2, ARow]);
  UpdateFactInfo();

  if TabControl1.TabIndex = 1 then
    CheckDifferenceFactSum;

{  if TabControl1.TabIndex=1 then
  begin
    if (ARow = StringGrid1.RowCount - 1) or (ACol = 0)  then
      StringGrid1.Options := StringGrid1.Options - [goEditing, goAlwaysShowEditor]
    else
      StringGrid1.Options := StringGrid1.Options + [goEditing, goAlwaysShowEditor];

//    StringGrid1.Cells[1,StringGrid1.RowCount-1]:= FloatToStr(GetColSum(StringGrid1,1));
//    StringGrid1.Cells[2,StringGrid1.RowCount-1]:= FloatToStr(GetColSum(StringGrid1,2));
//    StringGrid1.Cells[3,StringGrid1.RowCount-1]:= FloatToStr(GetColSum(StringGrid1,3));
    CheckDifferenceFactSum;
  end
  else
    StringGrid1.Options := StringGrid1.Options + [goEditing, goAlwaysShowEditor];}
end;

procedure TEditClForm.StringGrid1SetEditText(Sender: TObject; ACol, ARow: integer; const Value: string);
begin
  if ARow <> 0 then
    if Value <> '' then
    begin
      StringGrid1.Cells[3, ARow] := calcMDiff(StringGrid1.Cells[1, ARow], StringGrid1.Cells[2, ARow]);
      UpdateFactInfo();
    end;
end;

procedure TEditClForm.Button20Click(Sender: TObject);
var
  i: integer;
begin
  case TabControl1.TabIndex of
    0:
    begin
      if (ComboBox23.Items.Count = 0) and (not CheckBox1.Checked) then
        ShowMessage('Нет доступных периодов для добавления')
      else
      if ComboBox23.Text = '' then
        ShowMessage('Не выбран период для добавления')
      else
        with DModule do
        begin
          for i := 0 to StringGrid1.RowCount - 2 do
          begin
            try
              Query1.Close;
              Query1.SQL.Text := 'INSERT INTO FactSale' + #13 +
                'VALUES (convert(smalldatetime,:sdate,104),:regn,' +
                'convert(smalldatetime,:bdate,104),convert(smalldatetime,:edate,104),:sub,:factsum,:dis)';
              Query1.ParamByName('sdate').Value := StringGrid1.Cells[0, i + 1];
              Query1.ParamByName('regn').Value := cl.Data.regn;
              Query1.ParamByName('bdate').Value := DateToStr(fbegindate);
              Query1.ParamByName('edate').Value := DateToStr(fenddate);
              Query1.ParamByName('sub').Value := StrToFloat(StringGrid1.Cells[1, i + 1]);
              Query1.ParamByName('factsum').Value := StrToFloat(StringGrid1.Cells[2, i + 1]);
              Query1.ParamByName('dis').Value := Form1.dist;
              Query1.ExecSQL;
            except
              ShowMessage('Ошибка при добавлении! Проверьте правильность ввода данных.')
            end;
          end;
          try
            Query1.Close;
            Query1.SQL.Text := 'INSERT INTO FactBalance' + #13 +
              'VALUES (:regn,' +
              'convert(smalldatetime,:bdate,104),convert(smalldatetime,:edate,104),:balance,:dolg,:dist)';
            Query1.ParamByName('regn').Value := cl.Data.regn;
            Query1.ParamByName('bdate').Value := DateToStr(fbegindate);
            Query1.ParamByName('edate').Value := DateToStr(fenddate);
            Query1.ParamByName('balance').Value := StrToFloat(Edit114.Text);
            Query1.ParamByName('dolg').Value := StrToFloat(Edit113.Text);
            Query1.ParamByName('dist').Value := cl.Data.dist;
            Query1.ExecSQL;
          except
            ShowMessage('Ошибка при добавлении! Проверьте правильность ввода данных.')
          end;
        end;
    end;

    1:
    begin
      with DModule do
      begin
        if comboBoxCont.Text = '' then
          ShowMessage('Не выбран период для изменения')
        else
          for i := 0 to StringGrid1.RowCount - 2 do
          begin
            try
              Query1.Close;
              Query1.SQL.Text := 'UPDATE FactSale' + #13 +
                'SET factsum = :factsum, sub=:sub' + #13 +
                'WHERE (regn = :regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104)) ' +
                'AND (sdate = CONVERT(smalldatetime, :sdate, 104))';
              Query1.ParamByName('factsum').Value := StrToFloat(StringGrid1.Cells[2, i + 1]);
              Query1.ParamByName('sub').Value := StrToFloat(StringGrid1.Cells[1, i + 1]);
              Query1.ParamByName('regn').Value := cl.Data.regn;
              Query1.ParamByName('bdate').Value := DateToStr(fbegindate);
              Query1.ParamByName('sdate').Value := StringGrid1.Cells[0, i + 1];
              Query1.ExecSQL;
            except
              ShowMessage('Ошибка при изменении! Проверьте правильность ввода данных.')
            end;
            try
              Query1.Close;
              Query1.SQL.Text := 'UPDATE FactBalance' + #13 +
                'SET balance = :balance, dolg=:dolg' + #13 +
                'WHERE (regn = :regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104))';
              Query1.ParamByName('balance').Value := StrToFloat(Edit114.Text);
              Query1.ParamByName('dolg').Value := StrToFloat(Edit113.Text);
              Query1.ParamByName('regn').Value := cl.Data.regn;
              Query1.ParamByName('bdate').Value := DateToStr(fbegindate);
              Query1.ExecSQL;
            except
              ShowMessage('Ошибка при изменении! Проверьте правильность ввода данных.')
            end;
          end;
      end;
    end;
  end;
  if fbegindate = Cl.cdata.prevbegindate then
  begin
    Cl.cdata.averageFact := StrToFloat(Edit114.Text);
    Cl.cdata.dolgFact := StrToFloat(Edit113.Text);

    Edit116.Text := Edit114.Text;
    if Cl.cdata.dolgFact > 0 then
    begin
      with DModule.Query1 do
      begin
        Close;
        SQL.Text := 'SELECT sum(sub) as sumsub' + #13 +
          'FROM Sluj' + #13 +
          'WHERE (regn = :regn) AND (factminus = 1) AND (sdate >= convert(smalldatetime,:bdate,104))' + #13 +
          'AND (sdate < convert(smalldatetime,:edate,104))';
        ParamByName('regn').AsInteger := Cl.Data.regn;
        ParamByName('bdate').AsString := DateToStr(Cl.cdata.begindate);
        ParamByName('edate').AsString := DateToStr(Cl.cdata.enddate);
        Open;
        Cl.cdata.dolgFact := Cl.cdata.dolgFact - FieldByName('sumsub').AsFloat;
      end;
    end;
    Edit115.Text := FloatToStr(Cl.cdata.dolgFact);
  end;

  ClearFactGrids();
  TabControl1.OnChange(self);
end;

procedure TEditClForm.Button21Click(Sender: TObject);
begin
  if ComboBox23.Text = '' then
    ShowMessage('Не выбран период для удаления')
  else
  if MessageDlg('Удалить выбранный период?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      with DModule do
      begin
        Query1.Close;
        Query1.SQL.Text := 'DELETE FROM FactBalance' + #13 +
          'WHERE (regn=:regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104))';
        Query1.ParamByName('regn').Value := cl.Data.regn;
        Query1.ParamByName('bdate').Value := DateToStr(fbegindate);
        Query1.ExecSQL;
        //-----------------
        Query1.Close;
        Query1.SQL.Text := 'DELETE FROM FactSale' + #13 +
          'WHERE (regn=:regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104))';
        Query1.ParamByName('regn').Value := cl.Data.regn;
        Query1.ParamByName('bdate').Value := DateToStr(fbegindate);
        Query1.ExecSQL;
      end;
    except
      ShowMessage('Ошибка при удалении');
    end;
    if fbegindate = Cl.cdata.prevbegindate then
    begin
      Cl.cdata.averageFact := 0;
      Cl.cdata.dolgFact := 0;
      Edit115.Text := '0';
      Edit116.Text := '0';
    end;

    ClearFactGrids();
    TabControl1.OnChange(self);
  end;
end;

procedure TEditClForm.Button2Click(Sender: TObject);
{ применить изменения }
begin
  case mode of
    vAdd:
    begin
      if AddClient = 0 then
        Close;
    end;
    vEdit:
    begin
      if ModifyClient = 0 then
        Close;
    end;
  end;
end;

procedure TEditClForm.FormClose(Sender: TObject; var Action: TCloseAction);
{ закрытие формы }
begin
  DModule.Query1.Close;
  DModule.Query2.Close;
  DModule.qTarif.Close;
end;

function TEditClForm.AddAnyMonth(BD, ED: TDateTime): TStringList;
var
  tmpDate: TDateTime;
  StrList: TStringList;
  i: integer;
  //    tmp: byte;
begin
  StrList := TStringList.Create;
  tmpDate := BD;
  StrList.Add(DateToStr(tmpdate));
  for i := 1 to MounthDiff(BD, ED) - 1 do
  begin
    tmpdate := IncMonth(tmpdate, 1);
    StrList.Add(DateToStr(tmpdate));
  end;
  Result := StrList;
end;

function TEditClForm.AddClient: integer;
  { добавить клиента }
var
  mem, i, n, maxid: integer;
begin
  Result := 0;
  if not ErrorMessage then
  begin
    n := 0;
    if not ExistClient(n) then
    begin
      DModule.Database1.StartTransaction;
      try
        with DModule.Query1 do
        begin
          if not ExistHouse(n) then
          begin//если такого дома в базе нет
            Close;
            SQL.Clear;
            SQL.Add('execute maxhouse :dist');
            ParamByName('dist').AsInteger := Cl.Data.dist;
            Open;
            maxid := FieldByName('mid').AsInteger;
            Inc(maxid);
            Close;
            SQL.Clear;
            SQL.Add('insert into house');
            SQL.Add('values (:id,:dist,:str,:nh,:cp,:stnd,');
            SQL.Add(':cont,:rep,:cold,:hot,:canal,:heat,:gas,');
            SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil)');
            ParamByName('id').AsInteger := maxid;
            ParamByName('dist').AsInteger := Cl.Data.dist;
            ParamByName('str').AsInteger := Cl.Data.str;
            ParamByName('nh').AsString  := Cl.Data.nh;
            ParamByName('cp').AsString  := Cl.Data.corp;
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
            ParamByName('mng').AsInteger := Cl.Data.manager;
            ParamByName('fnd').AsInteger := Cl.Data.fond;
            ParamByName('boil').AsInteger := Cl.cdata.boiler;
            ExecSQL;
          end;
          Close;
          SQL.Clear;
          SQL.Add('insert into hist');
          SQL.Add('values (:id,CONVERT(smalldatetime,:bdate,104),CONVERT(smalldatetime,:edate,104),');
          SQL.Add(':mcount,:quanpriv,:pmin,:income,:insp,:dist,:control,:reason,');
          SQL.Add(':own, :manager, :fond, :cert, :bank, :acbank,:calc,:mdd,:heating,:rmcount,:indrstnd,:indrstndval)');
          ParamByName('id').AsInteger  := Cl.Data.regn;
          ParamByName('mcount').AsInteger := Cl.cdata.mcount;
          ParamByName('quanpriv').AsInteger := Cl.cdata.quanpriv;
          ParamByName('pmin').AsFloat  := Cl.cdata.pmin;
          ParamByName('income').AsFloat := Cl.cdata.income;
          ParamByName('insp').AsInteger := Cl.Data.insp;
          ParamByName('dist').AsInteger := Cl.Data.dist;
          ParamByName('control').AsInteger := Cl.Data.control;
          ParamByName('reason').AsString := Cl.Data.reason;
          ParamByName('own').AsInteger := Cl.Data.own;
          ParamByName('manager').AsInteger := Cl.Data.manager;
          ParamByName('fond').AsInteger := Cl.Data.fond;
          ParamByName('cert').AsInteger := Cl.Data.cert;
          ParamByName('bank').AsInteger := Cl.Data.bank;
          ParamByName('acbank').AsString := Cl.Data.acbank;
          ParamByName('bdate').AsString := DateToStr(Cl.cdata.begindate);
          ParamByName('edate').AsString := DateToStr(Cl.cdata.enddate);
          ParamByName('calc').AsInteger := Cl.cdata.calc;
          ParamByName('mdd').AsInteger := Cl.cdata.mdd;
          ParamByName('heating').AsInteger := Cl.cdata.heating;
          ParamByName('rmcount').AsInteger := Cl.cdata.rmcount;
          ParamByName('indrstnd').Value := Cl.cdata.indrstnd;
          ParamByName('indrstndval').AsFloat := Cl.cdata.indrstndval;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('insert into cl');
          SQL.Add('values (:id,:fio,CONVERT(smalldatetime, :rdate, 104),');
          SQL.Add('CONVERT(smalldatetime, :change, 104),:dist,:str,:n,:cp,:apart,:tel,');
          SQL.Add(':lsquare, :square,:stnd,:settl,:boil,CONVERT(smalldatetime, :declar, 104),:mmail)');
          ParamByName('fio').AsString := Cl.Data.fio;
          ParamByName('id').AsInteger := Cl.Data.regn;
          ParamByName('rdate').AsString := DateToStr(Cl.Data.regdate);
          ParamByName('change').AsString := DateToStr(Cl.Data.change);
          ParamByName('dist').AsInteger := Cl.Data.dist;
          ParamByName('str').AsInteger := Cl.Data.str;
          ParamByName('n').AsString  := Cl.Data.nh;
          ParamByName('cp').AsString := Cl.Data.corp;
          ParamByName('apart').AsString := Cl.Data.apart;
          ParamByName('tel').AsString := Cl.Data.tel;
          ParamByName('lsquare').AsFloat := Cl.cdata.lsquare;
          ParamByName('square').AsFloat := Cl.cdata.square;
          ParamByName('stnd').AsInteger := Cl.cdata.rstnd;
          ParamByName('settl').AsInteger := Cl.Data.settl;
          ParamByName('boil').AsInteger := Cl.cdata.boiler;
          ParamByName('declar').Value := formatdatetime('YYYYMMDD', strtodate(MaskEdit4.Text));
          if checkbox3.Checked then
            ParamByName('mmail').AsInteger := 1
          else
            ParamByName('mmail').AsInteger := 0;

          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('insert into sub');
          SQL.Add('values (CONVERT(smalldatetime,:d,104),:id,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp,:stndsub)');
          ParamByName('d').AsString := DateToStr(Cl.cdata.begindate);
          ParamByName('id').AsInteger := Cl.Data.regn;
          ParamByName('stp').AsInteger := Cl.cdata.stop;
          for i := 0 to numbtarif - 1 do
          begin
            if (i < 8) or (i > 11) then
            begin
              ParamByName('serv').AsInteger := i;
              ParamByName('idserv').AsInteger := Cl.cdata.tarifs[i];
              ParamByName('ac').AsString := Cl.cdata.accounts[i];
              ParamByName('pm').AsFloat  := Cl.cdata.pm[i];
              ParamByName('snp').AsFloat := Cl.cdata.snpm[i];
              ParamByName('sub').AsFloat := Cl.cdata.sub[i];
              ParamByName('sp').AsFloat  := Cl.cdata.fpm[i];
              ParamByName('stndsub').AsFloat := Cl.cdata.stndsub[i];
              ExecSQL;
            end;
          end;

          //счетчики
          Close;
          SQL.Clear;
          SQL.Add('insert into Counters');
          SQL.Add('values (CONVERT(smalldatetime,:d,104),:id,:serv,:count,:countdata,:countserv)');
          ParamByName('d').AsString := DateToStr(Cl.cdata.begindate);
          ParamByName('id').AsInteger := Cl.Data.regn;
          for i := 0 to numbtarif - 1 do
          begin
            if (i in [2..7]) and (Cl.cdata.counter[i]) then
            begin
              ParamByName('serv').AsInteger := i;
              ParamByName('count').Value := Cl.cdata.counter[i];
              ParamByName('countdata').AsFloat := Cl.cdata.counterdata[i];
              ParamByName('countserv').AsInteger := Cl.cdata.countertarifs[i];
              ExecSQL;
            end;
          end;

          Close;
          mem := 0;
          for i := 0 to Cl.cdata.family.Count - 1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into fam');
            SQL.Add('values (:id, :cl, :fio,convert(smalldatetime,:birth,104),');
            SQL.Add(':pol, :st, :priv,:mid, :rel,:npss)');
            ParamByName('id').AsInteger := StrToInt(IntToStr(Cl.Data.regn) + IntToStr(mem));
            ParamByName('cl').AsInteger := Cl.Data.regn;
            ParamByName('npss').AsString := TMan(Cl.cdata.family[i]).npss;
            ParamByName('fio').AsString := TMan(Cl.cdata.family[i]).fio;
            ParamByName('birth').AsString := DateToStr(TMan(Cl.cdata.family[i]).birth);
            ParamByName('pol').AsInteger := TMan(Cl.cdata.family[i]).pol;
            ParamByName('st').AsInteger := TMan(Cl.cdata.family[i]).status;
            ParamByName('priv').AsInteger := TMan(Cl.cdata.family[i]).priv;
            ParamByName('mid').AsFloat := TMan(Cl.cdata.family[i]).mid;
            ParamByName('rel').AsInteger := TMan(Cl.cdata.family[i]).rel;
            ExecSQL;
            Inc(mem);
          end;
          Close;
          SQL.Clear;
          SQL.Add('update insp');
          SQL.Add('set lastnum = :num');
          SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
          ParamByName('id').AsInteger  := cl.Data.insp;
          ParamByName('idd').AsInteger := Cl.Data.dist;
          ParamByName('num').AsInteger := StrToInt(Edit85.Text);
          try
            ExecSQL;
          except
            DModule.Database1.Close;
            try
              DModule.Database1.Open;
              ExecSQL;
            except
              ShowMessage('Нет соединения с сервером! Обратитесь к специалисту');
            end;
          end;
        end;
        DModule.Database1.Commit;
        Result := 0;
      except
        //транзакция не выполнена
        DModule.Database1.Rollback;
        Result := -1;
      end;
      if Result = 0 then
        Form1.AddCl(Cl.Data.regn);
    end
    else
      ShowMessage('Клиент с указанными данными уже существует!');
  end;
end;

function TEditClForm.ModifyClient: integer;
  { изменить клиента }
var
  n, i, mem, maxid: integer;
  dt: string;
begin
  Result := 0;
  if IsAPeriod then
  begin
    if not ErrorMessage then
    begin
      n := 0;
      if (not ExistClient(n) or ExistClient(n) and (n = Form1.client)) then
      begin
        DModule.Database1.StartTransaction;
        try
          with DModule.Query1 do
          begin
            if not ExistHouse(n) then
            begin//если такого дома в базе нет
              Close;
              SQL.Clear;
              SQL.Add('execute maxhouse :dist');
              ParamByName('dist').AsInteger := Cl.Data.dist;
              Open;
              maxid := FieldByName('mid').AsInteger;
              Inc(maxid);
              Close;
              SQL.Clear;
              SQL.Add('insert into house');
              SQL.Add('values (:id, :dist,:str, :nh, :cp, :stnd,');
              SQL.Add(':cont, :rep, :cold, :hot,:canal, :heat, :gas,');
              SQL.Add(':el, :wood, :coal, :mng, :fnd,:boil)');
              ParamByName('id').AsInteger := maxid;
              ParamByName('dist').AsInteger := Cl.Data.dist;
              ParamByName('str').AsInteger := Cl.Data.str;
              ParamByName('nh').AsString  := Cl.Data.nh;
              ParamByName('cp').AsString  := Cl.Data.corp;
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
              ParamByName('mng').AsInteger := Cl.Data.manager;
              ParamByName('fnd').AsInteger := Cl.Data.fond;
              ParamByName('boil').AsInteger := Cl.cdata.boiler;
              ExecSQL;
            end;
            if (att <> RadioGroup1.ItemIndex) and (RadioGroup1.ItemIndex = 2) then
            begin//внеплановая
              Close;
              SQL.Clear;
              SQL.Add('update hist');
              SQL.Add('set edate=CONVERT(smalldatetime, :edate, 104)');
              SQL.Add('where regn=:id and bdate<=CONVERT(smalldatetime, :d, 104)');
              SQL.Add('and edate>CONVERT(smalldatetime, :d, 104)');
              ParamByName('id').AsInteger := Cl.Data.regn;
              ParamByName('d').AsString := Form1.rdt;
              ParamByName('edate').AsString := Form1.rdt;
              ExecSQL;
              Close;
              SQL.Clear;
              SQL.Add('delete from sub');
              SQL.Add('where (regn = :id)and(sdate>=CONVERT(smalldatetime, :s, 104))');
              ParamByName('id').AsInteger := cl.Data.regn;
              ParamByName('s').AsString := Form1.rdt;
              ExecSQL;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select regn from hist');
            SQL.Add('where regn=:r and bdate=CONVERT(smalldatetime,:d,104)');
            ParamByName('r').AsInteger := Cl.Data.regn;
            ParamByName('d').AsString  := DateToStr(Cl.cdata.begindate);
            Open;
            if isEmpty then
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into hist');
              SQL.Add('values (:id,CONVERT(smalldatetime,:bdate,104),');
              SQL.Add('CONVERT(smalldatetime,:edate,104),:mcount,:quanpriv,:pmin,:income,:insp,');
              SQL.Add(':idd,:control,:reason,:own, :manager, :fond,:cert,:bank,:acbank,:calc,:mdd,:heating,:rmcount,:indrstnd,:indrstndval)');
            end
            else
            begin
              Close;
              SQL.Clear;
              SQL.Add('update hist');
              SQL.Add('set edate=CONVERT(smalldatetime,:edate,104),mcount=:mcount,');
              SQL.Add('quanpriv=:quanpriv,pmin=:pmin,income=:income,id_insp=:insp,id_dist=:idd,');
              SQL.Add('id_cntrl=:control,reason=:reason,id_own=:own,id_mng=:manager,');
              SQL.Add('id_fond=:fond,id_cert=:cert,id_bank=:bank,acbank=:acbank,calc=:calc,mdd=:mdd, id_heating=:heating, rmcount=:rmcount,indrstnd=:indrstnd,indrstndval=:indrstndval');
              SQL.Add('where regn=:id and bdate=CONVERT(smalldatetime,:bdate,104)');
            end;
            ParamByName('id').AsInteger  := Cl.Data.regn;
            ParamByName('mcount').AsInteger := Cl.cdata.mcount;
            ParamByName('quanpriv').AsInteger := Cl.cdata.quanpriv;
            ParamByName('pmin').AsFloat  := Cl.cdata.pmin;
            ParamByName('income').AsFloat := Cl.cdata.income;
            ParamByName('insp').AsInteger := cl.Data.insp;
            ParamByName('idd').AsInteger := cl.Data.dist;
            ParamByName('control').AsInteger := Cl.Data.control;
            ParamByName('reason').AsString := Cl.Data.reason;
            ParamByName('own').AsInteger := Cl.Data.own;
            ParamByName('manager').AsInteger := Cl.Data.manager;
            ParamByName('fond').AsInteger := Cl.Data.fond;
            ParamByName('cert').AsInteger := Cl.Data.cert;
            ParamByName('bank').AsInteger := Cl.Data.bank;
            ParamByName('acbank').AsString := Cl.Data.acbank;
            ParamByName('bdate').AsString := DateToStr(Cl.cdata.begindate);
            ParamByName('edate').AsString := DateToStr(Cl.cdata.enddate);
            ParamByName('calc').AsInteger := Cl.cdata.calc;
            ParamByName('mdd').AsInteger := Cl.cdata.mdd;
            ParamByName('heating').AsInteger := Cl.cdata.heating;
            ParamByName('rmcount').AsInteger := Cl.cdata.rmcount;
            ParamByName('indrstnd').Value := Cl.cdata.indrstnd;
            ParamByName('indrstndval').AsFloat := Cl.cdata.indrstndval;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('update cl');
            SQL.Add('set fio=:fio,change=CONVERT(smalldatetime, :change, 104),declardate=CONVERT(smalldatetime, :declar, 104),');
            SQL.Add('id_street=:str,nhouse=:n,corp=:cp,apart=:apart,tel=:tel,');
            SQL.Add('lsquare=:lsquare, square=:square,id_stnd=:stnd,id_settl=:settl,boiler=:boil,mail=:mmail');
            SQL.Add('where regn = :id');
            ParamByName('id').AsInteger := Cl.Data.regn;
            ParamByName('fio').AsString := Cl.Data.fio;
            Form1.SetPer2(Form1.rdt, dt);
            ParamByName('change').AsString := IntToStr(DayOf(Date)) + '.' + Copy(dt, 3, 2) + '.20' + Copy(dt, 1, 2);
            ParamByName('str').AsInteger := Cl.Data.str;
            ParamByName('n').AsString  := Cl.Data.nh;
            ParamByName('cp').AsString := Cl.Data.corp;
            ParamByName('apart').AsString := Cl.Data.apart;
            ParamByName('tel').AsString := Cl.Data.tel;
            ParamByName('lsquare').AsFloat := Cl.cdata.lsquare;
            ParamByName('square').AsFloat := Cl.cdata.square;
            ParamByName('stnd').AsInteger := Cl.cdata.rstnd;
            ParamByName('settl').AsInteger := Cl.Data.settl;
            ParamByName('boil').AsInteger := Cl.cdata.boiler;
            ParamByName('declar').Value := formatdatetime('YYYYMMDD', strtodate(MaskEdit4.Text));//.AsString :=  Edit111.Text;
            ParamByName('mmail').AsInteger := Cl.Data.mail;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('delete from sub');
            SQL.Add('where (regn=:r)and(sdate>=CONVERT(smalldatetime,:s,104))');
            ParamByName('s').AsString  := Form1.rdt;
            ParamByName('r').AsInteger := Form1.client;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('insert into  sub');
            SQL.Add('values (CONVERT(smalldatetime,:s,104),:r,:serv,:idserv,:ac,:pm,:snp,:sub,:sp,:stp,:stndsub)');
            ParamByName('s').AsString  := Form1.rdt;
            ParamByName('r').AsInteger := Form1.client;
            ParamByName('stp').AsInteger := Cl.cdata.stop;
            for i := 0 to numbtarif - 1 do
            begin
              if (i < 8) or (i > 11) then
              begin
                Close;
                ParamByName('serv').AsInteger := i;
                ParamByName('idserv').AsInteger := Cl.cdata.tarifs[i];
                ParamByName('ac').AsString := Cl.cdata.accounts[i];
                ParamByName('pm').AsFloat  := Cl.cdata.pm[i];
                ParamByName('snp').AsFloat := Cl.cdata.snpm[i];
                ParamByName('sub').AsFloat := Cl.cdata.sub[i];
                ParamByName('sp').AsFloat  := Cl.cdata.fpm[i];
                ParamByName('stndsub').AsFloat := Cl.cdata.stndsub[i];

                try
                  ExecSQL;
                except
                  DModule.Database1.Close;
                  try
                    DModule.Database1.Open;
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
            for i := 0 to Cl.cdata.family.Count - 1 do
            begin
              Close;
              SQL.Clear;
              //          if mem > 9 then mem := 9;
              SQL.Add('insert into fam');
              SQL.Add('values (:id, :cl, :fio,convert(smalldatetime,:birth,104),');
              SQL.Add(':pol, :st, :priv,:mid, :rel, :npss)');
              ParamByName('id').AsCurrency := StrToCurr(IntToStr(Cl.Data.regn) + IntToStr(mem));
              ParamByName('cl').AsInteger := Form1.client;
              ParamByName('npss').AsString := TMan(Cl.cdata.family[i]).npss;
              ParamByName('fio').AsString := TMan(Cl.cdata.family[i]).fio;
              ParamByName('birth').AsString := DateToStr(TMan(Cl.cdata.family[i]).birth);
              ParamByName('pol').AsInteger := TMan(Cl.cdata.family[i]).pol;
              ParamByName('st').AsInteger := TMan(Cl.cdata.family[i]).status;
              ParamByName('priv').AsInteger := TMan(Cl.cdata.family[i]).priv;
              ParamByName('mid').AsFloat := TMan(Cl.cdata.family[i]).mid;
              ParamByName('rel').AsInteger := TMan(Cl.cdata.family[i]).rel;
              ExecSQL;
              Inc(mem);
            end;
            //------счетчики
            Close;
            SQL.Text := 'delete from Counters' + #13 +
              'where (regn=:r)and(sdate>=CONVERT(smalldatetime,:s,104))';
            ParamByName('s').AsString := DateToStr(Cl.cdata.begindate); //Form1.rdt;
            ParamByName('r').AsInteger := Form1.client;
            ExecSQL;
            Close;
            SQL.Text := 'insert into Counters' + #13 +
              'values (CONVERT(smalldatetime,:d,104),:r,:serv,:count,:countdata,:countserv)';
            for i := 0 to numbtarif - 1 do
              if (i in [2..7]) and (cl.cdata.counter[i]) then
              begin
                Close;
                ParamByName('r').AsInteger := Form1.client;
                ParamByName('d').AsString  := DateToStr(Cl.cdata.begindate); //Form1.rdt;
                ParamByName('serv').AsInteger := i;
                ParamByName('count').Value := Cl.cdata.counter[i];
                ParamByName('countdata').AsFloat := Cl.cdata.counterdata[i];
                ParamByName('countserv').AsInteger := Cl.cdata.countertarifs[i];
                ExecSQL;
              end;
            //------
            Close;
          end;
          DModule.Database1.Commit;
          Result := 0;
        except
          //транзакция не выполнена
          DModule.Database1.Rollback;
          Result := -1;
        end;
        if Result = 0 then
          Form1.ModCl(Form1.client);
      end
      else
        ShowMessage('Клиент с указанными данными уже существует!');
    end;
  end
  else
    ShowMessage('Выберите новый срок субсидии, чтобы сохранить изменения!');
end;

procedure TEditClForm.SetRegn;
var
  num: integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select lastnum');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
    ParamByName('id').AsInteger  := Cl.Data.insp;
    ParamByName('idd').AsInteger := Cl.Data.dist;
    Open;
    num := FieldByName('lastnum').AsInteger;
    Close;
    Inc(num);
  end;
  if Form1.dist < 10 then
    Edit85.Text := '0' + IntToStr(num)
  else
    Edit85.Text := IntToStr(num);
  Cl.Data.regn := num;
end;

procedure TEditClForm.SetRegDate;
begin
  Edit87.Text := DateToStr(Date);
  Cl.Data.regdate := StrToDate(Edit87.Text);
end;

procedure TEditClForm.SetPeriod;
begin
  MaskEdit2.Text := Form1.rdt;
  MaskEdit3.Text := DateToStr(IncMonth(StrToDate(Form1.rdt), StrToInt(Edit109.Text)));
  SetCert;
  Cl.cdata.period  := StrToInt(Edit109.Text);
  Cl.cdata.begindate := StrToDate(MaskEdit2.Text);
  Cl.cdata.enddate := StrToDate(MaskEdit3.Text);
end;

procedure TEditClForm.NewPeriod;
begin
  SetPeriod;
  Edit86.Text  := SelInsp(Form1.insp);
  Edit88.Text  := DateToStr(Date);
  Cl.cdata.stop := 0;
  Cl.Data.insp := Form1.insp;
  Cl.Data.change := Date;
  MaskEdit4.Text := DateToStr(Date);
  CheckBox3.Checked := False;
  Cl.Data.mail := 0;

  //установка даты прошлого периода
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT *'#13#10 +
      'FROM dbo.getcurhist(:bdate)'#13#10 +
      'WHERE regn = :regn';
    //      'FROM hist INNER JOIN' + #13 +
    //        '(SELECT regn, max(bdate) as bdate' + #13 +
    //          'FROM hist' + #13 +
    //          'WHERE bdate < convert(smalldatetime,:bdate,104)' + #13 +
    //          'GROUP BY regn) sb on hist.regn = sb.regn AND hist.bdate = sb.bdate' + #13 +
    //      'WHERE hist.regn = :regn';
    ParamByName('regn').AsInteger := cl.Data.regn;
    ParamByName('bdate').AsString := DateToStr(cl.cdata.begindate);
    Open;
    //если запись в базе нет (нет прошлого периода)
    if RecordCount = 0 then
    begin
      cl.cdata.prevbegindate := cl.cdata.begindate;
      cl.cdata.prevenddate := cl.cdata.enddate;
    end
    else
    begin
      cl.cdata.prevbegindate := FieldByName('bdate').AsDateTime;
      cl.cdata.prevenddate := FieldByName('edate').AsDateTime;
    end;
  end;
  MaskEdit5.Text := DateToStr(Cl.cdata.prevbegindate);
  MaskEdit6.Text := DateToStr(Cl.cdata.prevenddate);

  //Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
  //Cl.CalcFinal(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
  //SetVCalc;
  //SumV;
end;

function TEditClForm.IsAPeriod: boolean;
begin
  if (Cl.cdata.begindate <= StrToDate(Form1.rdt)) and
    (Cl.cdata.enddate >= StrToDate(Form1.rdt)) then
    Result := True
  else
    Result := False;
end;

procedure TEditClForm.SetCert;
var
  c:  integer;
  p1: TDate;
begin
  c := Cl.Data.cert;
  if load then
  begin
    p1 := StrToDate(MaskEdit2.Text);
    if (p1 >= IncMonth(Cl.cdata.enddate)) or ((p1 = Cl.cdata.begindate) and (cl.Data.cert <> 2)) then
      c := 1;//первичная аттестация
    if (Cl.cdata.enddate = p1) then
      c := 2;//переаттестация
    if (Cl.cdata.begindate < p1) and (p1 < Cl.cdata.enddate) then
      c := 3;//внеплановая аттестация
    Cl.Data.cert := c;
    RadioGroup1.ItemIndex := c - 1;
  end;
end;

procedure TEditClForm.comboBoxContChange(Sender: TObject);
{ выбрали тариф на содержание жилья }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);//, SearchCont(comboBoxCont.Text);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit3.Text := FormatFloat('0.00', GetCostTarif(0, cont[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelCont(cont[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[0] := cont[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[0] := GetCostTarif(0, cont[(Sender as TComboBox).ItemIndex], Cl.cdata.begindate, 0, 0, Cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(0, cServSq);
end;

procedure TEditClForm.comboBoxMOPChange(Sender: TObject);
{ выбрали тариф на МОП }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit4.Text := FormatFloat('0.00', GetCostTarif(1, mop[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelRep(mop[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[1] := mop[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[1] := GetCostTarif(1, mop[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(1, cServe);
end;

procedure TEditClForm.comboBoxColdChange(Sender: TObject);
{ выбрали тариф на холодную воду }
var
  ind, b: integer;
begin
  if not CheckBox2.Checked then
    b := 0
  else
    b := 1;
  ind := SearchServIndex(comboBoxCold);
  ;
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit5.Text := FormatFloat('0.00', GetCostTarif(2, cold[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), b, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelCold(cold[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[2] := cold[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[2] := GetCostTarif(2, cold[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.tarifnorm[2] := GetNormTarif(2, cold[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(2, cServ);
end;

procedure TEditClForm.comboBoxColdCounterChange(Sender: TObject);
{ выбрали тариф на холодную воду }
var
  ind, b: integer;
begin
  if not CheckBox2.Checked then
    b := 0
  else
    b := 1;
  ind := SearchServIndex(comboBoxColdCounter);
  ;
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit124.Text := FormatFloat('0.00', GetCostTarif(2, cold[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), b, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelCold(cold[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.countertarifs[2] := cold[(Sender as TComboBox).ItemIndex];
    Cl.cdata.countercost[2] := GetCostTarif(2, cold[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.counternorm[2] := GetNormTarif(2, cold[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(2, cServ);
end;

procedure TEditClForm.comboBoxHotChange(Sender: TObject);
{ выбрали тариф на горячую воду }
var
  ind, b: integer;
begin
  if not CheckBox2.Checked then
    b := 0
  else
    b := 1;
  ind := SearchServIndex((Sender as TComboBox));
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit6.Text := FormatFloat('0.00', GetCostTarif(3, hot[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), b, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelHot(hot[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[3] := hot[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[3] := GetCostTarif(3, hot[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.tarifnorm[3] := GetNormTarif(3, hot[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(3, cServ);
end;

procedure TEditClForm.comboBoxHotCounterChange(Sender: TObject);
{ выбрали тариф на горячую воду }
var
  ind, b: integer;
begin
  if not CheckBox2.Checked then
    b := 0
  else
    b := 1;
  ind := SearchServIndex((Sender as TComboBox));
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit125.Text := FormatFloat('0.00', GetCostTarif(3, hot[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), b, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelHot(hot[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.countertarifs[3] := hot[(Sender as TComboBox).ItemIndex];
    Cl.cdata.countercost[3] := GetCostTarif(3, hot[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.counternorm[3] := GetNormTarif(3, hot[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, b, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(3, cServ);
end;

procedure TEditClForm.comboBoxCanalChange(Sender: TObject);
{ выбрали тариф на водоотведение }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit2.Text := FormatFloat('0.00', GetCostTarif(4, canal[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelCanal(canal[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[4] := canal[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[4] := GetCostTarif(4, canal[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.tarifnorm[4] := GetNormTarif(4, canal[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(4, cServ);
end;

procedure TEditClForm.comboBoxCanalCounterChange(Sender: TObject);
{ выбрали тариф на водоотведение }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit126.Text := FormatFloat('0.00', GetCostTarif(4, canal[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelCanal(canal[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.countertarifs[4] := canal[(Sender as TComboBox).ItemIndex];
    Cl.cdata.countercost[4] := GetCostTarif(4, canal[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.counternorm[4] := GetNormTarif(4, canal[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(4, cServ);
end;

procedure TEditClForm.ComboBox21Change(Sender: TObject);
begin
  if load then
  begin
    Cl.cdata.tarifs[7] := ComboBox21.ItemIndex + 1;
    Cl.cdata.cost[7] := GetCostTarif(7, ComboBox21.ItemIndex + 1, Cl.cdata.begindate, 0, Cl.cdata.mcount, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.countertarifs[7] := Cl.cdata.tarifs[7];
    Cl.cdata.countercost[7] := Cl.cdata.cost[7];
  end;

  if ComboBox21.ItemIndex <> -1 then
    RecalcOneServ(7, cServ);

  //0:газовая
  //1:электрическая
  //2:прочие
end;

procedure TEditClForm.ComboBox22Change(Sender: TObject);
begin
  if load then
    cl.cdata.heating := ComboBox22.ItemIndex + 1;
end;

procedure TEditClForm.ComboBox23Change(Sender: TObject);
begin
  fbegindate := StrToDate(copy(ComboBox23.Items[ComboBox23.ItemIndex], 1, 10));
  fenddate := StrToDate(copy(ComboBox23.Items[ComboBox23.ItemIndex], 14, 23));

  ChangeFactPeriod(fbegindate, fenddate);
  UpdateFactInfo();
  CheckDifferenceFactSum;
end;

procedure TEditClForm.ComboBox23KeyPress(Sender: TObject; var Key: char);
begin
  key := #0;
end;

procedure TEditClForm.comboBoxHeatChange(Sender: TObject);
{ выбрали тариф на отопление  }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit7.Text := FormatFloat('0.00', GetCostTarif(5, heat[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelHeat(heat[0]);
    (Sender as TComboBox).OnChange(comboBoxHeat);
  end;
  if load then
  begin
    Cl.cdata.tarifs[5] := heat[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[5] := GetCostTarif(5, heat[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.tarifnorm[5] := GetNormTarif(5, heat[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(5, cServSq);
end;

procedure TEditClForm.comboBoxHeatCounterChange(Sender: TObject);
{ выбрали тариф на отопление  }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit127.Text := FormatFloat('0.00', GetCostTarif(5, heat[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelHeat(heat[0]);
    (Sender as TComboBox).OnChange(comboBoxHeat);
  end;
  if load then
  begin
    Cl.cdata.countertarifs[5] := heat[(Sender as TComboBox).ItemIndex];
    Cl.cdata.countercost[5] := GetCostTarif(5, heat[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.counternorm[5] := GetNormTarif(5, heat[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(5, cServSq);
end;

procedure TEditClForm.comboBoxGasChange(Sender: TObject);
{ выбрали тариф на газ }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit8.Text := FormatFloat('0.00', GetCostTarif(6, gas[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelGas(gas[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[6] := gas[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[6] := GetCostTarif(6, gas[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.tarifnorm[6] := GetNormTarif(6, gas[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(6, cServ);
end;

procedure TEditClForm.comboBoxGasCounterChange(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit128.Text := FormatFloat('0.00', GetCostTarif(6, gas[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]));
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelGas(gas[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.countertarifs[6] := gas[(Sender as TComboBox).ItemIndex];
    Cl.cdata.countercost[6] := GetCostTarif(6, gas[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
    Cl.cdata.counternorm[6] := GetNormTarif(6, gas[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(6, cServ);
end;

procedure TEditClForm.comboBoxWoodChange(Sender: TObject);
{ выбрали тариф на дрова }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit10.Text := FormatFloat('0.00', (GetCostTarif(12, wood[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]) * Form1.normw) / 12);
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelWood(wood[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[12] := wood[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[12] := GetCostTarif(12, wood[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(12, cServWC);
end;

procedure TEditClForm.comboBoxCoalChange(Sender: TObject);
{ выбрали тариф на уголь }
var
  ind: integer;
begin
  ind := SearchServIndex(Sender as TComboBox);
  if ind <> -1 then
  begin
    (Sender as TComboBox).ItemIndex := ind;
    Edit11.Text := FormatFloat('0.00', (GetCostTarif(13, coal[(Sender as TComboBox).ItemIndex], StrToDate(Form1.rdt), 0, 0, settl[Combobox14.ItemIndex], ord(elevatorCheckBox.Checked), mop[comboBoxMOP.ItemIndex]) * Form1.normc) / 12);
  end
  else
  begin
    (Sender as TComboBox).ItemIndex := 0;
    (Sender as TComboBox).Text := SelCoal(coal[0]);
    (Sender as TComboBox).OnChange((Sender as TComboBox));
  end;
  if load then
  begin
    Cl.cdata.tarifs[13] := coal[(Sender as TComboBox).ItemIndex];
    Cl.cdata.cost[13] := GetCostTarif(13, coal[(Sender as TComboBox).ItemIndex], cl.cdata.begindate, 0, 0, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  RecalcOneServ(13, cServWC);
end;

procedure TEditClForm.ComboBox10Change(Sender: TObject);
{ выбрали региональный стандарт}
var
  ind: integer;
begin
  ind := SearchStnd(ComboBox10.Text);
  if ind <> -1 then
    ComboBox10.ItemIndex := ind
  else
  begin
    ComboBox10.Text := SelStnd(stnd[0]);
    ComboBox10.ItemIndex := 0;
  end;

  if load then
  begin
    Cl.cdata.rstnd := stnd[Combobox10.ItemIndex];
    if Combobox10.ItemIndex <> -1 then
      Edit9.Text := FloatToStr(Cl.GetStandard);
  end;
{  if load and not CalcEmpty then
  begin
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    Cl.CalcFinal(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end; }
end;

procedure TEditClForm.ComboBox12Change(Sender: TObject);
{ выбрали улицу }
var
  ind: integer;
begin
  ind := SearchStreet(Combobox12.Text);
  if ind <> -1 then
    Combobox12.ItemIndex := ind
  else
  begin
    Combobox12.ItemIndex := 0;
    Combobox12.Text := SelStr(str[0]);
  end;
  if load then
    Cl.Data.str := str[Combobox12.ItemIndex];
end;

procedure TEditClForm.Edit60Change(Sender: TObject);
{ выбрали дом }
var
  b: integer;
begin
  if IsRus(Edit60.Text) and IsInt(Edit61.Text) and (Combobox12.Text <> '') then
    with DModule.Query1 do
    begin
      if load then
      begin
        Cl.Data.nh := Edit60.Text;
        Cl.Data.corp := Edit61.Text;
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
      if not EOF then
      begin
        b := FieldByName('boiler').AsInteger;
        Combobox15.Text := FieldByName('namemng').AsString;
        Combobox13.Text := FieldByName('namefond').AsString;
        Combobox10.Text := SelStnd(FieldByName('id_stnd').AsInteger);
        comboBoxCont.Text := SelCont(FieldByName('id_cont').AsInteger);
        comboBoxMOP.Text := SelRep(FieldByName('id_rep').AsInteger);
        comboBoxCold.Text := SelCold(FieldByName('id_cold').AsInteger);
        comboBoxHot.Text := SelHot(FieldByName('id_hot').AsInteger);
        comboBoxCanal.Text := SelCanal(FieldByName('id_canal').AsInteger);
        comboBoxHeat.Text := SelHeat(FieldByName('id_heat').AsInteger);
        comboBoxGas.Text := SelGas(FieldByName('id_gas').AsInteger);
        comboBoxWood.Text := SelWood(FieldByName('id_wood').AsInteger);
        comboBoxCoal.Text := SelCoal(FieldByName('id_coal').AsInteger);
        if load then
        begin
          Cl.cdata.boiler := b;
          Cl.cdata.elevator := FieldByName('elevator').AsInteger; //!
          Cl.cdata.tarifs[7] := FieldByName('id_el').AsInteger;
          Cl.cdata.countertarifs[7] := Cl.cdata.tarifs[7];
        end;
        ComboBox21.ItemIndex := FieldByName('id_el').AsInteger - 1;
        //RadioGroup2.ItemIndex := FieldByName('id_el').AsInteger-1;
        Close;
        CheckBox2.Checked := (b = 1);
        elevatorCheckBox.Checked := (Cl.cdata.elevator = 1);
        comboBoxCont.OnChange(comboBoxCont);
        comboBoxMOP.OnChange(comboBoxMOP);
        comboBoxCold.OnChange(comboBoxCold);
        comboBoxHot.OnChange(comboBoxHot);
        comboBoxHeat.OnChange(comboBoxHeat);
        comboBoxGas.OnChange(comboBoxGas);
        comboBoxWood.OnChange(comboBoxWood);
        comboBoxCoal.OnChange(comboBoxCoal);
        Combobox10.OnChange(combobox10);
        Combobox13.OnChange(combobox13);
        Combobox15.OnChange(combobox15);
      end;
    end;
end;

procedure TEditClForm.AddFamMan;
var
  man: TMan;
  item: TListItem;
  s: integer;
begin
  s := 0;
  if RadioButton7.Checked then
    s := 1;
  if RadioButton8.Checked then
    s := 2;
  man := TMan.Create(Edit69.Text, npssEdit.Text, StrToDate(MaskEdit1.Text), s,
    st[Combobox17.ItemIndex], p[Combobox18.ItemIndex],
    StrToFloat(Edit72.Text), rel[Combobox7.ItemIndex]);
  Cl.cdata.family.Add(man);
  if Cl.cdata.family.Count > Cl.cdata.mcount then
    Inc(Cl.cdata.mcount);
  Edit68.Text := IntToStr(Cl.cdata.mcount);

  Cl.cdata.rmcount := Cl.cdata.mcount;
  Edit117.Text := IntToStr(Cl.cdata.rmcount);

  SetLength(Cl.cdata.mid, Cl.cdata.mcount);
  SetLength(Cl.cdata.min, Cl.cdata.mcount);
  SetLength(Cl.cdata.priv, Cl.cdata.mcount);
  curman := Cl.cdata.family.Count - 1;
  Cl.cdata.mid[curman] := man.mid;
  Cl.cdata.min[curman] := FromSt(man.status);
  Cl.cdata.priv[curman] := man.priv;
  if man.pol = 1 then
    RadioButton7.Checked := True;
  if man.pol = 2 then
    RadioButton8.Checked := True;
  if Cl.cdata.priv[curman] <> 0 then
    Inc(Cl.cdata.quanpriv);
  Edit95.Text := IntToStr(cl.cdata.quanpriv);
  Cl.SetNorm;
  Cl.SetMin;
  Edit94.Text := FormatFloat('0.00', Cl.cdata.pmin);
  SetIncome;
  SetKoef;
  SortFam;
  item := LVFam.Items.Insert(curman);
  item.Caption := TMan(Cl.cdata.family.Items[curman]).fio;
  item.SubItems.Add(DateToStr(TMan(Cl.cdata.family.Items[curman]).birth));
  item.SubItems.Add(FormatFloat('0.00', Cl.cdata.mid[curman]));
  item.SubItems.Add(FormatFloat('0.00', SelMin(Cl.cdata.min[curman])));
  item.SubItems.Add(SelRel(TMan(Cl.cdata.family.Items[curman]).rel));
  Cl.cdata.tarifs[7] := ComboBox21.ItemIndex + 1;
  Cl.cdata.cost[7] := GetCostTarif(7, ComboBox21.ItemIndex + 1, Cl.cdata.begindate, 0, Cl.cdata.mcount, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  Cl.cdata.countertarifs[7] := Cl.cdata.tarifs[7];
  Cl.cdata.countercost[7] := Cl.cdata.cost[7];
  if load and not CalcEmpty then
  begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.btnColdCounterClick(Sender: TObject);
var
  nam, namet, capt: string;
begin
  if Sender = btnColdCounter then
  begin
    capt := 'Тарифы на водопотребление с откр/закр водоразбором(руб./чел.)';
    nam  := 'cold';
    namet := comboBoxColdCounter.Text;
  end;
  if Sender = btnHotCounter then
  begin
    capt := 'Тарифы на го.воду с откр/закр водоразбором(руб./чел.)';
    nam  := 'hot';
    namet := comboBoxHotCounter.Text;
  end;
  if Sender = btnCanalCounter then
  begin
    capt := 'Тарифы на водоотведение(руб./чел.)';
    nam  := 'canal';
    namet := comboBoxCanalCounter.Text;
  end;
  if Sender = btnHeatCounter then
  begin
    capt := 'Тарифы на отопление(руб./кв.м.)';
    nam  := 'heat';
    namet := comboBoxHeatCounter.Text;
  end;
  if Sender = btnGasCounter then
  begin
    capt := 'Тарифы на газ(руб./чел.)';
    nam  := 'gas';
    namet := comboBoxGasCounter.Text;
  end;
  if (Sender = btnColdCounter) or (Sender = btnHotCounter) then
  begin
    Form39 := TForm39.Create(EditClForm);
    Form39.Caption := capt;
    Form39.nam := nam;
    Form39.namet := namet;
    Form39.ShowModal;
    if Form39.ac then
    begin
      if Sender = btnColdCounter then
      begin
        comboBoxColdCounter.Text := Form39.namet;
        comboBoxColdCounter.OnChange(comboBoxColdCounter);
      end
      else
      begin
        comboBoxHotCounter.Text := Form39.namet;
        comboBoxHotCounter.OnChange(comboBoxHotCounter);
      end;
    end;
    Form39.Free;
  end;
  if (Sender = btnCanalCounter) or (Sender = btnHeatCounter) or (Sender = btnGasCounter) then
  begin
    Form37 := TForm37.Create(EditClForm);
    Form37.Caption := capt;
    Form37.nam := nam;
    Form37.namet := namet;
    Form37.ShowModal;
    if Form37.ac then
    begin
      if Sender = btnCanalCounter then
      begin
        comboBoxCanalCounter.Text := Form37.namet;
        comboBoxCanalCounter.OnChange(comboBoxCanalCounter);
      end;
      if Sender = btnHeatCounter then
      begin
        comboBoxHeatCounter.Text := Form37.namet;
        comboBoxHeatCounter.OnChange(comboBoxHeatCounter);
      end;
      if Sender = btnGasCounter then
      begin
        comboBoxGasCounter.Text := Form37.namet;
        comboBoxGasCounter.OnChange(comboBoxGasCounter);
      end;
    end;
    Form37.Free;
  end;
end;

procedure TEditClForm.ModFamMan;
var
  man:  TMan;
  s, pr: integer;
  item: TListItem;
begin
  s := 0;
  if RadioButton7.Checked then
    s := 1;
  if RadioButton8.Checked then
    s := 2;
  man := TMan.Create(Edit69.Text, npssEdit.Text, StrToDate(MaskEdit1.Text), s,
    st[Combobox17.ItemIndex], p[Combobox18.ItemIndex],
    StrToFloat(Edit72.Text), rel[Combobox7.ItemIndex]);
  pr := TMan(Cl.cdata.family[curman]).priv;//старая льгота
  Cl.cdata.family.Extract(Cl.cdata.family[curman]);
  Cl.cdata.family.Insert(curman, man);
  Cl.cdata.mid[curman] := man.mid;
  Cl.cdata.min[curman] := FromSt(man.status);
  Cl.cdata.priv[curman] := man.priv;//новая льгота
  Cl.cdata.tarifs[7] := ComboBox21.ItemIndex + 1;
  Cl.cdata.countertarifs[7] := Cl.cdata.tarifs[7];
  if (pr <> 0) and (man.priv = 0) then
    Dec(Cl.cdata.quanpriv);
  if (pr = 0) and (man.priv <> 0) then
    Inc(Cl.cdata.quanpriv);
  Edit95.Text := IntToStr(cl.cdata.quanpriv);
  Cl.SetMin;
  Edit94.Text := FormatFloat('0.00', Cl.cdata.pmin);
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
  item.SubItems.Add(FormatFloat('0.00', Cl.cdata.mid[curman]));
  item.SubItems.Add(FormatFloat('0.00', SelMin(Cl.cdata.min[curman])));
  item.SubItems.Add(SelRel(TMan(Cl.cdata.family.Items[curman]).rel));
  if load and not CalcEmpty then
  begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.Button3Click(Sender: TObject);
{ добавить члена семьи }
var
  y, yc, m, mc, d, dc: word;
  n, mn: integer;
begin
  n := 0;
  if (Edit69.Text <> '') and (MaskEdit1.Text <> '') and
    (combobox7.Text <> '') and (Edit72.Text <> '') and
    (Combobox17.Text <> '') and (Combobox18.Text <> '') and not ExistMemEx(n) and IsRus(Edit69.Text) then
  begin
    DecodeDate(StrToDate(MaskEdit1.Text), y, m, d);//дата рождения
    DecodeDate(Date, yc, mc, dc);//текущая дата
    y := yc - y;//возраст
    if (m > mc) or (m = mc) and (d > dc) then
      y := y - 1;
    mn := FromSt(st[Combobox17.ItemIndex]);
    if RadioButton7.Checked and
      ((y < 16) and (mn = 1) or
      (y >= 16) and (y < 55) and (mn = 3) or
      (y >= 55) and (mn = 2) or
      (y < 55) and (mn = 2) and (p[Combobox18.ItemIndex] <> 0)
      ) or
      RadioButton8.Checked and
      ((y < 16) and (mn = 1) or
      (y >= 16) and (y < 60) and (mn = 3) or
      (y >= 60) and (mn = 2) or
      (y < 60) and (mn = 2) and (p[Combobox18.ItemIndex] <> 0)
      ) then
      AddFamMan
    else
    begin
      if MessageBox(EditClForm.Handle, PChar('Выбранный социальный статус не соответствует указанному возрасту.' + #13 +
        'Вы настаиваете на нем?'), PChar('Несоответствие'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        AddFamMan
      else
      begin
        Combobox17.Text := '';
        Combobox17.OnChange(combobox17);
      end;
    end;
  end
  else
    ShowMessage('Введите другие данные!');
end;

procedure TEditClForm.Button4Click(Sender: TObject);
{ изменить сведения о члене семьи }
var
  y, yc, m, mc, d, dc: word;
  n, mn: integer;
begin
  n := 0;
  if (Edit69.Text <> '') and (MaskEdit1.Text <> '') and
    (Combobox7.Text <> '') and (Edit72.Text <> '') and IsRus(Edit69.Text) and
    (Combobox17.Text <> '') and (Combobox18.Text <> '') and (Cl.cdata.mcount <> 0) and (not ExistMemEx(n) or ExistMemEx(n) and
    (TMan(Cl.cdata.family[n]).fio = TMan(Cl.cdata.family[curman]).fio) and
    (TMan(Cl.cdata.family[n]).birth = TMan(Cl.cdata.family[curman]).birth)) then
  begin
    DecodeDate(StrToDate(MaskEdit1.Text), y, m, d);//дата рождения
    DecodeDate(Date, yc, mc, dc);//текущая дата
    y := yc - y;//возраст
    if (m > mc) or (m = mc) and (d > dc) then
      y := y - 1;
    mn := FromSt(st[Combobox17.ItemIndex]);
    if RadioButton7.Checked and
      ((y < 16) and (mn = 1) or
      (y >= 16) and (y < 55) and (mn = 3) or
      (y >= 55) and (mn = 2) or
      (y < 55) and (mn = 2) and (p[Combobox18.ItemIndex] <> 0)
      ) or
      RadioButton8.Checked and
      ((y < 16) and (mn = 1) or
      (y >= 16) and (y < 60) and (mn = 3) or
      (y >= 60) and (mn = 2) or
      (y < 60) and (mn = 2) and (p[Combobox18.ItemIndex] <> 0)
      ) then
      ModFamMan
    else
    begin
      if MessageBox(EditClForm.Handle, PChar('Выбранный социальный статус не соответствует указанному возрасту.' + #13 +
        'Вы настаиваете на нем?'), PChar('Несоответствие'),
        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1 or MB_APPLMODAL) = idYes then
        ModFamMan
      else
      begin
        Combobox17.Text := '';
        Combobox17.OnChange(combobox17);
      end;
    end;
  end
  else
    ShowMessage('Введите другие данные!');
end;

procedure TEditClForm.Button5Click(Sender: TObject);
{ удалить сведения о члене семьи }
var
  i, pr: integer;
begin
  pr := TMan(Cl.cdata.family[curman]).priv;//льгота человека, которого удаляем
  if (pr <> 0) and (Cl.cdata.quanpriv <> 0) then
    Dec(Cl.cdata.quanpriv);
  Edit95.Text := IntToStr(cl.cdata.quanpriv);
  Cl.cdata.family.Extract(Cl.cdata.family[curman]);
  LVFam.Items.Delete(curman);
  if Cl.cdata.family.Count + 1 = Cl.cdata.mcount then
    Dec(Cl.cdata.mcount);
  if curman = 0 then
    for i := 0 to Cl.cdata.mcount - 2 do
    begin
      Cl.cdata.min[i]  := Cl.cdata.min[i + 1];
      Cl.cdata.mid[i]  := Cl.cdata.mid[i + 1];
      Cl.cdata.priv[i] := Cl.cdata.priv[i + 1];
    end;
  if (curman > 0) and (curman < Cl.cdata.mcount - 1) then
    for i := curman to Cl.cdata.mcount - 2 do
    begin
      Cl.cdata.min[i]  := Cl.cdata.min[i + 1];
      Cl.cdata.mid[i]  := Cl.cdata.mid[i + 1];
      Cl.cdata.priv[i] := Cl.cdata.priv[i + 1];
    end;
  SetLength(Cl.cdata.mid, Cl.cdata.mcount);
  SetLength(Cl.cdata.min, Cl.cdata.mcount);
  SetLength(Cl.cdata.priv, Cl.cdata.mcount);
  Edit68.Text := IntToStr(Cl.cdata.mcount);

  Cl.cdata.rmcount := Cl.cdata.mcount;
  Edit117.Text := IntToStr(Cl.cdata.rmcount);

  if Cl.cdata.family.Count <> 0 then
    curman := Cl.cdata.family.Count - 1
  else
  begin
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
  Edit94.Text := FormatFloat('0.00', Cl.cdata.pmin);
  SetIncome;
  SetKoef;
  Cl.cdata.tarifs[7] := ComboBox21.ItemIndex + 1;
  Cl.cdata.cost[7] := GetCostTarif(7, ComboBox21.ItemIndex + 1, Cl.cdata.begindate, 0, Cl.cdata.mcount, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  Cl.cdata.countertarifs[7] := Cl.cdata.tarifs[7];
  Cl.cdata.countercost[7] := Cl.cdata.cost[7];
  if load and not CalcEmpty then
  begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.LVFamSelectItem(Sender: TObject; Item: TListItem; Selected: boolean);
var
  i: integer;
begin
  if selected and (LVFam.Items.Count <> 0) then
  begin
    i := LVFam.ItemIndex;
    curman := i;
    Edit69.Text := TMan(Cl.cdata.family[i]).fio;
    npssEdit.Text := TMan(Cl.cdata.family[i]).npss;
    MaskEdit1.Text := DateToStr(TMan(Cl.cdata.family[i]).birth);
    if TMan(Cl.cdata.family[i]).pol = 1 then
      RadioButton7.Checked := True;
    if TMan(Cl.cdata.family[i]).pol = 2 then
      RadioButton8.Checked := True;
    Edit72.Text := FormatFloat('0.00', TMan(Cl.cdata.family[i]).mid);
    Combobox17.Text := SelSt(TMan(Cl.cdata.family[i]).status);
    Combobox18.Text := SelPriv(TMan(Cl.cdata.family[i]).priv);
    Combobox7.Text  := SelRel(TMan(Cl.cdata.family[i]).rel);
    Combobox7.OnChange(combobox7);
    Combobox17.OnChange(combobox17);
    Combobox18.OnChange(combobox18);
  end;
end;

procedure TEditClForm.ComboBox15Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchMng(Combobox15.Text);
  if ind <> -1 then
    Combobox15.ItemIndex := ind
  else
  begin
    Combobox15.ItemIndex := 0;
    Combobox15.Text := SelMng(mng[0]);
  end;
  if load then
    Cl.Data.manager := mng[Combobox15.ItemIndex];
end;

procedure TEditClForm.ComboBox13Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchFnd(Combobox13.Text);
  if ind <> -1 then
    Combobox13.ItemIndex := ind
  else
  begin
    Combobox13.ItemIndex := 0;
    Combobox13.Text := SelFnd(fnd[0]);
  end;
  if load then
    Cl.Data.fond := fnd[Combobox13.ItemIndex];
end;

procedure TEditClForm.ComboBox14Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchSettl(Combobox14.Text);
  if ind <> -1 then
    Combobox14.ItemIndex := ind
  else
  begin
    Combobox14.ItemIndex := 0;
    Combobox14.Text := SelSettl(settl[0]);
  end;
  if load then
  begin
    Cl.Data.settl  := settl[Combobox14.ItemIndex];
    Cl.cdata.settl := settl[Combobox14.ItemIndex];  //добавил эту строку 28.12.2006
  end;
end;

procedure TEditClForm.ComboBox16Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchOwn(Combobox16.Text);
  if ind <> -1 then
    Combobox16.ItemIndex := ind
  else
  begin
    Combobox16.ItemIndex := 0;
    Combobox16.Text := SelOwn(own[0]);
  end;
  if load then
    Cl.Data.own := own[Combobox16.ItemIndex];
end;

procedure TEditClForm.ComboBox11Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchCntrl(Combobox11.Text);
  if ind <> -1 then
    Combobox11.ItemIndex := ind
  else
  begin
    Combobox11.ItemIndex := 0;
    Combobox11.Text := SelCntrl(cntrl[0]);
  end;
  if load then
    Cl.Data.control := cntrl[Combobox11.ItemIndex];
end;

procedure TEditClForm.ComboBox17Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchSt(Combobox17.Text);
  if ind <> -1 then
    Combobox17.ItemIndex := ind
  else
  begin
    Combobox17.ItemIndex := 0;
    Combobox17.Text := SelSt(st[0]);
  end;
end;

procedure TEditClForm.ComboBox18Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchPriv(Combobox18.Text);
  if ind <> -1 then
    Combobox18.ItemIndex := ind
  else
  begin
    Combobox18.ItemIndex := 0;
    Combobox18.Text := SelPriv(p[0]);
  end;
end;

procedure TEditClForm.ComboBox19Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchBank(Combobox19.Text);
  if ind <> -1 then
    Combobox19.ItemIndex := ind
  else
  begin
    Combobox19.Text := SelBank(bank[0]);
    Combobox19.ItemIndex := 0;
  end;
  if load then
    Cl.Data.bank := bank[Combobox19.ItemIndex];
end;

procedure TEditClForm.ChangeFactPeriod(BD, ED: TDateTime);
var
  i, j: integer;
begin
  StringGrid1.RowCount := MounthDiff(BD, ED) + 1;
  for i := 0 to (AddAnyMonth(BD, ED)).Count - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := AddAnyMonth(BD, ED)[i];
    StringGrid1.Cells[1, i + 1] := '0';
    StringGrid1.Cells[2, i + 1] := '0';
    StringGrid1.Cells[3, i + 1] := '0';
  end;

  //-------------

  with DModule do
  begin
    Query1.Close;
    Query1.SQL.Text := 'exec factSum :bdate, :edate, :regn';
    Query1.ParamByName('bdate').Value := DateToStr(BD);
    Query1.ParamByName('edate').Value := DateToStr(ED);
    Query1.ParamByName('regn').Value := cl.Data.regn;
    Query1.Open;
  end;

  DModule.Query1.First;
  for i := 0 to DModule.Query1.RecordCount - 1 do
  begin
    for j := 0 to StringGrid1.RowCount - 1 do
      if StringGrid1.Cells[0, j + 1] = DModule.Query1.FieldByName('sd').AsString then
        StringGrid1.Cells[1, j + 1] := DModule.Query1.FieldByName('sum_sub').AsString;//.FieldValues['sum_sub'];
    DModule.Query1.Next;
  end;

  //-------------

  if TabControl1.TabIndex = 1 then
  begin
    with DModule do
    begin
      Query1.Close;
      Query1.SQL.Text := 'SELECT sdate, regn, bdate, sub, factsum' + #13 +
        'FROM FactSale' + #13 +
        'WHERE (regn = :regn) AND (bdate = CONVERT(smalldatetime, :bdate, 104))' + #13 +
        'ORDER BY sdate';
      Query1.ParamByName('regn').Value := cl.Data.regn;
      Query1.ParamByName('bdate').Value := DateToStr(BD);
      Query1.Open;
      Query1.First;

      for i := 0 to Query1.RecordCount - 1 do
      begin
        StringGrid1.Cells[1, i + 1] := Query1.FieldValues['sub'];
        StringGrid1.Cells[2, i + 1] := Query1.FieldValues['factsum'];
        StringGrid1.Cells[3, i + 1] := calcMDiff(StringGrid1.Cells[1, i + 1], StringGrid1.Cells[2, i + 1]);
        Query1.Next;
      end;
    end;
  end;
end;

procedure TEditClForm.CheckBox10Click(Sender: TObject);
begin
  if (CheckBox10.Checked) then
  begin
    Edit9.Color := clWindow;
    Edit9.ReadOnly := False;
    Cl.cdata.indrstnd := True;
    Edit9.Text  := FloatToStr(Cl.cdata.indrstndval);
  end
  else
  begin
    Edit9.Color := clBtnFace;
    Edit9.ReadOnly := True;
    Cl.cdata.indrstnd := False;
  end;
end;

procedure TEditClForm.CheckBox1Click(Sender: TObject);
var
  sts: integer;
begin
  sts := Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate);
  if not load then
  begin
    Edit12.ReadOnly := True;
    Edit15.ReadOnly := True;
    Edit18.ReadOnly := True;
    Edit21.ReadOnly := True;
    Edit24.ReadOnly := True;
    Edit27.ReadOnly := True;
    Edit30.ReadOnly := True;
    Edit33.ReadOnly := True;
    Edit36.ReadOnly := True;
    Edit59.ReadOnly := True;
    Edit65.ReadOnly := True;
    Edit13.ReadOnly := True;
    Edit16.ReadOnly := True;
    Edit19.ReadOnly := True;
    Edit22.ReadOnly := True;
    Edit25.ReadOnly := True;
    Edit28.ReadOnly := True;
    Edit31.ReadOnly := True;
    Edit34.ReadOnly := True;
    Edit37.ReadOnly := True;
    Edit62.ReadOnly := True;
    Edit96.ReadOnly := True;
    Edit97.ReadOnly := True;
    Edit98.ReadOnly := True;
    Edit99.ReadOnly := True;
    Edit100.ReadOnly := True;
    Edit101.ReadOnly := True;
    Edit102.ReadOnly := True;
    Edit103.ReadOnly := True;
    Edit104.ReadOnly := True;
    Edit105.ReadOnly := True;
    Edit84.ReadOnly := True;
    Edit39.ReadOnly := True;
    Edit41.ReadOnly := True;
    Edit43.ReadOnly := True;
    Edit45.ReadOnly := True;
    Edit47.ReadOnly := True;
    Edit49.ReadOnly := True;
    Edit51.ReadOnly := True;
    Edit53.ReadOnly := True;
    Edit55.ReadOnly := True;
    Edit70.ReadOnly := True;
    Edit12.Color  := clBtnFace;
    Edit15.Color  := clBtnFace;
    Edit18.Color  := clBtnFace;
    Edit21.Color  := clBtnFace;
    Edit24.Color  := clBtnFace;
    Edit27.Color  := clBtnFace;
    Edit30.Color  := clBtnFace;
    Edit33.Color  := clBtnFace;
    Edit36.Color  := clBtnFace;
    Edit59.Color  := clBtnFace;
    Edit65.Color  := clBtnFace;
    Edit13.Color  := clBtnFace;
    Edit16.Color  := clBtnFace;
    Edit19.Color  := clBtnFace;
    Edit22.Color  := clBtnFace;
    Edit25.Color  := clBtnFace;
    Edit28.Color  := clBtnFace;
    Edit31.Color  := clBtnFace;
    Edit34.Color  := clBtnFace;
    Edit37.Color  := clBtnFace;
    Edit62.Color  := clBtnFace;
    Edit96.Color  := clBtnFace;
    Edit97.Color  := clBtnFace;
    Edit98.Color  := clBtnFace;
    Edit99.Color  := clBtnFace;
    Edit100.Color := clBtnFace;
    Edit101.Color := clBtnFace;
    Edit102.Color := clBtnFace;
    Edit103.Color := clBtnFace;
    Edit104.Color := clBtnFace;
    Edit105.Color := clBtnFace;
    Edit84.Color  := clBtnFace;
    Edit39.Color  := clBtnFace;
    Edit41.Color  := clBtnFace;
    Edit43.Color  := clBtnFace;
    Edit45.Color  := clBtnFace;
    Edit47.Color  := clBtnFace;
    Edit49.Color  := clBtnFace;
    Edit51.Color  := clBtnFace;
    Edit53.Color  := clBtnFace;
    Edit55.Color  := clBtnFace;
    Edit70.Color  := clBtnFace;
    comboBoxCont.Enabled := True;
    comboBoxMOP.Enabled := True;
    comboBoxCold.Enabled := True;
    comboBoxHot.Enabled := True;
    comboBoxHeat.Enabled := True;
    comboBoxGas.Enabled := True;
    comboBoxWood.Enabled := True;
    comboBoxCoal.Enabled := True;
    comboBoxCanal.Enabled := True;
    ComboBox21.Enabled := True;
    RadioGroup3.Enabled := True;
  end;
  if CheckBox1.Checked then
  begin
    if (sts = 0) then
    begin
      {if Cl.cdata.rstnd <> 0 then
      begin}
      Edit12.ReadOnly := False;
      Edit12.Color := clWindow;
      Edit15.ReadOnly := False;
      Edit15.Color := clWindow;
      Edit18.ReadOnly := False;
      Edit18.Color := clWindow;
      Edit21.ReadOnly := False;
      Edit21.Color := clWindow;
      Edit24.ReadOnly := False;
      Edit24.Color := clWindow;
      Edit27.ReadOnly := False;
      Edit27.Color := clWindow;
      Edit30.ReadOnly := False;
      Edit30.Color := clWindow;
      Edit33.ReadOnly := False;
      Edit33.Color := clWindow;
      Edit36.ReadOnly := False;
      Edit36.Color := clWindow;
      Edit59.ReadOnly := False;
      Edit59.Color := clWindow;
      Edit65.ReadOnly := False;
      Edit65.Color := clWindow;
      {end
      else
      begin
        Edit13.ReadOnly := False; Edit13.Color := clWindow;
        Edit16.ReadOnly := False; Edit16.Color := clWindow;
        Edit19.ReadOnly := False; Edit19.Color := clWindow;
        Edit22.ReadOnly := False; Edit22.Color := clWindow;
        Edit25.ReadOnly := False; Edit25.Color := clWindow;
        Edit28.ReadOnly := False; Edit28.Color := clWindow;
        Edit31.ReadOnly := False; Edit31.Color := clWindow;
        Edit34.ReadOnly := False; Edit34.Color := clWindow;
        Edit37.ReadOnly := False; Edit37.Color := clWindow;
        Edit62.ReadOnly := False; Edit62.Color := clWindow;}
      //end;
    end
    else
    begin
      {if Cl.cdata.rstnd <> 0 then
      begin }
      Edit96.ReadOnly := False;
      Edit96.Color  := clWindow;
      Edit97.ReadOnly := False;
      Edit97.Color  := clWindow;
      Edit98.ReadOnly := False;
      Edit98.Color  := clWindow;
      Edit99.ReadOnly := False;
      Edit99.Color  := clWindow;
      Edit100.ReadOnly := False;
      Edit100.Color := clWindow;
      Edit101.ReadOnly := False;
      Edit101.Color := clWindow;
      Edit102.ReadOnly := False;
      Edit102.Color := clWindow;
      Edit103.ReadOnly := False;
      Edit103.Color := clWindow;
      Edit104.ReadOnly := False;
      Edit104.Color := clWindow;
      Edit105.ReadOnly := False;
      Edit105.Color := clWindow;
      Edit84.ReadOnly := False;
      Edit84.Color  := clWindow;
      {end
      else
      begin
        Edit39.ReadOnly := False; Edit39.Color := clWindow;
        Edit41.ReadOnly := False; Edit41.Color := clWindow;
        Edit43.ReadOnly := False; Edit43.Color := clWindow;
        Edit45.ReadOnly := False; Edit45.Color := clWindow;
        Edit47.ReadOnly := False; Edit47.Color := clWindow;
        Edit49.ReadOnly := False; Edit49.Color := clWindow;
        Edit51.ReadOnly := False; Edit51.Color := clWindow;
        Edit53.ReadOnly := False; Edit53.Color := clWindow;
        Edit55.ReadOnly := False; Edit55.Color := clWindow;
        Edit70.ReadOnly := False; Edit70.Color := clWindow;}
      //end;
    end;
    comboBoxCont.Enabled := False;
    comboBoxMOP.Enabled := False;
    comboBoxCold.Enabled := False;
    comboBoxHot.Enabled := False;
    comboBoxHeat.Enabled := False;
    comboBoxGas.Enabled := False;
    comboBoxWood.Enabled := False;
    comboBoxCoal.Enabled := False;
    comboBoxCanal.Enabled := False;
    Combobox21.Enabled  := False;
    RadioGroup3.Enabled := False;
  end
  else
  begin
    if (sts = 0) then
    begin
      {if Cl.cdata.rstnd <> 0 then
      begin }
      Edit12.ReadOnly := True;
      Edit12.Color := clBtnFace;
      Edit15.ReadOnly := True;
      Edit15.Color := clBtnFace;
      Edit18.ReadOnly := True;
      Edit18.Color := clBtnFace;
      Edit21.ReadOnly := True;
      Edit21.Color := clBtnFace;
      Edit24.ReadOnly := True;
      Edit24.Color := clBtnFace;
      Edit27.ReadOnly := True;
      Edit27.Color := clBtnFace;
      Edit30.ReadOnly := True;
      Edit30.Color := clBtnFace;
      Edit33.ReadOnly := True;
      Edit33.Color := clBtnFace;
      Edit36.ReadOnly := True;
      Edit36.Color := clBtnFace;
      Edit59.ReadOnly := True;
      Edit59.Color := clBtnFace;
      Edit65.ReadOnly := True;
      Edit65.Color := clBtnFace;
      {end
      else
      begin
        Edit13.ReadOnly := True; Edit13.Color := clBtnFace;
        Edit16.ReadOnly := True; Edit16.Color := clBtnFace;
        Edit19.ReadOnly := True; Edit19.Color := clBtnFace;
        Edit22.ReadOnly := True; Edit22.Color := clBtnFace;
        Edit25.ReadOnly := True; Edit25.Color := clBtnFace;
        Edit28.ReadOnly := True; Edit28.Color := clBtnFace;
        Edit31.ReadOnly := True; Edit31.Color := clBtnFace;
        Edit34.ReadOnly := True; Edit34.Color := clBtnFace;
        Edit37.ReadOnly := True; Edit37.Color := clBtnFace;
        Edit62.ReadOnly := True; Edit62.Color := clBtnFace;}
    end
    else
    begin
      {if Cl.cdata.rstnd <> 0 then
      begin   }
      Edit96.ReadOnly := True;
      Edit96.Color  := clBtnFace;
      Edit97.ReadOnly := True;
      Edit97.Color  := clBtnFace;
      Edit98.ReadOnly := True;
      Edit98.Color  := clBtnFace;
      Edit99.ReadOnly := True;
      Edit99.Color  := clBtnFace;
      Edit100.ReadOnly := True;
      Edit100.Color := clBtnFace;
      Edit101.ReadOnly := True;
      Edit101.Color := clBtnFace;
      Edit102.ReadOnly := True;
      Edit102.Color := clBtnFace;
      Edit103.ReadOnly := True;
      Edit103.Color := clBtnFace;
      Edit104.ReadOnly := True;
      Edit104.Color := clBtnFace;
      Edit105.ReadOnly := True;
      Edit105.Color := clBtnFace;
      Edit84.ReadOnly := True;
      Edit84.Color  := clBtnFace;
      {end
      else
      begin
        Edit39.ReadOnly := True; Edit39.Color := clBtnFace;
        Edit41.ReadOnly := True; Edit41.Color := clBtnFace;
        Edit43.ReadOnly := True; Edit43.Color := clBtnFace;
        Edit45.ReadOnly := True; Edit45.Color := clBtnFace;
        Edit47.ReadOnly := True; Edit47.Color := clBtnFace;
        Edit49.ReadOnly := True; Edit49.Color := clBtnFace;
        Edit51.ReadOnly := True; Edit51.Color := clBtnFace;
        Edit53.ReadOnly := True; Edit53.Color := clBtnFace;
        Edit55.ReadOnly := True; Edit55.Color := clBtnFace;
        Edit70.ReadOnly := True; Edit70.Color := clBtnFace;}
      //end;
    end;
    comboBoxCont.Enabled := True;
    comboBoxMOP.Enabled := True;
    comboBoxCold.Enabled := True;
    comboBoxHot.Enabled := True;
    comboBoxHeat.Enabled := True;
    comboBoxGas.Enabled := True;
    comboBoxWood.Enabled := True;
    comboBoxCoal.Enabled := True;
    comboBoxCanal.Enabled := True;
    Combobox21.Enabled  := True;
    RadioGroup3.Enabled := True;
  end;

  if load then
  begin
    if (Cl.cdata.calc = 0) then
      Cl.cdata.calc := 1
    else
      Cl.cdata.calc := 0;
  end;
  if load and not CalcEmpty then
  begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.FormShow(Sender: TObject);
begin
  curmonth := StrToInt(Copy(Form1.rdt, 4, 2));
  PageControl1.TabIndex := 0;
  load := False;
  att  := 0;
  Clear;
  Fill;
  Edit57.SetFocus;
  Cl := TClient.Create(Empty, EmptyC);
  Button2.Enabled := False;
  case mode of
    vAdd://добавить клиента
    begin
      load := True;
      EditClForm.Caption := 'Добавить клиента';
      Button2.Caption := 'Добавить клиента';
      SetDefault;
      Edit86.Text := SelInsp(Cl.Data.insp);
      Edit88.Text := DateToStr(Date);
      MaskEdit4.Text := DateToStr(Date);
    end;
    vEdit://изменить/просмотр клиента
    begin
      EditClForm.Caption := 'Изменить/Просмотр клиента';
      Button2.Caption := 'Изменить клиента';
      Cl.SetClient(Form1.client, Form1.rdt);
      Cl.SetCalc(Form1.client, Form1.rdt);
      SetData;
      load := True;
      SumV;
      if not fam then //семья загрузилась неполностью
        ShowMessage('Семья загрузилась некорректно! Указанное число членов семьи на совпадает с фактическим! Производить расчеты невозможно!');
    end;
  end;
end;

function TEditClForm.GetColSum(StrGrid: TStringGrid; Col: integer): string;
var
  i: integer;
  tmp: double;
begin
  tmp := 0;
  for i := 0 to StrGrid.RowCount - 1 do
    if StrGrid.Cells[Col, i + 1] <> '' then
      tmp := tmp + StrToFloat(StrGrid.Cells[Col, i + 1]);
  Result := FloatToStr(tmp);
end;

procedure TEditClForm.Button8Click(Sender: TObject);
begin
  if load and not CalcEmpty then
  begin
    Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.ComboBox7Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchRel(Combobox7.Text);
  if ind <> -1 then
    Combobox7.ItemIndex := ind
  else
  begin
    Combobox7.Text := SelRel(rel[0]);
    Combobox7.ItemIndex := 0;
  end;
end;

procedure TEditClForm.Button6Click(Sender: TObject);
begin
  NewPeriod;
end;

procedure TEditClForm.PageControl1Change(Sender: TObject);
begin
  if Edit57.Text = '' then
    PageControl1.TabIndex := 0
  else
  begin
    if PageControl1.TabIndex = 4 then
    begin
      if Form1.CheckP2 then
        Button2.Enabled := True;
    end
    else
    begin
      Button2.Enabled := False;
      if PageControl1.TabIndex = 1 then
      begin
        if Cl.cdata.family.Count = 0 then
        begin
          Edit69.Text := Edit57.Text;
          MaskEdit1.Text := '01.01.1940';
          RadioButton7.Checked := True;
          Edit72.Text := '0';
          Combobox17.Text := SelSt(8);
          Combobox18.Text := SelPriv(0);
          Combobox7.Text := SelRel(1);
          Combobox17.OnChange(combobox17);
          Combobox18.OnChange(combobox18);
          Combobox7.OnChange(combobox7);
        end;
      end;
      if PageControl1.TabIndex = 5 then
        TabControl1.OnChange(Self);

      //выбор регионального стандарта
      if PageControl1.TabIndex = 2 then
      begin
        PageControl2.TabIndex := 0;
        {if cl.data.apart <> '' then
          ComboBox10.ItemIndex := 1
        else
          ComboBox10.ItemIndex := 0;}
        Cl.cdata.rstnd := stnd[Combobox10.ItemIndex];
        ComboBox10.OnChange(Self);
      end;

    end;
  end;
end;

procedure TEditClForm.PageControl1DrawTab(Control: TCustomTabControl; TabIndex: integer; const Rect: TRect; Active: boolean);
begin
  case TabIndex of
    0: ;
    1: ;
    2: ;
    3: ;
    4:
    begin
      Control.Canvas.Brush.Color := clSkyBlue;
    end;
    5:
    begin
      Control.Canvas.Brush.Color := clMoneyGreen;
    end;
  end;
  Control.Canvas.Pen.Color := clBlack;
  Control.Canvas.FillRect(Rect);
  Control.Canvas.TextOut(Rect.left + 5, Rect.top + 3, PageControl1.Pages[tabindex].Caption);
end;

function TEditClForm.CheckPers: boolean;
var
  v: array[0..19] of integer;
  koef: array[0..19] of integer;
  s: string;
  i, k: integer;
begin
  if (Length(Edit83.Text) = 20) and (cl.Data.bank <> 0) and (cl.Data.bank <> 78) and
    (cl.Data.bank <> 79) and (cl.Data.bank <> 83) and IsNumber(Edit83.Text) then
  begin
    s := Edit83.Text;
    for i := 0 to 19 do
      v[i] := StrToInt(s[i + 1]);
    i := 0;
    while i < 17 do
    begin
      koef[i] := 7;
      koef[i + 1] := 1;
      koef[i + 2] := 3;
      i := i + 3;
    end;
    koef[18] := 7;
    koef[19] := 1;
    k := 0;
    for i := 0 to 19 do
    begin
      if i <> 8 then
        k := k + (v[i] * koef[i] mod 10);
    end;
    k := (((k + 18) mod 10) * 3) mod 10;
    if k = v[8] then
      Result := True
    else
      Result := False;
  end
  else
  begin
    if IsInt(Edit83.Text) and (Length(Edit83.Text) = 6) and (cl.Data.bank = 83) or
      (Length(Edit83.Text) <= 12) and ((cl.Data.bank = 78) or (cl.Data.bank = 79)) or
      (Edit83.Text = '') and (cl.Data.bank = 0) then
      Result := True
    else
      Result := False;
  end;
end;

function TEditClForm.CheckLS(s: string): boolean;
var
  v: array[0..10] of integer;
  koef: array[0..9] of integer;
  i, k: integer;
begin
  if (s <> '') then
  begin
    if IsNumber(s) and (Length(s) = 11) then
    begin
      for i := 1 to 11 do
        v[i - 1] := StrToInt(s[i]);
      i := 0;
      while i < 7 do
      begin
        koef[i] := 7;
        koef[i + 1] := 1;
        koef[i + 2] := 3;
        i := i + 3;
      end;
      koef[i] := 7;
      k := 0;
      for i := 0 to 9 do
        k := k + (v[i] * koef[i] mod 10);
      k := (k mod 10) * 3 mod 10;
      if k = v[10] then
        Result := True
      else
        Result := False;
    end
    else
      Result := True;
  end
  else
    Result := False;
end;

function TEditClForm.CheckLS: boolean;
var
  res: boolean;
begin
  if CheckLS(Edit74.Text) and {CheckLS(Edit75.Text)and} CheckLS(Edit76.Text) and
    CheckLS(Edit77.Text) and CheckLS(Edit78.Text) and CheckLS(Edit79.Text) and
    CheckLS(Edit80.Text) then
    res := True
  else
    res := False;
  if ((Edit81.Text <> '') and (Edit82.Text <> '') and CheckLS(Edit81.Text) and
    CheckLS(Edit82.Text) or (Edit81.Text = '') and (Edit82.Text = '')) and res then
    Result := True
  else
    Result := False;
end;

procedure TEditClForm.Button9Click(Sender: TObject);
begin
  if (Edit74.Text <> '') then
  begin
    Edit75.Text := Edit74.Text;
    Edit76.Text := Edit74.Text;
    Edit58.Text := Edit74.Text;
    Edit77.Text := Edit74.Text;
    Edit78.Text := Edit74.Text;
    Edit79.Text := Edit74.Text;
    Edit80.Text := Edit74.Text;
    Edit81.Text := Edit74.Text;
    Edit82.Text := Edit74.Text;
    Edit75.OnChange(edit75);
    Edit76.OnChange(edit76);
    Edit77.OnChange(edit77);
    Edit78.OnChange(edit78);
    Edit79.OnChange(edit79);
    Edit80.OnChange(edit80);
    Edit81.OnChange(edit81);
    Edit82.OnChange(edit82);
    Edit58.OnChange(edit58);
  end;
end;

procedure TEditClForm.TabSheet4Exit(Sender: TObject);
begin
  if Edit83.Font.Color = clRed then
    Pagecontrol1.TabIndex := 3;
end;

procedure TEditClForm.UpdateFactInfo;
begin
  if ComboBox23.ItemIndex <> -1 then
  begin
    Edit111.Text := GetColSum(StringGrid1, 1);
    Edit112.Text := GetColSum(StringGrid1, 2);
    Edit113.Text := GetColSum(StringGrid1, 3);
    if MounthDiff(fbegindate, fenddate) <> 0 then
      Edit114.Text := FloatToStr(rnd(StrToFloat(Edit112.Text) / MounthDiff(fbegindate, fenddate)))
    else
      Edit114.Text := '0';
  end;
end;

procedure TEditClForm.TabControl1Change(Sender: TObject);
var
  recCount: integer;
begin
  ClearFactGrids;
  case TabControl1.TabIndex of
    0:
    begin
      with DModule do
      begin
        Query1.Close;
        Query1.SQL.Text := 'SELECT bdate' + #13 +
          'FROM FactSale' + #13 +
          'WHERE regn=:regn and bdate < CONVERT(smallDATETIME, :bdate, 104)' + #13 +
          'ORDER BY bdate';
        Query1.ParamByName('bdate').Value := DateToStr(cl.cdata.begindate);//StrToDate(form1.rdt);
        Query1.ParamByName('regn').Value := cl.Data.regn;
        Query1.Open;

        recCount := Query1.RecordCount;

        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT regn, bdate, edate');
        Query1.SQL.Add('FROM Hist');
        Query1.SQL.Add('WHERE (regn = :regn) AND (bdate >= convert(smalldatetime, :factdate, 104))');
        Query1.SQL.Add('and bdate <  CONVERT(smalldatetime, :bdate, 104)');
        Query1.SQL.Add('and edate <>  CONVERT(smalldatetime, :factdateYear, 104)');


        if recCount = 0 then
        begin
          Query1.SQL.Add('ORDER BY bdate');
        end
        else
        begin
          Query1.SQL.Add('AND (bdate NOT IN');
          Query1.SQL.Add('(SELECT bdate');
          Query1.SQL.Add('FROM FactSale');
          Query1.SQL.Add('WHERE (regn = :regn) AND (bdate < convert(smalldatetime, :bdate, 104))');
          Query1.SQL.Add('GROUP BY bdate))');
          Query1.SQL.Add('GROUP BY regn, bdate, edate');
        end;

        Query1.ParamByName('regn').Value := cl.Data.regn;
        if cl.cdata.heating = 1 then
          Query1.ParamByName('factdate').Value := FactDateBase
        else
          Query1.ParamByName('factdate').Value := FactDateWC;
        Query1.ParamByName('bdate').Value := DateToStr(cl.cdata.begindate);
        Query1.ParamByName('factdateYear').Value := FactDateYear;
        Query1.Open;
        Query1.First;
      end;
      Button20.Caption := 'Добавить';
      Button21.Visible := False;
    end;

    1:
    begin
      with DModule do
      begin
        Query1.Close;
        Query1.SQL.Text := 'SELECT regn, bdate, edate' + #13 +
          'FROM FactSale' + #13 +
          'GROUP BY bdate, regn, edate' + #13 +
          'HAVING (regn = :regn)' + #13 +
          'ORDER BY bdate';
        Query1.ParamByName('regn').Value := cl.Data.regn;
        Query1.Open;
        Query1.First;
      end;
      Button20.Caption := 'Изменить';
      Button21.Visible := True;
    end;
  end;

  Combobox23.Items.Clear;
  with DModule do
  begin
    while not Query1.EOF do
    begin
      Combobox23.Items.Add(Query1.FieldByName('bdate').AsString + ' - ' + Query1.FieldByName('edate').AsString);
      DModule.Query1.Next;
    end;
  end;
end;

procedure TEditClForm.TabSheet1Exit(Sender: TObject);
begin
  if Edit57.Text = '' then
    Pagecontrol1.TabIndex := 0;
end;

procedure TEditClForm.RadioGroup1Click(Sender: TObject);
begin
  if load then
    RadioGroup1.ItemIndex := Cl.Data.cert - 1;
end;

procedure TEditClForm.Edit74Change(Sender: TObject);
begin
  with Sender as TEdit do
  begin
    if load then
    begin
      if IsNumber(Copy(Text, 1, 1)) then
      begin
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
      if Sender = Edit74 then
        Cl.cdata.accounts[0] := Edit74.Text;
      if Sender = Edit75 then
        Cl.cdata.accounts[1] := Edit75.Text;
      if Sender = Edit76 then
        Cl.cdata.accounts[2] := Edit76.Text;
      if Sender = Edit77 then
        Cl.cdata.accounts[3] := Edit77.Text;
      if Sender = Edit58 then
        Cl.cdata.accounts[4] := Edit58.Text;
      if Sender = Edit78 then
        Cl.cdata.accounts[5] := Edit78.Text;
      if Sender = Edit79 then
        Cl.cdata.accounts[6] := Edit79.Text;
      if Sender = Edit80 then
        Cl.cdata.accounts[7] := Edit80.Text;
      if Sender = Edit81 then
        Cl.cdata.accounts[12] := Edit81.Text;
      if Sender = Edit82 then
        Cl.cdata.accounts[13] := Edit82.Text;
    end;
  end;
end;

function TEditClForm.CheckCountMem: boolean;
begin
  Result := (Cl.cdata.mcount = Cl.cdata.family.Count);
end;

procedure TEditClForm.CheckDifferenceFactSum;
begin
  if TabControl1.TabIndex = 1 then
  begin
    if StrToFloat(Edit111.Text) <= StrToFloat(Edit113.Text) then
      label77.Caption := 'Размер субсидии не превышает фактических расходов'
    else
      label77.Caption := 'Размер субсидии превышает фактические расходы на +' +
        Edit113.Text;
  end;
end;

procedure TEditClForm.CheckBox2Click(Sender: TObject);
begin
  if Checkbox2.Checked then
  begin
    if load then
      Cl.cdata.boiler := 1;
  end
  else
  begin
    if load then
      Cl.cdata.boiler := 0;
  end;
  if (Length(cold) > 0) and (Length(hot) > 0) then
  begin
    comboBoxCold.OnChange(comboBoxCold);
    comboBoxHot.OnChange(comboBoxHot);
  end;
end;

procedure TEditClForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TEditClForm.Memo1Change(Sender: TObject);
begin
  if IsRus(Memo1.Text) then
  begin
    Memo1.Font.Color := clWindowText;
    if load then
      Cl.Data.reason := Memo1.Text;
  end
  else
  begin
    Memo1.Font.Color := clRed;
    ShowMessage('Можно использовать буквы только кириллицы!');
  end;
end;

procedure TEditClForm.Button10Click(Sender: TObject);
var
  nam, namet, capt: string;
begin
  if Sender = Button10 then
  begin
    capt := 'Тарифы на содержание жилья(руб./кв.м.)';
    nam  := 'cont';
    namet := comboBoxCont.Text;
  end;
  if Sender = Button11 then
  begin
    capt := 'Тарифы на ремонт жилья(руб./кв.м.)';
    nam  := 'rep';
    namet := comboBoxMOP.Text;
  end;
  if Sender = Button12 then
  begin
    capt := 'Тарифы на водопотребление с откр/закр водоразбором(руб./чел.)';
    nam  := 'cold';
    namet := comboBoxCold.Text;
  end;
  if Sender = Button13 then
  begin
    capt := 'Тарифы на го.воду с откр/закр водоразбором(руб./чел.)';
    nam  := 'hot';
    namet := comboBoxHot.Text;
  end;
  if Sender = Button14 then
  begin
    capt := 'Тарифы на водоотведение(руб./чел.)';
    nam  := 'canal';
    namet := comboBoxCanal.Text;
  end;
  if Sender = Button15 then
  begin
    capt := 'Тарифы на отопление(руб./кв.м.)';
    nam  := 'heat';
    namet := comboBoxHeat.Text;
  end;
  if Sender = Button16 then
  begin
    capt := 'Тарифы на газ(руб./чел.)';
    nam  := 'gas';
    namet := comboBoxGas.Text;
  end;
  if Sender = Button17 then
  begin
    capt := 'Тарифы на дрова(руб./кв.м.)';
    nam  := 'wood';
    namet := comboBoxWood.Text;
  end;
  if Sender = Button18 then
  begin
    capt := 'Тарифы на уголь(руб./кв.м.)';
    nam  := 'coal';
    namet := comboBoxCoal.Text;
  end;
  if (Sender = Button12) or (Sender = Button13) then
  begin
    Form39 := TForm39.Create(EditClForm);
    Form39.Caption := capt;
    Form39.nam := nam;
    Form39.namet := namet;
    Form39.ShowModal;
    if Form39.ac then
    begin
      if Sender = Button12 then
      begin
        comboBoxCold.Text := Form39.namet;
        comboBoxCold.OnChange(comboBoxCold);
      end
      else
      begin
        comboBoxHot.Text := Form39.namet;
        comboBoxHot.OnChange(comboBoxHot);
      end;
    end;
    Form39.Free;
  end;
  if (Sender = Button10) or (Sender = Button11) or (Sender = Button14) or
    (Sender = Button15) or (Sender = Button16) or (Sender = Button17) or
    (Sender = Button18) then
  begin
    Form37 := TForm37.Create(EditClForm);
    Form37.Caption := capt;
    Form37.nam := nam;
    Form37.namet := namet;
    Form37.ShowModal;
    if Form37.ac then
    begin
      if Sender = Button10 then
      begin
        comboBoxCont.Text := Form37.namet;
        comboBoxCont.OnChange(comboBoxCont);
      end;
      if Sender = Button11 then
      begin
        comboBoxMOP.Text := Form37.namet;
        comboBoxMOP.OnChange(comboBoxMOP);
      end;
      if Sender = Button14 then
      begin
        comboBoxCanal.Text := Form37.namet;
        comboBoxCanal.OnChange(comboBoxCanal);
      end;
      if Sender = Button15 then
      begin
        comboBoxHeat.Text := Form37.namet;
        comboBoxHeat.OnChange(comboBoxHeat);
      end;
      if Sender = Button16 then
      begin
        comboBoxGas.Text := Form37.namet;
        comboBoxGas.OnChange(comboBoxGas);
      end;
      if Sender = Button17 then
      begin
        comboBoxWood.Text := Form37.namet;
        comboBoxWood.OnChange(comboBoxWood);
      end;
      if Sender = Button18 then
      begin
        comboBoxCoal.Text := Form37.namet;
        comboBoxCoal.OnChange(comboBoxCoal);
      end;
    end;
    Form37.Free;
  end;
end;

procedure TEditClForm.Button7Click(Sender: TObject);
begin
  Form11.status := 0;
  Form11.ShowModal;
end;

procedure TEditClForm.Button19Click(Sender: TObject);
//сменить текущего инспектора
begin
  Form17.ShowModal;
  if Form17.ac and (Cl.Data.insp <> Form1.insp) then
  begin
    Cl.Data.insp := Form1.insp;
    Edit86.Text  := Form17.nameinsp;
    if (mode = vAdd) then
      SetRegn;
  end;
end;

procedure TEditClForm.RadioGroup3Click(Sender: TObject);
begin
  if load then
    Cl.cdata.mdd := RadioGroup3.ItemIndex;
  if load and not CalcEmpty then
  begin
    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    Cl.CalcFinal(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.RecalcOneServ(s: integer; mode: TCalcMode);
begin
  if load and not CalcEmpty then
  begin
    case mode of
      cServ: Cl.CalcServ(s);
      cServe: Cl.CalcServe(s);
      cServSq:
        if s = 5 then
          Cl.CalcServSq(s, StrToInt(Copy(Form1.rdt, 4, 2)))
        else
          Cl.CalcServSq(s);
      cServWC: Cl.CalcServWC(s);
    end;

    Cl.CalcSub(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    Cl.CalcFinal(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
    SetVCalc;
    SumV;
  end;
end;

procedure TEditClForm.Edit57Exit(Sender: TObject);
begin
  if CheckRus(Edit57) and load then
    Cl.Data.fio := Edit57.Text;
  Edit57.Text := NormalizeSpaces(Edit57.Text);
end;

procedure TEditClForm.Edit57KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if CheckRus(edit57) and load then
      Cl.Data.fio := Edit57.Text;
  end;
end;

procedure TEditClForm.Edit63Exit(Sender: TObject);
begin
  if CheckRus(edit63) and load then
    Cl.Data.apart := Edit63.Text;
end;

procedure TEditClForm.Edit63KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if CheckRus(edit63) and load then
      Cl.Data.apart := Edit63.Text;
  end;
end;

procedure TEditClForm.Edit64Exit(Sender: TObject);
begin
  if CheckInt(edit64) and load then
    Cl.Data.tel := Edit64.Text;
end;

procedure TEditClForm.Edit64KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if CheckInt(edit64) and load then
      Cl.Data.tel := Edit64.Text;
  end;
end;

procedure TEditClForm.Edit66Exit(Sender: TObject);
var
  i: integer;
begin
  if CheckNumb(TEdit(Sender)) and load then
  begin
    if Sender = Edit66 then
    begin
      SetPoint(Edit66);
      Cl.cdata.square := StrToFloat(Edit66.Text);
      Cl.cdata.lsquare := Cl.cdata.square;
      Edit110.Text := FloatToStr(Cl.cdata.lsquare);
    end;
    if Sender = Edit110 then
    begin
      SetPoint(Edit110);
      Cl.cdata.lsquare := StrToFloat(Edit110.Text);
    end;
    if Cl.cdata.calc = 1 then
    begin
      if TEdit(Sender).Enabled then
        SetPoint(TEdit(Sender));
      if Sender = Edit12 then
        Cl.cdata.bpm[0] := StrToFloat(Edit12.Text);
      if Sender = Edit15 then
        Cl.cdata.bpm[1] := StrToFloat(Edit15.Text);
      if Sender = Edit18 then
        Cl.cdata.bpm[2] := StrToFloat(Edit18.Text);
      if Sender = Edit21 then
        Cl.cdata.bpm[3] := StrToFloat(Edit21.Text);
      if Sender = Edit59 then
        Cl.cdata.bpm[4] := StrToFloat(Edit59.Text);
      if Sender = Edit24 then
        Cl.cdata.bpm[5] := StrToFloat(Edit24.Text);
      if Sender = Edit27 then
        Cl.cdata.bpm[6] := StrToFloat(Edit27.Text);
      if Sender = Edit30 then
        Cl.cdata.bpm[7] := StrToFloat(Edit30.Text);
      if Sender = Edit33 then
        Cl.cdata.bpm[12] := StrToFloat(Edit33.Text);
      if Sender = Edit36 then
        Cl.cdata.bpm[13] := StrToFloat(Edit36.Text);
      if Sender = Edit13 then
        Cl.cdata.bsnpm[0] := StrToFloat(Edit13.Text);
      if Sender = Edit16 then
        Cl.cdata.bsnpm[1] := StrToFloat(Edit16.Text);
      if Sender = Edit19 then
        Cl.cdata.bsnpm[2] := StrToFloat(Edit19.Text);
      if Sender = Edit22 then
        Cl.cdata.bsnpm[3] := StrToFloat(Edit22.Text);
      if Sender = Edit62 then
        Cl.cdata.bsnpm[4] := StrToFloat(Edit62.Text);
      if Sender = Edit25 then
        Cl.cdata.bsnpm[5] := StrToFloat(Edit25.Text);
      if Sender = Edit28 then
        Cl.cdata.bsnpm[6] := StrToFloat(Edit28.Text);
      if Sender = Edit31 then
        Cl.cdata.bsnpm[7] := StrToFloat(Edit31.Text);
      if Sender = Edit34 then
        Cl.cdata.bsnpm[12] := StrToFloat(Edit34.Text);
      if Sender = Edit37 then
        Cl.cdata.bsnpm[13] := StrToFloat(Edit37.Text);
      if Sender = Edit96 then
        Cl.cdata.pm[0] := StrToFloat(Edit96.Text);
      if Sender = Edit97 then
        Cl.cdata.pm[1] := StrToFloat(Edit97.Text);
      if Sender = Edit98 then
        Cl.cdata.pm[2] := StrToFloat(Edit98.Text);
      if Sender = Edit99 then
        Cl.cdata.pm[3] := StrToFloat(Edit99.Text);
      if Sender = Edit100 then
        Cl.cdata.pm[4] := StrToFloat(Edit100.Text);
      if Sender = Edit101 then
        Cl.cdata.pm[5] := StrToFloat(Edit101.Text);
      if Sender = Edit102 then
        Cl.cdata.pm[6] := StrToFloat(Edit102.Text);
      if Sender = Edit103 then
        Cl.cdata.pm[7] := StrToFloat(Edit103.Text);
      if Sender = Edit104 then
        Cl.cdata.pm[12] := StrToFloat(Edit104.Text);
      if Sender = Edit105 then
        Cl.cdata.pm[13] := StrToFloat(Edit105.Text);
      if Sender = Edit39 then
        Cl.cdata.snpm[0] := StrToFloat(Edit39.Text);
      if Sender = Edit41 then
        Cl.cdata.snpm[1] := StrToFloat(Edit41.Text);
      if Sender = Edit43 then
        Cl.cdata.snpm[2] := StrToFloat(Edit43.Text);
      if Sender = Edit45 then
        Cl.cdata.snpm[3] := StrToFloat(Edit45.Text);
      if Sender = Edit70 then
        Cl.cdata.snpm[4] := StrToFloat(Edit70.Text);
      if Sender = Edit47 then
        Cl.cdata.snpm[5] := StrToFloat(Edit47.Text);
      if Sender = Edit49 then
        Cl.cdata.snpm[6] := StrToFloat(Edit49.Text);
      if Sender = Edit51 then
        Cl.cdata.snpm[7] := StrToFloat(Edit51.Text);
      if Sender = Edit53 then
        Cl.cdata.snpm[12] := StrToFloat(Edit53.Text);
      if Sender = Edit55 then
        Cl.cdata.snpm[13] := StrToFloat(Edit55.Text);
      if Sender = Edit65 then//!
      begin
        for i := 1 to numbtarif - 1 do
          Cl.cdata.fpm[i] := 0;
        Cl.cdata.fpm[0] := StrToFloat(Edit65.Text);
        //Cl.cdata.bfpm[0] := StrToFloat(Edit65.Text);
      end;
      if Sender = Edit84 then
        Cl.cdata.fpm[0] := StrToFloat(Edit84.Text);
    end;
    if not CalcEmpty then
    begin
      Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
      SetVCalc;
      SumV;
    end;
  end;
end;

procedure TEditClForm.Edit66KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if CheckNumb(TEdit(Sender)) and load then
    begin
      if Sender = Edit66 then
      begin
        SetPoint(Edit66);
        Cl.cdata.square := StrToFloat(Edit66.Text);
        Cl.cdata.lsquare := Cl.cdata.square;
        Edit110.Text := FloatToStr(Cl.cdata.lsquare);
      end;
      if Sender = Edit110 then
      begin
        SetPoint(Edit110);
        Cl.cdata.lsquare := StrToFloat(Edit110.Text);
      end;
      if Cl.cdata.calc = 1 then
      begin
        if TEdit(Sender).Enabled then
          SetPoint(TEdit(Sender));
        if Sender = Edit12 then
          Cl.cdata.bpm[0] := StrToFloat(Edit12.Text);
        if Sender = Edit15 then
          Cl.cdata.bpm[1] := StrToFloat(Edit15.Text);
        if Sender = Edit18 then
          Cl.cdata.bpm[2] := StrToFloat(Edit18.Text);
        if Sender = Edit21 then
          Cl.cdata.bpm[3] := StrToFloat(Edit21.Text);
        if Sender = Edit59 then
          Cl.cdata.bpm[4] := StrToFloat(Edit59.Text);
        if Sender = Edit24 then
          Cl.cdata.bpm[5] := StrToFloat(Edit24.Text);
        if Sender = Edit27 then
          Cl.cdata.bpm[6] := StrToFloat(Edit27.Text);
        if Sender = Edit30 then
          Cl.cdata.bpm[7] := StrToFloat(Edit30.Text);
        if Sender = Edit33 then
          Cl.cdata.bpm[12] := StrToFloat(Edit33.Text);
        if Sender = Edit36 then
          Cl.cdata.bpm[13] := StrToFloat(Edit36.Text);
        if Sender = Edit13 then
          Cl.cdata.bsnpm[0] := StrToFloat(Edit13.Text);
        if Sender = Edit16 then
          Cl.cdata.bsnpm[1] := StrToFloat(Edit16.Text);
        if Sender = Edit19 then
          Cl.cdata.bsnpm[2] := StrToFloat(Edit19.Text);
        if Sender = Edit22 then
          Cl.cdata.bsnpm[3] := StrToFloat(Edit22.Text);
        if Sender = Edit62 then
          Cl.cdata.bsnpm[4] := StrToFloat(Edit62.Text);
        if Sender = Edit25 then
          Cl.cdata.bsnpm[5] := StrToFloat(Edit25.Text);
        if Sender = Edit28 then
          Cl.cdata.bsnpm[6] := StrToFloat(Edit28.Text);
        if Sender = Edit31 then
          Cl.cdata.bsnpm[7] := StrToFloat(Edit31.Text);
        if Sender = Edit34 then
          Cl.cdata.bsnpm[12] := StrToFloat(Edit34.Text);
        if Sender = Edit37 then
          Cl.cdata.bsnpm[13] := StrToFloat(Edit37.Text);
        if Sender = Edit96 then
          Cl.cdata.pm[0] := StrToFloat(Edit96.Text);
        if Sender = Edit97 then
          Cl.cdata.pm[1] := StrToFloat(Edit97.Text);
        if Sender = Edit98 then
          Cl.cdata.pm[2] := StrToFloat(Edit98.Text);
        if Sender = Edit99 then
          Cl.cdata.pm[3] := StrToFloat(Edit99.Text);
        if Sender = Edit100 then
          Cl.cdata.pm[4] := StrToFloat(Edit100.Text);
        if Sender = Edit101 then
          Cl.cdata.pm[5] := StrToFloat(Edit101.Text);
        if Sender = Edit102 then
          Cl.cdata.pm[6] := StrToFloat(Edit102.Text);
        if Sender = Edit103 then
          Cl.cdata.pm[7] := StrToFloat(Edit103.Text);
        if Sender = Edit104 then
          Cl.cdata.pm[12] := StrToFloat(Edit104.Text);
        if Sender = Edit105 then
          Cl.cdata.pm[13] := StrToFloat(Edit105.Text);
        if Sender = Edit39 then
          Cl.cdata.snpm[0] := StrToFloat(Edit39.Text);
        if Sender = Edit41 then
          Cl.cdata.snpm[1] := StrToFloat(Edit41.Text);
        if Sender = Edit43 then
          Cl.cdata.snpm[2] := StrToFloat(Edit43.Text);
        if Sender = Edit45 then
          Cl.cdata.snpm[3] := StrToFloat(Edit45.Text);
        if Sender = Edit70 then
          Cl.cdata.snpm[4] := StrToFloat(Edit70.Text);
        if Sender = Edit47 then
          Cl.cdata.snpm[5] := StrToFloat(Edit47.Text);
        if Sender = Edit49 then
          Cl.cdata.snpm[6] := StrToFloat(Edit49.Text);
        if Sender = Edit51 then
          Cl.cdata.snpm[7] := StrToFloat(Edit51.Text);
        if Sender = Edit53 then
          Cl.cdata.snpm[12] := StrToFloat(Edit53.Text);
        if Sender = Edit55 then
          Cl.cdata.snpm[13] := StrToFloat(Edit55.Text);
        if Sender = Edit65 then
          Cl.cdata.bfpm[0] := StrToFloat(Edit65.Text);
        if Sender = Edit84 then
          Cl.cdata.fpm[0] := StrToFloat(Edit84.Text);
      end;
      if not CalcEmpty then
      begin
        Cl.Calc(Form1.GetStatus(cl.cdata.begindate, cl.cdata.enddate));
        SetVCalc;
        SumV;
      end;
    end;
  end;
end;

procedure TEditClForm.Edit69Exit(Sender: TObject);
begin
  CheckRus(Edit69);
  Edit69.Text := NormalizeSpaces(Edit69.Text);
end;

procedure TEditClForm.Edit69KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(Edit69);
end;

procedure TEditClForm.MaskEdit1Exit(Sender: TObject);
begin
  CheckDate(maskedit1);
end;

procedure TEditClForm.MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckDate(maskedit1);
end;

procedure TEditClForm.Edit72Exit(Sender: TObject);
begin
  SetPoint(TEdit(Sender));
end;

procedure TEditClForm.Edit72KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    SetPoint(TEdit(Sender));
end;

procedure TEditClForm.Edit83Change(Sender: TObject);
begin
  if load then
  begin
    if bank[Combobox19.ItemIndex] <> 0 then
    begin
      try
        if CheckPers then
        begin
          Cl.Data.acbank := Edit83.Text;
          Edit83.Font.Color := clWindowText;
        end
        else
          Edit83.Font.Color := clRed;
      except
        Edit83.Font.Color := clRed;
      end;
    end
    else
    begin
      Edit83.Text := '';
      Cl.Data.acbank := '';
    end;
  end;
end;

procedure TEditClForm.Edit9Exit(Sender: TObject);
begin
  if (Cl.cdata.indrstnd) then
    Cl.cdata.indrstndval := StrToFloat(Edit9.Text);
end;

procedure TEditClForm.CheckBox3Click(Sender: TObject);
begin
  if Checkbox3.Checked then
  begin
    if load then
      Cl.Data.mail := 1;
  end
  else
  begin
    if load then
      Cl.Data.mail := 0;
  end;
end;

procedure TEditClForm.CheckBox4Click(Sender: TObject);

  procedure SetCounter(checkBox: TCheckBox; edit: TEdit; service: integer);
  begin
    if (Sender as TCheckBox).Checked then
    begin
      edit.Color := clWindow;
      edit.ReadOnly := False;
      Cl.cdata.counter[service] := True;
    end
    else
    begin
      edit.Color := clBtnFace;
      edit.ReadOnly := True;
      Cl.cdata.counter[service] := False;
    end;
  end;

begin
  if Sender = CheckBox4 then
    SetCounter(Sender as TCheckBox, Edit118, 2);
  if Sender = CheckBox5 then
    SetCounter(Sender as TCheckBox, Edit119, 3);

  //canal = (cold + hot)
  if ((CheckBox4.Checked) and (CheckBox5.Checked)) then
  begin
    CheckBox6.Checked := True;
    Edit120.Text := FloatToStr(StrToFloat(Edit118.Text) + StrToFloat(Edit119.Text));
    Cl.cdata.counter[4] := True;
  end;

  if Sender = CheckBox6 then
    SetCounter(Sender as TCheckBox, Edit120, 4);
  if Sender = CheckBox7 then
    SetCounter(Sender as TCheckBox, Edit121, 5);
  if Sender = CheckBox8 then
    SetCounter(Sender as TCheckBox, Edit122, 6);
  if Sender = CheckBox9 then
  begin
    SetCounter(Sender as TCheckBox, Edit123, 7);
    Cl.cdata.counternorm[7] := GetNormTarif(7, cl.cdata.tarifs[7], cl.cdata.begindate, cl.cdata.boiler, cl.cdata.rmcount, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
  end;

  Edit118.OnExit(self);
end;

procedure TEditClForm.Edit111Exit(Sender: TObject);
begin
  if StrToDate(MaskEdit4.Text) < Form1.Idate then
  begin
    ShowMessage('Указанная дата выходит за рамки доступного периода!');
    MaskEdit4.Text := Edit87.Text;
  end;
end;

procedure TEditClForm.Edit117Exit(Sender: TObject);
var
  i: integer;
begin
  Cl.cdata.rmcount := StrToInt(Edit117.Text);

  Edit9.Text := FloatToStr(Cl.GetStandard);
  Cl.SetNorm;

  for i := 0 to numbtarif - 1 do
    if (i < 8) or (i > 11) then
      cl.cdata.cost[i] := GetCostTarif(i, cl.cdata.tarifs[i], cl.cdata.begindate, cl.cdata.boiler, cl.cdata.rmcount, cl.cdata.settl, Cl.cdata.elevator, Cl.cdata.tarifs[1]);
end;

procedure TEditClForm.Edit118Exit(Sender: TObject);
begin
  if Sender = Edit118 then
  begin
    if (CheckBox4.Checked) and (Edit118.Text <> '') then
      Cl.cdata.counterdata[2] := StrToFloat(Edit118.Text);
  end;

  if Sender = Edit119 then
  begin
    if (CheckBox5.Checked) and (Edit119.Text <> '') then
      Cl.cdata.counterdata[3] := StrToFloat(Edit119.Text);
  end;

  if ((CheckBox4.Checked) and (CheckBox5.Checked)) then
  begin
    Edit120.Text := FloatToStr(StrToFloat(Edit118.Text) + StrToFloat(Edit119.Text));
    Cl.cdata.counterdata[4] := StrToFloat(Edit120.Text);
  end;

  if Sender = Edit120 then
  begin
    if (CheckBox6.Checked) and (Edit120.Text <> '') then
      Cl.cdata.counterdata[4] := StrToFloat(Edit120.Text);
  end;

  if Sender = Edit121 then
  begin
    if (CheckBox7.Checked) and (Edit121.Text <> '') then
      Cl.cdata.counterdata[5] := StrToFloat(Edit121.Text);
  end;

  if Sender = Edit122 then
  begin
    if (CheckBox8.Checked) and (Edit122.Text <> '') then
      Cl.cdata.counterdata[6] := StrToFloat(Edit122.Text);
  end;

  if Sender = Edit123 then
  begin
    if (CheckBox9.Checked) and (Edit123.Text <> '') then
      Cl.cdata.counterdata[7] := StrToFloat(Edit123.Text);
  end;
end;

end.
