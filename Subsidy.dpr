program Subsidy;

uses
  Forms,
  Dialogs,
  Windows,
  main in 'main.pas' {Form1},
  datamodule in 'datamodule.pas' {DataModule1: TDataModule},
  sclient in 'sclient.pas' {Form2},
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
  config in 'config.pas' {Form25},
  norm in 'norm.pas' {Form27},
  chpriv in 'chpriv.pas' {Form11},
  Client in 'Client.pas',
  service in 'service.pas',
  chhouse in 'chhouse.pas' {Form30},
  bank in 'bank.pas' {Form31},
  search in 'search.pas' {Form33},
  opend in 'opend.pas' {Form26},
  fstruct in 'fstruct.pas',
  sql in 'sql.pas' {Form34},
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
  merge in 'merge.pas' {Form21},
  shtarif in 'shtarif.pas' {Form37},
  shtarifb in 'shtarifb.pas' {Form39},
  mdd in 'mdd.pas' {Form20},
  statlm in 'statlm.pas' {Form40},
  statage in 'statage.pas' {Form22},
  codedbf in 'codedbf.pas' {Form41},
  chtarifs in 'chtarifs.pas' {Form42},
  rrecalc in 'rrecalc.pas' {Form43},
  stat in 'stat.pas' {Stats},
  ODBC_DSN in 'data\ODBC_DSN.pas',
  srvinfo in 'data\srvinfo.pas',
  min in 'data\min.pas',
  version in 'version.pas',
  SlujUnit in 'SlujUnit.pas' {Form44},
  ConnectUnit in 'ConnectUnit.pas' {Form45},
  ConfigPropertiesUnit in 'ConfigPropertiesUnit.pas' {ConfigFrm},
  fAppPropUnit in 'frames\fAppPropUnit.pas' {fAppProp: TFrame},
  fAppUpdateUnit in 'frames\fAppUpdateUnit.pas' {fAppUpdate: TFrame},
  AddReportDataUnit in 'AddReportDataUnit.pas' {AddReportDataFrm},
  AnyDirectoryUnit in 'AnyDirectoryUnit.pas' {AnyDirectoryFrm},
  EditReportUnit in 'EditReportUnit.pas' {EditReportFrm};

{$R *.res}
//{$R myRes.RES}

{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}

begin
  application.Initialize;
  application.title := 'Субсидии';
  Application.CreateForm(TDataModule1, DataModule1);
  try//Подключение к SQLSub - ODBC alias for Subsidy (MS SQL)
    datamodule1.database1.connected := True;
    try//Подключение к DBFSub - BDE alias for DBASE driver (BDE)
      datamodule1.dbfConnection.connected := True;
      try
        Application.CreateForm(TForm1, Form1);
        Application.CreateForm(TAboutBox1, AboutBox1);
        Application.CreateForm(TForm29, Form29);
        Application.CreateForm(TForm38, Form38);
        Application.CreateForm(TForm15, Form15);
        Application.CreateForm(TForm16, Form16);
        Application.CreateForm(TForm17, Form17);
        Application.CreateForm(TForm18, Form18);
        Application.CreateForm(TForm20, Form20);
        Application.CreateForm(TAboutBox, AboutBox);
        Application.CreateForm(TForm21, Form21);
        Form1.Show;
        Form1.Update;
        Form1.Reload;
        Application.CreateForm(TForm2, Form2);
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
        Application.CreateForm(TForm25, Form25);
        Application.CreateForm(TForm27, Form27);
        Application.CreateForm(TForm11, Form11);
        Application.CreateForm(TForm30, Form30);
        Application.CreateForm(TForm31, Form31);
        Application.CreateForm(TAboutBox, AboutBox);
        Application.CreateForm(TForm33, Form33);
        Application.CreateForm(TForm26, Form26);
        Application.CreateForm(TForm34, Form34);
        Application.CreateForm(TForm35, Form35);
        Application.CreateForm(TForm22, Form22);
        Application.CreateForm(TForm40, Form40);
        Application.CreateForm(TForm41, Form41);
        Application.CreateForm(TForm42, Form42);
        Application.CreateForm(TForm43, Form43);
        Application.CreateForm(TForm44, Form44);
        Application.CreateForm(TForm45, Form45);
        Application.CreateForm(TConfigFrm, ConfigFrm);
        Application.CreateForm(TAddReportDataFrm, AddReportDataFrm);
        Application.CreateForm(TAnyDirectoryFrm, AnyDirectoryFrm);
        Application.Run;
      except
        ShowMessage('Произошел сбой при создании одной из форм!');
      end;
    except
      ShowMessage('Произошел сбой при попытке назначения директории для временных баз: возможно данная директория не существует!');
    end;
  except
    ShowMessage('Произошел сбой при попытке соединения с сервером!' + #13 +
      'Проверьте:' + #13 +
      '1.Состояние сервера баз данных MSSQLServer: возможно он не установлен или не запущен;' + #13 +
      '2.Состояние ODBC-соединения SQLSub с сервером: возможно оно отстутствует или неверно настроено;' + #13 +
      '3.Состояние базы данных Subsidy: возможно файлы базы данных отсутствуют;' + #13 +
      '4.Состояние сети(в случае сетевого соединения): возможно нет сетевого доступа к серверу.');
  end;
end.
