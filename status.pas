unit status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm14 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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
    oldid: integer;//текущие id
    min: array of integer;//список id_min
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

uses datamodule, main, service;

{$R *.dfm}

procedure TForm14.Clear;
{*******************************************************************************
  Процедура Clear очищает содержимое списка Combobox1 и полей ввода.
*******************************************************************************}
begin
  Combobox1.Clear;
  Edit1.Text := '';Edit2.Text := '';
end;

procedure TForm14.Fill;
{*******************************************************************************
  Процедура Fill заполняет Combobox1 наименованиями соц-демогр групп.
*******************************************************************************}
var
  l: integer;
begin
  with Datamodule1.Query4 do begin
    l := 0;
    Close;
    SQL.Clear;
    SQL.Add('select * from "curlmin.dbf" sbros');
    SQL.Add('order by sbros.namemin');
    Open;
    First;
    while not EOF do begin
      SetLength(min, Length(min)+1);
      SetLength(namemin, Length(namemin)+1);
      Combobox1.Items.Add(FieldByName('namemin').AsString);
      min[l] := FieldByName('id_min').AsInteger;
      namemin[l] := FieldByName('namemin').AsString;
      Next;
      inc(l);
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
  for i:=0 to combobox1.Items.Count-1 do begin
    if AnsiLowerCase(Combobox1.Items.Strings[i])=AnsiLowerCase(s) then
      break;
  end;
  if i<combobox1.Items.Count then
    Result := i
  else
    Result := -1;
end;

procedure TForm14.SetDefault;
{*******************************************************************************
  Процедура SetDefault создает запрос для выборки всех записей из таблицы статусов.
  При этом выбирается еще и наименование соц-демогр. группы для отображения в DBGrid1.
*******************************************************************************}
begin
  with Datamodule1.Query1 do begin
    Close;
    SQl.Clear;
    SQL.Add('select id_status,namestatus,');
    SQL.Add('case when id_min=1 then :v1');
    SQL.Add('when id_min=2 then :v2');
    SQL.Add('when id_min=3 then :v3 end as namemin');
	  SQL.Add('from stat');
	  SQL.Add('order by id_status');
    ParamByName('v1').AsString := namemin[0];
    ParamByName('v2').AsString := namemin[1];
    ParamByName('v3').AsString := namemin[2];
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

procedure TForm14.DBGrid1CellClick(Column: TColumn);
{*******************************************************************************
  Процедура DBGrid1CellClick обрабатывает выбор ячейки в DBGrid1.
  В результате в полях ввода отражается информация из выбранной строки и
  устанавливается текущее значение id.
*******************************************************************************}
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  Combobox1.Text := DBGrid1.Fields[2].AsString;
  oldid := StrToInt(Edit2.Text);
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
  if (Edit1.Text<>'') and (Combobox1.Text <> '')and(Edit2.Text<>'')  then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_status');
      SQl.Add('from stat');
      SQl.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_status');
        SQl.Add('from stat');
        SQl.Add('where (namestatus = :name)');
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
        SQL.Add('insert into stat');
        SQL.Add('values (:id, :name, :min)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
        Open;
        oldid := FieldByName('id_status').AsInteger;
      end
      else begin
        ShowMessage('Наименование статуса и код должны быть уникальны!');
        SetDefault;
        Open;
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
  if (Edit1.Text <> '') and (Combobox1.Text <> '')and(Edit2.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_status');
      SQl.Add('from stat');
      SQl.Add('where (id_status=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_status').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_status');
        SQl.Add('from stat');
        SQl.Add('where (namestatus = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_status').AsInteger = oldid) then
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
        SQL.Add('update stat');
        SQL.Add('set namestatus = :name, id_min = :min');
        SQL.Add('where (id_status = :st)');
        ParamByName('st').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('min').AsInteger := min[Combobox1.ItemIndex];
        ExecSQL;
        SetDefault;
        Open;
        oldid := FieldByName('id_status').AsInteger;
      end
      else begin
        ShowMessage('Наименование статуса и код должны быть уникальны!');
        SetDefault;
        Open;
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
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from stat');
      SQL.Add('where (id_status = :id)');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[0].AsString;
      Combobox1.Text := DBGrid1.Fields[2].AsString;
      oldid := FieldByName('id_status').AsInteger;
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
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
    Edit1.Text := FieldByName('namestatus').AsString;
    Edit2.Text := FieldByName('id_status').AsString;
    Combobox1.Text := FieldByName('namemin').AsString;
    oldid := FieldByName('id_status').AsInteger;
    Combobox1.OnChange(combobox1);
  end;
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

procedure TForm14.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TForm14.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*******************************************************************************
  Процедура Edit1KeyDown обрабатывает нажатие клавиши enter. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckRus(Edit1);
end;

end.
