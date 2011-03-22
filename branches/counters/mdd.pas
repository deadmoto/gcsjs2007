unit mdd;

interface

uses
  Classes,
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
  TForm20 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label3:      TLabel;
    Label1:      TLabel;
    Label2:      TLabel;
    Edit3:       TEdit;
    Edit1:       TEdit;
    Edit2:       TEdit;
    FlowPanel1:  TFlowPanel;
    Button4:     TButton;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
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
  Form20: TForm20;

implementation

uses
  service, main, datamodule, MyTypes;

{$R *.dfm}

procedure TForm20.SetDefault;
var
  i: integer;
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "curmdd.dbf" sbros');
    SQL.Add('order by sbros.id_mdd');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'МДД'),
    TIntArray.Create(25, 220, 40), DModule.qTarif.RecordCount + 1);

  for i := 0 to DModule.qTarif.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.qTarif.FieldByName('id_mdd').Value;
    StringGrid1.Cells[1, i + 1] := DModule.qTarif.FieldByName('namegroup').Value;
    StringGrid1.Cells[2, i + 1] := DModule.qTarif.FieldByName('vmdd').Value;
    DModule.qTarif.Next;
  end;
end;

procedure TForm20.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
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

procedure TForm20.Button4Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TForm20.Button1Click(Sender: TObject);
{ добавить мдд }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_mdd');
      SQL.Add('from mdd');
      SQL.Add('where (id_mdd=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_mdd');
        SQL.Add('from mdd');
        SQL.Add('where (namegroup=:name)');
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
        SQL.Add('insert into mdd');
        SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:v)');
        ParamByName('d').AsString  := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('v').AsInteger := StrToInt(Edit2.Text);
        ExecSQL;
        FillMdd(Form1.bpath, Form1.rdt, Form1.codedbf);
        oldid := StrToInt(Edit3.Text);
      end
      else
        ShowMessage('Наименование социальной группы и кода должны быть уникальны!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm20.Button2Click(Sender: TObject);
{ изменить мдд }
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_mdd');
      SQL.Add('from mdd');
      SQL.Add('where (id_mdd=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_mdd').AsInteger = oldid) then
      begin
        if IsEmpty then
          flag := False
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('select id_mdd');
          SQL.Add('from mdd');
          SQL.Add('where (id_mdd=:id)and(sdate=Convert(smalldatetime,:d,104))');
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
        SQL.Add('select id_mdd');
        SQL.Add('from mdd');
        SQL.Add('where (namegroup=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_mdd').AsInteger = oldid) then
        begin
          if not flag then
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into mdd');
            SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:v)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('update mdd');
            SQL.Add('set namegroup = :name, vmdd = :v');
            SQL.Add('where (id_mdd = :id)and(sdate=Convert(smalldatetime,:d,104))');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('d').AsString  := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('v').AsInteger := StrToInt(Edit2.Text);
          ExecSQL;
          FillMdd(Form1.bpath, Form1.rdt, Form1.codedbf);
          oldid := StrToInt(Edit3.Text);
        end
        else
          ShowMessage('Наименование социальной группы должно быть уникальным!');
      end
      else
        ShowMessage('Наименование социальной группы должно быть уникальным!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Оба поля ввода должны быть заполнены!');
end;

procedure TForm20.Button3Click(Sender: TObject);
{ удалить минимум }
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from mdd');
    SQL.Add('where (id_mdd=:id)and(sdate=Convert(smalldatetime,:d,104))');
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillMdd(Form1.bpath, Form1.rdt, Form1.codedbf);
  end;
  SetDefault;
end;

procedure TForm20.FormShow(Sender: TObject);
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

procedure TForm20.Edit2Exit(Sender: TObject);
begin
  CheckInt(Tedit(Sender));
end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.Query1.Close;
  DModule.qTarif.Close;
end;

procedure TForm20.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm20.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(edit1);
end;

procedure TForm20.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(edit2);
end;



end.
