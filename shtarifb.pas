unit shtarifb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls;

type
  TForm39 = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    FlowPanel1: TFlowPanel;
    Button2: TButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetDefault;
  public
    { Public declarations }
    nam: string;//название услуги
    namet: string;//название текущего тарифа
    ac: boolean;//признак совершения действия: 0 - не было действия, 1 - совершено
  end;

var
  Form39: TForm39;

implementation

uses datamodule, service;

{$R *.dfm}

procedure TForm39.FormShow(Sender: TObject);
{*******************************************************************************
  Процедура FormShow обрабатывает событие OnShow формы. Устанавливаются названия
  полей, которые отражает DBGrid1, в него загружаются данные,в полях ввода
  появляются значения 1 строки.
*******************************************************************************}
begin
  ac := false;
  SetDefault;
end;

procedure TForm39.SetDefault;
var
  i: integer;
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "cur'+nam+'.dbf" sbros');
    SQL.Add('order by sbros.id_'+nam);
    Open;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'Откр.в/разбор', 'Закр.в/разбор'),
    TIntArray.Create(30, 300, 80, 80), DModule.qTarif.RecordCount + 1);

  for i := 0 to DModule.qTarif.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.qTarif.FieldByName('id_' + nam).Value;
    StringGrid1.Cells[1, i + 1] := DModule.qTarif.FieldByName('name' + nam).Value;
    StringGrid1.Cells[2, i + 1] := DModule.qTarif.FieldByName('tarif1').Value;
    StringGrid1.Cells[3, i + 1] := DModule.qTarif.FieldByName('tarif2').Value;
    DModule.qTarif.Next;
  end;
end;

procedure TForm39.StringGrid1DblClick(Sender: TObject);
begin
  Button1.OnClick(Self);
end;

procedure TForm39.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  SGDrawCell(Sender, ACol, ARow, Rect, State);
end;

procedure TForm39.FormClose(Sender: TObject; var Action: TCloseAction);
{*******************************************************************************
  Процедура FormClose закрывает Query1 и Query4, которые используются при работе
  в этом unit.
*******************************************************************************}
begin
  DModule.Query1.Close;
  DModule.qTarif.Close;
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
  namet := StringGrid1.Cells[1, StringGrid1.Row];
  ac := true;
  Close;
end;

end.
