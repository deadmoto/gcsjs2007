unit manager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm7 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
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
  Form7: TForm7;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm7.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from mng');
    SQL.Add('where id_dist = :dist');
    SQL.Add('order by id_mng');
    ParamByName('dist').AsInteger := Form1.dist;
  end;
end;

procedure TForm7.Button4Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
{ выбрали €чейку }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm7.Button1Click(Sender: TObject);
{ добавить распор€дител€ }
var
  flag: bool;
begin
  if (Edit1.Text<>'')and(Edit2.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_mng');
      SQl.Add('from mng');
      SQL.Add('where (id_mng=:idm)and(id_dist=:id)');
      ParamByName('idm').AsInteger := StrToInt(Edit2.Text);
      ParamByName('id').AsInteger := Form1.dist;
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_mng');
        SQl.Add('from mng');
        SQL.Add('where (namemng = :name)and(id_dist=:id)');
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('id').AsInteger := Form1.dist;
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
        SQL.Add('insert into mng');
        SQL.Add('values (:id, :dist,:name)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Ќаименование распор€дител€ и кода должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
      ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm7.Button2Click(Sender: TObject);
{ изменить распор€дител€ }
var
  flag: bool;
begin
  if (Edit1.Text<>'')and(Edit2.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_mng');
      SQl.Add('from mng');
      SQL.Add('where (id_mng=:idm)and(id_dist=:id)');
      ParamByName('idm').AsInteger := StrToInt(Edit2.Text);
      ParamByName('id').AsInteger := Form1.dist;
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_mng').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_mng');
        SQl.Add('from mng');
        SQL.Add('where (namemng = :name)and(id_dist=:id)');
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('id').AsInteger := Form1.dist;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_mng').AsInteger = oldid) then
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
        SQL.Add('update mng');
        SQL.Add('set namemng = :name');
        SQL.Add('where (id_mng = :id)and(id_dist = :dist)');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Ќаименование распор€дител€ и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
      ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm7.Button3Click(Sender: TObject);
{ удалить распор€дител€ }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from mng');
      SQL.Add('where (id_mng = :id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := oldid;
      ParamByName('dist').AsInteger := Form1.dist;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit2.Text);
    end;
  end;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
    Edit1.Text := FieldByName('namemng').AsString;
    Edit2.Text := FieldByName('id_mng').AsString;
  end;
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

procedure TForm7.Edit2Exit(Sender: TObject);
begin
  CheckInt(Edit2);
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm7.Edit1Enter(Sender: TObject);
begin
  if IsRus(Edit1.Text) then
    Edit1.Font.Color := clWindowText
  else begin
    Edit1.Font.Color := clRed;
    ShowMessage('ћожно использовать буквы только кириллицы!');
  end;
end;

procedure TForm7.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckInt(edit2);
end;

procedure TForm7.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm7.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(edit1);
end;

end.
