unit control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
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
  Form10: TForm10;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm10.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from cntrl');
    SQL.Add('order by id_cntrl');
  end;
end;

procedure TForm10.Button4Click(Sender: TObject);
{ выйти }
begin
  Form10.Close;
end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
{ выбрали €чейку }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm10.Button1Click(Sender: TObject);
{ добавить тип контрол€ }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_cntrl');
      SQl.Add('from cntrl');
      SQl.Add('where (id_cntrl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_cntrl');
        SQl.Add('from cntrl');
        SQl.Add('where (namecntrl = :name)');
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
        SQL.Add('insert into cntrl');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Ќаименование типа контрол€ и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm10.Button2Click(Sender: TObject);
{ изменить тип контрол€ }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_cntrl');
      SQl.Add('from cntrl');
      SQl.Add('where (id_cntrl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_cntrl').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_cntrl');
        SQl.Add('from cntrl');
        SQl.Add('where (namecntrl = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_cntrl').AsInteger = oldid) then
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
        SQL.Add('update cntrl');
        SQL.Add('set namecntrl = :name');
        SQL.Add('where id_cntrl = :id');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Ќаименование типа контрол€ и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm10.Button3Click(Sender: TObject);
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from cntrl');
      SQL.Add('where id_cntrl = :id');
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

procedure TForm10.FormShow(Sender: TObject);
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

procedure TForm10.Edit2Exit(Sender: TObject);
begin
  Checkint(edit2);
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm10.Edit1Enter(Sender: TObject);
begin
  if IsRus(Edit1.Text) then
    Edit1.Font.Color := clWindowText
  else begin
    Edit1.Font.Color := clRed;
    ShowMessage('ћожно использовать буквы только кириллицы!');
  end;
end;

procedure TForm10.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    checkInt(edit2);
end;

procedure TForm10.Edit1Exit(Sender: TObject);
begin
  CheckRus(Edit1);
end;

procedure TForm10.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(edit1);
end;

end.
