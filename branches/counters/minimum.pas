unit minimum;

interface

uses
  Classes,
  Controls,
  Dialogs,
  Forms,
  Graphics,
  Grids,
  Mask,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows,
  ExtCtrls;

type
  TForm13 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label1:      TLabel;
    Label2:      TLabel;
    Label3:      TLabel;
    Edit1:       TEdit;
    Edit2:       TEdit;
    Edit3:       TEdit;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button4Click(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//текущие значения полей до изменения
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form13: TForm13;

implementation

uses
  datamodule,
  main,
  service;

{$R *.dfm}

procedure TForm13.SetDefault;
var
  i: integer;
begin
  with DataModule1.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "curlmin.dbf" sbros');
    SQL.Add('order by sbros.id_min');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'Минимум'),
    TIntArray.Create(25, 200, 65), Datamodule1.qTarif.RecordCount + 1);

  for i := 0 to Datamodule1.qTarif.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := Datamodule1.qTarif.FieldByName('id_min').Value;
    StringGrid1.Cells[1, i + 1] := Datamodule1.qTarif.FieldByName('namemin').Value;
    StringGrid1.Cells[2, i + 1] := Datamodule1.qTarif.FieldByName('minim').Value;
    Datamodule1.qTarif.Next;
  end;
end;

procedure TForm13.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{ выбрана ячейка }
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[2, ARow];
    Edit3.Text := StringGrid1.Cells[0, ARow];
    if Edit3.Text <> '' then
      oldid := StrToInt(Edit3.Text);
  end;
end;

procedure TForm13.Button4Click(Sender: TObject);
{ выйти }
begin
  Form13.Close;
end;

procedure TForm13.Button1Click(Sender: TObject);
{ добавить минимум }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_min');
      SQL.Add('from lmin');
      SQL.Add('where (id_min=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_min');
        SQL.Add('from lmin');
        SQL.Add('where (namemin=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty then
          flag := True
        else
          flag := False;
        Close;
      end
      else
      begin
        flag := False;
        Close;
      end;
      if flag then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into lmin');
        SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:minim)');
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('minim').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        FillMin(Form1.bpath, Form1.rdt, Form1.codedbf);
        oldid := StrToInt(Edit3.Text);
      end
      else
        ShowMessage('Наименование социально-демографической группы и кода должны быть уникальны!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm13.Button2Click(Sender: TObject);
{ изменить минимум }
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_min');
      SQL.Add('from lmin');
      SQL.Add('where (id_min=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_min').AsInteger = oldid) then
      begin
        if IsEmpty then
          flag := False
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('select id_min');
          SQL.Add('from lmin');
          SQL.Add('where (id_min=:id)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          ParamByName('d').AsString := Form1.rdt;
          Open;
          if IsEmpty then
            flag := False
          else
            flag := True;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select id_min');
        SQL.Add('from lmin');
        SQL.Add('where (namemin=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_min').AsInteger = oldid) then
        begin
          if not flag then
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into lmin');
            SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:minim)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('update lmin');
            SQL.Add('set namemin = :name, minim = :minim');
            SQL.Add('where (id_min = :id)and(sdate=Convert(smalldatetime,:d,104))');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('minim').AsFloat := StrToFloat(Edit2.Text);
          ExecSQL;
          FillMin(Form1.bpath, Form1.rdt, Form1.codedbf);
          oldid := StrToInt(Edit3.Text);
        end
        else
          ShowMessage('Наименование социально-демографической группы должно быть уникальным!');
      end
      else
        ShowMessage('Наименование социально-демографической группы должно быть уникальным!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Оба поля ввода должны быть заполнены!');
end;

procedure TForm13.Button3Click(Sender: TObject);
{ удалить минимум }
begin
  with DataModule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from lmin');
    SQL.Add('where (id_min=:id)and(sdate=Convert(smalldatetime,:d,104))');
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillMin(Form1.bpath, Form1.rdt, Form1.codedbf);
  end;
  SetDefault;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  SetDefault;
  if status = 0 then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
  end
  else
  begin
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
  end;
end;

procedure TForm13.Edit3Exit(Sender: TObject);
begin
  CheckInt(edit3);
end;

procedure TForm13.Edit2Exit(Sender: TObject);
begin
  SetPoint(Edit2);
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
  Datamodule1.qTarif.Close;
end;

procedure TForm13.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm13.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(edit1);
end;

procedure TForm13.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    SetPoint(edit2);
end;

procedure TForm13.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(edit3);
end;

end.
