unit rrecalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleServer, ExcelXP;

type
  TForm43 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form43: TForm43;

implementation

uses datamodule, main, progress, service;

{$R *.dfm}

procedure TForm43.Button1Click(Sender: TObject);
{
  Процедура формирует список уведомлений клиентов о перерасчете субсидий. Список
  выходит в файл MS Excel.
}
var
  p,n,otdel{,c1,c2}: string;
  k,{i,}cnt{,fl}: integer;
  pr: TAboutBox1;
begin
  p := ExtractFilePath(Application.ExeName);
  pr := TAboutBox1.Create(Application);
  pr.Label1.Caption := 'Формирование уведомлений о перерасчете субсидий';
  pr.Label2.Caption := 'Обработано записей:';
  pr.Label3.Caption := '';
  pr.Show;
  pr.Update;
  SendMessage(pr.Handle, wm_paint, 0, 0);
  pr.ProgressBar1.Step := 1;
  cnt := 0;
  k := 1;
  case Form1.dist of
    2: otdel := 'Ленинскому';
    3: otdel := 'Октябрьскому';
    4: otdel := 'Советскому';
    6: otdel := 'Центральному';
    7: otdel := 'Кировскому';
  end;
  with ExcelApplication1 do begin
    Visible[0] := false;
    Workbooks.Add(p + 'reports\recalc.xlt', 1);
    with Datamodule1.Query1 do begin
      Close;
      SQL.Clear;
      SQL.Add('execute getclinfo :id,:d');
      ParamByName('id').AsInteger := Form1.dist;
      ParamByName('d').AsString := Form1.rdt; //DateToStr(IncMonth(StrToDate(Form1.rdt), -1));
      Open;
      pr.ProgressBar1.Max := RecordCount;
      while not eof do begin
        n := IntToStr(k);
        Range['b'+n,'b'+n].Value2 := 'БУ ОБЛАСТНОЙ ЦЕНТР ЖИЛИЩНЫХ СУБСИДИЙ СОЦИАЛЬНЫХ ВЫПЛАТ И ЛЬГОТ';
        Range['b'+n,'b'+n].HorizontalAlignment := xlCenter;
        inc(k);n := IntToStr(k);
        Range['b'+n,'b'+n].Value2 := 'Уведомление №0'+FieldByName('regn').AsString + ' по ' + otdel + 'округу';
        Range['b'+n,'b'+n].HorizontalAlignment := xlCenter;
        inc(k,2);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Заявитель';
        Range['b'+n,'b'+n].Value2 := FieldByName('fio').AsString;
        inc(k);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Адрес, телефон';
        Range['b'+n,'b'+n].Value2 := Form1.GenAddr(FieldByName('namestreet').AsString,
                                              FieldByName('nhouse').AsString,
                                              FieldByName('corp').AsString,
                                              FieldByName('apart').AsString);
        inc(k);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Распорядитель';
        Range['b'+n,'b'+n].Value2 := FieldByName('namemng').AsString;
        inc(k);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Сроки предоставления субсидии';
        Range['b'+n,'b'+n].Value2 := 'с '+FieldByName('bdate').AsString+
                                      ' по '+FieldByName('edate').AsString;
        inc(k);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Сумма субсидии с '+Form1.rdt+'г. составляет '+FlToStr(FieldByName('sub').AsFloat)+'руб. в связи с изменением';
        inc(k);n := IntToStr(k);
        if CheckBox1.Checked then
          Range['a'+n,'a'+n].Value2 := CheckBox1.Caption;
        if CheckBox2.Checked then
          Range['a'+n,'a'+n].Value2 := Range['a'+n,'a'+n].Value2 + ', '+CheckBox2.Caption;
        if CheckBox3.Checked then
          Range['a'+n,'a'+n].Value2 := Range['a'+n,'a'+n].Value2 + ', '+CheckBox3.Caption;
        if CheckBox4.Checked then
          Range['a'+n,'a'+n].Value2 := Range['a'+n,'a'+n].Value2 + ', '+Memo1.Text;
        inc(k,2);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Заведующий филиалом';
        Range['c'+n,'c'+n].Value2 := FieldByName('boss').AsString;
        inc(k,2);n := IntToStr(k);
        Range['a'+n,'a'+n].Value2 := 'Уведомление получил "   " ____________ '+Copy(Form1.rdt,7,4)+'г.';
        Range['c'+n,'c'+n].Value2 := '/подпись клиента/';
        inc(cnt);
        if cnt mod 5 = 0 then
          k := 71*((k div 71)+1)+1
        else
          inc(k,2);
{        if cnt mod 2=0 then begin
          c1 := 'a';
          c2 := 'b';
        end
        else begin
          c1 := 'c';
          c2 := 'd';
        end;
        n := IntToStr(k);fl := k;
        Range[c1+n,c1+n].Value2 := 'ЦЕНТР СОЦИАЛЬНЫХ и ЖИЛИЩНЫХ СУБСИДИЙ';
        inc(k);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Уведомление №0'+FieldByName('regn').AsString;
        inc(k,2);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Заявитель';
        Range[c2+n,c2+n].Value2 := FieldByName('fio').AsString;
        inc(k);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Адрес, телефон';
        Range[c2+n,c2+n].Value2 := GenAddr(FieldByName('namestreet').AsString,
                                              FieldByName('nhouse').AsString,
                                              FieldByName('corp').AsString,
                                              FieldByName('apart').AsString);
        inc(k);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Распорядитель';
        Range[c2+n,c2+n].Value2 := FieldByName('namemng').AsString;
        inc(k);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Сроки субсидии';
        Range[c2+n,c2+n].Value2 := 'с '+FieldByName('bdate').AsString+
                                      ' по '+FieldByName('edate').AsString;
        inc(k,2);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Сумма субсидии с '+rdt+'г. составляет '+FlToStr(FieldByName('sub').AsFloat)+'руб.';
        inc(k);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'в связи с изменением _______________________';
        inc(k,2);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Начальник '+otdel+' отдела ГЦСЖС';
        inc(k);n := IntToStr(k);
        Range[c2+n,c2+n].Value2 := FieldByName('boss').AsString;
        inc(k,2);n := IntToStr(k);
        Range[c1+n,c1+n].Value2 := 'Уведомление получил "    " ____________ '+Copy(rdt,7,4)+'г.';
        inc(k);n := IntToStr(k);
        Range[c2+n,c2+n].Value2 := '/подпись клиента/';
        inc(cnt);
        if cnt mod 2<>0 then
          k := fl
        else begin
          if cnt mod 8 = 0 then
            k := 71*((k div 71)+1)+1
          else
            inc(k,3);
        end;    }
        pr.ProgressBar1.StepIt;
        pr.Label3.Caption := IntToStr(cnt);
        pr.Update;
        SendMessage(pr.Handle, wm_paint, 0, 0);
        Next;
      end;
      Close;
    end;
    pr.Close;
    pr.Release;
    Visible[0] := true;
  end;
  Close;
end;

procedure TForm43.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
