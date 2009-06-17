unit shtarif;                                              

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm37 = class(TForm)
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
  Form37: TForm37;

implementation

uses datamodule;

{$R *.dfm}

procedure TForm37.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливаются названия
  полей, которые отражает DBGrid1, в него загружаются данные,в полях ввода
  появляются значения 1 строки.
*******************************************************************************}
begin
  DBGrid1.Columns[0].FieldName := 'id_'+nam;
  DBGrid1.Columns[1].FieldName := 'name'+nam;
  DBGrid1.Columns[2].FieldName := 'tarif'+nam;
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur'+nam+'.dbf" sbros');
    SQL.Add('order by sbros.id_'+nam);
    Open;
  end;
  ac := false;
end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1 и Query4, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm37.Button2Click(Sender: TObject);
{*******************************************************************************
  Процедура Button2Click обрабатывает нажатие клавиши Отмена на форме. Результатом
  является закрытие формы.
*******************************************************************************}
begin
  Close;
end;

procedure TForm37.Button1Click(Sender: TObject);
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
