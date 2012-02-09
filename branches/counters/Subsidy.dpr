program Subsidy;

uses
  Forms,
  Dialogs,
  Windows,
  main in 'main.pas' {MainForm},
  datamodule in 'datamodule.pas' {DModule: TDModule},
  sclient in 'sclient.pas' {EditClForm},
  inspector in 'inspector.pas' {Form3},
  district in 'district.pas' {Form4},
  Street in 'Street.pas' {Form5},
  fond in 'fond.pas' {Form6},
  manager in 'manager.pas' {Form7},
  privilege in 'privilege.pas' {Form12},
  minimum in 'minimum.pas' {Form13},
  status in 'status.pas' {Form14},
  elpower in 'elpower.pas' {Form23},
  houses in 'houses.pas' {Form24},
  uSelectDist in 'uSelectDist.pas' {SelectDistFrm},
  norm in 'norm.pas' {Form27},
  chpriv in 'chpriv.pas' {Form11},
  chhouse in 'chhouse.pas' {Form30},
  bank in 'bank.pas' {Form31},
  search in 'search.pas' {Form33},
  opend in 'opend.pas' {Form26},
  sql in 'sql.pas' {SQLExecForm},
  imexp in 'imexp.pas' {Form35},
  progress in 'progress.pas' {AboutBox1},
  chserv in 'chserv.pas' {Form29},
  rstnd in 'rstnd.pas' {Form38},
  tarif in 'tarif.pas' {Form15},
  loop in 'loop.pas' {Form16},
  chinsp in 'chinsp.pas' {Form17},
  curhist in 'curhist.pas' {Form18},
  tarifb in 'tarifb.pas' {Form19},
  about in 'about.pas' {AboutBox},
  merge in 'merge.pas' {MergeForm},
  shtarif in 'shtarif.pas' {Form37},
  shtarifb in 'shtarifb.pas' {Form39},
  mdd in 'mdd.pas' {Form20},
  statlm in 'statlm.pas' {Form40},
  statage in 'statage.pas' {Form22},
  codedbf in 'codedbf.pas' {Form41},
  chtarifs in 'chtarifs.pas' {Form42},
  rrecalc in 'rrecalc.pas' {Form43},
  stat in 'stat.pas' {Stats},
  uSluj in 'uSluj.pas' {SlujFrm},
  uConnection in 'uConnection.pas' {ConnectionFrm},
  uReportEdit in 'uReportEdit.pas' {ReportEditFrm},
  uReportData in 'uReportData.pas' {ReportDataFrm},
  uGenRefBook in 'uGenRefBook.pas' {GenRefBookFrm},
  uShade in 'uShade.pas' {ShadeForm},
  uSettings in 'uSettings.pas' {SettingsFrm},
  fAppProp in 'frames\fAppProp.pas' {fAppProp: TFrame},
  fAppUpdate in 'frames\fAppUpdate.pas' {fAppUpdate: TFrame},
  client in 'core\client.pas',
  service in 'core\service.pas',
  fstruct in 'core\fstruct.pas',
  appregistry in 'core\appregistry.pas',
  ODBC_DSN in 'data\ODBC_DSN.pas',
  srvinfo in 'data\srvinfo.pas',
  SevenZipVCL in 'data\SevenZipVCL.pas',
  dbf in 'data\dbf.pas',
  padegFIO in 'data\padegFIO.pas',
  md5 in 'data\md5.pas',
  wincontrols in 'data\wincontrols.pas',
  MyTypes in 'data\MyTypes.pas',
  HelpUtils in 'data\HelpUtils.pas',
  VBScript_RegExp_55_TLB in 'data\VBScript_RegExp_55_TLB.pas',
  service2 in 'core\service2.pas',
  uOffice in 'uOffice.pas' {OfficeForm};

{$R *.res}
//{$R myRes.RES}

{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}

begin
  application.Initialize;
  application.Title := '—убсидии';
  Application.CreateForm(TDModule, DModule);
  try
    DModule.sqlConnection.Connected := True;
    try
      DModule.dbfConnection.Connected := True;
      try
        if CheckParam('-sql') then
        begin
          Application.CreateForm(TSQLExecForm, SQLExecForm);
          Application.Run;
          Exit;
        end;
        if CheckParam('-conmanager') then
        begin
          Application.CreateForm(TConnectionFrm, ConnectionFrm);
          Application.Run;
          Exit;
        end;
        Application.CreateForm(TMainForm, MainForm);
        Application.CreateForm(TAboutBox1, AboutBox1);
        Application.CreateForm(TForm29, Form29);
        Application.CreateForm(TForm38, Form38);
        Application.CreateForm(TForm16, Form16);
        Application.CreateForm(TForm17, Form17);
        Application.CreateForm(TForm18, Form18);
        Application.CreateForm(TForm20, Form20);
        Application.CreateForm(TAboutBox, AboutBox);
        Application.CreateForm(TMergeForm, MergeForm);
        Application.CreateForm(TSelectDistFrm, SelectDistFrm);
        MainForm.Show;
        MainForm.Update;
        MainForm.Reload;
        Application.CreateForm(TEditClForm, EditClForm);
        Application.CreateForm(TForm3, Form3);
        Application.CreateForm(TForm4, Form4);
        Application.CreateForm(TForm5, Form5);
        Application.CreateForm(TForm6, Form6);
        Application.CreateForm(TForm7, Form7);
        Application.CreateForm(TForm12, Form12);
        Application.CreateForm(TForm13, Form13);
        Application.CreateForm(TForm14, Form14);
        Application.CreateForm(TForm23, Form23);
        Application.CreateForm(TForm24, Form24);
        Application.CreateForm(TForm27, Form27);
        Application.CreateForm(TForm11, Form11);
        Application.CreateForm(TForm30, Form30);
        Application.CreateForm(TForm31, Form31);
        Application.CreateForm(TAboutBox, AboutBox);
        Application.CreateForm(TForm33, Form33);
        Application.CreateForm(TForm26, Form26);
        Application.CreateForm(TForm35, Form35);
        Application.CreateForm(TForm22, Form22);
        Application.CreateForm(TForm40, Form40);
        Application.CreateForm(TForm41, Form41);
        Application.CreateForm(TForm42, Form42);
        Application.CreateForm(TForm43, Form43);
        Application.CreateForm(TConnectionFrm, ConnectionFrm);
        Application.CreateForm(TSettingsFrm, SettingsFrm);
        Application.CreateForm(TGenRefBookFrm, GenRefBookFrm);
        Application.CreateForm(TOfficeForm, OfficeForm);
        Application.Run;
      except
        ShowMessage('ѕроизошел сбой при создании одной из форм!');
      end;
    except
      ShowMessage('ѕроизошел сбой при попытке назначени€ директории дл€ временных баз: возможно данна€ директори€ не существует!');
    end;
  except
    ShowMessage('ѕроизошел сбой при попытке соединени€ с сервером!'#13 +
      'ѕроверьте:'#13#10 +
      '1.—осто€ние сервера баз данных MSSQLServer: возможно он не установлен или не запущен;'#13#10 +
      '2.—осто€ние ODBC-соединени€ SQLSub с сервером: возможно оно отстутствует или неверно настроено;'#13#10 +
      '3.—осто€ние базы данных Subsidy: возможно файлы базы данных отсутствуют;'#13#10 +
      '4.—осто€ние сети(в случае сетевого соединени€): возможно нет сетевого доступа к серверу.');
    Application.CreateForm(TConnectionFrm, ConnectionFrm);
    ConnectionFrm.mode := mBug;
    Application.Run;
  end;
end.
