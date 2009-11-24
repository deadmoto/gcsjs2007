unit chhouse;

interface

uses
  Classes,
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
  TForm30 = class(TForm)
    SGH:        TStringGrid;
    Panel1:     TPanel;
    FlowPanel1: TFlowPanel;
    Button4:    TButton;
    Button1:    TButton;
    Button2:    TButton;
    Button3:    TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure LVHCompare(Sender: TObject; Item1, Item2: TListItem; Data: integer; var Compare: integer);
    procedure FormShow(Sender: TObject);
    procedure SGHSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure SGHDblClick(Sender: TObject);
  private
    { Private declarations }
    h: array of integer;//список домов
    //    procedure ClearSG;
    function NewPlace(id: integer; s: string): integer;
    procedure InsertH(i1, i2: integer);
    procedure DelRow(i: integer);
    function GenAddr(s, n, c: string): string;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
    house:  integer;//текущий дом
    procedure AddH(id: integer);//добавить  в lvh
    procedure ModH(id: integer);//изменить  в lvh
    procedure DelH(id: integer);
    procedure SetDefault;
  end;

var
  Form30: TForm30;

implementation

uses
  houses,
  datamodule,
  main,
  service;

{$R *.dfm}

function TForm30.GenAddr(s, n, c: string): string;
  {функция генерирует адрес(улица+дом) из входных данных.}
begin
  Result := s + ',д.' + n;
  if c <> '' then
    Result := Result + '/' + c;
end;

procedure TForm30.Button1Click(Sender: TObject);
begin
  Form24.status := 0;
  Form24.sec := status;
  Form24.ShowModal;
end;

procedure TForm30.Button2Click(Sender: TObject);
begin
  if (Length(h) > 0) then
  begin
    Form24.status := 1;
    Form24.sec := status;
    Form24.ShowModal;
  end
  else
    ShowMessage('База пуста!');
end;

procedure TForm30.Button3Click(Sender: TObject);
begin
  if (Length(h) > 0) then
  begin
    Form24.status := 2;
    Form24.sec := status;
    Form24.ShowModal;
  end
  else
    ShowMessage('База пуста!');
end;

procedure TForm30.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm30.LVHCompare(Sender: TObject; Item1, Item2: TListItem; Data: integer; var Compare: integer);
var
  ind1, ind2, h1, h2: integer;
begin
  ind1 := Item1.index;
  ind2 := Item2.index;
  Compare := CompareText(Item1.Caption, Item2.Caption);
  if Compare > 0 then
  begin
    h1 := h[ind2];
    h2 := h[ind1];
    h[ind1] := h1;
    h[ind2] := h2;
  end;
end;

procedure TForm30.AddH(id: integer);//добавить  в lvh
var
  s:  string;
  pl: integer;
begin
  with Datamodule1.Query1 do
  begin
    SetLength(h, Length(h) + 1);
    Close;
    SQL.Clear;
    SQL.Add('select nhouse,corp,namestreet');
    SQL.Add('from house inner join strt on');
    SQL.Add('house.id_street=strt.id_street');
    SQL.Add('where (house.id_house=:h)and(house.id_dist=:idd)');
    ParamByName('h').AsInteger := id;
    ParamByName('idd').AsInteger := Form1.dist;
    Open;
    house := id;
    s := GenAddr(FieldByName('namestreet').AsString, FieldByName('nhouse').AsString,
      FieldByName('corp').AsString);
    if (SGH.RowCount > 1) or (SGH.RowCount = 1) and (SGH.Cells[0, 0] <> '') then
      pl := NewPlace(Length(h) - 1, s)
    else
      pl := 0;
    SGH.Cells[0, pl] := s;
    Close;
  end;
end;

procedure TForm30.ModH(id: integer);//изменить  в lvh
var
  i, pl: integer;
  s: string;
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select nhouse,corp,namestreet');
    SQL.Add('from house inner join strt on');
    SQL.Add('house.id_street=strt.id_street');
    SQL.Add('where (house.id_house=:h)and(house.id_dist=:idd)');
    ParamByName('h').AsInteger := id;
    ParamByName('idd').AsInteger := Form1.dist;
    Open;
    house := id;
    s := GenAddr(FieldByName('namestreet').AsString, FieldByName('nhouse').AsString,
      FieldByName('corp').AsString);
    for i := 0 to Length(h) - 1 do
      if h[i] = id then
        break;
    DelRow(i);
    SetLength(h, Length(h) + 1);
    h[Length(h) - 1] := id;
    pl := NewPlace(Length(h) - 1, s);
    SGH.Cells[0, pl] := s;
    Close;
  end;
end;

procedure TForm30.DelH(id: integer);
var
  ind, i: integer;
  c:  array of integer;
  rt: TGridRect;
begin
  for ind := 0 to Length(h) - 1 do
    if h[ind] = id then
      break;
  DelRow(ind);
  if ind > 0 then
  begin
    Dec(ind);
    rt.Left := 0;
    rt.Right := 0;
    rt.Top := ind;
    rt.Bottom := ind;
    SGH.Selection := rt;
    SetLength(c, Length(h) - ind - 1);
    for i := 0 to Length(c) - 1 do
      c[i] := h[i + ind + 1];
    SetLength(h, Length(h) - 1);
    for i := 0 to Length(c) - 1 do
      h[ind + i] := c[i];
  end
  else
    SetLength(h, Length(h) - 1);
end;

procedure TForm30.FormShow(Sender: TObject);
begin
  //  ClearSG;
  SetDefault;

  if status = 0 then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
    Button2.Caption := 'Просмотр';
  end
  else
  begin
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
    Button2.Caption := 'Изменить';
  end;
end;

procedure TForm30.SGHSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  house := h[ARow];
end;

procedure TForm30.SetDefault;
var
  c, i: integer;
  s: string;
begin
  SetLength(h, 0);
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_house, nhouse, corp, namestreet');
    SQL.Add('from house inner join strt');
    SQL.Add('on house.id_street=strt.id_street');
    SQL.Add('where id_dist=:idd');
    SQL.Add('order by namestreet, nhouse, corp');
    ParamByName('idd').AsInteger := Form1.dist;
    Open;
    First;

    c := RecordCount;
    SetLength(h, c);

    SGH.RowCount := c;
    house := FieldByName('id_house').AsInteger;

    for i := 0 to c - 1 do
    begin
      h[i] := FieldByName('id_house').AsInteger;
      s := GenAddr(FieldByName('namestreet').AsString, FieldByName('nhouse').AsString,
        FieldByName('corp').AsString);
      SGH.Cells[0, i] := s;
      Next;
    end;
    Close;
  end;
end;

procedure TForm30.SGHDblClick(Sender: TObject);
begin
  if (SGH.RowCount > 0) and (SGH.Cells[0, 0] <> '') then
  begin
    Form24.status := 1;
    Form24.sec := status;
    Form24.ShowModal;
  end;
end;

{procedure TForm30.ClearSG;
begin
  SetLength(h, 0);
  with SGH do
  begin
    RowCount := 1;
    Cells[0, 0] := '';
    Cells[1, 0] := '';
    Cells[2, 0] := '';
    Cells[3, 0] := '';
  end;
end;
}
function TForm30.NewPlace(id: integer; s: string): integer;
{
  Новое место для записи S в StringGrid.
}
var
  i, c: integer;
begin
  Result := 0;
  for i := 0 to SGH.RowCount - 1 do
  begin
    C := CompareText(SGH.Cells[0, i], s);
    if C > 0 then
    begin //первая > второй
      InsertH(id, i);
      Result := i;
      break;
    end;
    if C = 0 then
    begin
      Result := i;
      exit;
    end;
  end;
  if (i = SGH.RowCount) then//т.е. все строки
    Result := SGH.RowCount - 1;
end;

procedure TForm30.InsertH(i1, i2: integer);
{
  поместить элемент с номером i1 на место i2, остальные
  элементы сдвинуть
}
var
  i, c: integer;
  cs: string;
begin
  c  := h[i1];
  cs := SGH.Cells[0, i1];
  for i := Length(h) - 1 downto i2 + 1 do
  begin
    h[i] := h[i - 1];
    SGH.Cells[0, i] := SGH.Cells[0, i - 1];
  end;
  h[i2] := c;
  SGH.Cells[0, i2] := cs;
end;

procedure TForm30.DelRow(i: integer);
var
  j: integer;
begin
  if SGH.RowCount > 1 then
  begin
    for j := i to SGH.RowCount - 1 do
    begin
      SGH.Cells[0, j] := SGH.Cells[0, j + 1];
      h[j] := h[j + 1];
    end;
    SGH.RowCount := SGH.RowCount - 1;
    SetLength(h, Length(h) - 1);
  end
  else
    SGH.Cells[0, 0] := '';
end;

end.
