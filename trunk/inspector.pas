unit inspector;                                        

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DBGrids, Grids;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
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
    oldid: integer;//последний номер, который использовался
    procedure SetDefault;
    function SetRegn(d,ins,n: integer): integer;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form3: TForm3;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm3.SetDefault;
{ процедура создает запрос по умолчанию выборки из таблицы инспекторов }
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from insp inner join dist');
    SQL.Add('on insp.id_dist = dist.id_dist');
    SQL.Add('where insp.id_dist=:id');
    SQL.Add('order by insp.id_insp');
    ParamByName('id').AsInteger := Form1.dist;
  end;
end;

function TForm3.SetRegn(d,ins,n: integer): integer;
{ создает регистрационный номер из входных параметров }
var
  s: string;
begin
  s := IntToStr(d);
  if ins<10 then
    s := s + '0';
  s := s + IntToStr(ins);
  if n < 10 then
    s := s + '0000' + IntToStr(n);
  if (n < 100) and (n >= 10) then
    s := s + '000' + IntToStr(n);
  if (n < 1000) and (n >= 100) then
    s := s + '00' + IntToStr(n);
  if (n < 10000) and (n >= 1000) then
    s := s + '0' + IntToStr(n);
  if (n < 100000) and (n >= 10000) then
    s := s + IntToStr(n);
  Result := StrToInt(s);
end;

procedure TForm3.Button4Click(Sender: TObject);
{ выйти }
begin
  Form3.Close;
end;

procedure TForm3.Button1Click(Sender: TObject);
{ добавить инспектора }
var
  flag: bool;
var
  st: integer;
begin
  if (Edit1.Text<>'')and(Edit2.Text<>'')and(Edit3.Text<>'')  then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_insp');
      SQl.Add('from insp');
      SQl.Add('where (id_insp=:id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      ParamByName('dist').AsInteger := Form1.dist;
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_insp');
        SQl.Add('from insp');
        SQl.Add('where (nameinsp = :name)and(id_dist = :dist)');
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
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
        SQL.Add('insert into insp');
        SQL.Add('values (:id, :dist,:name, :st, :num)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        if CheckBox1.Checked = false then
          st := 0
        else
          st := 1;
        ParamByName('st').AsInteger := st;
        ParamByName('num').AsInteger := SetRegn(Form1.dist,StrToInt(Edit2.Text),0);
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('ФИО инспектора и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm3.Button2Click(Sender: TObject);
{ изменить инспектора }
var
  st: integer;
  flag: bool;
begin
  if (Edit1.Text<>'')and(Edit2.Text<>'')and(Edit3.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_insp');
      SQl.Add('from insp');
      SQl.Add('where (id_insp=:id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      ParamByName('dist').AsInteger := Form1.dist;
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_insp').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_insp');
        SQl.Add('from insp');
        SQl.Add('where (nameinsp = :name)and(id_dist = :dist)');
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_insp').AsInteger = oldid) then
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
        SQL.Add('update insp');
        SQL.Add('set nameinsp = :name, status = :st, lastnum=:num');
        SQL.Add('where (id_insp = :id)and(id_dist = :dist)');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        if CheckBox1.Checked = false then
          st := 0
        else
          st := 1;
        ParamByName('st').AsInteger := st;
        ParamByName('num').AsInteger := StrToInt(Edit3.Text);
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('ФИО инспектора и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm3.Button3Click(Sender: TObject);
{ удалить инспектора }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from insp');
      SQL.Add('where (id_insp = :id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := oldid;
      ParamByName('dist').AsInteger := Form1.dist;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      Edit3.Text := DBGrid1.Fields[3].AsString;
      if DBGrid1.Fields[2].AsInteger=0 then
        CheckBox1.Checked := false
      else
        CheckBox1.Checked := true;
      oldid := StrToInt(Edit2.Text);
    end;
  end;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
{ Обработка события выбора ячейки }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  Edit3.Text := DBGrid1.Fields[3].AsString;
  if DBGrid1.Fields[2].AsInteger=0 then
    CheckBox1.Checked := false
  else
    CheckBox1.Checked := true;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm3.FormShow(Sender: TObject);
{ Обработка события показ формы }
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  Edit3.Text := DBGrid1.Fields[3].AsString;
  if DBGrid1.Fields[2].AsInteger=0 then
    CheckBox1.Checked := false
  else
    CheckBox1.Checked := true;
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

procedure TForm3.Edit2Exit(Sender: TObject);
{ Обработка ввода числа }
begin
  CheckInt(TEdit(sender));
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
{ Обработка события закрытие формы }
begin
  Datamodule1.Query1.Close;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
{ Обработка ввода строки }
begin
  CheckRus(Edit1);
end;

procedure TForm3.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{ Обработка ввода числа, в случае нажатия enter }
begin
  if Key=VK_RETURN then
    CheckInt(TEdit(sender));
end;

procedure TForm3.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{ Обработка ввода строки }
begin
  if Key=VK_RETURN then
    CheckRus(Edit1);
end;

end.
