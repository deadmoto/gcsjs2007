unit inspector;

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
  TForm3 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label1:      TLabel;
    Label2:      TLabel;
    Label3:      TLabel;
    Edit1:       TEdit;
    CheckBox1:   TCheckBox;
    Edit2:       TEdit;
    Edit3:       TEdit;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    Button5: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    oldid: integer;//последний номер, который использовался
    procedure SetDefault;
    function SetRegn(d, ins, n: integer): integer;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form3: TForm3;

implementation

uses
  datamodule, main, service, md5, connection_module, wincontrols, MyTypes;

{$R *.dfm}

procedure TForm3.SetDefault;
{ процедура создает запрос по умолчанию выборки из таблицы инспекторов }
var
  i: integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from insp inner join dist');
    SQL.Add('on insp.id_dist = dist.id_dist');
    SQL.Add('where insp.id_dist=:id');
    SQL.Add('order by insp.id_insp');
    ParamByName('id').AsInteger := Form1.dist;
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'ФИО', 'Статус', 'Рег.номер'),
    TIntArray.Create(25, 210, 45, 80), DModule.Query1.RecordCount + 1);

  for i := 0 to DModule.Query1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.Query1.FieldByName('id_insp').Value;
    StringGrid1.Cells[1, i + 1] := DModule.Query1.FieldByName('nameinsp').Value;
    StringGrid1.Cells[2, i + 1] := DModule.Query1.FieldByName('status').Value;
    StringGrid1.Cells[3, i + 1] := DModule.Query1.FieldByName('lastnum').Value;
    DModule.Query1.Next;
  end;
end;

function TForm3.SetRegn(d, ins, n: integer): integer;
  { создает регистрационный номер из входных параметров }
var
  s: string;
begin
  s := IntToStr(d);
  if ins < 10 then
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

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{ Обработка события выбора ячейки }
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[0, ARow];
    Edit3.Text := StringGrid1.Cells[3, ARow];
    if StringGrid1.Cells[2, ARow] <> '' then
      CheckBox1.Checked := variant(StringGrid1.Cells[2, ARow]);

    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm3.Button4Click(Sender: TObject);
{ выйти }
begin
  Form3.Close;
end;

procedure TForm3.Button5Click(Sender: TObject);
var
  tmp_pass: string;
begin
  tmp_pass := InputPassword('Введите пароль!', 'Пароль:', '');
  with DModule.Query1 do
    begin
      Close;
      SQL.Text := 'UPDATE Insp SET password=:pwd' + #13 +
      'WHERE id_insp=:id';
      ParamByName('pwd').Value := GenMD5Password(tmp_pass);
      ParamByName('id').Value := oldid;
      ExecSQL;
    end;
end;

procedure TForm3.Button1Click(Sender: TObject);
{ добавить инспектора }
var
  flag: bool;
var
  st: integer;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_insp');
      SQL.Add('from insp');
      SQL.Add('where (id_insp=:id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      ParamByName('dist').AsInteger := Form1.dist;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_insp');
        SQL.Add('from insp');
        SQL.Add('where (nameinsp = :name)and(id_dist = :dist)');
        ParamByName('name').AsString  := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
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
        SQL.Add('insert into insp');
        SQL.Add('values (:id, :dist,:name, :st, :num,:pas)');
        ParamByName('id').AsInteger  := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        ParamByName('pas').AsString := GenMD5Password( InputPassword('Введите пароль!', 'Пароль:', '') );
        if CheckBox1.Checked = False then
          st := 0
        else
          st := 1;
        ParamByName('st').AsInteger := st;
        ParamByName('num').AsInteger := SetRegn(Form1.dist, StrToInt(Edit2.Text), 0);
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('ФИО инспектора и код должны быть уникальны!');
        SetDefault;
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
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_insp');
      SQL.Add('from insp');
      SQL.Add('where (id_insp=:id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      ParamByName('dist').AsInteger := Form1.dist;
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_insp').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_insp');
        SQL.Add('from insp');
        SQL.Add('where (nameinsp = :name)and(id_dist = :dist)');
        ParamByName('name').AsString  := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_insp').AsInteger = oldid) then
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
        SQL.Add('update insp');
        SQL.Add('set nameinsp = :name, status = :st, lastnum=:num');
        SQL.Add('where (id_insp = :id)and(id_dist = :dist)');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('dist').AsInteger := Form1.dist;
        if CheckBox1.Checked = False then
          st := 0
        else
          st := 1;
        ParamByName('st').AsInteger := st;
        ParamByName('num').AsInteger := StrToInt(Edit3.Text);
        ExecSQL;
        SetDefault;

      end
      else
      begin
        ShowMessage('ФИО инспектора и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm3.Button3Click(Sender: TObject);
{ удалить инспектора }
begin
  with DModule.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from insp');
      SQL.Add('where (id_insp = :id)and(id_dist = :dist)');
      ParamByName('id').AsInteger := oldid;
      ParamByName('dist').AsInteger := Form1.dist;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
{ Обработка события показ формы }
begin
  SetDefault;

  if status = 0 then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
    //Button5.Enabled := False;
  end
  else
  begin
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
    //Button5.Enabled := True;
  end;

  if Form1.LoginMode = lAdmin then
    Button5.Visible := True
  else
    Button5.Visible := False;
end;

procedure TForm3.Edit2Exit(Sender: TObject);
{ Обработка ввода числа }
begin
  CheckInt(TEdit(Sender));
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
{ Обработка события закрытие формы }
begin
  DModule.Query1.Close;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
{ Обработка ввода строки }
begin
  CheckRus(Edit1);
end;

procedure TForm3.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{ Обработка ввода числа, в случае нажатия enter }
begin
  if Key = VK_RETURN then
    CheckInt(TEdit(Sender));
end;

procedure TForm3.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{ Обработка ввода строки }
begin
  if Key = VK_RETURN then
    CheckRus(Edit1);
end;

end.
