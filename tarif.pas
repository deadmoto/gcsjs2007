unit tarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm15 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    oldid: integer;//текущее значение поля код
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//статус открытия формы: 0 - только для чтения, 1 - запись
    nam: string;//название услуги, для которой открывается форма
    num: integer;//номер услуги
  end;

var
  Form15: TForm15;

implementation

uses datamodule, service, main, progress;

{$R *.dfm}

procedure TForm15.SetDefault;
{*******************************************************************************
  Процедура SetDefault создает и выполняет запрос для выборки всех записей из
  таблицы, соответствующей текущим тарифам по услуге, определенной как nam.
*******************************************************************************}
begin
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur'+nam+'.dbf" sbros');
    SQL.Add('order by sbros.id_'+nam);
    Open;
  end;
end;

procedure TForm15.Button4Click(Sender: TObject);
{*******************************************************************************
  Процедура Button4Click обрабатывает нажатие клавиши Выйти на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  Close;
end;

procedure TForm15.Button1Click(Sender: TObject);
{*******************************************************************************
  Процедура Button1Click обрабатывает нажатие клавиши Добавить на форме.
  Если все поля ввода заполнены и в таблице нет записи с такими данными, то
  происходит добавление записи в соответствующую таблицу.
  Если хотя бы одно поле ввода не заполнено или в таблице существует запись с
  такими данными, то добавления не происходит и выдается соответствующее сообщение.
  После добавление тарифа происходит формирование новой таблицы текущих тарифов
  по данной услуге.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')and (Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_'+nam);
      SQl.Add('from '+nam);
      SQl.Add('where (id_'+nam+'=:id)and(id_dist=:idd)');
      ParamByName('idd').AsInteger := Form1.dist;
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_'+nam);
        SQl.Add('from '+nam);
        SQl.Add('where (name'+nam+'=:name)and(id_dist=:idd)');
        ParamByName('idd').AsInteger := Form1.dist;
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
        SQL.Add('insert into '+nam);
        SQL.Add('values (:idd,Convert(smalldatetime,:d,104), :id, :name, :tarif)');
        ParamByName('idd').AsInteger := Form1.dist;
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        FillTarif(Form1.bpath,nam,Form1.rdt,Form1.dist,Form1.codedbf);
        oldid := StrToInt(Edit3.Text);
      end
      else
        ShowMessage('Наименование тарифа и код должны быть уникальны!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm15.Button2Click(Sender: TObject);
{*******************************************************************************
  Процедура Button2Click обрабатывает нажатие клавиши Изменить на форме.
  Если все поля ввода заполнены, то проверяется существует ли в таблице запись с
  такими данными. Если не существует, то происходит добавление записи в таблицу.
  Если в таблице существует запись с таким же id, но наименование другое и не
  совпадает с наименование других записей, то происходит изменение записи.
  Если хотя бы одно поле ввода не заполнено или в таблице наименование совпадает
  с наименованием другой записи, то изменения не происходит и выдается
  соответствующее сообщение.
  После изменения тарифа происходит формирование новой таблицы текущих тарифов
  по данной услуге.
*******************************************************************************}
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')and (Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_'+nam);
      SQl.Add('from '+nam);
      SQl.Add('where (id_'+nam+'=:id)and(id_dist=:idd)');
      ParamByName('idd').AsInteger := Form1.dist;
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_'+nam).AsInteger = oldid) then begin
        if IsEmpty then
          flag := false
        else begin
          Close;
          SQL.Clear;
          SQl.Add('select id_'+nam);
          SQl.Add('from '+nam);
          SQl.Add('where (id_'+nam+'=:id)and(id_dist=:idd)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('idd').AsInteger := Form1.dist;
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          ParamByName('d').AsString := Form1.rdt;
          Open;
          if IsEmpty then
            flag := false
          else
            flag := true;    
        end;
        Close;
        SQL.Clear;
        SQl.Add('select id_'+nam);
        SQl.Add('from '+nam);
        SQl.Add('where (name'+nam+' = :name)and(id_dist=:idd)');
        ParamByName('idd').AsInteger := Form1.dist;
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_'+nam).AsInteger = oldid) then begin
          if not flag then begin
            Close;
            SQL.Clear;
            SQL.Add('insert into '+nam);
            SQL.Add('values (:idd,Convert(smalldatetime,:d,104), :id, :name, :tarif)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else begin
            Close;
            SQL.Clear;
            SQL.Add('update '+nam);
            SQL.Add('set name'+nam+' = :name, tarif'+nam+' = :tarif');
            SQL.Add('where (id_'+nam+' = :id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('idd').AsInteger := Form1.dist;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
          ExecSQL;
          FillTarif(Form1.bpath,nam,Form1.rdt,Form1.dist,Form1.codedbf);
          oldid := StrToInt(Edit3.Text);
        end
        else
          ShowMessage('Наименование тарифа и код должны быть уникальны!');
      end
      else
        ShowMessage('Наименование тарифа и код должны быть уникальны!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm15.Button3Click(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click обрабатывает нажатие клавиши Удалить на форме. Из таблицы
  удаляется запись, которая соответствует текущему округу, с текущей датой отчетного
  периода и текущим id.
  Если тариф несколько раз изменялся, то произойдет удаление записи с его последними
  изменениями, и текущей станет запись соответственно предпоследнего изменения.
  Чтобы полностью удалить тариф, нужно удалить все записи его изменений.
  После удаления тарифа происходит формирование новой таблицы текущих тарифов
  по данной услуге.
*******************************************************************************}
begin
  with DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from '+nam);
    SQl.Add('where (id_'+nam+'=:id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
    ParamByName('idd').AsInteger := Form1.dist;
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillTarif(Form1.bpath,nam,Form1.rdt,Form1.dist,Form1.codedbf);
  end;
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm15.DBGrid1CellClick(Column: TColumn);
{*******************************************************************************
  Процедура DBGrid1CellClick обрабатывает выбор ячейки в DBGrid1.
  В результате в полях ввода отражается информация из выбранной строки и
  устанавливается текущее значение id.
*******************************************************************************}
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm15.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливаются названия
  полей, которые отражает DBGrid1, в него загружаются данные, в полях ввода появляются
  значения 1 строки. В зависимости от статуса открытия формы управляющие кнопки
  становятся недоступными(чтение) или доступными(запись) для нажатия.
*******************************************************************************}
begin
  DBGrid1.Columns[0].FieldName := 'id_'+nam;
  DBGrid1.Columns[1].FieldName := 'name'+nam;
  DBGrid1.Columns[2].FieldName := 'tarif'+nam;
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
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

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1 и Query4, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm15.Edit3Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit3Exit обрабатывает потерю фокуса полем ввода. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  CheckInt(Edit3);
end;

procedure TForm15.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*******************************************************************************
  Процедура Edit3KeyDown обрабатывает нажатие клавиши enter. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit3);
end;

procedure TForm15.Edit2Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit2Exit обрабатывает потерю фокуса полем ввода. Устанавливает, если
  необходимо запятую в числе. Если строка не является числом, то устанавливается
  ноль.
*******************************************************************************}
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm15.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*******************************************************************************
  Процедура Edit2KeyDown обрабатывает нажатие клавиши enter. Устанавливает, если
  необходимо запятую в числе. Если строка не является числом, то устанавливается
  ноль.
*******************************************************************************}
begin
  if Key = (vk_return) then begin
    SetPoint(TEdit(Sender));
  end;
end;

end.
