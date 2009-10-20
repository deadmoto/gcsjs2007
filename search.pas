unit search;

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
  ExtCtrls,
  ComCtrls;

type
  TForm33 = class(TForm)
    GroupBox1:  TGroupBox;
    ComboBox2:  TComboBox;
    Label4:     TLabel;
    Edit3:      TEdit;
    Edit4:      TEdit;
    Edit5:      TEdit;
    ComboBox7:  TComboBox;
    ComboBox8:  TComboBox;
    ComboBox9:  TComboBox;
    ComboBox10: TComboBox;
    GroupBox2:  TGroupBox;
    Edit2:      TEdit;
    ComboBox1:  TComboBox;
    CheckBox1:  TCheckBox;
    CheckBox2:  TCheckBox;
    CheckBox3:  TCheckBox;
    CheckBox6:  TCheckBox;
    CheckBox7:  TCheckBox;
    CheckBox8:  TCheckBox;
    CheckBox9:  TCheckBox;
    CheckBox10: TCheckBox;
    GroupBox3:  TGroupBox;
    CheckBox11: TCheckBox;
    CheckBox4:  TCheckBox;
    CheckBox5:  TCheckBox;
    ComboBox3:  TComboBox;
    Label9:     TLabel;
    Label10:    TLabel;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    ComboBox5:  TComboBox;
    ComboBox6:  TComboBox;
    CheckBox14: TCheckBox;
    ComboBox4:  TComboBox;
    MaskEdit1:  TMaskEdit;
    MaskEdit2:  TMaskEdit;
    MaskEdit3:  TMaskEdit;
    MaskEdit4:  TMaskEdit;
    CheckBox15: TCheckBox;
    ComboBox11: TComboBox;
    GroupBox4:  TGroupBox;
    CheckBox16: TCheckBox;
    ComboBox12: TComboBox;
    CheckBox17: TCheckBox;
    MaskEdit5:  TMaskEdit;
    CheckBox18: TCheckBox;
    FlowPanel1: TFlowPanel;
    Button2:    TButton;
    Button1:    TButton;
    CheckBox19: TCheckBox;
    ComboBox13: TComboBox;
    CheckBox21: TCheckBox;
    CheckBox20: TCheckBox;
    ComboBox14: TComboBox;
    Panel1:     TPanel;
    Button3:    TButton;
    UpDown1:    TUpDown;
    CheckBox22: TCheckBox;
    Panel2:     TPanel;
    Button4:    TButton;
    UpDown2:    TUpDown;
    CheckBox23: TCheckBox;
    ComboBox15: TComboBox;
    CheckBox24: TCheckBox;
    ComboBox16: TComboBox;
    Edit1: TEdit;
    Edit6: TEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure CheckBox15Click(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckBox20Click(Sender: TObject);
    procedure JvArrowButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure CheckBox22Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure CheckBox23Click(Sender: TObject);
    procedure CheckBox24Click(Sender: TObject);
    procedure ComboBox15Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Fill;
    procedure Clear;
    function SearchStreet(s: string): integer;
    function SearchMng(s: string): integer;
    function SearchFnd(s: string): integer;
    function SearchSettl(s: string): integer;
    function SearchOwn(s: string): integer;
    function SearchCntrl(s: string): integer;
    function SearchComboBox(CBox: TComboBox; s: string): integer;
    function SearchInsp(s: string): integer;
    function SearchMonth(s: string): integer;
    function SearchCert(s: string): integer;
    function SearchCalc(s: string): integer;
    function SelMonth(n: integer): string; //выбрать
    function SelInsp(n: integer): string;  //выбрать инспектора
    function SelCert(n: integer): string;  //выбрать аттестацию
    function SelStreet(n: integer): string;//выбрать улицу
    function SelMng(n: integer): string;   //выбрать распорядителя
    function SelFnd(n: integer): string;   //выбрать фонд
    function SelSettl(n: integer): string; //выбрать тип заселения
    function SelOwn(n: integer): string;   //выбрать тип владения
    function SelCntrl(n: integer): string; //выбрать тип контроля
    function SelPriv(n: integer): string;  //выбрать льготу
    function SelCalc(n: integer): string;
    //    function FormHouse: string;
  public
    { Public declarations }
    cntrl, mng, fnd, settl, own, p, str, cert, insp, month, calc, stat: array of integer;
    cur:    array[0..18] of string;//текущие наименования в полях ввода в combobox
    curind: array[0..18] of integer;//индексы, соответствующие текущим наименованиям в полях ввода
    rsel:   boolean;
  end;

var
  Form33: TForm33;

implementation

uses
  datamodule,
  main,
  service,
  dateutils;

{$R *.dfm}

procedure TForm33.Clear;
{*******************************************************************************
*******************************************************************************}
begin
  Combobox1.Clear;
  Combobox2.Clear;
  Combobox3.Clear;
  Combobox4.Clear;
  Combobox6.Clear;
  Combobox7.Clear;
  Combobox8.Clear;
  Combobox5.Clear;
  Combobox9.Clear;
  Combobox10.Clear;
  Combobox11.Clear;
  Combobox15.Clear;
  Edit3.Text := '';
  Edit5.Text := '';
end;

procedure TForm33.Fill;
{*******************************************************************************
*******************************************************************************}
var
  l: integer;
begin
  SetLength(month, 4);
  SetLength(calc, 2);
  month[0] := 0;
  month[1] := 1;
  month[2] := 2;
  month[3] := 3;
  calc[0]  := 0;
  calc[1]  := 1;
  Combobox5.Items.Add('активный клиент');
  Combobox5.Items.Add('не активный клиент');
  Combobox5.Items.Add('первый');
  Combobox5.Items.Add('не первый');
  Combobox5.Items.Add('второй');
  Combobox5.Items.Add('последний');
  Combobox11.Items.Add('типовой расчет');
  Combobox11.Items.Add('индивид. расчет');
  with Datamodule1.Query1 do
  begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_cert, namecert');
    SQL.Add('from cert');
    SQL.Add('order by namecert');
    Open;
    First;
    while not EOF do
    begin
      SetLength(cert, Length(cert) + 1);
      Combobox3.Items.Add(FieldByName('namecert').AsString);
      cert[l] := FieldByName('id_cert').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox3.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_insp, nameinsp');
    SQL.Add('from insp');
    SQL.Add('where id_dist=:id');
    SQL.Add('order by nameinsp');
    ParamByName('id').AsInteger := Form1.dist;
    Open;
    First;
    while not EOF do
    begin
      SetLength(insp, Length(insp) + 1);
      Combobox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox1.ItemIndex := 0;
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
      Combobox2.Items.Add(FieldByName('namestreet').AsString);
      str[l] := FieldByName('id_street').AsInteger;
      Next;
      Inc(l);
    end;
    //combobox2.ItemIndex := 0;
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
      Combobox4.Items.Add(FieldByName('namecntrl').AsString);
      cntrl[l] := FieldByName('id_cntrl').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox4.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_mng, namemng');
    SQL.Add('from mng');
    SQL.Add('where id_dist = :dist');
    ParamByName('dist').AsInteger := Form1.dist;
    SQL.Add('order by namemng');
    Open;
    First;
    while not EOF do
    begin
      SetLength(mng, Length(mng) + 1);
      Combobox7.Items.Add(FieldByName('namemng').AsString);
      mng[l] := FieldByName('id_mng').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox7.ItemIndex := 0;
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
      Combobox8.Items.Add(FieldByName('namefond').AsString);
      fnd[l] := FieldByName('id_fond').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox8.ItemIndex := 0;
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
      Combobox9.Items.Add(FieldByName('namesettl').AsString);
      settl[l] := FieldByName('id_settl').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox9.ItemIndex := 0;
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
      Combobox10.Items.Add(FieldByName('nameown').AsString);
      own[l] := FieldByName('id_own').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox10.ItemIndex := 0;
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
      Combobox6.Items.Add(FieldByName('namepriv').AsString);
      p[l] := FieldByName('id_priv').AsInteger;
      Next;
      Inc(l);
    end;
    //Соц. Статус
    Close;
    l := 0;
    SQL.Clear;
    SQL.Add('select id_status, namestatus');
    SQL.Add('from stat');
    SQL.Add('order by namestatus');
    Open;
    First;
    while not EOF do
    begin
      SetLength(stat, Length(stat) + 1);
      Combobox15.Items.Add(FieldByName('namestatus').AsString);
      stat[l] := FieldByName('id_status').AsInteger;
      Next;
      Inc(l);
    end;
    //Combobox6.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox1Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox1.Checked then
  begin
    Edit2.Color := clBtnFace;
    Edit2.Font.Color := clGrayText;
    Edit2.ReadOnly := True;
    Edit2.Text  := '';
  end
  else
  begin
    Edit2.Color := clWindow;
    Edit2.Font.Color := clWindowText;
    Edit2.ReadOnly := False;
  end;
end;

procedure TForm33.CheckBox20Click(Sender: TObject);
begin
  if not Checkbox20.Checked then
  begin
    combobox14.Color := clBtnFace;
    combobox14.Font.Color := clGrayText;
    Combobox14.Text  := '';
  end
  else
  begin
    combobox14.Color := clWindow;
    combobox14.Font.Color := clWindowText;
    Combobox14.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox21Click(Sender: TObject);
begin
  if CheckBox21.Checked then
    Panel1.Visible := True
  else
  begin
    Panel1.Visible := False;
    Edit1.Text := '';
    CheckBox22.Checked := False;
  end;
end;

procedure TForm33.CheckBox22Click(Sender: TObject);
begin
  if CheckBox22.Checked then
    Panel2.Visible := True
  else
  begin
    Panel2.Visible := False;
    Edit6.Text := '';
  end;
end;

procedure TForm33.CheckBox23Click(Sender: TObject);
begin
  if not Checkbox23.Checked then
  begin
    combobox15.Color := clBtnFace;
    combobox15.Font.Color := clGrayText;
    combobox15.Text  := '';
  end
  else
  begin
    combobox15.Color := clWindow;
    combobox15.Font.Color := clWindowText;
    combobox15.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox24Click(Sender: TObject);
begin
  if not Checkbox24.Checked then
  begin
    combobox16.Color := clBtnFace;
    combobox16.Font.Color := clGrayText;
    combobox16.Text  := '';
  end
  else
  begin
    combobox16.Color := clWindow;
    combobox16.Font.Color := clWindowText;
//    combobox16.ItemIndex := 0;
  end;

end;

procedure TForm33.CheckBox2Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox2.Checked then
  begin
    MaskEdit1.Color := clBtnFace;
    MaskEdit1.Font.Color := clGrayText;
    MaskEdit1.ReadOnly := True;
    MaskEdit1.Text  := '';
  end
  else
  begin
    MaskEdit1.Color := clWindow;
    MaskEdit1.Font.Color := clWindowText;
    MaskEdit1.ReadOnly := False;
  end;
end;

procedure TForm33.CheckBox3Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox3.Checked then
  begin
    combobox1.Color := clBtnFace;
    combobox1.Font.Color := clGrayText;
    Combobox1.Text  := '';
  end
  else
  begin
    combobox1.Color := clWindow;
    combobox1.Font.Color := clWindowText;
    Combobox1.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox12Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox12.Checked then
  begin
    MaskEdit4.Color := clBtnFace;
    MaskEdit4.Font.Color := clGrayText;
    MaskEdit4.ReadOnly := True;
    MaskEdit4.Text  := '';
  end
  else
  begin
    MaskEdit4.Color := clWindow;
    MaskEdit4.Font.Color := clWindowText;
    MaskEdit4.ReadOnly := False;
  end;
end;

procedure TForm33.CheckBox11Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox11.Checked then
  begin
    MaskEdit2.Color := clBtnFace;
    MaskEdit2.Font.Color := clGrayText;
    MaskEdit2.ReadOnly := True;
    MaskEdit3.Color := clBtnFace;
    MaskEdit3.Font.Color := clGrayText;
    MaskEdit3.ReadOnly := True;
    MaskEdit2.Text  := '';
    MaskEdit3.Text  := '';
  end
  else
  begin
    MaskEdit2.Color := clWindow;
    MaskEdit2.Font.Color := clWindowText;
    MaskEdit2.ReadOnly := False;
    MaskEdit3.Color := clWindow;
    MaskEdit3.Font.Color := clWindowText;
    MaskEdit3.ReadOnly := False;
  end;
end;

procedure TForm33.CheckBox4Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox4.Checked then
  begin
    combobox3.Color := clBtnFace;
    combobox3.Font.Color := clGrayText;
    Combobox3.Text  := '';
  end
  else
  begin
    combobox3.Color := clWindow;
    combobox3.Font.Color := clWindowText;
    Combobox3.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox5Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox5.Checked then
  begin
    combobox4.Color := clBtnFace;
    combobox4.Font.Color := clGrayText;
    Combobox4.Text  := '';
  end
  else
  begin
    combobox4.Color := clWindow;
    combobox4.Font.Color := clWindowText;
    Combobox4.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox6Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox6.Checked then
  begin
    combobox2.Color := clBtnFace;
    combobox2.Font.Color := clGrayText;
    Edit3.Color := clBtnFace;
    Edit3.Font.Color := clGrayText;
    Edit3.ReadOnly := True;
    Edit4.Color := clBtnFace;
    Edit4.Font.Color := clGrayText;
    Edit5.Color := clBtnFace;
    Edit5.Font.Color := clGrayText;
    Edit5.ReadOnly := True;
    Edit3.Text  := '';
    Edit5.Text  := '';
    Combobox2.Text := '';
  end
  else
  begin
    combobox2.Color := clWindow;
    combobox2.Font.Color := clWindowText;
    Edit3.Color := clWindow;
    Edit3.Font.Color := clWindowText;
    Edit3.ReadOnly := False;
    Edit4.Color := clWindow;
    Edit4.Font.Color := clWindowText;
    Edit5.Color := clWindow;
    Edit5.Font.Color := clWindowText;
    Edit5.ReadOnly := False;
    Combobox2.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox7Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox7.Checked then
  begin
    combobox7.Color := clBtnFace;
    combobox7.Font.Color := clGrayText;
    Combobox7.Text  := '';
  end
  else
  begin
    combobox7.Color := clWindow;
    combobox7.Font.Color := clWindowText;
    Combobox7.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox8Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox8.Checked then
  begin
    combobox8.Color := clBtnFace;
    combobox8.Font.Color := clGrayText;
    Combobox8.Text  := '';
  end
  else
  begin
    combobox8.Color := clWindow;
    combobox8.Font.Color := clWindowText;
    Combobox8.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox9Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox9.Checked then
  begin
    combobox9.Color := clBtnFace;
    combobox9.Font.Color := clGrayText;
    Combobox9.Text  := '';
  end
  else
  begin
    combobox9.Color := clWindow;
    combobox9.Font.Color := clWindowText;
    Combobox9.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox10Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox10.Checked then
  begin
    combobox10.Color := clBtnFace;
    combobox10.Font.Color := clGrayText;
    Combobox10.Text  := '';
  end
  else
  begin
    combobox10.Color := clWindow;
    combobox10.Font.Color := clWindowText;
    Combobox10.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox13Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox13.Checked then
  begin
    combobox5.Color := clBtnFace;
    combobox5.Font.Color := clGrayText;
    Combobox5.Text  := '';
  end
  else
  begin
    combobox5.Color := clWindow;
    combobox5.Font.Color := clWindowText;
    Combobox5.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox14Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  if not Checkbox14.Checked then
  begin
    combobox6.Color := clBtnFace;
    combobox6.Font.Color := clGrayText;
    Combobox6.Text  := '';
  end
  else
  begin
    combobox6.Color := clWindow;
    combobox6.Font.Color := clWindowText;
    Combobox6.ItemIndex := 0;
  end;
end;

procedure TForm33.ComboBox1Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchInsp(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else
  begin
    Combobox1.ItemIndex := 0;
    Combobox1.Text := SelInsp(insp[0]);
  end;
  cur[2] := Combobox1.Text;
  curind[2] := Combobox1.ItemIndex;
end;

procedure TForm33.ComboBox6Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchComboBox(Combobox6, Combobox6.Text);
  if ind <> -1 then
    Combobox6.ItemIndex := ind
  else
  begin
    Combobox6.ItemIndex := 0;
    Combobox6.Text := SelPriv(p[0]);
  end;
  cur[4] := Combobox6.Text;
  curind[4] := Combobox6.ItemIndex;
end;

procedure TForm33.ComboBox5Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchMonth(Combobox5.Text);
  if ind <> -1 then
    Combobox5.ItemIndex := ind
  else
  begin
    Combobox5.ItemIndex := 0;
    Combobox5.Text := SelMonth(month[0]);
  end;
  cur[7] := Combobox5.Text;
  curind[7] := Combobox5.ItemIndex;
end;

procedure TForm33.ComboBox3Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchCert(Combobox3.Text);
  if ind <> -1 then
    Combobox3.ItemIndex := ind
  else
  begin
    Combobox3.ItemIndex := 0;
    Combobox3.Text := SelCert(cert[0]);
  end;
  cur[8] := Combobox3.Text;
  curind[8] := Combobox3.ItemIndex;
end;

procedure TForm33.ComboBox4Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchCntrl(Combobox4.Text);
  if ind <> -1 then
    Combobox4.ItemIndex := ind
  else
  begin
    Combobox4.ItemIndex := 0;
    Combobox4.Text := SelCntrl(cntrl[0]);
  end;
  cur[9] := Combobox4.Text;
  curind[9] := Combobox4.ItemIndex;
end;

procedure TForm33.ComboBox2Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchStreet(Combobox2.Text);
  if ind <> -1 then
    Combobox2.ItemIndex := ind
  else
  begin
    Combobox2.ItemIndex := 0;
    Combobox2.Text := SelStreet(str[0]);
  end;
  cur[10] := Combobox2.Text;
  curind[10] := Combobox2.ItemIndex;
end;

procedure TForm33.ComboBox7Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchMng(Combobox7.Text);
  if ind <> -1 then
    Combobox7.ItemIndex := ind
  else
  begin
    Combobox7.ItemIndex := 0;
    Combobox7.Text := SelMng(mng[0]);
  end;
  cur[13] := Combobox7.Text;
  curind[13] := Combobox7.ItemIndex;
end;

procedure TForm33.ComboBox8Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchFnd(Combobox8.Text);
  if ind <> -1 then
    Combobox8.ItemIndex := ind
  else
  begin
    Combobox8.ItemIndex := 0;
    Combobox8.Text := SelFnd(fnd[0]);
  end;
  cur[14] := Combobox8.Text;
  curind[14] := Combobox8.ItemIndex;
end;

procedure TForm33.ComboBox9Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchSettl(Combobox9.Text);
  if ind <> -1 then
    Combobox9.ItemIndex := ind
  else
  begin
    Combobox9.ItemIndex := 0;
    Combobox9.Text := SelSettl(settl[0]);
  end;
  cur[15] := Combobox9.Text;
  curind[15] := Combobox9.ItemIndex;
end;

procedure TForm33.ComboBox10Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchOwn(Combobox10.Text);
  if ind <> -1 then
    Combobox10.ItemIndex := ind
  else
  begin
    Combobox10.ItemIndex := 0;
    Combobox10.Text := SelOwn(own[0]);
  end;
  cur[16] := Combobox10.Text;
  curind[16] := Combobox10.ItemIndex;
end;

procedure TForm33.Button1Click(Sender: TObject);//поиск
{*******************************************************************************
*******************************************************************************}
var
  j: integer;
  q: CQuery;
begin
  j := 0;
  Form1.qr.SQL := '';
  SetLength(Form1.qr.parname, 0);
  SetLength(Form1.qr.parval, 0);
  q.SQL := '';
  SetLength(q.parname, 0);
  SetLength(q.parval, 0);
  if checkbox1.Checked or checkbox2.Checked or
    checkbox3.Checked or checkbox4.Checked or
    checkbox5.Checked or checkbox6.Checked or
    checkbox7.Checked or checkbox8.Checked or
    checkbox9.Checked or checkbox10.Checked or
    checkbox11.Checked or checkbox12.Checked or
    checkbox13.Checked or checkbox14.Checked or
    checkbox15.Checked or Checkbox16.Checked or
    Checkbox19.Checked or Checkbox20.Checked or
    Checkbox21.Checked or Checkbox23.Checked or
    Checkbox24.Checked then
  begin
    q.SQL := 'select cl.regn,hist.bdate,hist.edate,hist.calc from cl ';
    q.SQL := q.SQL + 'inner join hist on cl.regn=hist.regn ';
    q.SQL := q.SQL + 'inner join (select regn,max(bdate) as bdate from hist ';
    q.SQL := q.SQL + 'where (bdate<=convert(smalldatetime,:d,104))and(id_dist=:idd)';
    q.SQL := q.SQL + 'group by regn) sb on hist.regn=sb.regn and hist.bdate=sb.bdate ';
    SetLength(q.parname, Length(q.parname) + 1);
    SetLength(q.parval, Length(q.parval) + 1);
    q.parname[j] := 'd';
    q.parval[j]  := Form1.rdt;
    Inc(j);
    SetLength(q.parname, Length(q.parname) + 1);
    SetLength(q.parval, Length(q.parval) + 1);
    q.parname[j] := 'idd';
    q.parval[j]  := IntToStr(Form1.dist);
    if Checkbox14.Checked or Checkbox23.Checked then
      q.SQL := q.SQL + 'inner join fam on cl.regn=fam.regn ';
    q.SQL := q.SQL + 'where (cl.id_dist=:idd)';
    if Checkbox1.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(cl.regn=:reg)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'reg';
      q.parval[j]  := IntToStr(StrToInt(Edit2.Text));
    end;
    if Checkbox2.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(cl.rdate=CONVERT(smalldatetime, :rdate, 104))';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'rdate';
      q.parval[j]  := MaskEdit1.Text;
    end;
    if Checkbox12.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(cl.change=CONVERT(smalldatetime,:ch,104))';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'ch';
      q.parval[j]  := MaskEdit4.Text;
    end;
    if Checkbox6.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(cl.id_street=:str)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'str';
      q.parval[j]  := IntToStr(str[Combobox2.ItemIndex]);
      if Edit3.Text <> '' then
      begin
        Inc(j);
        q.SQL := q.SQL + 'and(cl.nhouse=:h)';
        q.SQL := q.SQL + 'and(cl.corp=:cp)';
        SetLength(q.parname, Length(q.parname) + 2);
        SetLength(q.parval, Length(q.parval) + 2);
        q.parname[j] := 'h';
        q.parval[j]  := Edit3.Text;
        Inc(j);
        q.parname[j] := 'cp';
        q.parval[j]  := Edit5.Text;
      end;
    end;
    if Checkbox9.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(cl.id_settl=:settl)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'settl';
      q.parval[j]  := IntToStr(settl[Combobox9.ItemIndex]);
    end;
    if Checkbox14.Checked then
    begin//среди найденных выбираем тех, у кого опр. льгота
      Inc(j);
      q.SQL := q.SQL + 'and(fam.id_priv=:priv)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'priv';
      q.parval[j]  := IntToStr(p[Combobox6.ItemIndex]);
    end;
    if Checkbox3.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_insp=:insp)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'insp';
      q.parval[j]  := IntToStr(insp[Combobox1.ItemIndex]);
    end;
    if Checkbox4.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_cert=:cert)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'cert';
      q.parval[j]  := IntToStr(cert[Combobox3.ItemIndex]);
    end;
    if Checkbox5.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_cntrl=:cnt)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'cnt';
      q.parval[j]  := IntToStr(cntrl[Combobox4.ItemIndex]);
    end;
    if Checkbox7.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_mng=:mng)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'mng';
      q.parval[j]  := IntToStr(mng[Combobox7.ItemIndex]);
    end;
    if Checkbox8.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_fond=:fnd)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'fnd';
      q.parval[j]  := IntToStr(fnd[Combobox8.ItemIndex]);
    end;
    if Checkbox10.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_own=:own)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'own';
      q.parval[j]  := IntToStr(own[Combobox10.ItemIndex]);
    end;
    if Checkbox15.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.calc=:calc)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'calc';
      q.parval[j]  := IntToStr(calc[Combobox11.ItemIndex]);
    end;
    //Тип отопления
    if Checkbox19.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.id_heating=:heating)';//'and(cl.mail=:mmail)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'heating';
      q.parval[j]  := IntToStr(ComboBox13.ItemIndex + 1);//(1);
    end;
    if Checkbox11.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.bdate=CONVERT(smalldatetime,:bdate,104))';
      q.SQL := q.SQL + 'and(hist.edate=CONVERT(smalldatetime,:edate,104))';
      SetLength(q.parname, Length(q.parname) + 2);
      SetLength(q.parval, Length(q.parval) + 2);
      q.parname[j] := 'bdate';
      q.parval[j]  := '01.' + Copy(MaskEdit2.Text, 4, 2) + '.' + Copy(MaskEdit2.Text, 7, 4);
      Inc(j);
      q.parname[j] := 'edate';
      q.parval[j]  := '01.' + Copy(MaskEdit3.Text, 4, 2) + '.' + Copy(MaskEdit3.Text, 7, 4);
    end;
    if Checkbox13.Checked then
    begin
      case combobox5.ItemIndex of
        0://активный
        begin
          q.SQL := q.SQL + 'and(hist.bdate<=CONVERT(smalldatetime,:d,104))';
          q.SQL := q.SQL + 'and(hist.edate>CONVERT(smalldatetime,:d,104))';
        end;
        1://неактивный
        begin
          q.SQL := q.SQL + 'and((hist.bdate>CONVERT(smalldatetime, :d, 104))';
          q.SQL := q.SQL + 'or(hist.edate<=CONVERT(smalldatetime, :d, 104)))';
        end;
        2://первый
        begin
          q.SQL := q.SQL + 'and(hist.bdate=CONVERT(smalldatetime, :d, 104))';
        end;
        3://не первый
        begin
          q.SQL := q.SQL + 'and(hist.bdate<>CONVERT(smalldatetime, :d, 104))' +
            'and(hist.bdate<=CONVERT(smalldatetime,:d,104))' +
            'and(hist.edate>CONVERT(smalldatetime,:d,104))';
        end;
        4://второй
        begin
          Inc(j);
          q.SQL := q.SQL + 'and(hist.bdate=CONVERT(smalldatetime, :db, 104))';
          SetLength(q.parname, Length(q.parname) + 1);
          SetLength(q.parval, Length(q.parval) + 1);
          q.parname[j] := 'db';
          q.parval[j]  := DateToStr(IncMonth(StrToDate(Form1.rdt), -1));
        end;
        5://последний
        begin
          Inc(j);
          q.SQL := q.SQL + 'and(hist.edate=CONVERT(smalldatetime, :de, 104))';
          SetLength(q.parname, Length(q.parname) + 1);
          SetLength(q.parval, Length(q.parval) + 1);
          q.parname[j] := 'de';
          q.parval[j]  := DateToStr(IncMonth(StrToDate(Form1.rdt), 1));
        end;
      end;
    end;
    //Уведомление
    if Checkbox16.Checked then
    begin
      Inc(j);
      if CheckBox17.Checked then
        q.SQL := q.SQL + 'and(cl.mail=:mmail) AND (DATEADD([day], 0, cl.declardate) >= CONVERT(smalldatetime, ' + QuotedStr(Form1.rdt) + ', 104))'
      else
        q.SQL := q.SQL + 'and(cl.mail=:mmail)';

      if CheckBox18.Checked then
        q.SQL := q.SQL + 'and(cl.mail=:mmail) AND cl.declardate = CONVERT(smalldatetime, ' + QuotedStr(MaskEdit5.Text) + ', 104)'
      else
        q.SQL := q.SQL + 'and(cl.mail=:mmail)';

      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'mmail';
      case ComboBox12.ItemIndex of
        0: q.parval[j] := IntToStr(1);
        1: q.parval[j] := IntToStr(0);
      end;
    end;
    //Количество человек
    if Checkbox20.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.mcount=:mcount)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'mcount';
      q.parval[j]  := Combobox14.Text;
    end;
    //Площадь
    if Checkbox21.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(cl.square' + Button3.Caption + ':sq)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'sq';
      q.parval[j]  := Edit1.Text;
      //Дополнительное условие
      if Checkbox22.Checked then
      begin
        Inc(j);
        q.SQL := q.SQL + 'and(cl.square' + Button4.Caption + ':sq1)';
        SetLength(q.parname, Length(q.parname) + 1);
        SetLength(q.parval, Length(q.parval) + 1);
        q.parname[j] := 'sq1';
        q.parval[j]  := Edit6.Text;
      end;
    end;
    //МДД
    if Checkbox24.Checked then
    begin
      Inc(j);
      q.SQL := q.SQL + 'and(hist.mdd=:mdd)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'mdd';
      q.parval[j]  := IntToStr(Combobox16.ItemIndex);
    end;
    if Checkbox23.Checked then
    begin//среди найденных выбираем тех, у кого опр. льгота
      Inc(j);
      q.SQL := q.SQL + 'and(fam.id_status=:stat)';
      SetLength(q.parname, Length(q.parname) + 1);
      SetLength(q.parval, Length(q.parval) + 1);
      q.parname[j] := 'stat';
      q.parval[j]  := IntToStr(stat[Combobox15.ItemIndex]);
    end;

    Form1.qr := q;
  end
  else //выбрать всех клиентов
    Form1.Reload;
  Close;
end;

procedure TForm33.Button2Click(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  Form1.qr.SQL := '';
  SetLength(Form1.qr.parname, 0);
  SetLength(Form1.qr.parval, 0);
  Close;
end;

procedure TForm33.Button3Click(Sender: TObject);
begin
  UpDown1.Position := UpDown1.Position + 1;
  if UpDown1.Position = 3 then
    UpDown1.Position := 0;
  Button3.Caption := cDiffOperation[UpDown1.Position];
end;

procedure TForm33.Button4Click(Sender: TObject);
begin
  UpDown2.Position := UpDown2.Position + 1;
  if UpDown2.Position = 3 then
    UpDown2.Position := 0;
  Button4.Caption := cDiffOperation[UpDown2.Position];
end;

function TForm33.SearchStreet(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox2.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox2.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox2.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchInsp(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox1.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox1.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchMng(s: string): integer;
{*******************************************************************************
*******************************************************************************}
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

function TForm33.SearchFnd(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox8.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox8.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox8.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchSettl(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox9.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox9.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox9.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchOwn(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox10.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox10.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox10.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchCntrl(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox4.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox4.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox4.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchComboBox(CBox: TComboBox; s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to CBox.Items.Count - 1 do
  begin
    if AnsiLowerCase(CBox.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < CBox.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchMonth(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox5.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox5.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox5.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchCert(s: string): integer;
{*******************************************************************************
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox3.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox3.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox3.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm33.SearchCalc(s: string): integer;
{*******************************************************************************
*******************************************************************************}
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

function TForm33.SelMonth(n: integer): string;//выбрать
{*******************************************************************************
*******************************************************************************}
begin
  case n of
    0:
      Result := 'активный клиент';
    1:
      Result := 'не активный клиент';
    2:
      Result := 'первый';
    3:
      Result := 'последний';
  end;
end;

function TForm33.SelCalc(n: integer): string;//выбрать
{*******************************************************************************
*******************************************************************************}
begin
  case n of
    0:
      Result := 'типовой расчет';
    1:
      Result := 'индивид. расчет';
  end;
end;

function TForm33.SelInsp(n: integer): string;//выбрать инспектора
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
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

function TForm33.SelCert(n: integer): string;//выбрать аттестацию
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namecert');
    SQL.Add('from cert');
    SQL.Add('where id_cert = :id');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namecert').AsString;
    Close;
  end;
end;

function TForm33.SelStreet(n: integer): string;//выбрать улицу
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
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

procedure TForm33.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if UpDown1.Position = 3 then
    UpDown1.Position := 2;
  Button3.Caption := cDiffOperation[UpDown1.Position];
end;

procedure TForm33.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  if UpDown2.Position = 3 then
    UpDown2.Position := 2;
  Button4.Caption := cDiffOperation[UpDown2.Position];
end;

function TForm33.SelMng(n: integer): string;//выбрать распорядителя
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select namemng');
    SQL.Add('from mng');
    SQL.Add('where (id_dist = :dist)and(id_mng = :id)');
    ParamByName('dist').AsInteger := Form1.dist;
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namemng').AsString;
    Close;
  end;
end;

function TForm33.SelFnd(n: integer): string;//выбрать фонд
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
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

function TForm33.SelSettl(n: integer): string;//выбрать тип заселения
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
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

function TForm33.SelOwn(n: integer): string;//выбрать тип владения
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
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

function TForm33.SelCntrl(n: integer): string;//выбрать тип контроля
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
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

function TForm33.SelPriv(n: integer): string;//выбрать льготу
{*******************************************************************************
*******************************************************************************}
begin
  with Datamodule1.Query1 do
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

procedure TForm33.MaskEdit1Exit(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  CheckDate(MaskEdit1);
  cur[1] := MaskEdit1.Text;
  curind[1] := 0;
end;

procedure TForm33.MaskEdit4Exit(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  CheckDate(MaskEdit4);
  cur[3] := MaskEdit4.Text;
  curind[3] := 0;
end;

procedure TForm33.MaskEdit2Exit(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  try
    if StrToDate(MaskEdit2.Text) < Form1.Idate then
    begin
      ShowMessage('Указанная дата выходит за рамки доступного периода!');
      MaskEdit2.Text := Form1.rdt;
    end;
    MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
  except
    on EconvertError do
    begin
      ShowMessage('Неправильно введена дата!');
      MaskEdit2.Text := Form1.rdt;
      MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
    end;
  end;
  cur[5] := MaskEdit2.Text;
  curind[5] := 0;
end;

procedure TForm33.MaskEdit3Exit(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  try
    if StrToDate(MaskEdit2.Text) < Form1.Idate then
    begin
      ShowMessage('Указанная дата выходит за рамки доступного периода!');
      MaskEdit2.Text := Form1.rdt;
      MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
    end
    else
    begin
      if (IncMonth(StrToDate(MaskEdit2.Text), 6) <> StrToDate(MaskEdit3.Text)) and
        (IncMonth(StrToDate(MaskEdit2.Text), 12) <> StrToDate(MaskEdit3.Text)) then
        MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
    end;
  except
    on EconvertError do
    begin
      ShowMessage('Неправильно введена дата!');
      MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
    end;
  end;
  cur[6] := MaskEdit3.Text;
  curind[6] := 0;
end;

procedure TForm33.FormShow(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
begin
  Clear;
  Fill;

  Edit2.Text := cur[0];
  Edit3.Text := cur[11];
  Edit5.Text := cur[12];

  MaskEdit1.Text := cur[1];
  MaskEdit2.Text := cur[5];
  MaskEdit3.Text := cur[6];
  MaskEdit4.Text := cur[3];
  Combobox1.ItemIndex := curind[2];
  Combobox2.ItemIndex := curind[10];
  Combobox3.ItemIndex := curind[8];
  Combobox4.ItemIndex := curind[9];
  Combobox5.ItemIndex := curind[7];
  Combobox6.ItemIndex := curind[4];
  Combobox7.ItemIndex := curind[13];
  Combobox8.ItemIndex := curind[14];
  Combobox9.ItemIndex := curind[15];
  Combobox10.ItemIndex := curind[16];
  Combobox11.ItemIndex := curind[17];
  Combobox15.ItemIndex := curind[18];
end;

procedure TForm33.JvArrowButton1Click(Sender: TObject);
begin

end;

{function TForm33.FormHouse: string;
{*******************************************************************************
*******************************************************************************}
{var
  s: string;
begin
  s := Edit3.Text;
  if Edit5.Text <> '' then
    s := s + '/' + Edit5.Text;
  Result := s;
end;
}
procedure TForm33.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
end;

procedure TForm33.Edit1Exit(Sender: TObject);
begin
  ReplacePoint(TEdit(Sender).Text);
end;

procedure TForm33.Edit2Exit(Sender: TObject);
begin
  if not IsInt(TEdit(Sender).Text) and (CheckBox1.Checked = True) then
  begin
    ShowMessage('В этом поле может быть только целое число!');
    TEdit(Sender).Text := '';
  end
  else
    cur[0] := Edit2.Text;
end;

procedure TForm33.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = (vk_return) then
  begin
    if not IsInt(TEdit(Sender).Text) and (CheckBox1.Checked = True) then
    begin
      ShowMessage('В этом поле может быть только целое число!');
      TEdit(Sender).Text := '';
    end
    else
      cur[0] := Edit2.Text;
  end;
end;

procedure TForm33.MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = (vk_return) then
  begin
    CheckDate(MaskEdit1);
    cur[1] := MaskEdit1.Text;
    curind[1] := 0;
  end;
end;

procedure TForm33.MaskEdit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    CheckDate(MaskEdit4);
    cur[3] := MaskEdit4.Text;
    curind[3] := 0;
  end;
end;

procedure TForm33.MaskEdit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    try
      if StrToDate(MaskEdit2.Text) < Form1.Idate then
      begin
        ShowMessage('Указанная дата выходит за рамки доступного периода!');
        MaskEdit2.Text := Form1.rdt;
      end;
      MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
    except
      on EconvertError do
      begin
        ShowMessage('Неправильно введена дата!');
        MaskEdit2.Text := Form1.rdt;
        MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
      end;
    end;
    cur[5] := MaskEdit2.Text;
    curind[5] := 0;
  end;
end;

procedure TForm33.MaskEdit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    try
      if StrToDate(MaskEdit2.Text) < Form1.Idate then
      begin
        ShowMessage('Указанная дата выходит за рамки доступного периода!');
        MaskEdit2.Text := Form1.rdt;
        MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
      end
      else
      begin
        if (IncMonth(StrToDate(MaskEdit2.Text), 6) <> StrToDate(MaskEdit3.Text)) and
          (IncMonth(StrToDate(MaskEdit2.Text), 12) <> StrToDate(MaskEdit3.Text)) then
          MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
      end;
    except
      on EconvertError do
      begin
        ShowMessage('Неправильно введена дата!');
        MaskEdit3.Text := DateToStr(IncMonth(StrToDate(MaskEdit2.Text), 6));
      end;
    end;
    cur[6] := MaskEdit3.Text;
    curind[6] := 0;
  end;
end;

procedure TForm33.Edit3Exit(Sender: TObject);
begin
  if not IsRus(Edit3.Text) and (CheckBox1.Checked = True) then
  begin
    ShowMessage('В этом поле может быть только набор кириллических букв и цифр!');
    Edit3.Text := '';
  end
  else
    cur[11] := Edit3.Text;
end;

procedure TForm33.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if not IsRus(Edit3.Text) and (CheckBox1.Checked = True) then
    begin
      ShowMessage('В этом поле может быть только набор кириллических букв и цифр!');
      Edit3.Text := '';
    end
    else
      cur[11] := Edit3.Text;
  end;
end;

procedure TForm33.Edit5Exit(Sender: TObject);
begin
  if not IsInt(Edit5.Text) and (CheckBox1.Checked = True) then
  begin
    ShowMessage('В этом поле может быть только целое число!');
    Edit5.Text := '';
  end
  else
    cur[12] := Edit5.Text;
end;

procedure TForm33.Edit5KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if not IsInt(Edit5.Text) and (CheckBox1.Checked = True) then
    begin
      ShowMessage('В этом поле может быть только целое число!');
      Edit5.Text := '';
    end
    else
      cur[12] := Edit5.Text;
  end;
end;

procedure TForm33.CheckBox15Click(Sender: TObject);
begin
  if not Checkbox15.Checked then
  begin
    combobox11.Color := clBtnFace;
    combobox11.Font.Color := clGrayText;
    Combobox11.Text  := '';
  end
  else
  begin
    combobox11.Color := clWindow;
    combobox11.Font.Color := clWindowText;
    Combobox11.ItemIndex := 0;
  end;
end;

procedure TForm33.ComboBox11Change(Sender: TObject);
{*******************************************************************************
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchCalc(Combobox11.Text);
  if ind <> -1 then
    Combobox11.ItemIndex := ind
  else
  begin
    Combobox11.ItemIndex := 0;
    Combobox11.Text := SelCalc(calc[0]);
  end;
  cur[17] := Combobox11.Text;
  curind[17] := Combobox11.ItemIndex;
end;

procedure TForm33.ComboBox15Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchComboBox(ComboBox15,ComboBox15.Text);
  if ind <> -1 then
    ComboBox15.ItemIndex := ind
  else
  begin
//    ComboBox15.ItemIndex := 0;
//    Combobox6.Text := SelPriv(stat[0]);
  end;
  cur[18] := ComboBox15.Text;
  curind[18] := ComboBox15.ItemIndex;
end;

procedure TForm33.CheckBox16Click(Sender: TObject);
begin
  if not Checkbox16.Checked then
  begin
    combobox12.Color := clBtnFace;
    combobox12.Font.Color := clGrayText;
    Combobox12.Text  := '';
    Checkbox17.Enabled := False;
    Checkbox17.Checked := False;
    Checkbox18.Enabled := False;
    Checkbox18.Checked := False;
  end
  else
  begin
    combobox12.Color := clWindow;
    combobox12.Font.Color := clWindowText;
    Combobox12.ItemIndex := 0;
    Checkbox17.Enabled := True;
    Checkbox18.Enabled := True;
  end;
end;

procedure TForm33.CheckBox18Click(Sender: TObject);
begin
  if not Checkbox18.Checked then
  begin
    MaskEdit5.Color := clBtnFace;
    MaskEdit5.Font.Color := clGrayText;
    MaskEdit5.ReadOnly := True;
    MaskEdit5.Text  := '';
  end
  else
  begin
    MaskEdit5.Color := clWindow;
    MaskEdit5.Font.Color := clWindowText;
    MaskEdit5.ReadOnly := False;
    CheckBox17.Checked := False;
  end;
end;

procedure TForm33.CheckBox19Click(Sender: TObject);
begin
  if not Checkbox19.Checked then
  begin
    combobox13.Color := clBtnFace;
    combobox13.Font.Color := clGrayText;
    combobox13.Text  := '';
  end
  else
  begin
    combobox13.Color := clWindow;
    combobox13.Font.Color := clWindowText;
    combobox13.ItemIndex := 0;
  end;
end;

procedure TForm33.CheckBox17Click(Sender: TObject);
begin
  if CHeckBox17.Checked then
    CheckBox18.Checked := False;
end;

end.
