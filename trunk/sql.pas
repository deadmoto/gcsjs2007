unit sql;
                                                  
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables,FileCtrl, ComCtrls;

type
  TForm34 = class(TForm)
    DBGrid1: TDBGrid;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    TabControl1: TTabControl;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
    path: string;//путь по умолчанию
  public
    { Public declarations }
  end;

var
  Form34: TForm34;

implementation

uses datamodule, main, service, dbf;

{$R *.dfm}

procedure TForm34.Button1Click(Sender: TObject);
{*******************************************************************************
  Процедура Button1Click выполняет запрос, который введен пользователем в Memo1.
  Если запрос пуст или содержит некоторую ошибку, то выдается предупреждение.
*******************************************************************************}
var
  i: integer;
begin
  if Memo1.Lines.Count<>0 then
    try
      with Datamodule1.Query1 do begin
        Close;
        SQL.Clear;
        for i:=0 to Memo1.Lines.Count-1 do
          SQL.Add(Memo1.Lines[i]);

        case TabControl1.TabIndex of
          0: begin
            Open;
          end;
          1: begin
            Close;
            ExecSQL;
            showmessage('Запрос выполнен');
          end;
        end;
      end;
    except
      Datamodule1.Query1.Close;
      ShowMessage('Запрос содержит ошибку!');
    end
  else
    ShowMessage('Введите запрос!');
end;

procedure TForm34.Button2Click(Sender: TObject);
{*******************************************************************************
  Процедура Button2Click очищает Memo1 и стирает результат запроса.
********************************************************************************}
begin
  Memo1.Clear;
  Datamodule1.Query1.Close;
end;

procedure TForm34.Button4Click(Sender: TObject);
{*******************************************************************************
  Процедура Button4Click совершает экспорт результата запроса в файл DBase 4.0
  untitled1.dbf с указанной кодировкой ANSI или OEM, по умолчанию ANSI.
  Если результат запроса нулевой, то экспорта не произойдет.
*******************************************************************************}
var
  i: integer;
begin
  with Datamodule1 do begin
    if Dbf1.Active then
      Dbf1.Close;
    if not Query1.IsEmpty then begin
      //создание таблицы
      for i:=0 to Query1.FieldCount-1 do
        Dbf1.AddFieldDefs(GetName(Query1.Fields[i]),GetType(Query1.Fields[i]),
                          GetSize(Query1.Fields[i]),GetPrec(Query1.Fields[i]));
      Dbf1.TableName := path+'untitled1.dbf';
      Dbf1.CreateTable;
      Dbf1.CodePage := Form1.codedbf;
      //запись в нее данных
      while not Query1.Eof do begin
        Dbf1.Append;
        for i:=1 to Query1.FieldCount do
          EditField(Query1.Fields[i-1].AsString,DBF1.CodePage,i);
        Dbf1.Post;
        Query1.Next;
      end;
      Dbf1.close;
      Query1.Close;
    end
    else
      ShowMessage('Для экспорта в dbf необходим ненулевой результат запроса!');
  end;
end;

procedure TForm34.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1, которые используются при работе
  в этом unit. Также устанавливается русская раскладка для ввода.
*******************************************************************************}
var
  rl, el: THandle;
  Layouts: array[0..7] of THandle;
  c, i: integer;
begin
  //русская расладка
  c := GetKeyboardLayoutList(High(Layouts)+1, Layouts);
  for i:=0 to c-1 do begin
    if LoWord(Layouts[i]) and $FF = Lang_Russian then
      rl := Layouts[i];
    if LoWord(Layouts[i]) and $FF = Lang_English then
      el := Layouts[i];
  end;
  if rl <> 0 then ActivateKeyboardLayout(rl, 0);
  Datamodule1.Query1.Close;
end;

procedure TForm34.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливается английская
  раскладка для ввода запроса, путь по умолчанию, куда можно сохранять текст
  запроса и откуда его можно загрузить, а также путь к каталогу, в который сохраняется
  результат экспорта в dbf.
*******************************************************************************}
var
  rl, el: THandle;
  Layouts: array[0..7] of THandle;
  c, i: integer;
begin
  Datamodule1.Query1.Close;
  //английская раскладка
  c := GetKeyboardLayoutList(High(Layouts)+1, Layouts);
  for i:=0 to c-1 do begin
    if LoWord(Layouts[i]) and $FF = Lang_Russian then
      rl := Layouts[i];
    if LoWord(Layouts[i]) and $FF = Lang_English then
      el := Layouts[i];
  end;
  if el <> 0 then ActivateKeyboardLayout(el, 0);
  path := ExtractFilePath(Application.ExeName)+'querys\';
  OpenDialog1.InitialDir := path;
  SaveDialog1.InitialDir := path;
  path := ExtractFilePath(Application.ExeName)+'out\';
end;

procedure TForm34.TabControl1Change(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0: begin
      Button4.Visible:= TRUE;
    end;
    1: begin
      Button4.Visible:= FALSE;
    end;
  end;
end;

procedure TForm34.Button3Click(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click сохраняет текст запроса в файл с именем, выбранным в
  появившемся диалоге.
*******************************************************************************}
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(Savedialog1.FileName);
end;

procedure TForm34.Button5Click(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click загружает текст запроса из файл с именем, выбранным в
  появившемся диалоге.
*******************************************************************************}
begin
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile(Opendialog1.FileName);
end;

end.
