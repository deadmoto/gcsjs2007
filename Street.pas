unit Street;

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
  TForm5 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label3:      TLabel;
    Edit2:       TEdit;
    Edit1:       TEdit;
    Label1:      TLabel;
    CheckBox1:   TCheckBox;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//текущее значение поля код
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//статус открытия формы: 0 - только для чтения, 1 - запись
  end;

var
  Form5: TForm5;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TForm5.SetDefault;
{*******************************************************************************
  Процедура SetDefault создает запрос для выборки всех записей из таблицы улиц.
*******************************************************************************}
var
  i: integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from strt');
    SQL.Add('order by id_street');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'Статус'),
    TIntArray.Create(25, 275, 40), DModule.Query1.RecordCount + 1);

  for i := 0 to DModule.Query1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.Query1.FieldByName('id_street').Value;
    StringGrid1.Cells[1, i + 1] := DModule.Query1.FieldByName('namestreet').Value;
    StringGrid1.Cells[2, i + 1] := DModule.Query1.FieldByName('status').Value;
    DModule.Query1.Next;
  end;
end;

procedure TForm5.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[0, ARow];
    if StringGrid1.Cells[2, ARow] <> '' then
      CheckBox1.Checked := variant(StringGrid1.Cells[2, ARow]);
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm5.Button4Click(Sender: TObject);
{*******************************************************************************
  Процедура Button4Click обрабатывает нажатие клавиши Выйти на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  Form5.Close;
end;

procedure TForm5.Button1Click(Sender: TObject);
{*******************************************************************************
  Процедура Button1Click обрабатывает нажатие клавиши Добавить на форме.
  Если все поля ввода заполнены и в таблице нет записи с такими данными, то
  происходит добавление записи в таблицу улиц.
  Если хотя бы одно поле ввода не заполнено или в таблице существует запись с
  такими данными, то добавления не происходит и выдается соответствующее сообщение.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_street');
      SQL.Add('from strt');
      SQL.Add('where (id_street=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_street');
        SQL.Add('from strt');
        SQL.Add('where (namestreet = :name)');
        ParamByName('name').AsString := Edit1.Text;
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
        SQL.Add('insert into strt');
        SQL.Add('values (:id, :name,:st)');
        ParamByName('id').AsInteger  := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        if CheckBox1.Checked then
          ParamByName('st').AsInteger := 1
        else
          ParamByName('st').AsInteger := 0;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование улицы и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm5.Button2Click(Sender: TObject);
{*******************************************************************************
  Процедура Button2Click обрабатывает нажатие клавиши Изменить на форме.
  Если все поля ввода заполнены, то проверяется существует ли в таблице запись с
  такими данными. Если не существует, то происходит добавление записи в таблицу.
  Если в таблице существует запись с таким же id, но наименование другое и не
  совпадает с наименование других записей, то происходит изменение записи.
  Если хотя бы одно поле ввода не заполнено или в таблице наименование совпадает
  с наименованием другой записи, то изменения не происходит и выдается
  соответствующее сообщение.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_street');
      SQL.Add('from strt');
      SQL.Add('where (id_street=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_street').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_street');
        SQL.Add('from strt');
        SQL.Add('where (namestreet = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_street').AsInteger = oldid) then
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
        SQL.Add('update strt');
        SQL.Add('set namestreet = :name,status=:st');
        SQL.Add('where id_street = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit1.Text;
        if CheckBox1.Checked then
          ParamByName('st').AsInteger := 1
        else
          ParamByName('st').AsInteger := 0;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование улицы и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm5.Button3Click(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click обрабатывает нажатие клавиши Удалить на форме. Из таблицы
  удаляется запись, которая соответствует текущему id.
*******************************************************************************}
begin
  with DModule.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from strt');
      SQL.Add('where (id_street = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. В StringGrid1 загружаются
  данные, в полях ввода появляются значения 1 строки. В зависимости от статуса
  открытия формы управляющие кнопки становятся недоступными(чтение) или
  доступными(запись) для нажатия.
*******************************************************************************}
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

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1, которая используется при работе
  в этом unit.
*******************************************************************************}
begin
  DModule.Query1.Close;
end;

procedure TForm5.Edit2Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit2Exit обрабатывает потерю фокуса полем ввода. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  CheckInt(Edit2);
end;

procedure TForm5.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  Процедура Edit2KeyDown обрабатывает нажатие клавиши enter. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit2);
end;

procedure TForm5.Edit1Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit1Exit обрабатывает потерю фокуса полем ввода. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  CheckRus(Edit1);
end;

procedure TForm5.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  Процедура Edit1KeyDown обрабатывает нажатие клавиши enter. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckRus(Edit1);
end;

end.
