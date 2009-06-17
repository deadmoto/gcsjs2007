unit bank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm31 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

uses datamodule, main, service;

{$R *.dfm}

procedure TForm31.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from bank');
    SQL.Add('order by id_bank');
  end;
end;

procedure TForm31.Button1Click(Sender: TObject);
{ добавить банк }
var
  flag: boolean;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '')and(Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_bank');
      SQl.Add('from bank');
      SQl.Add('where (id_bank=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_bank');
        SQl.Add('from bank');
        SQl.Add('where (namebank = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty then
          flag := true
        else
          flag := false;
        Close;
      end
      else begin
        flag := false;
        Close;
      end;
      if flag then begin
        Close;
        SQL.Clear;
        SQL.Add('insert into bank');
        SQL.Add('values (:id, :name, :bik)');
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('bik').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit3.Text);
      end
      else begin
        ShowMessage('Ќаименование банка и код должны быть уникальны!');
        SetDefault;
        Open;
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
  if (Edit1.Text <> '')and(Edit2.Text <> '')and(Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin                 
      Close;
      SQL.Clear;
      SQl.Add('select id_bank');
      SQl.Add('from bank');
      SQl.Add('where (id_bank=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_bank').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_bank');
        SQl.Add('from bank');
        SQl.Add('where (namebank = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_bank').AsInteger = oldid) then
          flag := true
        else
          flag := false;
        Close;
      end
      else begin
        flag := false;
        Close;
      end;
      if flag then begin
        Close;
        SQL.Clear;
        SQL.Add('update bank');
        SQL.Add('set namebank = :name, bik = :bik');
        SQL.Add('where (id_bank = :id)');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('bik').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit3.Text);
      end
      else begin
        ShowMessage('Ќаименование банка и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
      ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm31.Button3Click(Sender: TObject);
{ удалить банк }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from bank');
      SQL.Add('where (id_bank = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[2].AsString;
      Edit3.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit3.Text);
    end;
  end;
end;

procedure TForm31.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm31.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[2].AsString;
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm31.FormShow(Sender: TObject);
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[2].AsString;
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
  if status=0 then begin
    Button1.Enabled := false;
    Button2.Enabled := false;
    Button3.Enabled := false;
  end
  else begin
    Button1.Enabled := true;
    Button2.Enabled := true;
    Button3.Enabled := true;
  end;
end;

procedure TForm31.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm31.Edit3Exit(Sender: TObject);
begin
  CheckRus(Edit3);
end;

procedure TForm31.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
    CheckRus(Edit3);
end;

procedure TForm31.Edit1Exit(Sender: TObject);
begin
  CheckRus(Edit1);
end;

procedure TForm31.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
    CheckRus(Edit1);
end;

end.
