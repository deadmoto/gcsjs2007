unit certification;                   

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm28 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Edit2: TEdit;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    oldid: integer;//текущие значения полей до изменения
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form28: TForm28;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm28.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from cert');
    SQL.Add('order by id_cert');
  end;
end;

procedure TForm28.DBGrid1CellClick(Column: TColumn);
{ выбрали ячейку }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm28.Button1Click(Sender: TObject);
{ добавить тип аттестации }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_cert');
      SQl.Add('from cert');
      SQl.Add('where (id_cert=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_cert');
        SQl.Add('from cert');
        SQl.Add('where (namecert = :name)');
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
        SQL.Add('insert into cert');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование типа аттестации и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm28.Button2Click(Sender: TObject);
{ изменить тип аттестации }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_cert');
      SQl.Add('from cert');
      SQl.Add('where (id_cert=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_cert').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_cert');
        SQl.Add('from cert');
        SQl.Add('where (namecert = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_cert').AsInteger = oldid) then
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
        SQL.Add('update cert');
        SQL.Add('set namecert = :name');
        SQL.Add('where id_cert = :id');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование типа аттестации и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm28.Button3Click(Sender: TObject);
{ удалить тип}
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from cert');
      SQL.Add('where id_cert = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit2.Text);
    end;
  end;
end;

procedure TForm28.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm28.FormShow(Sender: TObject);
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit2.Text);
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

procedure TForm28.Edit2Exit(Sender: TObject);
begin
  CheckInt(Edit2);
end;

procedure TForm28.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm28.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckInt(edit2);
end;

procedure TForm28.Edit1Exit(Sender: TObject);
begin
  CheckRus(Edit1);
end;

procedure TForm28.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(Edit1);
end;

end.
