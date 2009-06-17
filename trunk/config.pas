unit config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TForm25 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
    insp: array of integer;//список id_insp
    dist: array of integer;//список id_dist
    procedure Fill;
    procedure Clear;
    function SelInsp(n: integer): string;
    function SearchInsp(s: string): integer;
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm25.Fill;
var
  l: integer;
begin
  with Datamodule1.Query1 do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from dist');
    SQL.Add('order by namedist');
    Open;
    First;
    while not EOF do begin
      SetLength(dist, Length(dist)+1);
      Combobox2.Items.Add(FieldByName('namedist').AsString);
      dist[l] := FieldByName('id_dist').AsInteger;
      if dist[l]=Form1.dist then begin
        Combobox2.ItemIndex := l;
        Combobox2.Text := FieldByName('namedist').AsString;
      end;
      Next;
      inc(l);
    end;
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_insp, nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (status = :st) and (id_dist = :id)');
    SQL.Add('order by nameinsp');
    ParamByName('st').AsInteger := 1;//только активные инспекторы
    ParamByName('id').AsInteger := dist[Combobox2.ItemIndex];
    Open;
    First;
    Combobox1.Text := FieldByName('nameinsp').AsString;
    while not EOF do begin
      SetLength(insp, Length(insp)+1);
      Combobox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      if insp[l]=Form1.insp then begin
        Combobox1.ItemIndex := l;
        Combobox1.Text := FieldByName('nameinsp').AsString;
      end;
      Next;
      inc(l);
    end;
    Close;
  end;
end;

procedure TForm25.Clear;
begin
  Combobox1.Clear;
  Combobox2.Clear;
end;

procedure TForm25.Button2Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TForm25.Button1Click(Sender: TObject);
{войти}
begin
  if Combobox1.Text <> '' then
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQL.Add('select *');
      SQL.Add('from insp');
      SQL.Add('where (id_insp = :id)and(id_dist=:idd)');
      ParamByName('id').AsInteger := insp[Combobox1.ItemIndex];
      ParamByName('idd').AsInteger := dist[Combobox2.ItemIndex];
      Open;
      if not IsEmpty then begin
        Form1.insp := insp[Combobox1.ItemIndex];
        Form1.dist := dist[Combobox2.ItemIndex];
        Form25.Close;
      end
      else
        ShowMessage('Вход невозможен! Введите другое ФИО!');
    end
  else
    ShowMessage('Поле ФИО должно быть заполнено!');
end;

procedure TForm25.FormShow(Sender: TObject);
begin
  Clear;
  Fill;
end;

procedure TForm25.ComboBox1Change(Sender: TObject);
var
  ind: integer;
begin
  ind := SearchInsp(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else begin
    Combobox1.ItemIndex := 0;
    Combobox1.Text := SelInsp(insp[0]);
  end;
end;

function TForm25.SearchInsp(s: string): integer;
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

function TForm25.SelInsp(n: integer): string;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (id_insp = :id)and(id_dist=:dist)');
    ParamByName('id').AsInteger := n;
    ParamByName('dist').AsInteger := dist[Combobox2.ItemIndex];
    Open;
    Result := FieldByName('nameinsp').AsString;
    Close;
  end;
end;

procedure TForm25.ComboBox2Change(Sender: TObject);
var
  l: integer;
begin
  with Datamodule1.Query1 do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select id_insp, nameinsp');
    SQL.Add('from insp');
    SQL.Add('where (status = :st) and (id_dist = :id)');
    SQL.Add('order by nameinsp');
    ParamByName('st').AsInteger := 1;//только активные инспекторы
    ParamByName('id').AsInteger := dist[Combobox2.ItemIndex];
    Open;
    First;
    Combobox1.Clear;
    Combobox1.Text := FieldByName('nameinsp').AsString;
    while not EOF do begin
      SetLength(insp, Length(insp)+1);
      Combobox1.Items.Add(FieldByName('nameinsp').AsString);
      insp[l] := FieldByName('id_insp').AsInteger;
      Next;
      inc(l);
    end;
    Close;
    Combobox1.ItemIndex := 0;
  end;
end;

end.
