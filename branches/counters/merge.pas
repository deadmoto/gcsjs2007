unit merge;

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
  ComCtrls;

type
  TForm21 = class(TForm)
    ProgressBar1: TProgressBar;
    Button1:      TButton;
    Button2:      TButton;
    Label1:       TLabel;
    MaskEdit1:    TMaskEdit;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    path: string;
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

uses
  main,
  datamodule,
  fstruct,
  service{, browse};

{$R *.dfm}

procedure TForm21.FormShow(Sender: TObject);
begin
  path := 'arc\';//путь по умолчанию
  MaskEdit1.Text := Form1.rdt;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := 7;
  ProgressBar1.Step := 1;
end;

procedure TForm21.MaskEdit1Exit(Sender: TObject);
begin
  CheckDate(MaskEdit1);
end;

procedure TForm21.Button1Click(Sender: TObject);
{ архиваци€ базы дл€ сброса по дате}
var
  cmd, flst, Name, dt: string;
  ext1, ext2: string;
begin
  ext1 := '.dbf';
  ext2 := IntToStr(Form1.dist) + ext1;
  Name := '4merge';
  dt := '01.' + Copy(MaskEdit1.Text, 4, 2) + '.' + Copy(MaskEdit1.Text, 7, 4);
  if MaskEdit1.Text = '' then
    dt := Form1.rdt;
  //удалить файлы из архива
  cmd := 'rar d ' + path + Name + ext1;
  WinExec(PChar(cmd), SW_HIDE);

  //добавить файлы в архив
  ExportHouse(path, Form1.dist);
  flst := path + 'house' + ext2 + ' ';
  ProgressBar1.StepIt;
  ExportClm(path, dt, Form1.dist);
  flst := flst + path + 'cl' + ext2 + ' ';
  ProgressBar1.StepIt;
  ExportHistm(path, dt, Form1.dist);
  flst := flst + path + 'hist' + ext2 + ' ';
  ProgressBar1.StepIt;
  ExportFamm(path, dt, Form1.dist);
  flst := flst + path + 'fam' + ext2 + ' ';
  ProgressBar1.StepIt;
  ExportSluj(path, dt, Form1.dist);
  flst := flst + path + 'sluj' + ext2 + ' ';
  ExportFact(path, Form1.dist);
  flst := flst + path + 'factsale' + ext2 + ' ';
  flst := flst + path + 'factbalance' + ext2 + ' ';  
  ProgressBar1.StepIt;
  ExportSub(path, dt, Form1.dist);
  flst := flst + path + 'sub' + ext2 + ' ';
  ProgressBar1.StepIt;
  ExportInsp(path, Form1.dist, False);
  flst := flst + path + 'insp' + ext2;
  cmd  := 'rar m -s -v1440 -vn -y -ep ' + path + Name + ' ' + flst;
  WinExec(PChar(cmd), SW_HIDE);
  ProgressBar1.StepIt;
  ShowMessage('Ёкспорт файлов завершен!');
  Close;
end;

procedure TForm21.Button2Click(Sender: TObject);
{ автоматический импорт данных из филиала или отдела }
var
  cmd: string;
//  i: integer;
begin
  path := path + '4merge';
  //извлечь файлы из архива
  cmd  := 'rar e -y ' + path + ' *.dbf' + ' arc\';
  WinExec(PChar(cmd), SW_HIDE);
  path := 'arc\';
//  i := 0;
  sleep(1000);
{  while not FileExists(path + 'insp' + IntToStr(Form1.dist) + '.dbf') do
    Inc(i);}
  try
    Datamodule1.Database1.StartTransaction;
    ImportInsp(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportCl(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportHist(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportFam(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportHouse(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportSub(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportSluj(path, Form1.dist);
    ProgressBar1.StepIt;
    ImportFact(path, Form1.dist);
    Datamodule1.Database1.Commit;
    ProgressBar1.StepIt;
    ShowMessage('»мпорт найденных файлов успешно завершен!');
    Form1.Reload;
  except
    Datamodule1.Database1.Rollback;
    ShowMessage('ќшибка импорта!');
  end;
  Close;
end;

procedure TForm21.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm21.MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckDate(MaskEdit1);
end;

end.
