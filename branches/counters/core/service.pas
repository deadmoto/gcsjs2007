unit service;

{**************************************************************************

  ��������� ������

***************************************************************************}

interface


uses
  Controls, DB, dbf, Dialogs, FileCtrl, Grids, Mask, padegFIO, Registry, dateutils, Math,
  StdCtrls, SysUtils, Variants, Windows, ExtCtrls, Graphics, Classes, jpeg, ComObj;

const
  numbtarif = 14;

  FactDateBase = '01.08.2008'; //�������� �������� � ������� ����� ���������, ������� � ������ ����
  FactDateWC   = '01.02.2008'; //�������� �������� � �������� �� �������� ���� ���������, ������� � ������ ����
  FactDateYear = '01.01.2009'; //���� ������ ����� ����������� ��������

  cDiffOperation: array[0..2] of string = (
    '=',
    '>=',
    '<='
    );

type
  TStringArray = array of string;
  TIntArray = array of integer;

procedure SetPoint(edt: TEdit);//���������� ������� � ������ ������

function CheckNumb(edt: TEdit): boolean;
function CheckInt(edt: TEdit): boolean;
function CheckRus(edt: TEdit): boolean;
function CheckDate(edt: TMaskEdit): boolean;

function IsNumber(str: string): boolean;//������ ������� ������ �� ����� � �������
function IsInt(str: string): boolean;   //������ ������� ������ �� ����
function IsRus(str: string): boolean;
function IsDate(str: string): boolean;

function FindReg(RegNumber, b: integer; buffer: array of integer): integer;//����� ��� �����
function FindCl(RegNumber: integer; buffer: array of integer): integer;    //����� ��� �����

function Rnd(n: real): real;
function FlToStr(n: real): string;
procedure ToRowF(n: real; var numb: array of integer);

procedure FillCurr(path, rdt: string; dis: integer; code: TCodePage);
procedure FillTarif(path, nam, rdt: string; dis: integer; code: TCodePage);
procedure FillTarifb(path, nam, rdt: string; dis: integer; code: TCodePage);
procedure FillEl(path, rdt: string; dis: integer; code: TCodePage);
procedure FillMin(path, rdt: string; code: TCodePage);
procedure FillStnd(path, rdt: string; code: TCodePage);
procedure FillMdd(path, rdt: string; code: TCodePage);

function GetName(fld: TField): string;
function GetType(fld: TField): TFldType;
function GetSize(fld: TField): byte;
function GetPrec(fld: TField): byte;
procedure FillTable(path, nam: string; code: TCodePage);
procedure EditField(f: string; code: TCodePage; n: integer);

function GetMonthsCount(BeginDate, EndDate: TDateTime): integer;
function WithoutDoubleSpaces(str: string): string;
function GetShortName(FIO: string): string;
function ReplacePoint(str: string): string; //�������� , �� .

{******************************************************************************}
function RefToCell(ARow, ACol: integer): string;
function ExportGridToExcel(AGrid: TStringGrid; AFileName: string): boolean;
{******************************************************************************}

//���������� ������ exe �� ����� �����
function FileVersion(AFileName: string): string;

function GetTempDir: string;
function GetSystemDir: string;
function SelectDir: string;

function getConfValue(str: string): variant;

procedure FormerStringGrid(StrGrid: TStringGrid; SGHead: TStringArray; SGColWidths: TIntArray; RecCount: integer);

//������� ��������� TStringGrig, ��������� ����� � ����� �� ��������� �����
procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
//��������� ���������� ���������� � ������� �������������� ������
procedure FixObjPosn(SG:TStringGrid; vCol, vRow: LongInt);
//������� ��������� TComboBox, ��������� ����� � items �� ��������� �����
//procedure CBMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
//procedure CBDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);

procedure LoadJPEGFromRes(TheJPEG : string; ThePicture : TPicture);

implementation

uses
  datamodule, main;

procedure SetPoint(edt: TEdit);
{*******************************************************************************
  ��������� SetPoint ������������� ������� � ������ ������
*******************************************************************************}
var
  r, str: string;
  len: integer;
begin
  str := edt.Text;
  if (str <> '') and IsNumber(str) then
  begin
    if (Pos(',', str) = 0) then
    begin//���� ������� ���
      len := Length(str);
      if len > 2 then
        edt.Text := Copy(str, 0, len - 2) + ',' + Copy(str, len - 1, 2);
      if (len > 0) and (len < 3) then
      begin
        if len = 1 then
        begin
          r := '0';
          edt.Text := '0,' + r + Copy(str, len - 1, 2);
        end;
        if len = 2 then
          edt.Text := Copy(str, len - 1, 2) + ',00';
      end;
    end
    else
    begin
      try
        if Length(str) - Pos(',', str) > 2 then
          edt.Text := Copy(str, 1, Pos(',', str) + 2);
      except
        edt.Text := '0,00';
      end;
    end;
  end
  else
    edt.Text := '0,00';
end;

function IsRus(str: string): boolean;
{*******************************************************************************
  ������� IsRus ��������� �������� �� ������ ������� ������������� ��������.
  ���� ��������, �� ������������ true, ����� false.
*******************************************************************************}
var
  i: integer;
  flag: boolean;
begin
  flag := True;
  if str <> '' then
  begin
    for i := 1 to Length(str) do
      if str[i] in ['A'..'Z', 'a'..'z'] then
      begin
        flag := False;
        break;
      end;
  end;
  Result := flag;
end;

function FlToStr(n: real): string;
{*******************************************************************************
  ������� FlToStr ��������� ����� � ������. �����, �������������� �������, ������
  ��������� �� ����� 2 ������ ����� �������.
*******************************************************************************}
var
  p: integer;
begin
  Result := FloatToStr(roundto(n, -2));
  p := Pos(',', Result);
  if p <> 0 then
  begin
    if p = Length(Result) - 1 then//125.2
      Result := Result + '0';
  end
  else//125
    Result := Result + ',00';
end;

procedure ToRowF(n: real; var numb: array of integer);
{*******************************************************************************
��������� ToRow ���������� ���������� � ��� ������� ����� �����.
*******************************************************************************}
var
  num: real;
  i: integer;
begin
  num := frac(RoundTo(frac(n), -5));
  if num <> 0 then
  begin
    for i := 0 to Length(numb) - 1 do
      numb[i] := trunc(num * intpower(10, i + 1)) mod 10;
  end
  else
    numb[0] := trunc(RoundTo(frac(n), -5)) * 10;
end;

function Rnd(n: real): real;
{*******************************************************************************
  ������� Rnd ���������� ���������� ����� �� 2 ������.
*******************************************************************************}
var
  i: integer;
  numb: array of integer;
begin
  SetLength(numb, 5);
  ToRowF(n, numb);
  if (numb[2] > 4) {or (numb[3]>4) or (numb[4]>4) or (numb[5]>4)} then
  begin
    for i := Length(numb) - 1 downto 2 do
      if (numb[i] > 4) then
      begin
        numb[i - 1] := numb[i - 1] + 1;
        if numb[i] > 9 then
          numb[i] := numb[i] - 10;
      end;
  end;
  Result := int(n) + numb[0] / 10 + numb[1] / 100;
end;

function IsNumber(str: string): boolean;
{*******************************************************************************
  ������� IsNumber ��������� ������� �� ������ ������ �� ���� � �������. ���� ��,
  �� ������������ true.
*******************************************************************************}
var
  i: integer;
  flag: boolean;
begin
  flag := True;
  if str <> '' then
  begin
    for i := 1 to Length(str) do
      if not (str[i] in ['0'..'9', ',']) then
      begin
        flag := False;
        break;
      end;
  end;
  Result := flag;
end;

function IsDate(str: string): boolean;
{*******************************************************************************
  ������� IsInt ��������� �������� �� ������ �����. ���� ��,
  �� ������������ true.
*******************************************************************************}
var
  s: string;
begin
  try
    s := DateToStr(StrToDate(str));
    Result := True;
  except
    Result := False;
  end;
end;

function IsInt(str: string): boolean;
{*******************************************************************************
  ������� IsInt ��������� ������� �� ������ ������ �� ����. ���� ��,
  �� ������������ true.
*******************************************************************************}
var
  i: integer;
  flag: boolean;
begin
  flag := True;
  if str <> '' then
  begin
    for i := 1 to Length(str) do
      if not (str[i] in ['0'..'9']) then
      begin
        flag := False;
        break;
      end;
  end;
  Result := flag;
end;

function CheckNumb(edt: TEdit): boolean;
{*******************************************************************************
  ��������� ��������� �������� �� ������ � ���� ����� ������, ���� ���, �� ����
  ������ � ���� ����� ���������� �������, � ���� ����� ����������.
*******************************************************************************}
begin
  if not IsNumber(Edt.Text) then
  begin
    ShowMessage('� ���� ���� ����� ���� ������ �����!');
    Edt.Text := '0.00';
    Result := False;
  end
  else
    Result := True;
end;

function CheckDate(edt: TMaskEdit): boolean;
{*******************************************************************************
  ��������� ��������� �������� �� ������ � ���� ����� �����, ���� ���, �� ����
  ������ � ���� ����� ���������� �������, � ���� ����� ����������.
*******************************************************************************}
begin
  if not IsDate(Edt.Text) then
  begin
    ShowMessage('������� ������� ����!');
    Edt.Text := Form1.rdt;
    Result := False;
  end
  else
    Result := True;
end;

function CheckInt(edt: TEdit): boolean;
{*******************************************************************************
  ��������� ��������� �������� �� ������ � ���� ����� ����� ������, ���� ���, �� ����
  ������ � ���� ����� ���������� �������, � ���� ����� ����������.
*******************************************************************************}
begin
  if not IsInt(Edt.Text) then
  begin
    ShowMessage('� ���� ���� ����� ���� ������ ����� �����!');
    Edt.Text := '0';
    Result := False;
  end
  else
    Result := True;
end;

function CheckRus(edt: TEdit): boolean;
{*******************************************************************************
  ��������� ��������� �������� �� ������ � ���� ����� ������� ������������� ��������,
  ���� ���, �� ���� ������ � ���� ����� ���������� �������, � ���� ����� ���������.
*******************************************************************************}
begin
  if not IsRus(edt.Text) then
  begin
    ShowMessage('����� ������������ ����� ������ ���������!');
    edt.Text := '';
    Result := False;
  end
  else
    Result := True;
end;

function FindCl(RegNumber: integer; buffer: array of integer): integer;
{*******************************************************************************
  ������� FindCl ������� ��������������� ����� � ������� buffer � ���������� ���
  ������.
*******************************************************************************}
var
  i: integer;
begin
  Result := 0;
{  for i := 0 to Length(buffer) - 1 do
    if buffer[i] = RegNumber then
    begin
      Result := i;
      exit;
    end;
  if i = Length(buffer) then
    Result := -1;}
  i := 0;
  while i <>  Length(buffer) - 1 do
  begin
    if buffer[i] = RegNumber then
    begin
      Result := i;
      exit;
    end;
    Inc(i);
  end;
  if i = Length(buffer) then
    Result := -1;
end;

function FindReg(RegNumber, b: integer; buffer: array of integer): integer;
{*******************************************************************************
  ������� FindCl ������� ��������������� ����� � ������� buffer � ���������� ���
  ������.
*******************************************************************************}
var
  a, c: integer;
begin
  Result := 0;
  if b <> 0 then
  begin
    a := 0;
    while True do
    begin
      if (b - a <= 1) then
      begin
        if (buffer[a] = RegNumber) then
        begin
          Result := a;
          break;
        end;
        if (buffer[b] = RegNumber) then
        begin
          Result := b;
          break;
        end;
        if (buffer[a] <> RegNumber) and (buffer[b] <> RegNumber) then
        begin
          Result := -1;
          break;
        end;
      end
      else
      begin
        c := (b + a) div 2;
        if (buffer[c] = RegNumber) then
        begin
          Result := c;
          break;
        end;
        if (buffer[c] > RegNumber) then
          b := c
        else
          a := c;
      end;
    end;
  end
  else
    Result := -1;
end;

function GetName(fld: TField): string;
{*******************************************************************************
  ������� GetName ���������� �������� ���� fld
*******************************************************************************}
begin
  Result := fld.FieldName;
end;

function GetType(fld: TField): TFldType;
{*******************************************************************************
  ������� GetType ���������� ��� ���� fld
*******************************************************************************}
begin
  case fld.DataType of
    ftString: Result  := bfString;
    ftBoolean: Result := bfBoolean;
    ftFloat, ftCurrency: Result := bfFloat;
    ftDate, ftDateTime: Result := bfDate;
    else
      Result := bfNumber;
  end;
end;

function GetSize(fld: TField): byte;
{*******************************************************************************
  ������� GetSize ���������� ������ ���� fld
*******************************************************************************}
begin
  case fld.DataType of
    ftDate, ftDateTime: Result := 8;
    ftBoolean: Result := 1;
    ftString: Result  := fld.DisplayWidth;
    else
      Result := 20;
  end;
end;

function GetPrec(fld: TField): byte;
{*******************************************************************************
  ������� GetPrec ���������� ���������� ������ ����� ������� ���� fld
*******************************************************************************}
begin
  case fld.DataType of
    ftFloat, ftCurrency:
      Result := 2;
    else
      Result := 0;
  end;
end;

procedure FillTable(path, nam: string; code: TCodePage);
{*******************************************************************************
  ��������� ������� ������� � ��������� �� ������� �� Query1 � ���������� code
  (OEM ��� ANSI)
*******************************************************************************}
var
  i: integer;
begin
  if FileExists(path + nam + '.dbf') then
    DeleteFile(PAnsiChar(path + nam + '.dbf'));

  with Datamodule1 do
  begin
    if Dbf1.Active then
      Dbf1.Close;
    for i := 0 to Query1.FieldCount - 1 do
      Dbf1.AddFieldDefs(GetName(Query1.Fields[i]), GetType(Query1.Fields[i]),
        GetSize(Query1.Fields[i]), GetPrec(Query1.Fields[i]));
    Dbf1.TableName := path + nam + '.dbf';
    Dbf1.CreateTable;
    Dbf1.CodePage := code;
//    try
      while not Query1.EOF do
      begin
        dbf1.Append;
        for i := 1 to Query1.FieldCount do
          EditField(Query1.Fields[i - 1].AsString, code, i);
        Dbf1.Post;
        Query1.Next;
      end;
//    except
//      ShowMessage(Query1.Fields[i - 1].AsString);
//    end;
    Dbf1.Close;
    Query1.Close;
  end;
end;

procedure EditField(f: string; code: TCodePage; n: integer);
var
  v1: string;
  j:  integer;
begin
  with Datamodule1 do
  begin
    SetLength(v1, Length(f));
    //���������� ��� ��������� OEM
    if code = OEM then
    begin
      for j := 1 to Length(f) do
        v1[j] := f[j];
      DBF1.Translate(v1, f, True);
    end;
    Dbf1.SetFieldData(n, f);
  end;
end;


procedure FillCurr(path, rdt: string; dis: integer; code: TCodePage);
{*******************************************************************************
  ��������� FillCurr ��������� ������� ������� �������� �������, ���������� �
  ����������� ���������.
*******************************************************************************}
begin
  if not DirectoryExists(path) then
    ForceDirectories(path);

  FillTarif(path, 'cont', rdt, dis, code);
  FillTarif(path, 'rep', rdt, dis, code);
  FillTarifb(path, 'cold', rdt, dis, code);
  FillTarifb(path, 'hot', rdt, dis, code);
  FillTarif(path, 'canal', rdt, dis, code);
  FillTarif(path, 'heat', rdt, dis, code);
  FillTarif(path, 'gas', rdt, dis, code);
  FillEl(path, rdt, dis, code);
  FillTarif(path, 'wood', rdt, dis, code);
  FillTarif(path, 'coal', rdt, dis, code);
  FillMin(path, rdt, code);
  FillStnd(path, rdt, code);
  FillMdd(path, rdt, code);
end;

procedure FillTarif(path, nam, rdt: string; dis: integer; code: TCodePage);
{*******************************************************************************
  ��������� FillTarif ��������� ������� ������� �������� ������� ��� �������
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.add('select ' + nam + '.id_' + nam + ',' + nam + '.name' + nam + ',' + nam + '.tarif' + nam + ' from');
    SQL.add('(select max(sdate) as sdate,id_' + nam + ' from ' + nam);
    SQL.add('where sdate<=convert(smalldatetime,:d,104) and (id_dist=:idd)');
    SQL.add('group by id_' + nam + ') sb inner join');
    SQL.add(nam + ' on (' + nam + '.id_' + nam + '=sb.id_' + nam + ')and(' + nam + '.sdate=sb.sdate)and(' + nam + '.id_dist=:idd)');
    SQL.add('order by ' + nam + '.name' + nam);
    ParamByName('d').AsString := rdt;
    ParamByName('idd').AsInteger := dis;
    Open;
    FillTable(path, 'cur' + nam, code);
  end;
end;

procedure FillTarifb(path, nam, rdt: string; dis: integer; code: TCodePage);
{*******************************************************************************
  ��������� FillTarifb ��������� ������� ������� �������� ������� � ��������
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.add('select ' + nam + '.id_' + nam + ',' + nam + '.name' + nam + ',' + nam + '.tarif1,' + nam + '.tarif2 from');
    SQL.add('(select max(sdate) as sdate,id_' + nam + ' from ' + nam);
    SQL.add('where sdate<=convert(smalldatetime,:d,104) and (id_dist=:idd)');
    SQL.add('group by id_' + nam + ') sb inner join');
    SQL.add(nam + ' on (' + nam + '.id_' + nam + '=sb.id_' + nam + ')and(' + nam + '.sdate=sb.sdate)and(' + nam + '.id_dist=:idd)');
    SQL.add('order by ' + nam + '.name' + nam);
    ParamByName('d').AsString := rdt;
    ParamByName('idd').AsInteger := dis;
    Open;
    FillTable(path, 'cur' + nam, code);
  end;
end;

procedure FillEl(path, rdt: string; dis: integer; code: TCodePage);
{*******************************************************************************
  ��������� Fillel ��������� ������� ������� �������� ������� �� �/�
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.add('select el.id_el,el.plate,el.tarifel1,el.tarifel2,el.tarifel3 from');
    SQL.add('(select max(sdate) as sdate,id_el from el');
    SQL.add('where sdate<=convert(smalldatetime,:d,104) and (id_dist=:idd)');
    SQL.add('group by id_el) sb inner join');
    SQL.add('el on (el.id_el=sb.id_el)and(el.sdate=sb.sdate)and(el.id_dist=:idd)');
    SQL.add('order by el.plate');
    ParamByName('d').AsString := rdt;
    ParamByName('idd').AsInteger := dis;
    Open;
    FillTable(path, 'curel', code);
  end;
end;

procedure FillMin(path, rdt: string; code: TCodePage);
{*******************************************************************************
  ��������� FillMin ��������� ������� ������� �������� ����������� ���������
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.add('select lmin.id_min,lmin.namemin,lmin.minim from');
    SQL.add('(select max(sdate) as sdate,id_min from lmin');
    SQL.add('where sdate<=convert(smalldatetime,:d,104)');
    SQL.add('group by id_min) sb inner join');
    SQL.add('lmin on (lmin.id_min=sb.id_min)and(lmin.sdate=sb.sdate)');
    SQL.add('order by lmin.namemin');
    ParamByName('d').AsString := rdt;
    Open;
    FillTable(path, 'curlmin', code);
  end;
end;

procedure FillMdd(path, rdt: string; code: TCodePage);
{*******************************************************************************
  ��������� FillMdd ��������� ������� ������� �������� ���
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.add('select mdd.id_mdd,mdd.namegroup,mdd.vmdd from');
    SQL.add('(select max(sdate) as sdate,id_mdd from mdd');
    SQL.add('where sdate<=convert(smalldatetime,:d,104)');
    SQL.add('group by id_mdd) sb inner join');
    SQL.add('mdd on (mdd.id_mdd=sb.id_mdd)and(mdd.sdate=sb.sdate)');
    SQL.add('order by mdd.namegroup');
    ParamByName('d').AsString := rdt;
    Open;
    FillTable(path, 'curmdd', code);
  end;
end;

procedure FillStnd(path, rdt: string; code: TCodePage);
{*******************************************************************************
  ��������� FillStnd ��������� ������� ������� �������� ������������ ����������
*******************************************************************************}
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.add('select rstnd.id_stnd,rstnd.namestnd,rstnd.value1,rstnd.value2,rstnd.value3,rstnd.value4,rstnd.value5,rstnd.value6, rstnd.value7');
    SQL.add('from(select max(sdate) as sdate,id_stnd from rstnd');
    SQL.add('where sdate<=convert(smalldatetime,:d,104)');
    SQL.add('group by id_stnd) sb inner join');
    SQL.add('rstnd on (rstnd.id_stnd=sb.id_stnd)and(rstnd.sdate=sb.sdate)');
    SQL.add('order by rstnd.namestnd');
    ParamByName('d').AsString := rdt;
    Open;
    FillTable(path, 'currstnd', code);
  end;
end;

function GetMonthsCount(BeginDate, EndDate: TDateTime): integer;
{*******************************************************************************
 �������, ������� ���������� ������� ����� ����� ������ � �������.
 �������� ������: BeginDate, EndDate - ��������� � �������� ����;
                  DaysCount - ������� ������� � ���� (���� ������ ��� ��������
                              ������, � ��������).
 �������� ������: ���������� ������� ����� ������ � �������.
*******************************************************************************}

var
//  Days1, Days2,             // ���������� ���� ��������� � �������� ���
  Months1, Months2,         // ���������� ������� ��������� � �������� ���
  Years1, Years2: integer;  // ���������� ��� ��������� � �������� ���
  BufferDate: TDateTime;    // ����� ��� ������ ����������
//  DaysCount: byte;
begin
  if BeginDate > EndDate then  // ���������� ����, ���� ��������� �������
  begin                        // ��������, �� ������ ���� ����� �����
    BufferDate := BeginDate;
    BeginDate := EndDate;
    EndDate := BufferDate;
  end;
//  Days1  := StrToInt(FormatDateTime('dd', BeginDate));     // ��������� ������-
//  Days2  := StrToInt(FormatDateTime('dd', EndDate));       // ���� ����, �������
  Months1 := StrToInt(FormatDateTime('mm', BeginDate));    // � ��� ������ �� ���
  Months2 := StrToInt(FormatDateTime('mm', EndDate));      // � ������� � ����-
  Years1 := StrToInt(FormatDateTime('yyyy', BeginDate));   // ����������� ����-
  Years2 := StrToInt(FormatDateTime('yyyy', EndDate));     // ������
  // ��������� ��������� ������� ����� ������ �� �������� � �����*12 � �������
  Result := (Years2 - Years1) * 12 + (Months2 - Months1);
  // ��������� ������� ������� � ���� �� ���������� ������� + ������� � ���� �
  // ���������� DaysCount
{  if (Days2 - Days1) < 0 then
  begin  // ���� ������� ������������, ��
    Result := Result - 1;  // ���������� ���� ������ �� ���������
    // � ����������� �� ������ � "�������" ����, ��������� ������� � ����
    case Months1 of
      1, 3, 5, 7, 8, 10, 12: DaysCount := 31 - Days1 + Days2;
      4, 6, 9, 11: DaysCount := 30 - Days1 + Days2;
      // � ������ ������� ��������� ����� ������������ ����
      2: if (Years2 mod 4 = 0) and (Years2 mod 100 <> 0) then
          DaysCount := 29 - Days1 + Days2
        else
        if (Years2 mod 100 = 0) and (Years2 mod 400 = 0) then
          DaysCount := 29 - Days1 + Days2
        else
          DaysCount := 28 - Days1 + Days2;
    end;
  end  // ����� �������� ��� ������������� ������� ����
  else  // ��� ������������� ��� ������� ������� ����
    DaysCount := Days2 - Days1;  // ��������� ��������}
end;

{******************************************************************************}
function RefToCell(ARow, ACol: integer): string;
begin
  Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;

function ExportGridToExcel(AGrid: TStringGrid; AFileName: string): boolean;
var
  ExcelApp, Sheet, Data: OleVariant;
  i, j: integer;
begin
  try
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=False;
  except
    on E: Exception do
      raise Exception.Create('������ �������� ������� Excel: ' + E.Message);
  end;

  try
    ExcelApp.WorkBooks.Open(aFileName);
  finally
  end;

  // Prepare Data
  Data := VarArrayCreate([1, AGrid.RowCount, 1, AGrid.colcount], varVariant);
  for i := 0 to AGrid.colcount - 1 do
    for j := 0 to AGrid.RowCount - 1 do
      Data[j + 1, i + 1] := AGrid.Cells[i, j];

  try
    //ExcelApp.ActiveWorkBook.WorkSheets.Add;
    Sheet :=  ExcelApp.ActiveWorkBook.WorkSheets[1];
    //Sheet.Name := ASheetName;
    // Fill up the sheet
    Sheet.Range[RefToCell(1, 1), RefToCell(AGrid.RowCount, AGrid.colcount)] := Data;
    ExcelApp.Visible := True;
  finally
    Result := True;
//    ExcelApp.Quit;
//    ExcelApp:=Unassigned;
  end;
end;
{******************************************************************************}

function FileVersion(AFileName: string): string;
{*******************************************************************************
    ������� ���������� ������ �����
*******************************************************************************}
var
  szName: array[0..255] of char;
  P: Pointer;
  Value: Pointer;
  Len: UINT;
  GetTranslationString: string;
  FFileName: PChar;
  FValid: boolean;
  FSize: DWORD;
  FHandle: DWORD;
  FBuffer: PChar;
begin
  try
    FFileName := StrPCopy(StrAlloc(Length(AFileName) + 1), AFileName);
    FValid := False;
    FSize  := GetFileVersionInfoSize(FFileName, FHandle);
    if FSize > 0 then
      try
        GetMem(FBuffer, FSize);
        FValid := GetFileVersionInfo(FFileName, FHandle, FSize, FBuffer);
      except
        FValid := False;
        raise;
      end;
    Result := '';
    if FValid then
      VerQueryValue(FBuffer, '\VarFileInfo\Translation', p, Len)
    else
      p := nil;
    if P <> nil then
      GetTranslationString := IntToHex(MakeLong(HiWord(longint(P^)),
        LoWord(longint(P^))), 8);
    if FValid then
    begin
      StrPCopy(szName, '\StringFileInfo\' + GetTranslationString +
        '\FileVersion');
      if VerQueryValue(FBuffer, szName, Value, Len) then
        Result := StrPas(PChar(Value));
    end;
  finally
    try
      if FBuffer <> nil then
        FreeMem(FBuffer, FSize);
    except
    end;
    try
      StrDispose(FFileName);
    except
    end;
  end;
end;

function GetTempDir: string;
{*******************************************************************************
    ������� ���������� ���� � ����� %TEMP%
*******************************************************************************}
var
  Buf: array[0..1023] of char;
begin
  SetString(Result, Buf, GetTempPath(Sizeof(Buf) - 1, Buf));
end;

function GetSystemDir: string;
{*******************************************************************************
    ������� ���������� ���� � ����� %WINDIR%\system32
*******************************************************************************}
var
  Buf: array[0..1023] of char;
begin
  SetString(Result, Buf, GetSystemDirectory(Buf,Sizeof(Buf) - 1));
end;


function getConfValue(str: string): variant;
{*******************************************************************************
    ������� getConfValue ���������� �������� ���������� � �������, �������
    ������������ ������������� �������� ����������.
*******************************************************************************}
begin
  with TRegistry.Create do
  begin
    RootKey := HKEY_CURRENT_USER;
    if OpenKey('Software\Subsidy\Config', True) then
      if ValueExists(str) then
        Result := ReadString(str)
      else
        WriteString(str, '0');
  end;
end;

function SelectDir: string;
var
  dir: string;
  bool: boolean;
begin
  bool := SelectDirectory('Select directory', '', dir, [sdShowShares, sdNewUI, sdValidateDir, sdNewFolder]);
  if not bool then exit
  else
  begin
    if dir[length(dir)] <> '\' then
      dir := dir + '\';
    Result := dir;
  end;
end;

procedure FormerStringGrid(StrGrid: TStringGrid; SGHead: TStringArray; SGColWidths: TIntArray; RecCount: integer);
var
  i: integer;
begin
  StrGrid.RowCount := RecCount;
  StrGrid.ColCount := length(SGHead);
  for i := 0 to length(SGHead) - 1 do
  begin
    StrGrid.Cells[i, 0] := SGHead[i];
//  for i := 0 to length(SGColWidths) - 1 do
    StrGrid.ColWidths[i] := SGColWidths[i];
  end;
end;

function WithoutDoubleSpaces(str: string): string;
var
  i: integer;
begin
  for i := 0 to 2 do
    str := Trim(StringReplace(str, '  ', ' ', [rfReplaceAll]));
  Result := str;
end;

function GetShortName(FIO: string): string;
var
  FIOParts: TFIOParts;
begin
  FIOParts := GetFIOParts(FIO);

  if Trim(FIOParts.MiddleName) <> '' then
    Result := Trim(FIOParts.LastName) + ' ' +
      Trim(FIOParts.FirstName)[1] + '. ' +
      Trim(FIOParts.MiddleName)[1] + '.'
  else
    Result := Trim(FIOParts.LastName) + ' ' +
      Trim(FIOParts.FirstName)[1] + '. ';
end;

function ReplacePoint(str: string): string;
var
  i: integer;
  tmpStr: string;
begin
  tmpStr := str;
  for i:=0 to Length(tmpStr)-1 do
    if tmpStr[i] = ',' then
      tmpStr[i] := '.';
  str := tmpStr;
end;

procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  H: integer;
  buffer: string;
begin
  with (Sender as TStrinGgrid) do
  if (ARow > 0) and (Canvas.TextWidth(Cells[ACol, ARow]) > ColWidths[ACol]) then
    begin
      (Sender as TStrinGgrid).Canvas.FillRect(Rect);
      buffer:= (Sender as TStrinGgrid).Cells[ACol, ARow];
      Inc(Rect.Left,3);
      Dec(Rect.Right,3);
      H := DrawText((Sender as TStrinGgrid).Canvas.Handle, PChar(buffer),
        length(buffer), Rect, DT_WORDBREAK);
      if H > (Sender as TStrinGgrid).RowHeights[ARow] then
        (Sender as TStrinGgrid).RowHeights[ARow] := H;
    end;
end;

procedure FixObjPosn(SG:TStringGrid; vCol, vRow: LongInt);
var
  R: TRect;
begin
  R := SG.CellRect(vCol, vRow);
  if SG.Objects[vCol, vRow] is TControl then
    with TControl(SG.Objects[vCol, vRow]) do
      if R.Right = R.Left then {������������� ������ �������}
        Visible := False
      else
      begin
        InflateRect(R, 0, 0);//-1
        OffsetRect(R, SG.Left + 0, SG.Top + 0);//+1
        BoundsRect := R;
        Visible := True;
      end;
end;


{procedure CBMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
var
  ItemString: string;
  MyRect: TRect;
  MyImage: TImage;
  MyCombo: TComboBox;
begin
  // Don't waste time with this on Index = -1
  if (Index > -1) then
  begin
    MyCombo := TComboBox(Control);
    // Create a temporary canvas to calculate the height
    MyImage := TImage.Create(MyCombo);
    try
      MyRect := MyCombo.ClientRect;
      ItemString := MyCombo.Items.Strings[Index];
      MyImage.Canvas.Font := MyCombo.Font;
      // Calc. using this ComboBox's font size
      Height := DrawText(MyImage.Canvas.Handle, PChar(ItemString),
        length(ItemString), MyRect, DT_CALCRECT or DT_WORDBREAK);
    finally
      MyImage.Free;
    end;
  end;
end;

procedure CBDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  ItemString: string;
begin
  TComboBox(Control).Canvas.FillRect(Rect);
  ItemString := TComboBox(Control).Items.Strings[Index];
  DrawText(TComboBox(Control).Canvas.Handle, PChar(ItemString), length(ItemString), Rect, DT_WORDBREAK);
end;}


procedure LoadJPEGFromRes(TheJPEG : string; ThePicture : TPicture);
var
        ResHandle : THandle;
        MemHandle : THandle;
        MemStream : TMemoryStream;
        ResPtr    : PByte;
        ResSize   : Longint;
        JPEGImage : TJPEGImage;
begin
        ResHandle := FindResource(hInstance, PChar(TheJPEG), 'JPEG');
        MemHandle := LoadResource(hInstance, ResHandle);
        ResPtr    := LockResource(MemHandle);
        MemStream := TMemoryStream.Create;
        JPEGImage := TJPEGImage.Create;
        ResSize := SizeOfResource(hInstance, ResHandle);
        MemStream.SetSize(ResSize);
        MemStream.Write(ResPtr^, ResSize);
        FreeResource(MemHandle);
        MemStream.Seek(0, 0);
        JPEGImage.LoadFromStream(MemStream);
        ThePicture.Assign(JPEGImage);
        JPEGImage.Free;
        MemStream.Free;
end;

end.