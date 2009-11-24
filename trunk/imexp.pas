unit imexp;

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
  DB,
  DBTables,
  Mask;

type
  TStatusMode = (mImport, mExport);

type
  TForm35 = class(TForm)
    CheckBox7:  TCheckBox;
    Button1:    TButton;
    CheckBox8:  TCheckBox;
    CheckBox9:  TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox13: TCheckBox;
    GroupBox1:  TGroupBox;
    CheckBox3:  TCheckBox;
    CheckBox4:  TCheckBox;
    CheckBox5:  TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox2:  TCheckBox;
    CheckBox6:  TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox23: TCheckBox;
    Button4:    TButton;
    CheckBox16: TCheckBox;
    CheckBox27: TCheckBox;
    Label1:     TLabel;
    Edit1:      TEdit;
    Button2:    TButton;
    MaskEdit1:  TMaskEdit;
    CheckBox1:  TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox24Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox29Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function CountCh: integer;
  public
    { Public declarations }
    status: TStatusMode;//integer;//1 - export, 2 - import
    path:   string;//путь к файлам
  end;

var
  Form35: TForm35;

implementation

uses
  fstruct,
  datamodule,
  main,
  DateUtils,
  service,
  progress;

{$R *.dfm}

procedure TForm35.Button1Click(Sender: TObject);
{ Экспорт/импорт выбранных файлов }
var
  ext1, ext2, dt: string;
  pr: TAboutBox1;
  i:  integer;
begin
  ext1 := '.dbf';
  ext2 := IntToStr(Form1.dist) + ext1;
  if CheckBox29.Checked then
    dt := '01.' + Copy(MaskEdit1.Text, 4, 2) + '.' + copy(MaskEdit1.Text, 7, 4)
  else
    dt := '';
  pr := TAboutBox1.Create(Application);
  pr.Label2.Caption := 'Обработано файлов:';
  pr.Label3.Caption := '';
  pr.ProgressBar1.Max := CountCh;
  pr.ProgressBar1.Step := 1;
  i := 0;
  case status of
    mExport://export
    begin
      pr.Label1.Caption := 'Экспорт данных';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      try
        if CheckBox8.Checked then
        begin
          ExportCl(path, dt, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox30.Checked then
        begin
          ExportHist(path, dt, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox9.Checked then
        begin
          ExportFam(path, dt, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox10.Checked then
        begin
          ExportSub(path, dt, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox13.Checked then
        begin
          ExportInsp(path, Form1.dist, True);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox11.Checked then
        begin
          ExportMng(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox28.Checked then
        begin
          ExportSluj(path, dt, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox7.Checked then
        begin
          ExportHouse(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox31.Checked then
        begin
          ExportFact(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox24.Checked then
        begin
          if CheckBox1.Checked then
          begin
            ExportStr(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox5.Checked then
          begin
            ExportDiff(path, 'bank');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox3.Checked then
          begin
            ExportDiff(path, 'dist');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox12.Checked then
          begin
            ExportDiff(path, 'fond');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox4.Checked then
          begin
            ExportMin(path, dt);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox2.Checked then
          begin
            ExportDiff(path, 'stat');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox23.Checked then
          begin
            ExportRStnd(path, dt);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox25.Checked then
          begin
            ExportDiff(path, 'norm');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox26.Checked then
          begin
            ExportDiff(path, 'priv');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox22.Checked then
          begin
            ExportDiff(path, 'cert');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'own');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'settl');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'cntrl');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'rel');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'serv');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'charge');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox6.Checked then
          begin
            ExportTarif(path, dt, 'cont', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox14.Checked then
          begin
            ExportTarif(path, dt, 'rep', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox15.Checked then
          begin
            ExportTarif(path, dt, 'cold', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox16.Checked then
          begin
            ExportTarif(path, dt, 'hot', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox27.Checked then
          begin
            ExportTarif(path, dt, 'canal', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox17.Checked then
          begin
            ExportTarif(path, dt, 'heat', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox18.Checked then
          begin
            ExportTarif(path, dt, 'gas', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox19.Checked then
          begin
            ExportTarif(path, dt, 'el', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox20.Checked then
          begin
            ExportTarif(path, dt, 'wood', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox21.Checked then
          begin
            ExportTarif(path, dt, 'coal', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
        end;
        //pr.Close;
        //pr.Release;
        pr.Free;
        ShowMessage('Экспорт успешно завершен!');
      except
        if Assigned(pr) then
          pr.Free;
        ShowMessage('Ошибка экспорта!');
      end;
    pr.Free;
    end;
    mImport: //import
    begin
      pr.Label1.Caption := 'Импорт данных';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      try
        Datamodule1.Database1.StartTransaction;
        if CheckBox24.Checked then
        begin
          if CheckBox1.Checked then
          begin
            ImportStr(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox5.Checked then
          begin
            ImportBank(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox3.Checked then
          begin
            ImportDist(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox12.Checked then
          begin
            ImportFond(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox4.Checked then
          begin
            ImportMin(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox2.Checked then
          begin
            ImportStat(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox23.Checked then
          begin
            ImportRStnd(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox25.Checked then
          begin
            ImportNorm(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox26.Checked then
          begin
            ImportPriv(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox22.Checked then
          begin
            ImportDiff(path, 'cert');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'own');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'settl');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'cntrl');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'rel');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'serv');
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportCharge(path);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox6.Checked then
          begin
            ImportTarif(path, 'cont', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox14.Checked then
          begin
            ImportTarif(path, 'rep', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox15.Checked then
          begin
            ImportTarifb(path, 'cold', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox16.Checked then
          begin
            ImportTarifb(path, 'hot', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox27.Checked then
          begin
            ImportTarif(path, 'canal', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox17.Checked then
          begin
            ImportTarif(path, 'heat', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox18.Checked then
          begin
            ImportTarif(path, 'gas', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox19.Checked then
          begin
            ImportEl(path, Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox20.Checked then
          begin
            ImportTarif(path, 'wood', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox21.Checked then
          begin
            ImportTarif(path, 'coal', Form1.dist);
            Inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
        end;
        if CheckBox13.Checked then
        begin
          ImportInsp(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox11.Checked then
        begin
          ImportMng(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox7.Checked then
        begin
          ImportHouse(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox8.Checked then
        begin
          ImportCl(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox9.Checked then
        begin
          ImportFam(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox10.Checked then
        begin
          ImportSub(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox28.Checked then
        begin
          ImportSluj(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox30.Checked then
        begin
          ImportHist(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox31.Checked then
        begin
          ImportFact(path, Form1.dist);
          Inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        //pr.Close;
        //pr.Release;
        pr.Free;
        Datamodule1.Database1.Commit;
        FillCurr(Form1.bpath, Form1.rdt, Form1.dist, Form1.codedbf);
        ShowMessage('Импорт найденных файлов успешно завершен!');
        Form1.Reload;
      except
        Datamodule1.Database1.Rollback;
        if Assigned(pr) then
          pr.Free;
        ShowMessage('Ошибка импорта!');
      end;

    end;
  end;
  Close;
end;

procedure TForm35.FormShow(Sender: TObject);
{ Установка первоначальных настроек }
begin
  Edit1.Text := ExtractFilePath(Application.ExeName) + 'out\';//путь по умолчанию
  path := Edit1.Text;

  if not DirectoryExists(path) then
    CreateDir(path);

  MaskEdit1.Enabled := False;//экспорт/импорт всех данных
  MaskEdit1.Text := '';
  CheckBox29.Checked := False;
  MaskEdit1.Text := Form1.rdt;
  case status of
    mExport:
    begin
      Form35.Caption  := 'Экспорт файлов';
      Button1.Caption := 'Экспорт';
    end;
    mImport:
    begin
      Form35.Caption  := 'Импорт файлов';
      Button1.Caption := 'Импорт';
    end;
  end;
  CheckBox8.Checked  := True;
  CheckBox30.Checked := True;
  CheckBox9.Checked  := True;
  CheckBox10.Checked := True;
  CheckBox11.Checked := True;
  CheckBox13.Checked := True;
  CheckBox28.Checked := True;
  CheckBox7.Checked  := True;
  CheckBox24.Checked := False;
  GroupBox1.Enabled  := False;
  CheckBox1.Checked  := False;
  CheckBox5.Checked  := False;
  CheckBox3.Checked  := False;
  CheckBox12.Checked := False;
  CheckBox4.Checked  := False;
  CheckBox2.Checked  := False;
  CheckBox25.Checked := False;
  CheckBox23.Checked := False;
  CheckBox26.Checked := False;
  CheckBox27.Checked := False;
  CheckBox22.Checked := False;
  CheckBox6.Checked  := False;
  CheckBox14.Checked := False;
  CheckBox15.Checked := False;
  CheckBox16.Checked := False;
  CheckBox17.Checked := False;
  CheckBox18.Checked := False;
  CheckBox19.Checked := False;
  CheckBox20.Checked := False;
  CheckBox21.Checked := False;
end;

procedure TForm35.Button2Click(Sender: TObject);
{ Вызов формы выбора пути }
begin
  //  Form36.ShowModal;
  path := SelectDir;
  //  path := Form36.path;
  if path = '' then
    path := ExtractFilePath(Application.ExeName) + 'out\';

  Edit1.Text := path;
end;

procedure TForm35.CheckBox24Click(Sender: TObject);
{
  Обработка нажатия CheckBox24. В случае выбора этого CheckBox происходит доступ
  к выбору справочников, если нет, то они недоступны для выбора
}
begin
  if CheckBox24.Checked then
    GroupBox1.Enabled := True
  else
    GroupBox1.Enabled := False;
end;

procedure TForm35.Button4Click(Sender: TObject);
{ Обработка нажатия клавиши "Все". Происходит выбор всех справочников в группе. }
begin
  CheckBox1.Checked  := True;
  CheckBox2.Checked  := True;
  CheckBox3.Checked  := True;
  CheckBox4.Checked  := True;
  CheckBox5.Checked  := True;
  CheckBox6.Checked  := True;
  CheckBox12.Checked := True;
  CheckBox14.Checked := True;
  CheckBox15.Checked := True;
  CheckBox16.Checked := True;
  CheckBox17.Checked := True;
  CheckBox18.Checked := True;
  CheckBox19.Checked := True;
  CheckBox20.Checked := True;
  CheckBox21.Checked := True;
  CheckBox22.Checked := True;
  CheckBox23.Checked := True;
  CheckBox25.Checked := True;
  CheckBox26.Checked := True;
  CheckBox27.Checked := True;
end;

procedure TForm35.CheckBox29Click(Sender: TObject);
{
  обрабатывает нажатие на CheckBox29. Если CheckBox29 выбран, то дата учитывается
  при экспорте/импорте, иначе нет и обрабатываеются все данные.
}
begin
  if CheckBox29.Checked then
  begin
    MaskEdit1.Enabled := True;//экспорт/импорт по указанной дате
    MaskEdit1.Text := Form1.rdt;
  end
  else
  begin
    MaskEdit1.Enabled := False;//экспорт/импорт всех данных
    MaskEdit1.Text := '';
  end;
end;

procedure TForm35.MaskEdit1Exit(Sender: TObject);
{ Обработка ввода даты }
begin
  CheckDate(MaskEdit1);
end;

procedure TForm35.MaskEdit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
{ Обработка ввода даты }
begin
  if key = VK_RETURN then
    CheckDate(MaskEdit1);
end;

function TForm35.CountCh: integer;
begin
  Result := 0;
  if CheckBox8.Checked then
    Inc(Result);
  if CheckBox30.Checked then
    Inc(Result);
  if CheckBox9.Checked then
    Inc(Result);
  if CheckBox10.Checked then
    Inc(Result);
  if CheckBox13.Checked then
    Inc(Result);
  if CheckBox11.Checked then
    Inc(Result);
  if CheckBox28.Checked then
    Inc(Result);
  if CheckBox7.Checked then
    Inc(Result);
  if CheckBox1.Checked then
    Inc(Result);
  if CheckBox5.Checked then
    Inc(Result);
  if CheckBox3.Checked then
    Inc(Result);
  if CheckBox12.Checked then
    Inc(Result);
  if CheckBox4.Checked then
    Inc(Result);
  if CheckBox2.Checked then
    Inc(Result);
  if CheckBox23.Checked then
    Inc(Result);
  if CheckBox25.Checked then
    Inc(Result);
  if CheckBox26.Checked then
    Inc(Result);
  if CheckBox22.Checked then
    Inc(Result, 7);
  if CheckBox6.Checked then
    Inc(Result);
  if CheckBox14.Checked then
    Inc(Result);
  if CheckBox15.Checked then
    Inc(Result);
  if CheckBox16.Checked then
    Inc(Result);
  if CheckBox27.Checked then
    Inc(Result);
  if CheckBox17.Checked then
    Inc(Result);
  if CheckBox18.Checked then
    Inc(Result);
  if CheckBox19.Checked then
    Inc(Result);
  if CheckBox20.Checked then
    Inc(Result);
  if CheckBox21.Checked then
    Inc(Result);
  if CheckBox31.Checked then
    Inc(Result);
end;

procedure TForm35.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Form1.SetTarifs;
end;

end.
