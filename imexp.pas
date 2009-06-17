unit imexp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, DB, DBTables, Mask;

type
  TForm35 = class(TForm)
    CheckBox7: TCheckBox;
    Button1: TButton;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox13: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox6: TCheckBox;
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
    Button4: TButton;
    CheckBox16: TCheckBox;
    CheckBox27: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    MaskEdit1: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox24Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox29Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function CountCh: integer;
  public
    { Public declarations }
    status: integer;//1 - export, 2 - import
    path: string;//путь к файлам
  end;

var
  Form35: TForm35;

implementation

uses fstruct,browse, datamodule, main,DateUtils, service, progress;

{$R *.dfm}

procedure TForm35.Button1Click(Sender: TObject);
{ Экспорт/импорт выбранных файлов }
var
  ext1,ext2,dt: string;
  pr: TAboutBox1;
  i: integer;
begin
  ext1 := '.dbf';
  ext2 := IntToStr(Form1.dist) + ext1;
  if CheckBox29.Checked then
    dt := '01.'+Copy(MaskEdit1.Text,4,2)+'.'+copy(MaskEdit1.Text,7,4)
  else
    dt := '';
  pr := TAboutBox1.Create(Application);
  pr.Label2.Caption := 'Обработано файлов:';
  pr.Label3.Caption := '';
  pr.ProgressBar1.Max := CountCh;
  pr.ProgressBar1.Step := 1;
  i:=0;
  case status of
  1://export
    begin
      pr.Label1.Caption := 'Экспорт данных';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      try
        if CheckBox8.Checked then begin
          ExportCl(path, dt, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox30.Checked then begin
          ExportHist(path, dt, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox9.Checked then begin
          ExportFam(path, dt, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox10.Checked then begin
          ExportSub(path, dt, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox13.Checked then begin
          ExportInsp(path, Form1.dist,true);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox11.Checked then begin
          ExportMng(path, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox28.Checked then begin
          ExportSluj(path, dt, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox7.Checked then begin
          ExportHouse(path, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox24.Checked then begin
          if CheckBox1.Checked then begin
            ExportStr(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox5.Checked then begin
            ExportDiff(path,'bank');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox3.Checked then begin
            ExportDiff(path,'dist');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox12.Checked then begin
            ExportDiff(path,'fond');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox4.Checked then begin
            ExportMin(path, dt);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox2.Checked then begin
            ExportDiff(path,'stat');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox23.Checked then begin
            ExportRStnd(path, dt);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox25.Checked then begin
            ExportDiff(path,'norm');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox26.Checked then begin
            ExportDiff(path,'priv');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox22.Checked then begin
            ExportDiff(path, 'cert');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'own');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'settl');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'cntrl');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'rel');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path, 'serv');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ExportDiff(path,'charge');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox6.Checked then begin
            ExportTarif(path, dt, 'cont',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox14.Checked then begin
            ExportTarif(path, dt, 'rep',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox15.Checked then begin
            ExportTarif(path, dt, 'cold',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox16.Checked then begin
            ExportTarif(path, dt, 'hot',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox27.Checked then begin
            ExportTarif(path, dt, 'canal',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox17.Checked then begin
            ExportTarif(path, dt, 'heat',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox18.Checked then begin
            ExportTarif(path, dt, 'gas',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox19.Checked then begin
            ExportTarif(path, dt,'el',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox20.Checked then begin
            ExportTarif(path, dt, 'wood',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox21.Checked then begin
            ExportTarif(path, dt, 'coal',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
        end;
        pr.Close;
        pr.Release;
        ShowMessage('Экспорт успешно завершен!');
      except
        ShowMessage('Ошибка экспорта!');
      end;
    end;
  2: //import
    begin
      pr.Label1.Caption := 'Импорт данных';
      pr.Show;
      pr.Update;
      SendMessage(pr.Handle, wm_paint, 0, 0);
      try
        Datamodule1.Database1.StartTransaction;
        if CheckBox24.Checked then begin
          if CheckBox1.Checked then begin
            ImportStr(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox5.Checked then begin
            ImportBank(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox3.Checked then begin
            ImportDist(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox12.Checked then begin
            ImportFond(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox4.Checked then begin
            ImportMin(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox2.Checked then begin
            ImportStat(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox23.Checked then begin
            ImportRStnd(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox25.Checked then begin
            ImportNorm(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox26.Checked then begin
            ImportPriv(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox22.Checked then begin
            ImportDiff(path, 'cert');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'own');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'settl');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'cntrl');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'rel');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportDiff(path, 'serv');
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
            ImportCharge(path);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox6.Checked then begin
            ImportTarif(path, 'cont',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox14.Checked then begin
            ImportTarif(path, 'rep',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox15.Checked then begin
            ImportTarifb(path, 'cold',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox16.Checked then begin
            ImportTarifb(path, 'hot',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox27.Checked then begin
            ImportTarif(path, 'canal',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox17.Checked then begin
            ImportTarif(path, 'heat',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox18.Checked then begin
            ImportTarif(path, 'gas',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox19.Checked then begin
            ImportEl(path,Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox20.Checked then begin
            ImportTarif(path,'wood',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
          if CheckBox21.Checked then begin
            ImportTarif(path, 'coal',Form1.dist);
            inc(i);
            pr.ProgressBar1.StepIt;
            pr.Label3.Caption := IntToStr(i);
            pr.Update;
            SendMessage(pr.Handle, wm_paint, 0, 0);
          end;
        end;
        if CheckBox13.Checked then begin
          ImportInsp(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox11.Checked then begin
          ImportMng(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox7.Checked then begin
          ImportHouse(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox8.Checked then begin
          ImportCl(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox9.Checked then begin
          ImportFam(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox10.Checked then begin
          ImportSub(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox28.Checked then begin
          ImportSluj(path,Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        if CheckBox30.Checked then begin
          ImportHist(path, Form1.dist);
          inc(i);
          pr.ProgressBar1.StepIt;
          pr.Label3.Caption := IntToStr(i);
          pr.Update;
          SendMessage(pr.Handle, wm_paint, 0, 0);
        end;
        pr.Close;
        pr.Release;
        Datamodule1.Database1.Commit;
        FillCurr(Form1.bpath,Form1.rdt,Form1.dist,Form1.codedbf);
        ShowMessage('Импорт найденных файлов успешно завершен!');
        Form1.Reload;
      except
        Datamodule1.Database1.Rollback;
        ShowMessage('Ошибка импорта!');
      end;
    end;
  end;
  Close;
end;

procedure TForm35.FormShow(Sender: TObject);
{ Установка первоначальных настроек }
begin
  Edit1.Text := ExtractFilePath(Application.ExeName)+'out\';//путь по умолчанию
  path := Edit1.Text;
  MaskEdit1.Enabled := false;//экспорт/импорт всех данных
  MaskEdit1.Text := '';
  CheckBox29.Checked := false;
  MaskEdit1.Text := Form1.rdt;
  case status of
  1:
    begin
      Form35.Caption := 'Экспорт файлов';
      Button1.Caption := 'Экспорт';
    end;
  2:
    begin
      Form35.Caption := 'Импорт файлов';
      Button1.Caption := 'Импорт';
    end;
  end;
  CheckBox8.Checked := true;
  CheckBox30.Checked := true;
  CheckBox9.Checked := true;
  CheckBox10.Checked := true;
  CheckBox11.Checked := true;
  CheckBox13.Checked := true;
  CheckBox28.Checked := true;
  CheckBox7.Checked := true;
  CheckBox24.Checked := false;
  GroupBox1.Enabled := false;
  CheckBox1.Checked := false;
  CheckBox5.Checked := false;
  CheckBox3.Checked := false;
  CheckBox12.Checked := false;
  CheckBox4.Checked := false;
  CheckBox2.Checked := false;
  CheckBox25.Checked := false;
  CheckBox23.Checked := false;
  CheckBox26.Checked := false;
  CheckBox27.Checked := false;
  CheckBox22.Checked := false;
  CheckBox6.Checked := false;
  CheckBox14.Checked := false;
  CheckBox15.Checked := false;
  CheckBox16.Checked := false;
  CheckBox17.Checked := false;
  CheckBox18.Checked := false;
  CheckBox19.Checked := false;
  CheckBox20.Checked := false;
  CheckBox21.Checked := false;
end;

procedure TForm35.Button2Click(Sender: TObject);
{ Вызов формы выбора пути }
begin
  Form36.ShowModal;
  path := Form36.path;
  Edit1.Text := path;
end;

procedure TForm35.CheckBox24Click(Sender: TObject);
{
  Обработка нажатия CheckBox24. В случае выбора этого CheckBox происходит доступ
  к выбору справочников, если нет, то они недоступны для выбора
}
begin
  if CheckBox24.Checked then
    GroupBox1.Enabled := true
  else
    GroupBox1.Enabled := false;
end;

procedure TForm35.Button4Click(Sender: TObject);
{ Обработка нажатия клавиши "Все". Происходит выбор всех справочников в группе. }
begin
  CheckBox1.Checked := true;
  CheckBox2.Checked := true;
  CheckBox3.Checked := true;
  CheckBox4.Checked := true;
  CheckBox5.Checked := true;
  CheckBox6.Checked := true;
  CheckBox12.Checked := true;
  CheckBox14.Checked := true;
  CheckBox15.Checked := true;
  CheckBox16.Checked := true;
  CheckBox17.Checked := true;
  CheckBox18.Checked := true;
  CheckBox19.Checked := true;
  CheckBox20.Checked := true;
  CheckBox21.Checked := true;
  CheckBox22.Checked := true;
  CheckBox23.Checked := true;
  CheckBox25.Checked := true;
  CheckBox26.Checked := true;
  CheckBox27.Checked := true;
end;

procedure TForm35.CheckBox29Click(Sender: TObject);
{
  обрабатывает нажатие на CheckBox29. Если CheckBox29 выбран, то дата учитывается
  при экспорте/импорте, иначе нет и обрабатываеются все данные.
}
begin
  if CheckBox29.Checked then begin
    MaskEdit1.Enabled := true;//экспорт/импорт по указанной дате
    MaskEdit1.Text := Form1.rdt;
  end
  else begin
    MaskEdit1.Enabled := false;//экспорт/импорт всех данных
    MaskEdit1.Text := '';
  end;
end;

procedure TForm35.MaskEdit1Exit(Sender: TObject);
{ Обработка ввода даты }
begin
  CheckDate(MaskEdit1);
end;

procedure TForm35.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{ Обработка ввода даты }
begin
  if key=VK_RETURN then
    CheckDate(MaskEdit1);
end;

function TForm35.CountCh: integer;
begin
  Result := 0;
  if CheckBox8.Checked then inc(Result);
  if CheckBox30.Checked then inc(Result);
  if CheckBox9.Checked then inc(Result);
  if CheckBox10.Checked then inc(Result);
  if CheckBox13.Checked then inc(Result);
  if CheckBox11.Checked then inc(Result);
  if CheckBox28.Checked then inc(Result);
  if CheckBox7.Checked then inc(Result);
  if CheckBox1.Checked then inc(Result);
  if CheckBox5.Checked then inc(Result);
  if CheckBox3.Checked then inc(Result);
  if CheckBox12.Checked then inc(Result);
  if CheckBox4.Checked then inc(Result);
  if CheckBox2.Checked then inc(Result);
  if CheckBox23.Checked then inc(Result);
  if CheckBox25.Checked then inc(Result);
  if CheckBox26.Checked then inc(Result);
  if CheckBox22.Checked then inc(Result,7);
  if CheckBox6.Checked then inc(Result);
  if CheckBox14.Checked then inc(Result);
  if CheckBox15.Checked then inc(Result);
  if CheckBox16.Checked then inc(Result);
  if CheckBox27.Checked then inc(Result);
  if CheckBox17.Checked then inc(Result);
  if CheckBox18.Checked then inc(Result);
  if CheckBox19.Checked then inc(Result);
  if CheckBox20.Checked then inc(Result);
  if CheckBox21.Checked then inc(Result);
end;

procedure TForm35.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Form1.SetTarifs;
end;

end.
