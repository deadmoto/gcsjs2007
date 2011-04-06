unit merge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ComCtrls, SevenZipVCL;

type
  TMergeForm = class(TForm)
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
  MergeForm: TMergeForm;

implementation

uses
  main,
  datamodule,
  fstruct,
  service{, browse};

{$R *.dfm}

procedure TMergeForm.FormShow(Sender: TObject);
begin
  path := 'arc\';//путь по умолчанию
  MaskEdit1.Text := Form1.rdt;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := 8;
  ProgressBar1.Step := 1;
end;

procedure TMergeForm.MaskEdit1Exit(Sender: TObject);
begin
  CheckDate(MaskEdit1);
end;

procedure TMergeForm.Button1Click(Sender: TObject);
{ архиваци€ базы дл€ сброса по дате}
var
  ext1, ext2, Name, dt: string;
  SevenZip: TSevenZip;
  i: integer;
begin
  ext1 := '.dbf';
  ext2 := IntToStr(Form1.dist) + ext1;

  Name := '4merge' + IntToStr(Form1.dist);
  dt := '01.' + Copy(MaskEdit1.Text, 4, 2) + '.' + Copy(MaskEdit1.Text, 7, 4);
  if MaskEdit1.Text = '' then
    dt := Form1.rdt;

  try
    if FileExists(path + Name + '.7z') then
      DeleteFile(PAnsiChar(path + Name + '.7z'));
    SevenZip := TSevenZip.Create(Application);
    SevenZip.SZFileName := path + Name + '.7z';
    with SevenZip do
    begin
      AddOptions := [AddStoreOnlyFilename];
      VolumeSize := 0;
      LZMACompressType := LZMA;
      LZMACompressStrength := MAXIMUM;
      Files.Clear;
    end;

    //добавить файлы в архив
    ExportHouse(path, Form1.dist);
    SevenZip.Files.AddString(path + 'house' + ext2);
    ProgressBar1.StepIt;
    ExportClm(path, dt, Form1.dist);
    SevenZip.Files.AddString(path + 'cl' + ext2);
    ProgressBar1.StepIt;
    ExportHistm(path, dt, Form1.dist);
    SevenZip.Files.AddString(path + 'hist' + ext2);
    ProgressBar1.StepIt;
    ExportFamm(path, dt, Form1.dist);
    SevenZip.Files.AddString(path + 'fam' + ext2);
    ProgressBar1.StepIt;
    ExportSluj(path, dt, Form1.dist);
    SevenZip.Files.AddString(path + 'sluj' + ext2);
    ExportFact(path, Form1.dist);
    SevenZip.Files.AddString(path + 'factsale' + ext2);
    SevenZip.Files.AddString(path + 'factbalance' + ext2);
    ProgressBar1.StepIt;
    ExportSub(path, dt, Form1.dist);
    SevenZip.Files.AddString(path + 'sub' + ext2);
    ProgressBar1.StepIt;
    ExportCounters(path, dt, Form1.dist);
    SevenZip.Files.AddString(path + 'counters' + ext2);
    ProgressBar1.StepIt;
    ExportInsp(path, Form1.dist, False);
    SevenZip.Files.AddString(path + 'insp' + ext2);
    SevenZip.Add;
    ProgressBar1.StepIt;
    ShowMessage('Ёкспорт файлов завершен!');
    Close;
  finally
    for i := 0 to SevenZip.Files.Count - 1 do
      DeleteFile(SevenZip.Files.WStrings[i]);
    SevenZip.Free;
  end;
end;

procedure TMergeForm.Button2Click(Sender: TObject);
{ автоматический импорт данных из филиала или отдела }
var
  SevenZip: TSevenZip;
begin
  path := path + '4merge' + IntToStr(Form1.dist) +'.7z';
  try
    SevenZip := TSevenZip.Create(Application);
    SevenZip.SZFileName := path;

    //извлечь файлы из архива
    with SevenZip do
    begin
      ExtrBaseDir := 'arc\';
      ExtractOptions := [ExtractOverwrite];
      Extract();
    end;
    path := 'arc\';

    sleep(1000);
    try
      DModule.Database1.StartTransaction;
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
      ProgressBar1.StepIt;
      ImportCounters(path, Form1.dist);
      DModule.Database1.Commit;
      ProgressBar1.StepIt;
      ShowMessage('»мпорт найденных файлов успешно завершен!');
      Form1.Reload;
    except
      DModule.Database1.Rollback;
      ShowMessage('ќшибка импорта!');
    end;
  finally
    SevenZip.Free;
  end;
  Close;
end;

procedure TMergeForm.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TMergeForm.MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckDate(MaskEdit1);
end;

end.
