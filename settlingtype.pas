unit settlingtype;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
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
    status: integer;//статус открытия формы: 0 - только для чтения, 1 - запись
  end;

var
  Form9: TForm9;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm9.SetDefault;
{*******************************************************************************
  Процедура SetDefault формирует запрос для выборки всех записей из
  таблицы типов заселения.
*******************************************************************************}
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from settl');
    SQL.Add('order by id_settl');
  end;
end;

procedure TForm9.Button4Click(Sender: TObject);
{*******************************************************************************
  Процедура Button4Click обрабатывает нажатие клавиши Выйти на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  Form9.Close;
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);
{*******************************************************************************
  Процедура DBGrid1CellClick обрабатывает выбор ячейки в DBGrid1.
  В результате в полях ввода отражается информация из выбранной строки и
  устанавливается текущее значение id.
*******************************************************************************}
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm9.Button1Click(Sender: TObject);
{*******************************************************************************
  Процедура Button1Click обрабатывает нажатие клавиши Добавить на форме.
  Если все поля ввода заполнены и в таблице нет записи с такими данными, то
  происходит добавление записи в соответствующую таблицу.
  Если хотя бы одно поле ввода не заполнено или в таблице существует запись с
  такими данными, то добавления не происходит и выдается соответствующее сообщение.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_settl');
      SQl.Add('from settl');
      SQl.Add('where (id_settl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_settl');
        SQl.Add('from settl');
        SQl.Add('where (namesettl = :name)');
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
        SQL.Add('insert into settl');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование типа заселения и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm9.Button2Click(Sender: TObject);
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
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_settl');
      SQl.Add('from settl');
      SQl.Add('where (id_settl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_settl').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_settl');
        SQl.Add('from settl');
        SQl.Add('where (namesettl = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_settl').AsInteger = oldid) then
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
        SQL.Add('update settl');
        SQL.Add('set namesettl = :name');
        SQL.Add('where id_settl = :id');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование типа заселения и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm9.Button3Click(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click обрабатывает нажатие клавиши Удалить на форме. Из таблицы
  удаляется запись, которая соответствует текущему id.
*******************************************************************************}
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from settl');
      SQL.Add('where id_settl = :id');
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

procedure TForm9.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливаются названия
  полей, которые отражает DBGrid1, в него загружаются данные, в полях ввода появляются
  значения 1 строки. В зависимости от статуса открытия формы управляющие кнопки
  становятся недоступными(чтение) или доступными(запись) для нажатия.
*******************************************************************************}
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

procedure TForm9.Edit2Exit(Sender: TObject);
begin
  CheckInt(Edit2);
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
end;

procedure TForm9.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Ord(vk_return) then
    CheckInt(Edit2);
end;

procedure TForm9.Edit1Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit1Exit обрабатывает потерю фокуса полем ввода. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  CheckRus(Edit1);
end;

procedure TForm9.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*******************************************************************************
  Процедура Edit1KeyDown обрабатывает нажатие клавиши enter. Если строка содержит
  некириллические символы, то выдается сообщение, а строка становится пустой.
*******************************************************************************}
begin
  if Key = Ord(vk_return) then
    CheckRus(Edit1);
end;

end.
