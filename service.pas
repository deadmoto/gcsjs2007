unit service;

{**************************************************************************

  Служебный модуль

***************************************************************************}

interface

uses
  SysUtils,
  Windows,
  Controls,
  Dialogs,
  StdCtrls,
  Variants,
  dbf,
  DB,
  Mask,
  Grids,
  ExcelXP,
  Registry,
  FileCtrl;

const
  numbtarif = 14;
  cDiffOperation: array[0..2] of string = (
    '=',
    '>=',
    '<='
  );

type
  TStringArray = array of string;

  TIntArray = array of integer;

procedure SetPoint(edt: TEdit);//установить запятую с учетом копеек

function CheckNumb(edt: TEdit): boolean;
function CheckInt(edt: TEdit): boolean;
function CheckRus(edt: TEdit): boolean;
function CheckDate(edt: TMaskEdit): boolean;

function IsNumber(str: string): boolean;//строка состоит только из чисел и запятой
function IsInt(str: string): boolean;   //строка состоит только из цифр
function IsRus(str: string): boolean;
function IsDate(str: string): boolean;

function FindReg(RegNumber, b: integer; buffer: array of integer): integer;//найти рег номер
function FindCl(RegNumber: integer; buffer: array of integer): integer;    //найти рег номер

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

function GetMonthsCount(BeginDate, EndDate: TDateTime; var DaysCount: byte): integer;

{******************************************************************************}
function RefToCell(ARow, ACol: integer): string;
function ExportGridToExcel(AGrid: TStringGrid; ASheetName, AFileName: string): boolean;
{******************************************************************************}
function FileVersion(AFileName: string): string;
function GetTempDir: string;
function getConfValue(str: string): variant;
function SelectDir: string;
procedure FormerStringGrid(StrGrid: TStringGrid; SGHead: TStringArray; SGColWidths: TIntArray; RecCount: integer);

implementation

uses
  datamodule,
  dateutils,
  Math,
  Graphics,
  main;

procedure SetPoint(edt: TEdit);
{*******************************************************************************
  Процедура SetPoint установливает запятую с учетом копеек
*******************************************************************************}
var
  r, str: string;
  len: integer;
begin
  str := edt.Text;
  if (str <> '') and IsNumber(str) then
  begin
    if (Pos(',', str) = 0) then
    begin//если запятой нет
      len := Length(str);
      if len > 2 then
        edt.Text := Copy(str, 0, len - 2) + ',' + Copy(str, len - 1, 2);
      if (len > 0) and (len < 3) then
      begin
        if len = 1 then
          r := '0';
        edt.Text := '0,' + r + Copy(str, len - 1, 2);
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
  Функция IsRus проверяет является ли строка набором кириллических символов.
  Если является, то возвращается true, иначе false.
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
  Функция FlToStr переводит число в строку. Число, представленное строкой, должно
  содержать не более 2 знаков после запятой.
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
Процедура ToRow производит разложение в ряд дробной части числа.
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
  Функция Rnd производит округление числа до 2 знаков.
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
  Функция IsNumber проверяет состоит ли строка только из цифр и запятой. Если да,
  то возвращается true.
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
  Функция IsInt проверяет является ли строка датой. Если да,
  то возвращается true.
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
  Функция IsInt проверяет состоит ли строка только из цифр. Если да,
  то возвращается true.
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
  Процедура проверяет является ли строка в поле ввода числом, если нет, то цвет
  шрифта в поле ввода становится красным, а поле ввода обнуляется.
*******************************************************************************}
begin
  if not IsNumber(Edt.Text) then
  begin
    ShowMessage('В этом поле может быть только число!');
    Edt.Text := '0.00';
    Result := False;
  end
  else
    Result := True;
end;

function CheckDate(edt: TMaskEdit): boolean;
{*******************************************************************************
  Процедура проверяет является ли строка в поле ввода датой, если нет, то цвет
  шрифта в поле ввода становится красным, а поле ввода обнуляется.
*******************************************************************************}
begin
  if not IsDate(Edt.Text) then
  begin
    ShowMessage('Неверно введена дата!');
    Edt.Text := Form1.rdt;
    Result := False;
  end
  else
    Result := True;
end;

function CheckInt(edt: TEdit): boolean;
{*******************************************************************************
  Процедура проверяет является ли строка в поле ввода целым числом, если нет, то цвет
  шрифта в поле ввода становится красным, а поле ввода обнуляется.
*******************************************************************************}
begin
  if not IsInt(Edt.Text) then
  begin
    ShowMessage('В этом поле может быть только целое число!');
    Edt.Text := '0';
    Result := False;
  end
  else
    Result := True;
end;

function CheckRus(edt: TEdit): boolean;
{*******************************************************************************
  Процедура проверяет является ли строка в поле ввода набором кириллических символов,
  если нет, то цвет шрифта в поле ввода становится красным, а поле ввода очищается.
*******************************************************************************}
begin
  if not IsRus(edt.Text) then
  begin
    ShowMessage('Можно использовать буквы только кириллицы!');
    edt.Text := '';
    Result := False;
  end
  else
    Result := True;
end;

function FindCl(RegNumber: integer; buffer: array of integer): integer;
{*******************************************************************************
  Функция FindCl находит регистрационный номер в массиве buffer и возвращает его
  индекс.
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to Length(buffer) - 1 do
    if buffer[i] = RegNumber then
    begin
      Result := i;
      exit;
    end;
  if i = Length(buffer) then
    Result := -1;
end;

function FindReg(RegNumber, b: integer; buffer: array of integer): integer;
{*******************************************************************************
  Функция FindCl находит регистрационный номер в массиве buffer и возвращает его
  индекс.
*******************************************************************************}
var
  a, c: integer;
begin
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
  Функция GetName определяет название поля fld
*******************************************************************************}
begin
  Result := fld.FieldName;
end;

function GetType(fld: TField): TFldType;
{*******************************************************************************
  Функция GetType определяет тип поля fld
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
  Функция GetSize определяет размер поля fld
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
  Функция GetPrec определяет количество знаков после запятой поля fld
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
  Процедура создает таблицу и заполняет ее данными из Query1 с кодировкой code
  (OEM или ANSI)
*******************************************************************************}
var
  i: integer;
begin
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
    while not Query1.EOF do
    begin
      dbf1.Append;
      for i := 1 to Query1.FieldCount do
        EditField(Query1.Fields[i - 1].AsString, code, i);
      Dbf1.Post;
      Query1.Next;
    end;
    dbf1.Close;
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
    //необходимо для кодировки OEM
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
  Процедура FillCurr заполняет таблицы текущих значений тарифов, стандартов и
  прожиточных минимумов.
*******************************************************************************}
begin
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
  Процедура FillTarif заполняет таблицу текущих значений тарифов без бойлера
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
  Процедура FillTarifb заполняет таблицу текущих значений тарифов с бойлером
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
  Процедура Fillel заполняет таблицу текущих значений тарифов на э/э
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
  Процедура FillMin заполняет таблицу текущих значений прожиточных минимумов
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
  Процедура FillMdd заполняет таблицу текущих значений мдд
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
  Процедура FillStnd заполняет таблицу текущих значений региональных стандартов
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

function GetMonthsCount(BeginDate, EndDate: TDateTime; var DaysCount: byte): integer;
{*******************************************************************************
 Функция, которая возвращает разницу между двумя датами в месяцах.
 Исходные данные: BeginDate, EndDate - начальная и конечная даты;
                  DaysCount - остаток разницы в днях (хотя скорее она исходная
                              данная, а выходная).
 Выходные данные: возвращает разницу между датами в месяцах.
*******************************************************************************}

var
  Days1, Days2,             // количество дней начальной и конечной дат
  Months1, Months2,         // количество месяцев начальной и конечной дат
  Years1, Years2: integer;  // количество лет начальной и конечной дат
  BufferDate: TDateTime;    // буфер для обмена значениями
begin
  if BeginDate > EndDate then  // сравниваем даты, если начальная позднее
  begin                        // конечной, то меняем даты между собой
    BufferDate := BeginDate;
    BeginDate := EndDate;
    EndDate := BufferDate;
  end;
  Days1  := StrToInt(FormatDateTime('dd', BeginDate));     // считываем количе-
  Days2  := StrToInt(FormatDateTime('dd', EndDate));       // ство дней, месяцев
  Months1 := StrToInt(FormatDateTime('mm', BeginDate));    // и лет каждой из дат
  Months2 := StrToInt(FormatDateTime('mm', EndDate));      // и заносим в соот-
  Years1 := StrToInt(FormatDateTime('yyyy', BeginDate));   // ветствующие пере-
  Years2 := StrToInt(FormatDateTime('yyyy', EndDate));     // менные
  // Вычисляем суммарную разницу между датами по разницам в годах*12 и месяцах
  Result := (Years2 - Years1) * 12 + (Months2 - Months1);
  // Учитываем влияние разницы в днях на количество месяцев + остаток в днях в
  // переменной DaysCount
  if (Days2 - Days1) < 0 then
  begin  // если разница отрицательна, то
    Result := Result - 1;  // производим заем месяца из имеющихся
    // В зависимости от месяца в "меньшей" дате, вычисляем остаток в днях
    case Months1 of
      1, 3, 5, 7, 8, 10, 12: DaysCount := 31 - Days1 + Days2;
      4, 6, 9, 11: DaysCount := 30 - Days1 + Days2;
      // В случае февраля учитываем также високосность года
      2: if (Years2 mod 4 = 0) and (Years2 mod 100 <> 0) then
          DaysCount := 29 - Days1 + Days2
        else
        if (Years2 mod 100 = 0) and (Years2 mod 400 = 0) then
          DaysCount := 29 - Days1 + Days2
        else
          DaysCount := 28 - Days1 + Days2;
    end;
  end  // конец действий при отрицательной разнице дней
  else  // при положительной или нулевой разнице дней
    DaysCount := Days2 - Days1;  // банальная разность
end;

{StringGrid->ExcelExport*******************************************************}
function RefToCell(ARow, ACol: integer): string;
begin
  Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;

function ExportGridToExcel(AGrid: TStringGrid; ASheetName, AFileName: string): boolean;
var //Row, Col: Integer;
  Sheet, Data: olevariant;
  i, j: integer;
  ExcelApp: TExcelApplication;
begin
  // Prepare Data
  Data := VarArrayCreate([1, AGrid.RowCount, 1, AGrid.colcount], varVariant);
  for i := 0 to AGrid.colcount - 1 do
    for j := 0 to AGrid.RowCount - 1 do
      Data[j + 1, i + 1] := AGrid.Cells[i, j];

  ExcelApp := TExcelApplication.Create(nil);
  Result := False;

  try
    with ExcelApp do
    begin
      Visible[0] := False;
      try
        Workbooks.Add(AFileName, 1);
        Result := True;
      except
        // Error ?
      end;

      Sheet := Form1.ExcelApplication1.WorkSheets[1];
      Sheet.Name := ASheetName;
      // Fill up the sheet
      Sheet.Range[RefToCell(1, 1), RefToCell(AGrid.RowCount, AGrid.colcount)].Value := Data;
      Visible[0] := True;
    end;
  finally

  end;
end;

function FileVersion(AFileName: string): string;
{*******************************************************************************
    Функция возвращает версию файла
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
    Функция возвращает путь к папки %TEMP%
*******************************************************************************}
var
  Buf: array[0..1023] of char;
begin
  SetString(Result, Buf, GetTempPath(Sizeof(Buf) - 1, Buf));
end;

function getConfValue(str: string): variant;
{*******************************************************************************
    Функция getConfValue возвращает значение переменной в реестре, которое
    соответсвует определенному свойству компонента.
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
begin
  if SelectDirectory('Select directory', '', dir, [sdShowShares, sdNewUI, sdValidateDir, sdNewFolder]) then
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
  for i := 0 to length(SGHead) - 1 do
    StrGrid.Cells[i, 0] := SGHead[i];
  for i := 0 to length(SGColWidths) - 1 do
    StrGrid.ColWidths[i] := SGColWidths[i];
end;

end.
