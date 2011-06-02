unit curhist;

interface

uses
  Classes,
  Client,
  ComCtrls,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TCl = packed record
    reg: array of integer;
    sub: array of real;
    fio: array of string;
  end;

  TForm18 = class(TForm)
    GroupBox1:  TGroupBox;
    SGH:        TStringGrid;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGHSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure SGHDblClick(Sender: TObject);
    procedure SGHKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure SGHKeyPress(Sender: TObject; var Key: char);
  private
    { Private declarations }
    procedure Clear;
  public
    { Public declarations }
    client:  integer;
    fio:     string;
    status:  integer;
    changes: boolean;
    procedure ModSub(n: integer; s: real);
  end;

var
  Form18: TForm18;

implementation

uses
  datamodule,
  loop,
  Math,
  service,
  main,
  dateutils,
  MyTypes;

{$R *.dfm}

//id_debt в запросах означает что запись в базе смотриться только по ручному удержанию (занесенному через эту форму)

var
  cl: TCl;

procedure TForm18.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.sqlQuery1.Close;
end;

procedure TForm18.ModSub(n: integer; s: real);
var
  sum: real;
  i: integer;
begin
  cl.sub[SGH.Row - 1] := s;
  sum := 0;
  SGH.Cells[2, SGH.Row] := FormatFloat('0.00', (s));
  for i := 0 to Length(cl.reg) - 1 do
    sum := sum + cl.sub[i];
  StatusBar1.Panels[1].Text := 'Сумма субсидий: ' + FormatFloat('0.00', (sum));
end;

procedure TForm18.Clear;
var
  i: integer;
begin
  SetLength(cl.reg, 0);
  SetLength(cl.fio, 0);
  SetLength(cl.sub, 0);
  with SGH do
  begin
    RowCount  := 2;
    FixedRows := 1;
    for i := 1 to RowCount - 1 do
    begin
      Cells[0, i] := '';
      Cells[1, i] := '';
      Cells[2, i] := '';
    end;
  end;
  StatusBar1.Panels[1].Text := 'Сумма субсидий: ' + '0.00';
  StatusBar1.Panels[0].Text := 'Клиентов: ' + '0';
end;

procedure TForm18.FormShow(Sender: TObject);
var
  i: integer;
  sum: real;
begin
  Clear;
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text :=
      'exec getcurhist_query ' +  quotedstr(MainForm.rdt) + ',' + IntToStr(MainForm.dist);
    Open;
    i := 0;
    if not EOF then
    begin
      while not EOF do
      begin
        SetLength(cl.reg, i + 1);
        SetLength(cl.fio, i + 1);
        SetLength(cl.sub, i + 1);
        cl.fio[i] := FieldByName('fio').AsString;
        cl.reg[i] := FieldByName('regn').AsInteger;
        cl.sub[i] := FieldByName('s1').AsFloat - FieldByName('s2').AsFloat;
        Inc(i);
        Next;
      end;
      Close;
      client := cl.reg[0];
      fio := cl.fio[0];
    end;
  end;
  SGH.RowCount := Length(cl.reg) + 1;
  sum := 0;
  for i := 0 to Length(cl.reg) - 1 do
  begin
    SGH.Cells[0, i + 1] := cl.fio[i];
    SGH.Cells[1, i + 1] := IntToStr(cl.reg[i]);
    SGH.Cells[2, i + 1] := FormatFloat('0.00', (cl.sub[i]));
    sum := sum + cl.sub[i];
  end;

  changes := False;

  StatusBar1.Panels[1].Text := 'Сумма субсидий: ' + FormatFloat('0.00', (sum));
  StatusBar1.Panels[0].Text := 'Клиентов: ' + IntToStr(Length(cl.reg));
end;

procedure TForm18.FormCreate(Sender: TObject);
begin
  FormerStringGrid(SGH, TStringArray.Create('ФИО', 'Рег.номер', 'Субсидия'),
    TIntArray.Create(240, 70, 70), 2);

  //для быстрого поиска по фамилии
  ItemIndex := -1;
  LastTime  := Time;
end;

procedure TForm18.SGHSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if Length(cl.reg) > 0 then
  begin
    client := cl.reg[ARow - 1];
    fio := cl.fio[ARow - 1];
  end;
end;

procedure TForm18.SGHDblClick(Sender: TObject);
begin
  Form16.status := status;
  if Length(cl.reg) > 0 then
    Form16.ShowModal;
end;

procedure TForm18.SGHKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = (vk_return) then
  begin
    Form16.status := status;
    if Length(cl.reg) > 0 then
      Form16.ShowModal;
  end;
end;

procedure TForm18.SGHKeyPress(Sender: TObject; var Key: char);
{
  Процедура обработки нажатия клавиш на клавиатуре. Используется для быстрого
  поиска ФИО клиента в stringgrid.
}
var
  s: word;
begin
  //поиск клиента по набору символов
  if (Key in ['а'..'я']) or (Key in ['А'..'Я']) then
  begin
    s := MilliSecondsBetween(Time, LastTime);
    if (s > 1000) then//новый поиск
      searchbuf := Key
    else
    begin
      Dec(ItemIndex);
      searchbuf := searchbuf + Key;
    end;
    LastTime  := Time;
    ItemIndex := SG_Find(SGH, searchbuf, 0);
    if (ItemIndex <> -1) then
      SGH.Row := ItemIndex;
  end;
end;

end.
