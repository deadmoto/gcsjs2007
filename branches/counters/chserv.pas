unit chserv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TTarif = record
    id: array of integer;//id_tarif
    name: array of string;//nametarif
    value1: array of real;//valuetarif
    value2: array of real;//valuetarif with boiler
  end;
  TForm29 = class(TForm)
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ComboBox4: TComboBox;
    Label2: TLabel;
    ComboBox5: TComboBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Edit6: TEdit;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox6: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
    serv, str, mng, fnd, stnd, curt: array of integer;
    tarifs: array of TTarif;
    procedure Fill;
    procedure FillTarif(n: string;num: integer);
    procedure FillTarifb(n: string;num: integer);
    procedure Clear;
    function SearchStnd(s: string): integer;
    function SearchStreet(s: string): integer;
    function SearchMng(s: string): integer;
    function SearchFnd(s: string): integer;
    function SearchTarif(s: string): integer;
    function SearchServ(s: string): integer;
    function SelStnd(n: integer): string;
    function SelTarif(t,n: integer): string;//выбрать тариф
  public
    { Public declarations }
    status: integer;
    ac: boolean;
  end;

var
  Form29: TForm29;

implementation

uses service, main, datamodule, MyTypes;

{$R *.dfm}

function TForm29.SelStnd(n: integer): string;//выбрать стандарт
begin
  with DModule.qTarif do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.namestnd');
    SQL.Add('from currstnd.dbf sbros');
    SQL.Add('where sbros.id_stnd = :id');
    Parameters.ParamByName('id').Value := n;
    Open;
    Result := FieldByName('namestnd').AsString;
    Close;
  end;
end;

function TForm29.SelTarif(t,n: integer): string;//выбрать тариф
var
  nam: string;
begin
  case n of
    0: nam := 'cont';
    1: nam := 'rep';
    2: nam := 'cold';
    3: nam := 'hot';
    4: nam := 'canal';
    5: nam := 'heat';
    6: nam := 'gas';
    7: nam := 'el';
    12: nam := 'wood';
    13: nam := 'coal';
  end;
  with DModule.qTarif do begin
    Close;
    SQL.Clear;
    if n<>7 then
      SQL.Add('select sbros.name'+nam)
    else
      SQL.Add('select sbros.plate as name'+nam);
    SQL.Add('from cur'+nam+'.dbf sbros');
    SQL.Add('where sbros.id_'+nam+' = :id');
    Parameters.ParamByName('id').Value := t;
    Open;
    Result := FieldByName('name'+nam).AsString;
    Close;
  end;
end;

function TForm29.SearchStreet(s: string): integer;
var
  i: integer;
  s1: string;
begin
  for i:=0 to combobox1.Items.Count-1 do begin
    s1:=AnsiLowerCase(Combobox1.Items.Strings[i]);
    if s1=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm29.SearchStnd(s: string): integer;
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

function TForm29.SearchMng(s: string): integer;
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

function TForm29.SearchFnd(s: string): integer;
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

function TForm29.SearchServ(s: string): integer;
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

function TForm29.SearchTarif(s: string): integer;
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

procedure TForm29.FillTarif(n: string;num: integer);
var
  l: integer;
begin
  with DModule.qTarif do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from cur'+n+'.dbf sbros');
    SQL.Add('order by sbros.name'+n);
    Open;
    First;
    while not EOF do begin
      SetLength(tarifs[num].id, Length(tarifs[num].id)+1);
      SetLength(tarifs[num].name, Length(tarifs[num].id));
      SetLength(tarifs[num].value1, Length(tarifs[num].id));
      SetLength(tarifs[num].value2, Length(tarifs[num].id));
      tarifs[num].id[l] := FieldByName('id_'+n).AsInteger;
      tarifs[num].name[l] := FieldByName('name'+n).AsString;
      tarifs[num].value1[l] := FieldByName('tarif'+n).AsFloat;
      tarifs[num].value2[l] := 0;
      Next;
      inc(l);
    end;
  end;
end;

procedure TForm29.FillTarifb(n: string;num: integer);
var
  l: integer;
begin
  with DModule.qTarif do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from cur'+n+'.dbf sbros');
    SQL.Add('order by sbros.name'+n);
    Open;
    First;
    while not EOF do begin
      SetLength(tarifs[num].id, Length(tarifs[num].id)+1);
      SetLength(tarifs[num].name, Length(tarifs[num].id));
      SetLength(tarifs[num].value1, Length(tarifs[num].id));
      SetLength(tarifs[num].value2, Length(tarifs[num].id));
      tarifs[num].id[l] := FieldByName('id_'+n).AsInteger;
      tarifs[num].name[l] := FieldByName('name'+n).AsString;
      tarifs[num].value1[l] := FieldByName('tarif1').AsFloat;
      tarifs[num].value2[l] := FieldByName('tarif2').AsFloat;
      Next;
      inc(l);
    end;
  end;
end;

procedure TForm29.Fill;
var
  l: integer;
begin
  checkbox1.Checked := false;
  with DModule.Query1 do begin
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
      Combobox1.Items.Add(FieldByName('namestreet').AsString);
      str[l] := FieldByName('id_street').AsInteger;
      Next;
      inc(l);
    end;
    combobox1.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_mng, namemng');
    SQL.Add('from mng');
    SQL.Add('where id_dist = :dist');
    SQL.Add('order by namemng');
    ParamByName('dist').AsInteger := MainForm.dist;
    Open;
    First;
    while not EOF do begin
      SetLength(mng, Length(mng)+1);
      Combobox2.Items.Add(FieldByName('namemng').AsString);
      mng[l] := FieldByName('id_mng').AsInteger;
      Next;
      inc(l);
    end;
    Combobox2.ItemIndex := 0;
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
      Combobox3.Items.Add(FieldByName('namefond').AsString);
      fnd[l] := FieldByName('id_fond').AsInteger;
      Next;
      inc(l);
    end;
    Combobox3.ItemIndex := 0;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_serv, nameserv');
    SQL.Add('from serv');
    SQL.Add('order by id_serv');
    Open;
    First;
    while not EOF do begin
      SetLength(serv, Length(serv)+1);
      Combobox4.Items.Add(FieldByName('nameserv').AsString);
      serv[l] := FieldByName('id_serv').AsInteger;
      Next;
      inc(l);
    end;
    SetLength(curt,Length(serv));
    Combobox4.ItemIndex := 0;
  end;
  with DModule.qTarif do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select sbros.id_stnd, sbros.namestnd');
    SQL.Add('from currstnd.dbf sbros');
    SQL.Add('order by sbros.namestnd');
    Open;
    First;
    while not EOF do begin
      SetLength(stnd, Length(stnd)+1);
      Combobox6.Items.Add(FieldByName('namestnd').AsString);
      stnd[l] := FieldByName('id_stnd').AsInteger;
      Next;
      inc(l);
    end;
    Combobox6.ItemIndex := 0;
    SetLength(tarifs, numbtarif);
    FillTarif('cont',0);
    FillTarif('rep',1);
    FillTarifb('cold',2);
    FillTarifb('hot',3);
    FillTarif('canal',4);
    FillTarif('heat',5);
    FillTarif('gas',6);
    FillTarif('wood',12);
    FillTarif('coal',13);
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from curel.dbf sbros');
    SQL.Add('order by sbros.plate');
    Open;
    First;
    while not EOF do begin
      SetLength(tarifs[7].id, Length(tarifs[7].id)+1);
      SetLength(tarifs[7].name, Length(tarifs[7].id));
      SetLength(tarifs[7].value1, Length(tarifs[7].id));
      SetLength(tarifs[7].value2, Length(tarifs[7].id));
      tarifs[7].id[l] := FieldByName('id_el').AsInteger;
      tarifs[7].name[l] := FieldByName('plate').AsString;
      tarifs[7].value1[l] := 0;
      tarifs[7].value2[l] := 0;
      Next;
      inc(l);
    end;
  end;
  combobox1.OnChange(combobox1);
  combobox2.OnChange(combobox2);
  combobox3.OnChange(combobox3);
  combobox4.OnChange(combobox4);
  combobox6.OnChange(combobox6);
end;

procedure TForm29.Clear;
begin
  Edit2.Text := '';Edit3.Text := '';Edit6.Text := '';
  Combobox1.Clear;Combobox2.Clear;Combobox3.Clear;
  Combobox4.Clear;Combobox5.Clear;
  CheckBox1.Checked := false;CheckBox2.Checked := false;CheckBox3.Checked := false;
  Combobox2.Enabled := false;Combobox3.Enabled := false;Combobox4.Enabled := false;
  Combobox5.Enabled := false;Combobox6.Enabled := false;
  Combobox2.Color := clBtnFace;Combobox3.Color := clBtnFace;Combobox4.Color := clBtnFace;
  Combobox5.Color := clBtnFace;Combobox6.Color := clBtnFace;
end;

procedure TForm29.FormShow(Sender: TObject);
begin
  ac := false;
  Clear;
  Fill;
  if status=0 then
    Button1.Enabled := false
  else
    Button1.Enabled := true;
  MainForm.qr.SQL := '';
  SetLength(MainForm.qr.parname,0);
  SetLength(MainForm.qr.parval,0);
end;

procedure TForm29.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.Query1.Close;
  DModule.qTarif.Close;
end;

procedure TForm29.ComboBox2Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchMng(Combobox2.Text);
  if ind <> -1 then
    Combobox2.ItemIndex := ind
  else begin
    Combobox2.ItemIndex := 0;
    //Combobox2.Text := SelMng(mng[0]);
  end;
end;

procedure TForm29.ComboBox3Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchFnd(Combobox3.Text);
  if ind <> -1 then
    Combobox3.ItemIndex := ind
  else begin
    Combobox3.ItemIndex := 0;
    //Combobox3.Text := SelFnd(fnd[0]);
  end;
end;

procedure TForm29.ComboBox6Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchStnd(Combobox6.Text);
  if (ind <> -1) then
    Combobox6.ItemIndex := ind
  else begin
    Combobox6.ItemIndex := 0;
    //Combobox6.Text := SelStnd(stnd[0]);
  end;
end;

procedure TForm29.ComboBox4Change(Sender: TObject);
var
  ind,i: integer;
begin
  ind := SearchServ(Combobox4.Text);
  if (ind <> -1) then
    Combobox4.ItemIndex := ind
  else
    Combobox4.ItemIndex := 0;
  Combobox5.Clear;
  for i:=0 to Length(tarifs[serv[Combobox4.ItemIndex]].id)-1 do
    Combobox5.Items.Add(tarifs[serv[Combobox4.ItemIndex]].name[i]);
  Combobox5.Text := SelTarif(curt[serv[Combobox4.ItemIndex]],serv[Combobox4.ItemIndex]);
  Combobox5.OnChange(combobox5);
end;

procedure TForm29.ComboBox5Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchTarif(Combobox5.Text);
  if (ind <> -1) then
    Combobox5.ItemIndex := ind
  else begin
    Combobox5.ItemIndex := 0;
    //Combobox5.Text := SelS(serv[0]);
  end;
  ind := Combobox5.ItemIndex;
  if ((serv[Combobox4.ItemIndex]=2)or(serv[Combobox4.ItemIndex]=3))and
      CheckBox1.Checked then
    Edit6.Text := FormatFloat('0.00', tarifs[serv[Combobox4.ItemIndex]].value2[ind])
  else begin
    if (serv[Combobox4.ItemIndex]=7) then begin
      Edit6.Enabled := false;
      Edit6.Text := '';
    end
    else begin
      Edit6.Enabled := true;
      Edit6.Text := FormatFloat('0.00', tarifs[serv[Combobox4.ItemIndex]].value1[ind]);
    end;
  end;
end;

procedure TForm29.ComboBox1Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchStreet(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else begin
    Combobox1.ItemIndex := 0;
    //Combobox1.Text := SelStr(str[0]);
  end;
end;

procedure TForm29.Button1Click(Sender: TObject);
begin
  if IsRus(Edit2.Text)and IsInt(Edit3.Text)then begin
    DModule.Database1.StartTransaction;
    try
      with DModule.Query1 do begin
        if Checkbox2.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update hist');
          SQL.Add('set id_mng=:mng,id_fond=:fnd');
          SQL.Add('where regn in (select regn from cl');
          SQL.Add('where (id_street=:str)and(nhouse=:n)and(corp=:cp)');
          SQL.Add('and(id_dist=:idd))');
          SQL.Add('and bdate<=convert(smalldatetime,:d,104)');
          SQL.Add('and edate>convert(smalldatetime,:d,104)');
          ParamByName('mng').AsInteger := mng[combobox2.ItemIndex];
          ParamByName('fnd').AsInteger := fnd[combobox3.ItemIndex];
          ParamByName('str').AsInteger := str[combobox1.ItemIndex];
          ParamByName('n').AsString := Edit2.Text;
          ParamByName('cp').AsString := Edit3.Text;
          ParamByName('d').AsString := MainForm.rdt;
          ParamByName('idd').AsInteger := MainForm.dist;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('update cl');
          SQL.Add('set id_stnd=:stnd,boiler=:b, change =:dc');
          SQL.Add('where (id_street=:str)and(nhouse=:n)and(corp=:cp)');
          SQL.Add('and(id_dist=:idd)');
          ParamByName('stnd').AsInteger := stnd[combobox6.ItemIndex];
          ParamByName('dc').AsDateTime := Date;
          ParamByName('str').AsInteger := str[combobox1.ItemIndex];
          ParamByName('n').AsString := Edit2.Text;
          ParamByName('cp').AsString := Edit3.Text;
          ParamByName('idd').AsInteger := MainForm.dist;
          if CheckBox1.Checked then
            ParamByName('b').AsInteger := 1
          else
            ParamByName('b').AsInteger := 0;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('update house');
          SQL.Add('set id_stnd=:stnd,id_mng=:mng,id_fond=:fnd,boiler=:b');
          SQL.Add('where (id_street=:str)and(nhouse=:n)and(corp=:cp)and(id_dist=:idd)');
          ParamByName('stnd').AsInteger := stnd[combobox6.ItemIndex];
          ParamByName('str').AsInteger := str[combobox1.ItemIndex];
          ParamByName('n').AsString := Edit2.Text;
          ParamByName('cp').AsString := Edit3.Text;
          ParamByName('idd').AsInteger := MainForm.dist;
          ParamByName('mng').AsInteger := mng[combobox2.ItemIndex];
          ParamByName('fnd').AsInteger := fnd[combobox3.ItemIndex];
          if CheckBox1.Checked then
            ParamByName('b').AsInteger := 1
          else
            ParamByName('b').AsInteger := 0;
          ExecSQL;
          Close;
        end
        else begin
          Close;
          SQL.Clear;
          SQL.Add('update cl');
          SQL.Add('set boiler=:b, change =:dc');
          SQL.Add('where (id_street=:str)and(nhouse=:n)and(corp=:cp)');
          SQL.Add('and(id_dist=:idd)');
          ParamByName('dc').AsDateTime := Date;
          ParamByName('str').AsInteger := str[combobox1.ItemIndex];
          ParamByName('n').AsString := Edit2.Text;
          ParamByName('cp').AsString := Edit3.Text;
          ParamByName('idd').AsInteger := MainForm.dist;
          if CheckBox1.Checked then
            ParamByName('b').AsInteger := 1
          else
            ParamByName('b').AsInteger := 0;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('update house');
          SQL.Add('set boiler=:b');
          SQL.Add('where (id_street=:str)and(nhouse=:n)and(corp=:cp)and(id_dist=:idd)');
          ParamByName('str').AsInteger := str[combobox1.ItemIndex];
          ParamByName('n').AsString := Edit2.Text;
          ParamByName('cp').AsString := Edit3.Text;
          ParamByName('idd').AsInteger := MainForm.dist;
          if CheckBox1.Checked then
            ParamByName('b').AsInteger := 1
          else
            ParamByName('b').AsInteger := 0;
          ExecSQL;
          Close;
        end;
        if Checkbox3.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update sub');
          SQL.Add('set id_service=:id');
          SQL.Add('where sdate=(select max(sdate) from sub where sdate<=convert(smalldatetime,:s,104))and(service=:serv)');
          SQL.Add('and regn in (select regn from cl');
          SQL.Add('where (id_street=:str)and(nhouse=:n)and(corp=:cp)');
          SQL.Add('and(id_dist=:idd))');
          ParamByName('id').AsInteger := tarifs[serv[combobox4.ItemIndex]].id[Combobox5.ItemIndex];
          ParamByName('s').AsString := MainForm.rdt;
          ParamByName('serv').AsInteger := serv[combobox4.ItemIndex];
          ParamByName('str').AsInteger := str[combobox1.ItemIndex];
          ParamByName('n').AsString := Edit2.Text;
          ParamByName('cp').AsString := Edit3.Text;
          ParamByName('idd').AsInteger := MainForm.dist;
          ExecSQL;
          Close;
        end;
        if Checkbox4.Checked then begin
          Close;
           SQL.Clear;
          SQL.Add('update cl');
          SQL.Add('set boiler=:b, change =:dc');
          SQL.Add('where regn in (select regn from hist where id_mng = :mng ');
          SQL.Add('and id_dist=:idd)');
          ParamByName('dc').AsDateTime := Date;
          ParamByName('mng').AsInteger := mng[combobox2.ItemIndex];
          ParamByName('idd').AsInteger := MainForm.dist;
          if CheckBox1.Checked then
            ParamByName('b').AsInteger := 1
          else
            ParamByName('b').AsInteger := 0;
          ExecSQL;
          Close;

        end;
      end;
      DModule.Database1.Commit;
      ShowMessage('Все в порядке');
      MainForm.qr.SQL := 'select regn from cl where(id_street=:str)and(nhouse=:n)and(corp=:cp)'+
                      'and(id_dist=:idd)';

      SetLength(MainForm.qr.parname,4);SetLength(MainForm.qr.parval,4);
      MainForm.qr.parname[0] := 'str';MainForm.qr.parval[0] := IntToStr(str[combobox1.ItemIndex]);
      MainForm.qr.parname[1] := 'n';  MainForm.qr.parval[1] := Edit2.Text;
      MainForm.qr.parname[2] := 'cp'; MainForm.qr.parval[2] := Edit3.Text;
      MainForm.qr.parname[3] := 'idd'; MainForm.qr.parval[3] := IntToStr(MainForm.dist);
//      ac := true;
      if CheckBox4.Checked then
      begin
         MainForm.qr.SQL := 'select distinct regn from hist where(id_mng=:mng)'+
                      'and(id_dist=:idd)';

         SetLength(MainForm.qr.parname,1);SetLength(MainForm.qr.parval,1);
         MainForm.qr.parname[0] := 'mng';MainForm.qr.parval[0] := IntToStr(str[combobox2.ItemIndex]);

      end;
      MainForm.RecalcSelectedRows;
    except
      DModule.Database1.Rollback;
      ShowMessage('Операция завершилась неудачей!');
      MainForm.qr.SQL := '';
      SetLength(MainForm.qr.parname,0);
      SetLength(MainForm.qr.parval,0);

    end;
  end;
end;

procedure TForm29.Button2Click(Sender: TObject);
begin
  DModule.Query1.Close;
  ac := false;
  MainForm.qr.SQL := '';
  SetLength(MainForm.qr.parname,0);
  SetLength(MainForm.qr.parval,0);
  Close;
end;

procedure TForm29.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{ выбрали квартиры }
var
  b: integer;
begin
  if key=vk_return then begin
    if IsRus(Edit2.Text)and IsInt(Edit3.Text)and
      (Combobox1.Text <> '') then
      with DModule.Query1 do begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from house inner join');
        SQL.Add('strt on house.id_street=strt.id_street inner join');
        SQL.Add('mng on house.id_mng=mng.id_mng and house.id_dist=mng.id_dist inner join');
        SQL.Add('fond on house.id_fond=fond.id_fond');
        SQL.Add('where (strt.id_street = :str) and(corp=:cp)');
        SQL.Add('and(house.nhouse = :numb) and (house.id_dist=:dist)');
        ParamByName('str').AsInteger := str[Combobox1.ItemIndex];
        ParamByName('numb').AsString := Edit2.Text;
        ParamByName('cp').AsString := Edit3.Text;
        ParamByName('dist').AsInteger := MainForm.dist;
        Open;
        if not eof then begin
          b :=FieldByName('boiler').AsInteger;
          Combobox2.Text := FieldByName('namemng').AsString;
          Combobox3.Text := FieldByName('namefond').AsString;
          Combobox6.Text := SelStnd(FieldByName('id_stnd').AsInteger);
          Combobox4.Text := Combobox4.Items[serv[0]];
          curt[0] := FieldByName('id_cont').AsInteger;
          curt[1] := FieldByName('id_rep').AsInteger;
          curt[2] := FieldByName('id_cold').AsInteger;
          curt[3] := FieldByName('id_hot').AsInteger;
          curt[4] := FieldByName('id_canal').AsInteger;
          curt[5] := FieldByName('id_heat').AsInteger;
          curt[6] := FieldByName('id_gas').AsInteger;
          curt[7] := FieldByName('id_el').AsInteger;
          curt[12] := FieldByName('id_wood').AsInteger;
          curt[13] := FieldByName('id_coal').AsInteger;
          Close;
          if b=0 then
            CheckBox1.Checked := false
          else
            CheckBox1.Checked := true;
          Combobox2.OnChange(combobox2);
          Combobox3.OnChange(combobox3);
          Combobox4.OnChange(combobox4);
          Combobox6.OnChange(combobox6);
        end;
      end;
  end;
end;

procedure TForm29.Edit2Exit(Sender: TObject);
{ выбрали квартиры }
var
  b: integer;
begin
  if IsRus(Edit2.Text)and IsInt(Edit3.Text)and(Combobox1.Text <> '') then
      with DModule.Query1 do begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from house inner join');
        SQL.Add('strt on house.id_street=strt.id_street inner join');
        SQL.Add('mng on house.id_mng=mng.id_mng and house.id_dist=mng.id_dist inner join');
        SQL.Add('fond on house.id_fond=fond.id_fond');
        SQL.Add('where (strt.id_street = :str) and(corp=:cp)');
        SQL.Add('and(house.nhouse = :numb) and (house.id_dist=:dist)');
        ParamByName('str').AsInteger := str[Combobox1.ItemIndex];
        ParamByName('numb').AsString := Edit2.Text;
        ParamByName('cp').AsString := Edit3.Text;
        ParamByName('dist').AsInteger := MainForm.dist;
        Open;
        if not eof then begin
          b :=FieldByName('boiler').AsInteger;
          Combobox2.Text := FieldByName('namemng').AsString;
          Combobox3.Text := FieldByName('namefond').AsString;
          Combobox6.Text := SelStnd(FieldByName('id_stnd').AsInteger);
          Combobox4.Text := Combobox4.Items[serv[0]];
          curt[0] := FieldByName('id_cont').AsInteger;
          curt[1] := FieldByName('id_rep').AsInteger;
          curt[2] := FieldByName('id_cold').AsInteger;
          curt[3] := FieldByName('id_hot').AsInteger;
          curt[4] := FieldByName('id_canal').AsInteger;
          curt[5] := FieldByName('id_heat').AsInteger;
          curt[6] := FieldByName('id_gas').AsInteger;
          curt[7] := FieldByName('id_el').AsInteger;
          curt[12] := FieldByName('id_wood').AsInteger;
          curt[13] := FieldByName('id_coal').AsInteger;
          Close;
          if b=0 then
            CheckBox1.Checked := false
          else
            CheckBox1.Checked := true;
          Combobox2.OnChange(combobox2);
          Combobox3.OnChange(combobox3);
          Combobox4.OnChange(combobox4);
          Combobox6.OnChange(combobox6);
        end;
      end;
end;

procedure TForm29.CheckBox2Click(Sender: TObject);
begin
  combobox2.enabled:=checkbox2.checked;
  combobox3.enabled:=checkbox2.checked;
  combobox6.enabled:=checkbox2.checked;
end;

procedure TForm29.CheckBox3Click(Sender: TObject);
begin
  combobox4.enabled:=checkbox3.checked;
  combobox5.enabled:=checkbox3.checked;
end;

end.
