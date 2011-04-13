unit tarifb;

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
  TForm19 = class(TForm)
    Panel1:      TPanel;
    Panel2:      TPanel;
    FlowPanel1:  TFlowPanel;
    StringGrid1: TStringGrid;
    Button4:     TButton;
    Button3:     TButton;
    Button2:     TButton;
    Button1:     TButton;
    Label3:      TLabel;
    Label1:      TLabel;
    Label2:      TLabel;
    Label4:      TLabel;
    Edit3:       TEdit;
    Edit1:       TEdit;
    Edit2:       TEdit;
    Edit4:       TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    oldid: integer;//текущее значение поля код
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//статус открытия формы: 0 - только для чтения, 1 - запись
    nam:    string;//название услуги, для которой открывается форма
    num:    integer;//номер услуги
  end;

var
  Form19: TForm19;

implementation

uses
  datamodule, service, main, MyTypes;

{$R *.dfm}

procedure TForm19.SetDefault;
{*******************************************************************************
  Процедура SetDefault создает и выполняет запрос для выборки всех записей из
  таблицы, соответствующей текущим тарифам по услуге, определенной как nam.
*******************************************************************************}
var
  i: integer;
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur' + nam + '.dbf" sbros');
    SQL.Add('order by sbros.id_' + nam);
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'Откр.в/разбор', 'Закр.в/разбор', 'Норм.'),
    TIntArray.Create(30, 237, 78, 48, 48), DModule.qTarif.RecordCount + 1);

  for i := 0 to DModule.qTarif.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.qTarif.FieldByName('id_' + nam).Value;
    StringGrid1.Cells[1, i + 1] := DModule.qTarif.FieldByName('name' + nam).Value;
    StringGrid1.Cells[2, i + 1] := DModule.qTarif.FieldByName('tarif1').Value;
    StringGrid1.Cells[3, i + 1] := DModule.qTarif.FieldByName('tarif2').Value;
    StringGrid1.Cells[4, i + 1] := DModule.qTarif.FieldByName('norm' + nam).Value;
    DModule.qTarif.Next;
  end;
end;

procedure TForm19.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  SGDrawCell(Sender, ACol, ARow, Rect, State);
end;

procedure TForm19.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{*******************************************************************************
  Процедура StringGrid1SelectCell обрабатывает выбор ячейки в StringGrid1.
  В результате в полях ввода отражается информация из выбранной строки и
  устанавливается текущее значение id.
*******************************************************************************}
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[2, ARow];
    Edit4.Text := StringGrid1.Cells[3, ARow];
    Edit5.Text := StringGrid1.Cells[4, ARow];
    Edit3.Text := StringGrid1.Cells[0, ARow];
    if Edit3.Text <> '' then
      oldid := StrToInt(Edit3.Text);
  end;
end;

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1 и Query4, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  DModule.Query1.Close;
  DModule.qTarif.Close;
end;

procedure TForm19.Button4Click(Sender: TObject);
{*******************************************************************************
  Процедура Button4Click обрабатывает нажатие клавиши Выйти на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  Close;
end;

procedure TForm19.Button1Click(Sender: TObject);
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
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_' + nam);
      SQL.Add('from ' + nam);
      SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)');
      ParamByName('id').AsInteger  := StrToInt(Edit3.Text);
      ParamByName('idd').AsInteger := MainForm.dist;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_' + nam);
        SQL.Add('from ' + nam);
        SQL.Add('where (name' + nam + '=:name)and(id_dist=:idd)');
        ParamByName('idd').AsInteger := MainForm.dist;
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
        SQL.Add('insert into ' + nam);
        SQL.Add('values (:idd,Convert(smalldatetime,:d,104),:id,:name,:t1,:t2,:norm)');
        ParamByName('idd').AsInteger := MainForm.dist;
        ParamByName('d').AsString := MainForm.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('t1').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('t2').AsFloat := StrToFloat(Edit4.Text);
        ParamByName('norm').AsFloat := StrToFloat(Edit5.Text);
        ExecSQL;
        FillTarifb(MainForm.bpath, nam, MainForm.rdt, MainForm.dist, MainForm.codedbf);
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

procedure TForm19.Button2Click(Sender: TObject);
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
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') and (Edit4.Text <> '') then
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_' + nam);
      SQL.Add('from ' + nam);
      SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)');
      ParamByName('idd').AsInteger := MainForm.dist;
      ParamByName('id').AsInteger  := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_' + nam).AsInteger = oldid) then
      begin
        if IsEmpty then
          flag := False
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('select id_' + nam);
          SQL.Add('from ' + nam);
          SQL.Add('where (id_' + nam + '=:id)and(id_dist=:idd)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('idd').AsInteger := MainForm.dist;
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          ParamByName('d').AsString := MainForm.rdt;
          Open;
          if IsEmpty then
            flag := False
          else
            flag := True;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select id_' + nam);
        SQL.Add('from ' + nam);
        SQL.Add('where (name' + nam + ' = :name)and(id_dist=:idd)');
        ParamByName('idd').AsInteger := MainForm.dist;
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_' + nam).AsInteger = oldid) then
        begin
          if not flag then
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into ' + nam);
            SQL.Add('values (:idd,Convert(smalldatetime,:d,104),:id,:name,:t1,:t2,:norm)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('update ' + nam);
            SQL.Add('set name' + nam + '=:name,tarif1=:t1,tarif2=:t2,norm'+ nam +'=:norm');
            SQL.Add('where (id_' + nam + ' = :id)and(sdate=convert(smalldatetime,:d,104))and(id_dist=:idd)');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('idd').AsInteger := MainForm.dist;
          ParamByName('d').AsString := MainForm.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('t1').AsFloat := StrToFloat(Edit2.Text);
          ParamByName('t2').AsFloat := StrToFloat(Edit4.Text);
          ParamByName('norm').AsFloat := StrToFloat(Edit5.Text);
          ExecSQL;
          FillTarifb(MainForm.bpath, nam, MainForm.rdt, MainForm.dist, MainForm.codedbf);
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

procedure TForm19.Button3Click(Sender: TObject);
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
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from ' + nam);
    SQL.Add('where (id_' + nam + '=:id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
    ParamByName('idd').AsInteger := MainForm.dist;
    ParamByName('d').AsString := MainForm.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillTarifb(MainForm.bpath, nam, MainForm.rdt, MainForm.dist, MainForm.codedbf);
  end;
  SetDefault;
end;

procedure TForm19.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливаются названия
  полей, которые отражает StringGrid1, в него загружаются данные, в полях ввода появляются
  значения 1 строки. В зависимости от статуса открытия формы управляющие кнопки
  становятся недоступными(чтение) или доступными(запись) для нажатия.
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

procedure TForm19.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  Процедура Edit2KeyDown обрабатывает нажатие клавиши enter. Устанавливает, если
  необходимо запятую в числе. Если строка не является числом, то устанавливается
  ноль.
*******************************************************************************}
begin
  if Key = (vk_return) then
  begin
    SetPoint(TEdit(Sender));
  end;
end;

procedure TForm19.Edit2Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit2Exit обрабатывает потерю фокуса полем ввода. Устанавливает, если
  необходимо запятую в числе. Если строка не является числом, то устанавливается
  ноль.
*******************************************************************************}
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm19.Edit3KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{*******************************************************************************
  Процедура Edit3KeyDown обрабатывает нажатие клавиши enter. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  if Key = (vk_return) then
    CheckInt(Edit3);
end;

procedure TForm19.Edit3Exit(Sender: TObject);
{*******************************************************************************
  Процедура Edit3Exit обрабатывает потерю фокуса полем ввода. Если строка не
  является целым числом, то устанавливается ноль.
*******************************************************************************}
begin
  CheckInt(Edit3);
end;

end.
