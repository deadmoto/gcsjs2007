unit norm;

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
  TForm27 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label4: TLabel;
    Edit4: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    FlowPanel1: TFlowPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  Form27: TForm27;

implementation

uses
  datamodule,
  service,
  main;

{$R *.dfm}

procedure TForm27.SetDefault;
var
  i: integer;
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from norm');
    SQL.Add('order by id_norm');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Человек в семье', 'Норма пл.', 'Норма пл. для п/и', 'Норма тепла', 'Норма пл. для лгтн.'),
    TIntArray.Create(25, 96, 60, 105, 75, 105), Datamodule1.Query1.RecordCount + 1);

  for i := 0 to Datamodule1.Query1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_norm').Value;
    StringGrid1.Cells[1, i + 1] := Datamodule1.Query1.FieldByName('countp').Value;
    StringGrid1.Cells[2, i + 1] := Datamodule1.Query1.FieldByName('snorm').Value;
    StringGrid1.Cells[3, i + 1] := Datamodule1.Query1.FieldByName('psnorm').Value;
    StringGrid1.Cells[4, i + 1] := Datamodule1.Query1.FieldByName('hnorm').Value;
    StringGrid1.Cells[5, i + 1] := Datamodule1.Query1.FieldByName('phnorm').Value;
    Datamodule1.Query1.Next;
  end;
end;

procedure TForm27.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{ выбрана ячейка }
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[2, ARow];
    Edit5.Text := StringGrid1.Cells[3, ARow];
    Edit3.Text := StringGrid1.Cells[4, ARow];
    Edit6.Text := StringGrid1.Cells[5, ARow];
    Edit4.Text := StringGrid1.Cells[0, ARow];
    if Edit4.Text <> '' then
      oldid := StrToInt(Edit4.Text);
  end;
end;

procedure TForm27.Button1Click(Sender: TObject);
{ добавить норму }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') and
    (Edit5.Text <> '') and (Edit6.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_norm');
      SQL.Add('from norm');
      SQL.Add('where (id_norm=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_norm');
        SQL.Add('from norm');
        SQL.Add('where (countp = :count)');
        ParamByName('count').AsString := Edit1.Text;
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
        SQL.Add('insert into norm');
        SQL.Add('values (:id, :count, :sn, :spn, :hn, :hpn)');
        ParamByName('id').AsInteger := StrToInt(Edit4.Text);
        ParamByName('count').AsString := Edit1.Text;
        ParamByName('sn').AsFloat  := StrToFloat(Edit2.Text);
        ParamByName('hn').AsFloat  := StrToFloat(Edit3.Text);
        ParamByName('spn').AsFloat := StrToFloat(Edit5.Text);
        ParamByName('hpn').AsFloat := StrToFloat(Edit6.Text);
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Число человек и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm27.Button2Click(Sender: TObject);
{ изменить норму }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') and
    (Edit5.Text <> '') and (Edit6.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_norm');
      SQL.Add('from norm');
      SQL.Add('where (id_norm=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_norm').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_norm');
        SQL.Add('from norm');
        SQL.Add('where (countp = :count)');
        ParamByName('count').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_norm').AsInteger = oldid) then
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
        SQL.Add('update norm');
        SQL.Add('set countp = :count, snorm = :sn, psnorm = :spn, hnorm = :hn, phnorm = :hpn');
        SQL.Add('where (id_norm = :id)');
        ParamByName('id').AsInteger := oldid;
        ParamByName('count').AsString := Edit1.Text;
        ParamByName('sn').AsFloat  := StrToFloat(Edit2.Text);
        ParamByName('hn').AsFloat  := StrToFloat(Edit3.Text);
        ParamByName('spn').AsFloat := StrToFloat(Edit5.Text);
        ParamByName('hpn').AsFloat := StrToFloat(Edit6.Text);
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Число человек  и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm27.Button3Click(Sender: TObject);
{ удалить норму }
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from norm');
      SQL.Add('where id_norm=:id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm27.Button4Click(Sender: TObject);
{ выйти }
begin
  Form27.Close;
end;

procedure TForm27.Edit2Exit(Sender: TObject);
{ ввод нормы площади }
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm27.FormShow(Sender: TObject);
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

procedure TForm27.Edit1Exit(Sender: TObject);
begin
  CheckInt(tedit(Sender));
end;

procedure TForm27.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule1.norm1.Close;
  DataModule1.norm1.SQL.Clear;
  DataModule1.norm1.SQL.Add('select * from norm');
  DataModule1.norm1.Open;
  Datamodule1.Query1.Close;
end;

procedure TForm27.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(tedit(Sender));
end;

procedure TForm27.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    SetPoint(TEdit(Sender));
end;

end.
