unit sluj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DBGrids, OleServer, ExcelXP;

type
  TForm38 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ExcelApplication1: TExcelApplication;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    fnd,mng: array of integer;
    function SearchMng(s: string): integer;
    function SearchFnd(s: string): integer;
    function SelMng(n: integer): string;//выбрать распорядителя
    function SelFnd(n: integer): string;//выбрать фонд
    procedure Load;
    procedure PrintNachCr;
    procedure PrintNachExl;
    procedure SetParam(printJob: integer;ind: integer;v: string);
  public
    { Public declarations }
  end;

var
  Form38: TForm38;
  jobnumber: integer;

implementation

uses datamodule, main, DateUtils, service, CRDelphi;

{$R *.dfm}

procedure TForm38.Load;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select namefond, namemng, conts, reps, colds,');
    SQL.Add('hots, heats, gass, els, woods, coals');
    SQL.Add('from sluj inner join fond on sluj.id_fond=fond.id_fond');
    SQL.Add('inner join mng on mng.id_mng=sluj.id_mng');
    SQL.Add('where mng.id_dist=:d');
    SQL.Add('order by namefond, namemng');
    ParamByName('d').AsInteger := Form1.dist;
    Open;
    Combobox1.Text := DBGrid1.Fields[0].AsString;
    Combobox2.Text := DBGrid1.Fields[1].AsString;
    Edit1.Text := DBGrid1.Fields[2].AsString;
    Edit2.Text := DBGrid1.Fields[3].AsString;
    Edit3.Text := DBGrid1.Fields[4].AsString;
    Edit4.Text := DBGrid1.Fields[5].AsString;
    Edit5.Text := DBGrid1.Fields[6].AsString;
    Edit6.Text := DBGrid1.Fields[7].AsString;
    Edit7.Text := DBGrid1.Fields[8].AsString;
    Edit8.Text := DBGrid1.Fields[9].AsString;
    Edit9.Text := DBGrid1.Fields[10].AsString;
    combobox1.OnChange(combobox1);
    combobox2.OnChange(combobox2);
  end;
end;

procedure TForm38.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PEClosePrintJob(jobnumber);
  PECloseEngine;  {Close the Crystal Print Engine}
  Datamodule1.Query1.Close;
end;

procedure TForm38.FormShow(Sender: TObject);
var
  i:integer;
  filenme: pansichar;
begin
  Edit1.Text := '0';Edit2.Text := '0';Edit3.Text := '0';
  Edit4.Text := '0';Edit5.Text := '0';Edit6.Text := '0';
  Edit7.Text := '0';Edit8.Text := '0';Edit9.Text := '0';
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select id_fond, namefond');
    SQL.Add('from fond');
    SQL.Add('order by namefond');
    Open;
    i:=0;
    Combobox1.Items.Clear;
    while not eof do begin
      SetLength(fnd, Length(fnd)+1);
      fnd[i] := FieldByName('id_fond').AsInteger;
      Combobox1.Items.Add(FieldByName('namefond').AsString);
      Next;
      inc(i);
    end;
    Combobox1.ItemIndex := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_mng, namemng');
    SQL.Add('from mng');
    SQL.Add('where mng.id_dist=:d');
    SQL.Add('order by namemng');
    ParamByName('d').AsInteger := Form1.dist;
    Open;
    i:=0;
    Combobox2.Items.Clear;
    while not eof do begin
      SetLength(mng, Length(mng)+1);
      mng[i] := FieldByName('id_mng').AsInteger;
      Combobox2.Items.Add(FieldByName('namemng').AsString);
      Next;
      inc(i);
    end;
    Combobox2.ItemIndex := 0;
    Close;
  end;
  Load;
  PEOpenEngine;{Open the Crystal Print Engine}
  filenme := StrAlloc(80);
  StrPCopy(FileNme, ExtractFilePath(Application.ExeName)+ 'reports\nach.rpt');
  {Open the Report and assign the Job number}
  JobNumber := PEOpenPrintJob(FileNme);
end;

procedure TForm38.ComboBox2Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchMng(Combobox2.Text);
  if ind <> -1 then
    Combobox2.ItemIndex := ind
  else begin
    Combobox2.ItemIndex := 0;
    Combobox2.Text := SelMng(mng[0]);
  end;
end;

procedure TForm38.ComboBox1Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchFnd(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else begin
    Combobox1.ItemIndex := 0;
    Combobox1.Text := SelFnd(fnd[0]);
  end;
end;

procedure TForm38.Edit1Exit(Sender: TObject);
begin
  if not IsNumber(TEdit(Sender).Text) and(TEdit(Sender).Text<>'') then begin
    ShowMessage('В этом поле может быть только число!');
    TEdit(Sender).Text := '0';
  end;
end;

procedure TForm38.Button1Click(Sender: TObject);
//добавить запись в таблицу
begin
  if (StrToFloat(Edit1.Text)<>0)or(StrToFloat(Edit2.Text)<>0)or
     (StrToFloat(Edit3.Text)<>0)or(StrToFloat(Edit4.Text)<>0)or
     (StrToFloat(Edit5.Text)<>0)or(StrToFloat(Edit6.Text)<>0)or
     (StrToFloat(Edit7.Text)<>0)or(StrToFloat(Edit8.Text)<>0)or
     (StrToFloat(Edit9.Text)<>0)then begin
    with Datamodule1.Query1 do begin
      Close;
      SQL.Clear;
      SQL.Add('select id_fond, id_mng');
      SQL.Add('from sluj');
      SQL.Add('where (id_fond=:f) and (id_mng=:m)');
      ParamByName('f').AsInteger := fnd[Combobox1.ItemIndex];
      ParamByName('m').AsInteger := mng[Combobox2.ItemIndex];
      Open;
      if eof then begin
        Close;
        SQL.Clear;
        SQL.Add('insert into sluj');
        SQL.Add('values (:f,:m,:cont,:rep,:cold,:hot,:heat,:gas,:el,:wood,:coal)');
      end
      else begin
        Close;
        SQL.Clear;
        SQL.Add('update sluj');
        SQL.Add('set conts=conts+:cont,reps=reps+:rep,colds=colds+:cold,');
        SQL.Add('hots=hots+:hot,heats=heats+:heat,gass=gass+:gas,els=els+:el,');
        SQL.Add('woods=woods+:wood,coals=coals+:coal');
        SQL.Add('where (id_fond=:f) and (id_mng=:m)');
      end;
      ParamByName('f').AsInteger := fnd[Combobox1.ItemIndex];
      ParamByName('m').AsInteger := mng[Combobox2.ItemIndex];
      ParamByName('cont').AsFloat := StrToFloat(Edit1.Text);
      ParamByName('rep').AsFloat := StrToFloat(Edit2.Text);
      ParamByName('cold').AsFloat := StrToFloat(Edit3.Text);
      ParamByName('hot').AsFloat := StrToFloat(Edit4.Text);
      ParamByName('heat').AsFloat := StrToFloat(Edit5.Text);
      ParamByName('gas').AsFloat := StrToFloat(Edit6.Text);
      ParamByName('el').AsFloat := StrToFloat(Edit7.Text);
      ParamByName('wood').AsFloat := StrToFloat(Edit8.Text);
      ParamByName('coal').AsFloat := StrToFloat(Edit9.Text);
      ExecSQL;
    end;
    Load;
  end
  else
    ShowMessage('Добавляемая запись должна содержать хотя бы одно ненулевое поле!');
end;

procedure TForm38.Button2Click(Sender: TObject);
//изменить запись
begin
  if (StrToFloat(Edit1.Text)<>0)or(StrToFloat(Edit2.Text)<>0)or
     (StrToFloat(Edit3.Text)<>0)or(StrToFloat(Edit4.Text)<>0)or
     (StrToFloat(Edit5.Text)<>0)or(StrToFloat(Edit6.Text)<>0)or
     (StrToFloat(Edit7.Text)<>0)or(StrToFloat(Edit8.Text)<>0)or
     (StrToFloat(Edit9.Text)<>0)then begin
    with Datamodule1.Query1 do begin
      Close;
      SQL.Clear;
      SQL.Add('update sluj');
      SQL.Add('set conts=:cont,reps=:rep,colds=:cold,');
      SQL.Add('hots=:hot,heats=:heat,gass=:gas,els=:el,woods=:wood,coals=:coal');
      SQL.Add('where (id_fond=:f) and (id_mng=:m)');
      ParamByName('f').AsInteger := fnd[Combobox1.ItemIndex];
      ParamByName('m').AsInteger := mng[Combobox2.ItemIndex];
      ParamByName('cont').AsFloat := StrToFloat(Edit1.Text);
      ParamByName('rep').AsFloat := StrToFloat(Edit2.Text);
      ParamByName('cold').AsFloat := StrToFloat(Edit3.Text);
      ParamByName('hot').AsFloat := StrToFloat(Edit4.Text);
      ParamByName('heat').AsFloat := StrToFloat(Edit5.Text);
      ParamByName('gas').AsFloat := StrToFloat(Edit6.Text);
      ParamByName('el').AsFloat := StrToFloat(Edit7.Text);
      ParamByName('wood').AsFloat := StrToFloat(Edit8.Text);
      ParamByName('coal').AsFloat := StrToFloat(Edit9.Text);
      ExecSQL;
    end;
    Load;
  end
  else
    ShowMessage('Запись должна содержать хотя бы одно ненулевое поле! Либо удалите исходную запись, либо введите хотя бы одно ненулевое значение!');
end;

procedure TForm38.Button3Click(Sender: TObject);
//удалить запись
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from sluj');
    SQL.Add('where (id_fond=:f) and (id_mng=:m)');
    ParamByName('f').AsInteger := fnd[Combobox1.ItemIndex];
    ParamByName('m').AsInteger := mng[Combobox2.ItemIndex];
    ExecSQL;
  end;
  Load;
end;

procedure TForm38.Button4Click(Sender: TObject);
//сформировать отчет
begin
  PrintNachCr;
end;

procedure TForm38.Button5Click(Sender: TObject);
//выйти
begin
  Close;
end;

procedure TForm38.Button6Click(Sender: TObject);
//очистить таблицу
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from sluj');
    ExecSQL;
  end;
  Load;
end;

function TForm38.SearchMng(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox2.Items.Count-1 do begin
    if Combobox2.Items.Strings[i]=s then
      break;
  end;
  if i<combobox2.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm38.SearchFnd(s: string): integer;
var
  i: integer;
begin
  for i:=0 to combobox1.Items.Count-1 do begin
    if Combobox1.Items.Strings[i]=s then
      break;
  end;
  if i<combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

function TForm38.SelMng(n: integer): string;//выбрать распорядителя
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select namemng');
    SQL.Add('from mng');
    SQL.Add('where (id_mng = :id)');
    ParamByName('id').AsInteger := n;
    Open;
    Result := FieldByName('namemng').AsString;
    Close;
  end;
end;

function TForm38.SelFnd(n: integer): string;//выбрать фонд
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

procedure TForm38.DBGrid1CellClick(Column: TColumn);
begin
  Combobox1.Text := DBGrid1.Fields[0].AsString;
  Combobox2.Text := DBGrid1.Fields[1].AsString;
  Edit1.Text := DBGrid1.Fields[2].AsString;
  Edit2.Text := DBGrid1.Fields[3].AsString;
  Edit3.Text := DBGrid1.Fields[4].AsString;
  Edit4.Text := DBGrid1.Fields[5].AsString;
  Edit5.Text := DBGrid1.Fields[6].AsString;
  Edit6.Text := DBGrid1.Fields[7].AsString;
  Edit7.Text := DBGrid1.Fields[8].AsString;
  Edit8.Text := DBGrid1.Fields[9].AsString;
  Edit9.Text := DBGrid1.Fields[10].AsString;
end;

procedure TForm38.PrintNachCr;
//сформировать отчет Cristal
var
  m,y: integer;
  m1,y1: string;
begin
  //параметры
  m := StrToInt(Copy(Form1.dt,3,2));
  y := StrToInt(Copy(Form1.dt,1,2));
  if m<10 then
    m1 := '0'+IntToStr(m)
  else
    m1 := IntToStr(m);
  if y<10 then
    y1 := '200'+IntToStr(y)
  else
    y1 := '20'+IntToStr(y);
  SetParam(jobnumber,0,'01.'+m1+'.'+y1);
  SetParam(jobnumber,1,IntToStr(Form1.dist));
  if not PEOutputToWindow(JobNumber,'Отчет о начислении',30,30,600,400,0,0) then
    ShowMessage('Ошибка вывода на экран!')
  else
    if PEStartPrintJob(JobNumber, True) = False then
      ShowMessage('Ошибка вывода на печать!');
end;

procedure TForm38.PrintNachExl;
//сформировать отчет Excel
var
  j, k, m, y, page: integer;
  RangeE: ExcelRange;
  nd, n, boss, s, fond: string;
  sum,sump,sums,fsumy,fsumpy,gsum,gsump,gsums,gsumy,gsumpy: array of real;
begin
  Close;
  with ExcelApplication1 do begin
    Visible[0] := true;
    Workbooks.Add('d:\sub\reports\nach.xlt', 0);
    page:=1;
    Range['k1','k1'].Value2 := 'Лист ' + IntToStr(page);
    RangeE := Range['a2','a2'];
    with Datamodule1.Query1 do begin
      Close;
      SQl.Clear;
      SQL.Add('select namedist, boss from dist');
      SQL.Add('where id_dist=:id');
      ParamByName('id').AsInteger := Form1.dist;
      Open;
      nd := FieldByName('namedist').AsString;
      boss := FieldByName('boss').AsString;
      Close;
    end;
    nd := nd + ' округ. Отчет о начислении жилищных субсидий за ';
    m:=MONTHOF(Date);
    y:=YEAROF(Date);
    case m of
    12:RangeE.Value2:= nd + 'Декабрь '+IntToStr(y) + 'г.';
    1:RangeE.Value2:= nd + 'Январь '+IntToStr(y) + 'г.';
    2:RangeE.Value2:= nd + 'Февраль '+IntToStr(y) + 'г.';
    3:RangeE.Value2:= nd + 'Март '+IntToStr(y) + 'г.';
    4:RangeE.Value2:= nd + 'Апрель '+IntToStr(y) + 'г.';
    5:RangeE.Value2:= nd + 'Май '+IntToStr(y) + 'г.';
    6:RangeE.Value2:= nd + 'Июнь '+IntToStr(y) + 'г.';
    7:RangeE.Value2:= nd + 'Июль '+IntToStr(y) + 'г.';
    8:RangeE.Value2:= nd + 'Август '+IntToStr(y) + 'г.';
    9:RangeE.Value2:= nd + 'Сентябрь '+IntToStr(y) + 'г.';
    10:RangeE.Value2:= nd + 'Октябрь '+IntToStr(y) + 'г.';
    11:RangeE.Value2:= nd + 'Ноябрь '+IntToStr(y) + 'г.';
    end;
    //данные
    k:=0;
    SetLength(sum, 10);SetLength(sump, 10);SetLength(sums, 10);
    SetLength(fsumy, 10);SetLength(fsumpy, 10);
    SetLength(gsum, 10);SetLength(gsump, 10);SetLength(gsums, 10);
    SetLength(gsumy, 10);SetLength(gsumpy, 10);
    with Datamodule1.Query1 do begin
      Close;
      SQL.Clear;
      SQL.Add('execute nach :s, :d');
      ParamByName('s').AsString := '01.08.2005';// + Copy(Form1.dt,3,2)+'.20'+Copy(Form1.dt,1,2);
      ParamByName('d').AsString := IntToStr(Form1.dist);
      Open;
      while not eof do begin
        n := IntToStr(5+k);
        s := FieldByName('namefond').AsString;
        //старая группа
        if (k<>0)and(fond=FieldByName('namefond').AsString) then begin
          sum[0] := sum[0] + FieldByName('num').AsInteger;
          sum[1] := sum[1] + FieldByName('cont').AsFloat;
          sum[2] := sum[2] + FieldByName('rep').AsFloat;
          sum[3] := sum[3] + FieldByName('cold').AsFloat;
          sum[4] := sum[4] + FieldByName('hot').AsFloat;
          sum[5] := sum[5] + FieldByName('heat').AsFloat;
          sum[6] := sum[6] + FieldByName('gas').AsFloat;
          sum[7] := sum[7] + FieldByName('el').AsFloat;
          sum[8] := sum[8] + FieldByName('wood').AsFloat;
          sum[9] := sum[9] + FieldByName('coal').AsFloat;
          Range['a'+n,'a'+n].Value2 := FieldByName('namemng').AsString;
          Range['b'+n,'b'+n].Value2 := FieldByName('num').AsInteger;
          Range['c'+n,'c'+n].Value2 := FieldByName('cont').AsFloat;
          Range['d'+n,'d'+n].Value2 := FieldByName('rep').AsFloat;
          Range['e'+n,'e'+n].Value2 := FieldByName('cold').AsFloat;
          Range['f'+n,'f'+n].Value2 := FieldByName('hot').AsFloat;
          Range['g'+n,'g'+n].Value2 := FieldByName('heat').AsFloat;
          Range['h'+n,'h'+n].Value2 := FieldByName('gas').AsFloat;
          Range['i'+n,'i'+n].Value2 := FieldByName('el').AsFloat;
          Range['j'+n,'j'+n].Value2 := FieldByName('wood').AsFloat;
          Range['k'+n,'k'+n].Value2 := FieldByName('coal').AsFloat;
          Range['l'+n,'l'+n].Value2 := FieldByName('sumall').AsFloat;
          Range['a'+n,'a'+n].Font.Size := 8;
          Range['b'+n,'l'+n].Font.Size := 9;
          if (FieldByName('nump').AsInteger<>0) then begin
            inc(k);
            n := IntToStr(5+k);
            sump[0] := sump[0] + FieldByName('nump').AsInteger;
            sump[1] := sump[1] + FieldByName('contp').AsFloat;
            sump[2] := sump[2] + FieldByName('repp').AsFloat;
            sump[3] := sump[3] + FieldByName('coldp').AsFloat;
            sump[4] := sump[4] + FieldByName('hotp').AsFloat;
            sump[5] := sump[5] + FieldByName('heatp').AsFloat;
            sump[6] := sump[6] + FieldByName('gasp').AsFloat;
            sump[7] := sump[7] + FieldByName('elp').AsFloat;
            sump[8] := sump[8] + FieldByName('woodp').AsFloat;
            sump[9] := sump[9] + FieldByName('coalp').AsFloat;
            Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
            Range['b'+n,'b'+n].Value2 := FieldByName('nump').AsInteger;
            Range['c'+n,'c'+n].Value2 := FieldByName('contp').AsFloat;
            Range['d'+n,'d'+n].Value2 := FieldByName('repp').AsFloat;
            Range['e'+n,'e'+n].Value2 := FieldByName('coldp').AsFloat;
            Range['f'+n,'f'+n].Value2 := FieldByName('hotp').AsFloat;
            Range['g'+n,'g'+n].Value2 := FieldByName('heatp').AsFloat;
            Range['h'+n,'h'+n].Value2 := FieldByName('gasp').AsFloat;
            Range['i'+n,'i'+n].Value2 := FieldByName('elp').AsFloat;
            Range['j'+n,'j'+n].Value2 := FieldByName('woodp').AsFloat;
            Range['k'+n,'k'+n].Value2 := FieldByName('coalp').AsFloat;
            Range['l'+n,'l'+n].Value2 := FieldByName('sumallp').AsFloat;
            Range['a'+n,'a'+n].Font.Size := 7;
            Range['a'+n,'a'+n].Font.Italic := true;
            Range['b'+n,'l'+n].Font.Size := 9;
          end;
          if (FieldByName('id_fond_1').AsInteger<>0) then begin
            inc(k);
            n := IntToStr(5+k);
            sums[1] := sums[1] + sum[1] - FieldByName('conts').AsFloat;
            sums[2] := sums[2] + sum[2] - FieldByName('reps').AsFloat;
            sums[3] := sums[3] + sum[3] - FieldByName('colds').AsFloat;
            sums[4] := sums[4] + sum[4] - FieldByName('hots').AsFloat;
            sums[5] := sums[5] + sum[5] - FieldByName('heats').AsFloat;
            sums[6] := sums[6] + sum[6] - FieldByName('gass').AsFloat;
            sums[7] := sums[7] + sum[7] - FieldByName('els').AsFloat;
            sums[8] := sums[8] + sum[8] - FieldByName('woods').AsFloat;
            sums[9] := sums[9] + sum[9] - FieldByName('coals').AsFloat;
            Range['a'+n,'a'+n].Value2 := 'Итого с учетом служебных';
            Range['c'+n,'c'+n].Value2 := sum[1] - FieldByName('conts').AsFloat;
            Range['d'+n,'d'+n].Value2 := sum[2] - FieldByName('reps').AsFloat;
            Range['e'+n,'e'+n].Value2 := sum[3] - FieldByName('colds').AsFloat;
            Range['f'+n,'f'+n].Value2 := sum[4] - FieldByName('hots').AsFloat;
            Range['g'+n,'g'+n].Value2 := sum[5] - FieldByName('heats').AsFloat;
            Range['h'+n,'h'+n].Value2 := sum[6] - FieldByName('gass').AsFloat;
            Range['i'+n,'i'+n].Value2 := sum[7] - FieldByName('els').AsFloat;
            Range['j'+n,'j'+n].Value2 := sum[8] - FieldByName('woods').AsFloat;
            Range['k'+n,'k'+n].Value2 := sum[9] - FieldByName('coals').AsFloat;
            Range['l'+n,'l'+n].Value2 := sum[1]+sum[2]+sum[3]+
            sum[4]+sum[5]+sum[6]+sum[7]+sum[8]+sum[9]-FieldByName('conts').AsFloat-
            FieldByName('reps').AsFloat-FieldByName('colds').AsFloat-
            FieldByName('hots').AsFloat-FieldByName('heats').AsFloat-
            FieldByName('gass').AsFloat-FieldByName('els').AsFloat-
            FieldByName('woods').AsFloat-FieldByName('coals').AsFloat;
            Range['a'+n,'a'+n].Font.Size := 7;
            Range['a'+n,'a'+n].Font.Italic := true;
            Range['b'+n,'l'+n].Font.Size := 9;
            Range['b'+n,'l'+n].Font.Italic := true;
          end;
          Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
        end
        else begin//новая группа
          if k<>0 then begin
            //подводим итоги предыдущей группы
            Range['a'+n,'a'+n].Value2 := 'Итого';
            Range['b'+n,'b'+n].Value2 := sum[0];
            Range['c'+n,'c'+n].Value2 := sum[1];
            Range['d'+n,'d'+n].Value2 := sum[2];
            Range['e'+n,'e'+n].Value2 := sum[3];
            Range['f'+n,'f'+n].Value2 := sum[4];
            Range['g'+n,'g'+n].Value2 := sum[5];
            Range['h'+n,'h'+n].Value2 := sum[6];
            Range['i'+n,'i'+n].Value2 := sum[7];
            Range['j'+n,'j'+n].Value2 := sum[8];
            Range['k'+n,'k'+n].Value2 := sum[9];
            Range['l'+n,'l'+n].Value2 := sum[1]+sum[2]+sum[3]+sum[4]+
                                        sum[5]+ sum[6]+sum[7]+sum[8]+sum[9];
            Range['a'+n,'a'+n].Font.Size := 9;
            Range['a'+n,'a'+n].Font.Bold := true;
            Range['b'+n,'l'+n].Font.Size := 9;
            Range['b'+n,'l'+n].Font.Bold := true;
            if sump[0]<>0 then begin
              inc(k);
              n := IntToStr(5+k);
              Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
              Range['b'+n,'b'+n].Value2 := sump[0];
              Range['c'+n,'c'+n].Value2 := sump[1];
              Range['d'+n,'d'+n].Value2 := sump[2];
              Range['e'+n,'e'+n].Value2 := sump[3];
              Range['f'+n,'f'+n].Value2 := sump[4];
              Range['g'+n,'g'+n].Value2 := sump[5];
              Range['h'+n,'h'+n].Value2 := sump[6];
              Range['i'+n,'i'+n].Value2 := sump[7];
              Range['j'+n,'j'+n].Value2 := sump[8];
              Range['k'+n,'k'+n].Value2 := sump[9];
              Range['l'+n,'l'+n].Value2 := sump[1]+sump[2]+sump[3]+sump[4]+
                                        sump[5]+ sump[6]+sump[7]+sump[8]+sump[9];
              Range['a'+n,'a'+n].Font.Size := 7;
              Range['a'+n,'a'+n].Font.Italic := true;
              Range['b'+n,'l'+n].Font.Size := 9;
              Range['b'+n,'l'+n].Font.Bold := true;
            end;
            if sums[1]<>0 then begin
              inc(k);
              n := IntToStr(5+k);
              Range['a'+n,'a'+n].Value2 := 'Итого с учетом служебных';
              Range['c'+n,'c'+n].Value2 := sums[1];
              Range['d'+n,'d'+n].Value2 := sums[2];
              Range['e'+n,'e'+n].Value2 := sums[3];
              Range['f'+n,'f'+n].Value2 := sums[4];
              Range['g'+n,'g'+n].Value2 := sums[5];
              Range['h'+n,'h'+n].Value2 := sums[6];
              Range['i'+n,'i'+n].Value2 := sums[7];
              Range['j'+n,'j'+n].Value2 := sums[8];
              Range['k'+n,'k'+n].Value2 := sums[9];
              Range['l'+n,'l'+n].Value2 := sums[1]+sums[2]+sums[3]+sums[4]+
                                        sums[5]+ sums[6]+sums[7]+sums[8]+sums[9];
              Range['a'+n,'a'+n].Font.Size := 9;
              Range['a'+n,'a'+n].Font.Bold := true;
              Range['a'+n,'a'+n].Font.Italic := true;
              Range['b'+n,'l'+n].Font.Size := 9;
              Range['b'+n,'l'+n].Font.Bold := true;
              Range['b'+n,'l'+n].Font.Italic := true;
            end;
            Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
            inc(k);
            n := IntToStr(5+k);
            Range['a'+n,'a'+n].Value2 := 'Итого с начала года';
            Range['c'+n,'c'+n].Value2 := fsumy[1];
            Range['d'+n,'d'+n].Value2 := fsumy[2];
            Range['e'+n,'e'+n].Value2 := fsumy[3];
            Range['f'+n,'f'+n].Value2 := fsumy[4];
            Range['g'+n,'g'+n].Value2 := fsumy[5];
            Range['h'+n,'h'+n].Value2 := fsumy[6];
            Range['i'+n,'i'+n].Value2 := fsumy[7];
            Range['j'+n,'j'+n].Value2 := fsumy[8];
            Range['k'+n,'k'+n].Value2 := fsumy[9];
            Range['l'+n,'l'+n].Value2 := fsumy[1]+fsumy[2]+fsumy[3]+fsumy[4]+
                                        fsumy[5]+ fsumy[6]+fsumy[7]+fsumy[8]+fsumy[9];
            Range['a'+n,'a'+n].Font.Size := 9;
            Range['a'+n,'a'+n].Font.Bold := true;
            Range['b'+n,'l'+n].Font.Size := 9;
            Range['b'+n,'l'+n].Font.Bold := true;
            if fsumpy[1]<>0 then begin
              inc(k);
              n := IntToStr(5+k);
              Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
              Range['c'+n,'c'+n].Value2 := fsumpy[1];
              Range['d'+n,'d'+n].Value2 := fsumpy[2];
              Range['e'+n,'e'+n].Value2 := fsumpy[3];
              Range['f'+n,'f'+n].Value2 := fsumpy[4];
              Range['g'+n,'g'+n].Value2 := fsumpy[5];
              Range['h'+n,'h'+n].Value2 := fsumpy[6];
              Range['i'+n,'i'+n].Value2 := fsumpy[7];
              Range['j'+n,'j'+n].Value2 := fsumpy[8];
              Range['k'+n,'k'+n].Value2 := fsumpy[9];
              Range['l'+n,'l'+n].Value2 := fsumpy[1]+fsumpy[2]+fsumpy[3]+fsumpy[4]+
                                        fsumpy[5]+ fsumpy[6]+fsumpy[7]+fsumpy[8]+fsumpy[9];
              Range['a'+n,'a'+n].Font.Size := 7;
              Range['a'+n,'a'+n].Font.Italic := true;
              Range['b'+n,'l'+n].Font.Size := 8;
              Range['b'+n,'l'+n].Font.Bold := true;
            end;
            Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
            inc(k);
            n := IntToStr(5+k);
            for j:=0 to 9 do begin
              gsum[j] := gsum[j] + sum[j];
              gsump[j] := gsump[j] + sump[j];
              gsums[j] := gsums[j] + sums[j];
              gsumy[j] := gsumy[j] + fsumy[j];
              gsumpy[j] := gsumpy[j] + fsumpy[j];
              sum[j] := 0;
              sump[j] := 0;
              sums[j] := 0;
              fsumy[j] := 0;
              fsumpy[j] := 0;
            end;
          end;
          //новая группа
          fond := FieldByName('namefond').AsString;
          Range['a'+n,'a'+n].Value2 := fond;
          Range['a'+n,'a'+n].Font.Size := 10;
          Range['a'+n,'a'+n].Font.Bold := true;
          Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
          inc(k);
          n := IntToStr(5+k);
          fsumy[1] := FieldByName('conty').AsFloat;
          fsumy[2] := FieldByName('repy').AsFloat;
          fsumy[3] := FieldByName('coldy').AsFloat;
          fsumy[4] := FieldByName('hoty').AsFloat;
          fsumy[5] := FieldByName('heaty').AsFloat;
          fsumy[6] := FieldByName('gasy').AsFloat;
          fsumy[7] := FieldByName('ely').AsFloat;
          fsumy[8] := FieldByName('woody').AsFloat;
          fsumy[9] := FieldByName('coaly').AsFloat;
          fsumpy[1] := FieldByName('contpy').AsFloat;
          fsumpy[2] := FieldByName('reppy').AsFloat;
          fsumpy[3] := FieldByName('coldpy').AsFloat;
          fsumpy[4] := FieldByName('hotpy').AsFloat;
          fsumpy[5] := FieldByName('heatpy').AsFloat;
          fsumpy[6] := FieldByName('gaspy').AsFloat;
          fsumpy[7] := FieldByName('elpy').AsFloat;
          fsumpy[8] := FieldByName('woodpy').AsFloat;
          fsumpy[9] := FieldByName('coalpy').AsFloat;
          sum[0] := sum[0] + FieldByName('num').AsInteger;
          sum[1] := sum[1] + FieldByName('cont').AsFloat;
          sum[2] := sum[2] + FieldByName('rep').AsFloat;
          sum[3] := sum[3] + FieldByName('cold').AsFloat;
          sum[4] := sum[4] + FieldByName('hot').AsFloat;
          sum[5] := sum[5] + FieldByName('heat').AsFloat;
          sum[6] := sum[6] + FieldByName('gas').AsFloat;
          sum[7] := sum[7] + FieldByName('el').AsFloat;
          sum[8] := sum[8] + FieldByName('wood').AsFloat;
          sum[9] := sum[9] + FieldByName('coal').AsFloat;
          Range['a'+n,'a'+n].Value2 := FieldByName('namemng').AsString;
          Range['b'+n,'b'+n].Value2 := FieldByName('num').AsInteger;
          Range['c'+n,'c'+n].Value2 := FieldByName('cont').AsFloat;
          Range['d'+n,'d'+n].Value2 := FieldByName('rep').AsFloat;
          Range['e'+n,'e'+n].Value2 := FieldByName('cold').AsFloat;
          Range['f'+n,'f'+n].Value2 := FieldByName('hot').AsFloat;
          Range['g'+n,'g'+n].Value2 := FieldByName('heat').AsFloat;
          Range['h'+n,'h'+n].Value2 := FieldByName('gas').AsFloat;
          Range['i'+n,'i'+n].Value2 := FieldByName('el').AsFloat;
          Range['j'+n,'j'+n].Value2 := FieldByName('wood').AsFloat;
          Range['k'+n,'k'+n].Value2 := FieldByName('coal').AsFloat;
          Range['l'+n,'l'+n].Value2 := FieldByName('sumall').AsFloat;
          Range['a'+n,'a'+n].Font.Size := 8;
          Range['b'+n,'l'+n].Font.Size := 9;
          if (FieldByName('nump').AsInteger<>0) then begin
            inc(k);
            n := IntToStr(5+k);
            sump[0] := sump[0] + FieldByName('nump').AsInteger;
            sump[1] := sump[1] + FieldByName('contp').AsFloat;
            sump[2] := sump[2] + FieldByName('repp').AsFloat;
            sump[3] := sump[3] + FieldByName('coldp').AsFloat;
            sump[4] := sump[4] + FieldByName('hotp').AsFloat;
            sump[5] := sump[5] + FieldByName('heatp').AsFloat;
            sump[6] := sump[6] + FieldByName('gasp').AsFloat;
            sump[7] := sump[7] + FieldByName('elp').AsFloat;
            sump[8] := sump[8] + FieldByName('woodp').AsFloat;
            sump[9] := sump[9] + FieldByName('coalp').AsFloat;
            Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
            Range['b'+n,'b'+n].Value2 := FieldByName('nump').AsInteger;
            Range['c'+n,'c'+n].Value2 := FieldByName('contp').AsFloat;
            Range['d'+n,'d'+n].Value2 := FieldByName('repp').AsFloat;
            Range['e'+n,'e'+n].Value2 := FieldByName('coldp').AsFloat;
            Range['f'+n,'f'+n].Value2 := FieldByName('hotp').AsFloat;
            Range['g'+n,'g'+n].Value2 := FieldByName('heatp').AsFloat;
            Range['h'+n,'h'+n].Value2 := FieldByName('gasp').AsFloat;
            Range['i'+n,'i'+n].Value2 := FieldByName('elp').AsFloat;
            Range['j'+n,'j'+n].Value2 := FieldByName('woodp').AsFloat;
            Range['k'+n,'k'+n].Value2 := FieldByName('coalp').AsFloat;
            Range['l'+n,'l'+n].Value2 := FieldByName('sumallp').AsFloat;
            Range['a'+n,'a'+n].Font.Size := 7;
            Range['a'+n,'a'+n].Font.Italic := true;
            Range['b'+n,'l'+n].Font.Size := 9;
          end;
          if (FieldByName('id_fond_1').AsInteger<>0) then begin
            inc(k);
            n := IntToStr(5+k);
            sums[1] := sums[1] + sum[1] - FieldByName('conts').AsFloat;
            sums[2] := sums[2] + sum[2] - FieldByName('reps').AsFloat;
            sums[3] := sums[3] + sum[3] - FieldByName('colds').AsFloat;
            sums[4] := sums[4] + sum[4] - FieldByName('hots').AsFloat;
            sums[5] := sums[5] + sum[5] - FieldByName('heats').AsFloat;
            sums[6] := sums[6] + sum[6] - FieldByName('gass').AsFloat;
            sums[7] := sums[7] + sum[7] - FieldByName('els').AsFloat;
            sums[8] := sums[8] + sum[8] - FieldByName('woods').AsFloat;
            sums[9] := sums[9] + sum[9] - FieldByName('coals').AsFloat;
            Range['a'+n,'a'+n].Value2 := 'Итого с учетом служебных';
            Range['c'+n,'c'+n].Value2 := sum[1] - FieldByName('conts').AsFloat;
            Range['d'+n,'d'+n].Value2 := sum[2] - FieldByName('reps').AsFloat;
            Range['e'+n,'e'+n].Value2 := sum[3] - FieldByName('colds').AsFloat;
            Range['f'+n,'f'+n].Value2 := sum[4] - FieldByName('hots').AsFloat;
            Range['g'+n,'g'+n].Value2 := sum[5] - FieldByName('heats').AsFloat;
            Range['h'+n,'h'+n].Value2 := sum[6] - FieldByName('gass').AsFloat;
            Range['i'+n,'i'+n].Value2 := sum[7] - FieldByName('els').AsFloat;
            Range['j'+n,'j'+n].Value2 := sum[8] - FieldByName('woods').AsFloat;
            Range['k'+n,'k'+n].Value2 := sum[9] - FieldByName('coals').AsFloat;
            Range['l'+n,'l'+n].Value2 := sum[1]+sum[2]+sum[3]+
            sum[4]+sum[5]+sum[6]+sum[7]+sum[8]+sum[9]-FieldByName('conts').AsFloat-
            FieldByName('reps').AsFloat-FieldByName('colds').AsFloat-
            FieldByName('hots').AsFloat-FieldByName('heats').AsFloat-
            FieldByName('gass').AsFloat-FieldByName('els').AsFloat-
            FieldByName('woods').AsFloat-FieldByName('coals').AsFloat;
            Range['a'+n,'a'+n].Font.Size := 7;
            Range['a'+n,'a'+n].Font.Italic := true;
            Range['b'+n,'l'+n].Font.Size := 9;
            Range['b'+n,'l'+n].Font.Italic := true;
          end;
          Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
        end;
        inc(k);
        Next;
      end;
      n := IntToStr(5+k);
      Range['a'+n,'a'+n].Value2 := 'Итого';
      Range['b'+n,'b'+n].Value2 := sum[0];
      Range['c'+n,'c'+n].Value2 := sum[1];
      Range['d'+n,'d'+n].Value2 := sum[2];
      Range['e'+n,'e'+n].Value2 := sum[3];
      Range['f'+n,'f'+n].Value2 := sum[4];
      Range['g'+n,'g'+n].Value2 := sum[5];
      Range['h'+n,'h'+n].Value2 := sum[6];
      Range['i'+n,'i'+n].Value2 := sum[7];
      Range['j'+n,'j'+n].Value2 := sum[8];
      Range['k'+n,'k'+n].Value2 := sum[9];
      Range['l'+n,'l'+n].Value2 := sum[1]+sum[2]+sum[3]+sum[4]+
                                        sum[5]+ sum[6]+sum[7]+sum[8]+sum[9];
      Range['a'+n,'a'+n].Font.Size := 9;
      Range['a'+n,'a'+n].Font.Bold := true;
      Range['b'+n,'l'+n].Font.Size := 9;
      Range['b'+n,'l'+n].Font.Bold := true;
      if sump[0]<>0 then begin
        inc(k);
        n := IntToStr(5+k);
        Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
        Range['b'+n,'b'+n].Value2 := sump[0];
        Range['c'+n,'c'+n].Value2 := sump[1];
        Range['d'+n,'d'+n].Value2 := sump[2];
        Range['e'+n,'e'+n].Value2 := sump[3];
        Range['f'+n,'f'+n].Value2 := sump[4];
        Range['g'+n,'g'+n].Value2 := sump[5];
        Range['h'+n,'h'+n].Value2 := sump[6];
        Range['i'+n,'i'+n].Value2 := sump[7];
        Range['j'+n,'j'+n].Value2 := sump[8];
        Range['k'+n,'k'+n].Value2 := sump[9];
        Range['l'+n,'l'+n].Value2 := sump[1]+sump[2]+sump[3]+sump[4]+
                                        sump[5]+ sump[6]+sump[7]+sump[8]+sump[9];
        Range['a'+n,'a'+n].Font.Size := 7;
        Range['a'+n,'a'+n].Font.Italic := true;
        Range['b'+n,'l'+n].Font.Size := 9;
        Range['b'+n,'l'+n].Font.Bold := true;
      end;
      if sums[1]<>0 then begin
        inc(k);
        n := IntToStr(5+k);
        Range['a'+n,'a'+n].Value2 := 'Итого с учетом служебных';
        Range['c'+n,'c'+n].Value2 := sums[1];
        Range['d'+n,'d'+n].Value2 := sums[2];
        Range['e'+n,'e'+n].Value2 := sums[3];
        Range['f'+n,'f'+n].Value2 := sums[4];
        Range['g'+n,'g'+n].Value2 := sums[5];
        Range['h'+n,'h'+n].Value2 := sums[6];
        Range['i'+n,'i'+n].Value2 := sums[7];
        Range['j'+n,'j'+n].Value2 := sums[8];
        Range['k'+n,'k'+n].Value2 := sums[9];
        Range['l'+n,'l'+n].Value2 := sums[1]+sums[2]+sums[3]+sums[4]+
                                        sums[5]+ sums[6]+sums[7]+sums[8]+sums[9];
        Range['a'+n,'a'+n].Font.Size := 9;
        Range['a'+n,'a'+n].Font.Bold := true;
        Range['a'+n,'a'+n].Font.Italic := true;
        Range['b'+n,'l'+n].Font.Size := 9;
        Range['b'+n,'l'+n].Font.Bold := true;
        Range['b'+n,'l'+n].Font.Italic := true;
      end;
      Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
      inc(k);
      n := IntToStr(5+k);
      Range['a'+n,'a'+n].Value2 := 'Итого с начала года';
      Range['c'+n,'c'+n].Value2 := fsumy[1];
      Range['d'+n,'d'+n].Value2 := fsumy[2];
      Range['e'+n,'e'+n].Value2 := fsumy[3];
      Range['f'+n,'f'+n].Value2 := fsumy[4];
      Range['g'+n,'g'+n].Value2 := fsumy[5];
      Range['h'+n,'h'+n].Value2 := fsumy[6];
      Range['i'+n,'i'+n].Value2 := fsumy[7];
      Range['j'+n,'j'+n].Value2 := fsumy[8];
      Range['k'+n,'k'+n].Value2 := fsumy[9];
      Range['l'+n,'l'+n].Value2 := fsumy[1]+fsumy[2]+fsumy[3]+fsumy[4]+
                                        fsumy[5]+ fsumy[6]+fsumy[7]+fsumy[8]+fsumy[9];
      Range['a'+n,'a'+n].Font.Size := 9;
      Range['b'+n,'l'+n].Font.Bold := true;
      Range['b'+n,'l'+n].Font.Size := 9;
      Range['b'+n,'l'+n].Font.Bold := true;
      if fsumpy[1]<>0 then begin
        inc(k);
        n := IntToStr(5+k);
        Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
        Range['c'+n,'c'+n].Value2 := fsumpy[1];
        Range['d'+n,'d'+n].Value2 := fsumpy[2];
        Range['e'+n,'e'+n].Value2 := fsumpy[3];
        Range['f'+n,'f'+n].Value2 := fsumpy[4];
        Range['g'+n,'g'+n].Value2 := fsumpy[5];
        Range['h'+n,'h'+n].Value2 := fsumpy[6];
        Range['i'+n,'i'+n].Value2 := fsumpy[7];
        Range['j'+n,'j'+n].Value2 := fsumpy[8];
        Range['k'+n,'k'+n].Value2 := fsumpy[9];
        Range['l'+n,'l'+n].Value2 := fsumpy[1]+fsumpy[2]+fsumpy[3]+fsumpy[4]+
                                        fsumpy[5]+ fsumpy[6]+fsumpy[7]+fsumpy[8]+fsumpy[9];
        Range['a'+n,'a'+n].Font.Size := 7;
        Range['a'+n,'a'+n].Font.Italic := true;
        Range['b'+n,'l'+n].Font.Size := 8;
        Range['b'+n,'l'+n].Font.Bold := true;
      end;
      Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
      inc(k);
      n := IntToStr(5+k);
      for j:=0 to 9 do begin
        gsum[j] := gsum[j] + sum[j];
        gsump[j] := gsump[j] + sump[j];
        gsums[j] := gsums[j] + sums[j];
        gsumy[j] := gsumy[j] + fsumy[j];
        gsumpy[j] := gsumpy[j] + fsumpy[j];
        sum[j] := 0;
        sump[j] := 0;
        sums[j] := 0;
        fsumy[j] := 0;
        fsumpy[j] := 0;
      end;
      Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
      inc(k);
      n := IntToStr(5+k);
      Range['a'+n,'a'+n].Value2 := 'Общий итог';
      Range['b'+n,'b'+n].Value2 := gsum[0];
      Range['c'+n,'c'+n].Value2 := gsum[1];
      Range['d'+n,'d'+n].Value2 := gsum[2];
      Range['e'+n,'e'+n].Value2 := gsum[3];
      Range['f'+n,'f'+n].Value2 := gsum[4];
      Range['g'+n,'g'+n].Value2 := gsum[5];
      Range['h'+n,'h'+n].Value2 := gsum[6];
      Range['i'+n,'i'+n].Value2 := gsum[7];
      Range['j'+n,'j'+n].Value2 := gsum[8];
      Range['k'+n,'k'+n].Value2 := gsum[9];
      Range['l'+n,'l'+n].Value2 := gsum[1]+gsum[2]+gsum[3]+
                                    gsum[4]+gsum[5]+gsum[6]+gsum[7]+
                                    gsum[8]+gsum[9];
      Range['a'+n,'a'+n].Font.Size := 9;
      Range['b'+n,'l'+n].Font.Size := 9;
      Range['b'+n,'l'+n].Font.Bold := true;
      if gsump[0]<>0 then begin
        inc(k);
        n := IntToStr(5+k);
        Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
        Range['b'+n,'b'+n].Value2 := gsump[0];
        Range['c'+n,'c'+n].Value2 := gsump[1];
        Range['d'+n,'d'+n].Value2 := gsump[2];
        Range['e'+n,'e'+n].Value2 := gsump[3];
        Range['f'+n,'f'+n].Value2 := gsump[4];
        Range['g'+n,'g'+n].Value2 := gsump[5];
        Range['h'+n,'h'+n].Value2 := gsump[6];
        Range['i'+n,'i'+n].Value2 := gsump[7];
        Range['j'+n,'j'+n].Value2 := gsump[8];
        Range['k'+n,'k'+n].Value2 := gsump[9];
        Range['l'+n,'l'+n].Value2 := gsump[1]+gsump[2]+gsump[3]+
                                    gsump[4]+gsump[5]+gsump[6]+gsump[7]+
                                    gsump[8]+gsump[9];
        Range['a'+n,'a'+n].Font.Size := 8;
        Range['a'+n,'a'+n].Font.Italic := true;
        Range['b'+n,'l'+n].Font.Size := 9;
        Range['b'+n,'l'+n].Font.Bold := true;
      end;
      if gsums[1]<>0 then begin
        inc(k);
        n := IntToStr(5+k);
        Range['a'+n,'a'+n].Value2 := 'Общий итог с учетом служебных';
        Range['c'+n,'c'+n].Value2 := gsums[1];
        Range['d'+n,'d'+n].Value2 := gsums[2];
        Range['e'+n,'e'+n].Value2 := gsums[3];
        Range['f'+n,'f'+n].Value2 := gsums[4];
        Range['g'+n,'g'+n].Value2 := gsums[5];
        Range['h'+n,'h'+n].Value2 := gsums[6];
        Range['i'+n,'i'+n].Value2 := gsums[7];
        Range['j'+n,'j'+n].Value2 := gsums[8];
        Range['k'+n,'k'+n].Value2 := gsums[9];
        Range['l'+n,'l'+n].Value2 := gsums[1]+gsums[2]+gsums[3]+
                                    gsums[4]+gsums[5]+gsums[6]+gsums[7]+
                                    gsums[8]+gsums[9];
        Range['a'+n,'a'+n].Font.Size := 9;
        Range['a'+n,'a'+n].Font.Bold := true;
        Range['a'+n,'a'+n].Font.Italic := true;
        Range['b'+n,'l'+n].Font.Size := 9;
        Range['b'+n,'l'+n].Font.Bold := true;
        Range['b'+n,'l'+n].Font.Italic := true;
      end;
      Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
      inc(k);
      n := IntToStr(5+k);
      Range['a'+n,'a'+n].Value2 := 'Общий итог с начала года';
      Range['c'+n,'c'+n].Value2 := gsumy[1];
      Range['d'+n,'d'+n].Value2 := gsumy[2];
      Range['e'+n,'e'+n].Value2 := gsumy[3];
      Range['f'+n,'f'+n].Value2 := gsumy[4];
      Range['g'+n,'g'+n].Value2 := gsumy[5];
      Range['h'+n,'h'+n].Value2 := gsumy[6];
      Range['i'+n,'i'+n].Value2 := gsumy[7];
      Range['j'+n,'j'+n].Value2 := gsumy[8];
      Range['k'+n,'k'+n].Value2 := gsumy[9];
      Range['l'+n,'l'+n].Value2 := gsumy[1]+gsumy[2]+gsumy[3]+gsumy[4]+
                                        gsumy[5]+ gsumy[6]+gsumy[7]+gsumy[8]+gsumy[9];
      Range['a'+n,'a'+n].Font.Size := 9;
      Range['b'+n,'l'+n].Font.Size := 8;
      Range['b'+n,'l'+n].Font.Bold := true;
      if gsump[0]<>0 then begin
        inc(k);
        n := IntToStr(5+k);
        Range['a'+n,'a'+n].Value2 := 'в т.ч. по ПСС';
        Range['c'+n,'c'+n].Value2 := gsumpy[1];
        Range['d'+n,'d'+n].Value2 := gsumpy[2];
        Range['e'+n,'e'+n].Value2 := gsumpy[3];
        Range['f'+n,'f'+n].Value2 := gsumpy[4];
        Range['g'+n,'g'+n].Value2 := gsumpy[5];
        Range['h'+n,'h'+n].Value2 := gsumpy[6];
        Range['i'+n,'i'+n].Value2 := gsumpy[7];
        Range['j'+n,'j'+n].Value2 := gsumpy[8];
        Range['k'+n,'k'+n].Value2 := gsumpy[9];
        Range['l'+n,'l'+n].Value2 := gsumpy[1]+gsumpy[2]+gsumpy[3]+gsumpy[4]+
                                        gsumpy[5]+ gsumpy[6]+gsumpy[7]+gsumpy[8]+gsumpy[9];
        Range['a'+n,'a'+n].Font.Size := 7;
        Range['a'+n,'a'+n].Font.Italic := true;
        Range['b'+n,'l'+n].Font.Size := 8;
        Range['b'+n,'l'+n].Font.Bold := true;
      end;
      Range['a'+n,'l'+n].Borders.Item[xlBottom].LineStyle := xlContinuous;
      Close;
    end;
    k := k+4;
    n := IntToStr(7+k);
    Range['j'+n,'j'+n].Value2 := boss;
    case Form1.dist of
    2: Range['a'+n,'a'+n].Value2 := 'Начальник Ленинского отдела ГЦСЖС';
    3: Range['a'+n,'a'+n].Value2 := 'Начальник Октябрьского отдела ГЦСЖС';
    4: Range['a'+n,'a'+n].Value2 := 'Начальник Советского отдела ГЦСЖС';
    6: Range['a'+n,'a'+n].Value2 := 'Начальник Центрального отдела ГЦСЖС';
    7: Range['a'+n,'a'+n].Value2 := 'Начальник Кировского отдела ГЦСЖС';
    end;
  end;
end;

procedure TForm38.SetParam(printJob: integer;ind: integer;v: string);
var
  vInf: PEParameterFieldInfo;
  dte: PEParameterFieldValueTYPE;
  i: integer;
begin
  for i:=1 to Length(v) do
    dte[i-1] := v[i];
  dte[i-1] := #0;
  PEGetNthParameterField(printjob,ind,vInf);
  vInf.DefaultValueSet := 1;
  vInf.DefaultValue := dte;
  PESetNthParameterField(printjob,ind,vInf);
end;

end.
