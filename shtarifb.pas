unit shtarifb;                                                

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm39 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nam: string;//название услуги
    namet: string;//название текущего тарифа
    ac: boolean;//признак совершения действия: 0 - не было действия, 1 - совершено
  end;

var
  Form39: TForm39;

implementation

uses datamodule;

{$R *.dfm}

procedure TForm39.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливаются названия
  полей, которые отражает DBGrid1, в него загружаются данные,в полях ввода
  появляются значения 1 строки.
*******************************************************************************}
begin
  DBGrid1.Columns[0].FieldName := 'id_'+nam;
  DBGrid1.Columns[1].FieldName := 'name'+nam;
  DBGrid1.Columns[2].FieldName := 'tarif1';
  DBGrid1.Columns[3].FieldName := 'tarif2';
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur'+nam+'.dbf" sbros');
    SQL.Add('order by sbros.id_'+nam);
    Open;
  end;
  namet := DBGrid1.Fields[1].AsString;
  ac := false;
end;

procedure TForm39.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1 и Query4, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm39.Button2Click(Sender: TObject);
{*******************************************************************************
  Процедура Button2Click обрабатывает нажатие клавиши Отмена на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  ac := false;
  Close;
end;

procedure TForm39.Button1Click(Sender: TObject);
{*******************************************************************************
  Процедура Button1Click обрабатывает нажатие клавиши Выбрать на форме. Действие
  считается совершенным и форма закрывается.
*******************************************************************************}
begin
  namet := DBGrid1.Fields[1].AsString;
  ac := true;
  Close;
end;

end.
