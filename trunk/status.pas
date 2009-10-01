unit status;

interface

uses
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Mask,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TForm14 = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Edit2:       TEdit;
    Label3:      TLabel;
    Edit1:       TEdit;
    Label1:      TLabel;
    ComboBox1:   TComboBox;
    Label2:      TLabel;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid:   integer;//текущие id
    min:     array of integer;//список id_min
    namemin: array of string;//список наименований соц-демогр.групп
    function SearchMin(s: string): integer;
    procedure SetDefault;
    procedure Fill;
    procedure Clear;
  public
    { Public declarations }
    status: integer;//статус открытия формы: 0 - только для чтения, 1 - запись
  end;

var
  Form14: TForm14;

implementation

uses
  datamodule,
  main,
  service;

{$R *.dfm}

procedure TForm14.Clear;
{*******************************************************************************
  Процедура Clear очищает содержимое списка Combobox1 и полей ввода.
*******************************************************************************}
begin
  Combobox1.Clear;
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm14.Fill;
{*******************************************************************************
  Процедура Fill заполняет Combobox1 наименованиями соц-демогр групп.
*******************************************************************************}
var
  l: integer;
begin
  with Datamodule1.Query4 do
  begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select * from "curlmin.dbf" sbros');
    SQL.Add('order by sbros.namemin');
    Open;
    First;
    while not EOF do
    begin
      SetLength(min, Length(min) + 1);
      SetLength(namemin, Length(namemin) + 1);
      Combobox1.Items.Add(FieldByName('namemin').AsString);
      min[l] := FieldByName('id_min').AsInteger;
      namemin[l] := FieldByName('namemin').AsString;
      Next;
      Inc(l);
    end;
    Close;
  end;
end;

function TForm14.SearchMin(s: string): integer;
{*******************************************************************************
  Функция SearchMin выполняет поиск строки s в списке Combobox1 и возвращает ее
  индекс в списке. Если строка не найдена, то возвращается -1.
*******************************************************************************}
var
  i: integer;
begin
  for i := 0 to combobox1.Items.Count - 1 do
  begin
    if AnsiLowerCase(Combobox1.Items.Strings[i]) = AnsiLowerCase(s) then
      break;
  end;
  if i < combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

procedure TForm14.SetDefault;
{*******************************************************************************
  Процедура SetDefault создает запрос для выборки всех записей из таблицы статусов.
  При этом выбирается еще и наименование соц-демогр. группы для отображения в DBGrid1.
*******************************************************************************}
var
  i: integer;
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_status,namestatus,');
    SQL.Add('case when id_min=1 then :v1');
    SQL.Add('when id_min=2 then :v2');
    SQL.Add('when id_min=3 then :v3 end as namemin');
    SQL.Add('from stat');
    SQL.Add('order by id_status');
    ParamByName('v1').AsString := namemin[0];
    ParamByName('v2').AsString := namemin[1];
    ParamByName('v3').AsString := namemin[2];
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'Группа'),
    TIntArray.Create(25, 190, 190), Datamodule1.Query1.RecordCount + 1);

  for i := 0 to Datamodule1.Query1.RecordCount + 1 do
  begin
    with StringGrid1 do
    begin
      Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_status').AsString;
      Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namestatus').AsString;
      Cells[2, i + 1] := Datamodule1.Query1.FieldByName('namemin').AsString;
    end;
    Datamodule1.Query1.Next;
  end;
end;

procedure TForm14.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{*******************************************************************************
  Процедура StringGrid1SelectCell обрабатывает выбор ячейки в StringGrid1.
  В результате в полях ввода отражается информация из выбранной строки и
  устанавливается текущее значение id.
*******************************************************************************}
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[0, ARow];
    Combobox1.Text := StringGrid1.Cells[2, ARow];
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm14.Button4Click(Sender: TObject);
{*******************************************************************************
  Процедура Button4Click обрабатывает нажатие клавиши Выйти на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  Form14.Close;
end;

procedure TForm14.Button1Click(Sender: TObject);
{*******************************************************************************
  Процедура Button1Click обрабатывает нажатие клавиши Добавить на форме.
  Если все поля ввода заполнены и в таблице нет записи с такими данными, то
  происходит добавление записи в таблицу статусов.
  Если хотя бы одно поле ввода не заполнено или в таблице существует запись с
  такими данными, то добавления не происходит и выдается соответствующее сообщение.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Combobox1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_status');
      SQL.Add('from stat');
      SQL.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_status');
        SQL.Add('from stat');
        SQL.Add('where (namestatus = :name)');
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
        SQL.Add('insert into stat');
        SQL.Add('values (:id, :name, :min)');
        ParamByName('id').AsInteger  := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование статуса и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm14.Button2Click(Sender: TObject);
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
  if (Edit1.Text <> '') and (Combobox1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_status');
      SQL.Add('from stat');
      SQL.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_status').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_status');
        SQL.Add('from stat');
        SQL.Add('where (namestatus = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_status').AsInteger = oldid) then
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
        SQL.Add('update stat');
        SQL.Add('set namestatus = :name, id_min = :min');
        SQL.Add('where (id_status = :st)');
        ParamByName('st').AsInteger  := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование статуса и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm14.Button3Click(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click обрабатывает нажатие клавиши Удалить на форме. Из таблицы
  удаляется запись, которая соответствует текущему id.
*******************************************************************************}
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from stat');
      SQL.Add('where (id_status = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TForm14.ComboBox1Change(Sender: TObject);
{*******************************************************************************
  Процедура обрабатывает изменение в поле ввода Combobox1.
*******************************************************************************}
var
  ind: integer;
begin
  ind := SearchMin(Combobox1.Text);
  if ind <> -1 then
    Combobox1.ItemIndex := ind
  else
    Combobox1.ItemIndex := 0;
end;

procedure TForm14.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. В DBGrid1 загружаются данные,
  в полях ввода появляются значения 1 строки. В зависимости от статуса открытия
  формы управляющие кнопки становятся недоступными(чтение) или доступными(запись)
  для нажатия.
*******************************************************************************}
begin
  Clear;
  Fill;
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

procedure TForm14.Edit2Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit2Exit обрабатывает потерю фокуса полем ввода. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  CheckInt(Edit2);
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1 и Query4, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm14.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  Процедура Edit2KeyDown обрабатывает нажатие клавиши enter. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit2);
end;

procedure TForm14.Edit1Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit1Exit обрабатывает потерю фокуса полем ввода. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  CheckRus(Edit1);
end;

procedure TForm14.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  Процедура Edit1KeyDown обрабатывает нажатие клавиши enter. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckRus(Edit1);
end;

end.
