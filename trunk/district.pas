unit district;      

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  Form4: TForm4;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm4.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from dist');
    SQL.Add('order by id_dist');
  end;
end;

procedure TForm4.Button4Click(Sender: TObject);
{ выйти }
begin
  Form4.Close;
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
{ выбрали €чейку }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  Edit3.Text := DBGrid1.Fields[2].AsString;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm4.Button1Click(Sender: TObject);
{ добавить округ }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_dist');
      SQl.Add('from dist');
      SQl.Add('where (id_dist=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_dist');
        SQl.Add('from dist');
        SQl.Add('where (namedist=:name)');
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
        SQL.Add('insert into dist');
        SQL.Add('values (:id, :name, :boss)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('boss').AsString := Edit3.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Ќаименование округа и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm4.Button2Click(Sender: TObject);
{ изменить округ }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_dist');
      SQl.Add('from dist');
      SQl.Add('where (id_dist=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_dist').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_dist');
        SQl.Add('from dist');
        SQl.Add('where (namedist=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_dist').AsInteger = oldid) then
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
        SQL.Add('update dist');
        SQL.Add('set namedist = :name, boss=:boss');
        SQL.Add('where id_dist = :id');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('boss').AsString := Edit3.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Ќаименование округа и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('¬се пол€ ввода должны быть заполнены!');
end;

procedure TForm4.Button3Click(Sender: TObject);
{ удалить округ }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from dist');
      SQL.Add('where id_dist = :id');
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

procedure TForm4.FormShow(Sender: TObject);
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  Edit3.Text := DBGrid1.Fields[2].AsString;
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

procedure TForm4.Edit2Exit(Sender: TObject);
begin
  CheckInt(edit2);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
  CheckRus(TEdit(Sender));
end;

procedure TForm4.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    checkInt(edit2);
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(TEdit(Sender));
end;

end.
