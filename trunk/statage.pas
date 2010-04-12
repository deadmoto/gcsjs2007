unit statage;

interface

uses
  Classes,
  Controls,
  Dialogs,
  Forms,
  Graphics,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TForm22 = class(TForm)
    Edit1:   TEdit;
    Edit2:   TEdit;
    Label2:  TLabel;
    Label3:  TLabel;
    Edit3:   TEdit;
    Button1: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

uses
  datamodule,
  main,
  service,
  dbf;

{$R *.dfm}

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Edit3.Text := '0';
  Datamodule1.Query1.Close;
end;


procedure TForm22.Button1Click(Sender: TObject);
{*******************************************************************************
  ѕоиск и расчет количества людей с возрастом в указанном диапазоне
*******************************************************************************}
begin
  with DataModule1.Query1 do
  begin
    Close;
    SQL.Add('select sb.fio,sb.age,strt.namestreet,cl.nhouse,cl.corp,cl.apart,cl.tel');
    SQL.Add('from cl inner join (select regn,fio,birth,DATEDIFF(year,birth,');
    SQL.Add('convert(smalldatetime,:d,104)) AS age');
    SQL.Add('from fam) as sb on cl.regn=sb.regn');
    SQL.Add('inner join strt on cl.id_street=strt.id_street');
    SQL.Add('where sb.age>=:f and sb.age<=:s');
    ParamByName('f').AsInteger := StrToInt(Edit1.Text);
    ParamByName('s').AsInteger := StrToInt(Edit2.Text);
    ParamByName('d').AsString  := Form1.rdt;
    Open;
    Edit3.Text := IntToStr(RecordCount);
  end;
end;

procedure TForm22.Button3Click(Sender: TObject);
{*******************************************************************************
  —брос результатов поиска людей с возрастом в указанном диапазоне в dbf
*******************************************************************************}
var
  path: string;
begin
  if StrToInt(Edit3.Text) <> 0 then
  begin
    path := ExtractFilePath(Application.ExeName) + 'out\';
    Datamodule1.Query1.First;
    FillTable(path, 'age' + Edit1.Text + '-' + Edit2.Text, Form1.codedbf);
  end;
end;

procedure TForm22.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(tedit(Sender));
end;

procedure TForm22.Edit1Exit(Sender: TObject);
begin
  CheckInt(tedit(Sender));
end;

end.
