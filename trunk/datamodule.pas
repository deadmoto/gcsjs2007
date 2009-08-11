unit DataModule;

interface

uses
{*******************************************************************************
Default Delphi units:
*******************************************************************************}
  sysutils,
  classes,
  db,
  dbtables,
{*******************************************************************************
External components:
*******************************************************************************}
  dbf,dialogs, ODBC_DSN, Registry, service;

type
  TDataModule1 = class(TDataModule)
    Query1: TQuery;
    Query2: TQuery;
    Database1: TDatabase;
    Query3: TQuery;
    Database2: TDatabase;
    Query4: TQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    qtarif: TQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DBF1: TDBF;
    { Public declarations }
    t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, pv, tc, norm1: TQuery;
    procedure ChAttrTable(d: integer);
  end;

var
  DataModule1: TDataModule1;

implementation

uses ConnectUnit;


{$R *.dfm}

{******************************************************************************}

procedure TDataModule1.FormCreate(Sender: TObject);
begin
  with TRegistry.Create do
  try
    RootKey:= System.Cardinal($80000001);
    if OpenKey('\Software\Subsidy\Connection', TRUE) then
      if not ValueExists('Server') then
        begin
          Form45:= TForm45.Create(nil);
          Form45.mode:= mBug;
          Form45.ShowModal;
          Form45.Free;
        end
      else
      begin
        if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ReadString('Server'), 'Subsidy', '') then
        ShowMessage('Ошибка при создании DSN записи SQLSub!');
//        if not ODBC_DSN.AddDSNdBaseSource('DBFSub', ExtractFilePath(paramstr(0))+'database' , '') then
//        ShowMessage('Ошибка при создании DSN записи DBFSub!');
      end;
  finally
  CloseKey;
  Free;
  end;

  //назначение директории для файлов _QSQL*.dbf
  if getConfValue('0.UseTempDir') then Session.PrivateDir:= GetTempDir;

  dbf1:=tdbf.create(self);//создание парсера dbf-файлов
//   tc := TQuery.Create(Self);
  t1 := TQuery.Create(Self);
  t2 := TQuery.Create(Self);
  t3 := TQuery.Create(Self);
  t4 := TQuery.Create(Self);
  t5 := TQuery.Create(Self);
  t6 := TQuery.Create(Self);
  t7 := TQuery.Create(Self);
  t8 := TQuery.Create(Self);
  t9 := TQuery.Create(Self);
  t10 := TQuery.Create(Self);
  pv := TQuery.Create(Self);
  norm1 := TQuery.Create(Self);
  tc := TQuery.Create(Self);

  //Назначение базе DBFSub переменной PATH
  if getConfValue('0.OtherDatabasePath') then
    DataBase2.Params.Add('PATH='+getConfValue('0.DatabasePath'))
  else DataBase2.Params.Add('PATH='+ExtractFilePath(paramstr(0))+'database');
end;

procedure TDataModule1.ChAttrTable(d: integer);
{
  Процедура производит изменения alias
}
begin

end;

end.

