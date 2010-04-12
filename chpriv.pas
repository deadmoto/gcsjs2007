unit chpriv;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Mask,
  DBCtrls,
  Grids,
  {DBGrids,} ExtCtrls;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    FlowPanel1: TFlowPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    priv:   integer;
    status: integer;//0 - только для чтения, 1 - запись
    procedure SetDefault;
  end;

var
  Form11: TForm11;

implementation

uses
  datamodule,
  privilege,
  main,
  service;

{$R *.dfm}

procedure TForm11.Button2Click(Sender: TObject);
{ изменить/просмотр }
begin
  Form12.status := 1;
  Form12.sec := status;
  Form12.ShowModal;

  SetDefault;
end;

procedure TForm11.Button1Click(Sender: TObject);
{ добавить льготу }
begin
  Form12.status := 0;
  Form12.sec := status;
  Form12.ShowModal;

  SetDefault;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
{ закрытие формы }
begin
  Datamodule1.Query1.Close;
end;

procedure TForm11.Button4Click(Sender: TObject);
{ закрытие формы }
begin
  Close;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  Form12.status := 2;
  Form12.sec := status;
  Form12.ShowModal;

  SetDefault;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
  SetDefault;
  if status = 0 then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
    Button2.Caption := 'Просмотр';
  end
  else
  begin
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
    Button2.Caption := 'Изменить';
  end;
end;

procedure TForm11.SetDefault;
var
  i: integer;
begin
  with Datamodule1.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('execute getpriv');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'с/н', 'фед/у', '%обслуж', '%коммун', '%тв.топл.'),
    TIntArray.Create(25, 330, 25, 35, 60, 60, 60), Datamodule1.Query1.RecordCount + 1);

  for i := 0 to Datamodule1.Query1.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_priv').Value;
    StringGrid1.Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namepriv').Value;
    StringGrid1.Cells[2, i + 1] := Datamodule1.Query1.FieldByName('square').Value;
    StringGrid1.Cells[3, i + 1] := Datamodule1.Query1.FieldByName('levelp').Value;
    StringGrid1.Cells[4, i + 1] := Datamodule1.Query1.FieldByName('p1').Value;
    StringGrid1.Cells[5, i + 1] := Datamodule1.Query1.FieldByName('p2').Value;
    StringGrid1.Cells[6, i + 1] := Datamodule1.Query1.FieldByName('p3').Value;
    Datamodule1.Query1.Next;
  end;
end;

procedure TForm11.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    Form12.status := 1;
    Form12.sec := status;
    Form12.ShowModal;
  end;
  if key = VK_INSERT then
  begin
    Form12.status := 0;
    Form12.sec := status;
    Form12.ShowModal;
  end;
end;

procedure TForm11.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if ARow <> 0 then
  begin
    if StringGrid1.Cells[0, ARow] <> ''  then
      priv := StrToInt(StringGrid1.Cells[0, ARow]);
  end;
end;

end.
