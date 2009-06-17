unit chatt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls;

type
  TForm42 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    SG1: TStringGrid;
    SG2: TStringGrid;
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form42: TForm42;

implementation

{$R *.dfm}

procedure TForm42.SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
{
  Событие прорисовки ячейки. Перепрограммировано для изменения подсветки
  текущей выбранной строки.
}
begin
  if Arow=0 then
    TStringGrid(Sender).Canvas.Brush.Color := clBtnFace
  else begin
    if (Arow=TStringGrid(Sender).Row) then
      TStringGrid(Sender).Canvas.Brush.Color := clSkyBlue
    else
      TStringGrid(Sender).Canvas.Brush.Color := clWindow;
  end;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(rect.Left+2,rect.Top+2,TStringGrid(Sender).Cells[acol,arow]);
end;

procedure TForm42.FormCreate(Sender: TObject);
begin
  with SG1 do begin
    ColCount := 2;
    ColWidths[0] := 190;
    ColWidths[1] := 150;
    Cells[0,0] := 'ФИО';
    Cells[1,0] := 'Адрес';
  end;
  with SG2 do begin
    ColCount := 2;
    ColWidths[0] := 190;
    ColWidths[1] := 150;
    Cells[0,0] := 'ФИО';
    Cells[1,0] := 'Адрес';
  end;
end;

end.
