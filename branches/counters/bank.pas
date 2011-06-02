unit bank;

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
  TForm31 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Edit3:       TEdit;
    Label3:      TLabel;
    Label1:      TLabel;
    Edit1:       TEdit;
    Edit2:       TEdit;
    Label2:      TLabel;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//текущие значени€ полей до изменени€
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только дл€ чтени€, 1 - запись
  end;

var
  Form31: TForm31;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TForm31.SetDefault;
var
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from bank');
    SQL.Add('order by id_bank');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create(' од', 'Ќаименование', 'BIK'),
    TIntArray.Create(25, 200, 155), DModule.sqlQuery1.RecordCount + 1);

  for i := 0 to DModule.sqlQuery1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.sqlQuery1.FieldByName('id_bank').Value;
    StringGrid1.Cells[1, i + 1] := DModule.sqlQuery1.FieldByName('namebank').Value;
    StringGrid1.Cells[2, i + 1] := DModule.sqlQuery1.FieldByName('bik').Value;
    DModule.sqlQuery1.Next;
  end;

end;

procedure TForm31.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];// DBGrid1.Fields[1].AsString;
    Edit2.Text := StringGrid1.Cells[2, ARow];//DBGrid1.Fields[2].AsString;
    Edit3.Text := StringGrid1.Cells[0, ARow];//DBGrid1.Fields[0].AsString;
    if Edit3.Text <> '' then
      oldid := StrToInt(Edit3.Text);
  end;
end;

procedure TForm31.Button1Click(Sender: TObject);
{ добавить банк }
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_bank');
      SQL.Add('from bank');
      SQL.Add('where (id_bank=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit3.Text));
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_bank');
        SQL.Add('from bank');
        SQL.Add('where (namebank = :name)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', Edit1.Text);
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
        SQL.Add('insert into bank');
        SQL.Add('values (:id, :name, :bik)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', StrToInt(Edit3.Text));
        SetParam(Parameters, 'name', Edit1.Text);
        SetParam(Parameters, 'bik', Edit2.Text);
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Ќаименование банка и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm31.Button2Click(Sender: TObject);
{ изменить банк }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_bank');
      SQL.Add('from bank');
      SQL.Add('where (id_bank=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit3.Text));
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_bank').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_bank');
        SQL.Add('from bank');
        SQL.Add('where (namebank = :name)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', Edit1.Text);
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_bank').AsInteger = oldid) then
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
        SQL.Add('update bank');
        SQL.Add('set namebank = :name, bik = :bik');
        SQL.Add('where (id_bank = :id)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', oldid);
        SetParam(Parameters, 'name', Edit1.Text);
        SetParam(Parameters, 'bik', Edit2.Text);
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Ќаименование банка и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm31.Button3Click(Sender: TObject);
{ удалить банк }
begin
  with DModule.sqlQuery1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from bank');
      SQL.Add('where (id_bank = :id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', oldid);
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm31.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm31.FormShow(Sender: TObject);
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

procedure TForm31.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.sqlQuery1.Close;
end;

procedure TForm31.Edit3Exit(Sender: TObject);
begin
  CheckRus(Edit3);
end;

procedure TForm31.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    CheckRus(Edit3);
end;

procedure TForm31.Edit1Exit(Sender: TObject);
begin
  CheckRus(Edit1);
end;

procedure TForm31.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    CheckRus(Edit1);
end;

end.
