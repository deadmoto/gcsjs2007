unit relation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm32 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit2Exit(Sender: TObject);
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
  Form32: TForm32;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm32.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from rel');
    SQL.Add('order by id_rel');
  end;
end;

procedure TForm32.Button1Click(Sender: TObject);
{ добавить отношение }
var
  flag: boolean;
begin
  if (Edit1.Text <> '')and(Edit2.Text<>'')  then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_rel');
      SQl.Add('from rel');
      SQl.Add('where (id_rel=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_rel');
        SQl.Add('from rel');
        SQl.Add('where (namerel = :name)');
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
        SQL.Add('insert into rel');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование типа и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm32.Button2Click(Sender: TObject);
{ изменить отношение }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_rel');
      SQl.Add('from rel');
      SQl.Add('where (id_rel=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_rel').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_rel');   
        SQl.Add('from rel');
        SQl.Add('where (namerel = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_rel').AsInteger = oldid) then
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
        SQL.Add('update rel');
        SQL.Add('set namerel = :name');
        SQL.Add('where (id_rel = :id)');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование типа и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
      ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm32.Button3Click(Sender: TObject);
{ удалить отношение }
begin
  if Edit1.Text<>'клиент' then
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from rel');
      SQL.Add('where (id_rel = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit2.Text);
    end;
  end
  else
    ShowMessage('Эту запись удалить нельзя!');
end;

procedure TForm32.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm32.FormShow(Sender: TObject);
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

procedure TForm32.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm32.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm32.Edit2Exit(Sender: TObject);
begin
  CheckInt(edit2);
end;

procedure TForm32.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckInt(edit2);
end;

procedure TForm32.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm32.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(edit1);
end;

end.
