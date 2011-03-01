unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBTables, Dialogs, Registry, ADODB, dbf;

type
  TDModule = class(TDataModule)
    Query1:      TQuery;
    Query2:      TQuery;
    Database1:   TDatabase;
    Query3:      TQuery;
    DataSource1: TDataSource;
    qTarif: TADOQuery;
    DataSource2: TDataSource;
    dbfConnection: TADOConnection;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DBF1: TDBF;
    { Public declarations }
    t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, tc: TADOQuery;
    pv, norm1: TQuery;
    function SetConnectStr(path: string): string;
  end;

var
  DModule: TDModule;

implementation

uses
  uConnection, service, ODBC_DSN, connection_module, md5;


{$R *.dfm}

{******************************************************************************}

procedure TDModule.FormCreate(Sender: TObject);
var
  _user, _password: string;
begin
  if CheckRegProperty('User', True) then
    _user := ReadRegProperty('User');

  //if CheckRegProperty('Password', True) then
    _password := ReadRegProperty('Password');

  Database1.Params.Values['USER NAME'] := _user;
  Database1.Params.Values['PASSWORD'] := GetConnectionPass(_password);

  if not CheckRegProperty('Server') then
  begin
    ConnectionFrm := TConnectionFrm.Create(nil);
    ConnectionFrm.mode := mBug;
    ConnectionFrm.ShowModal;
    ConnectionFrm.Free;
  end
  else
  begin
    if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ReadRegProperty('Server'), 'Subsidy', ReadRegProperty('User'), ReadRegProperty('Password'), 'База данных программы Subsidy') then
      ShowMessage('Ошибка при создании DSN записи SQLSub!');
  end;

  //назначение директории для файлов _QSQL*.dbf
{  if getConfValue('0.UseTempDir') then
    Session.PrivateDir := GetTempDir;}

  //Назначение пути для баз *.dbf
  if getConfValue('0.OtherDatabasePath') then
    dbfConnection.ConnectionString := SetConnectStr(getConfValue('0.DatabasePath'))
  else
    dbfConnection.ConnectionString := SetConnectStr(ExtractFilePath(ParamStr(0)) + '\database');


  dbf1 := tdbf.Create(self);//создание парсера dbf-файлов

  t1  := TADOQuery.Create(Self);
  t2  := TADOQuery.Create(Self);
  t3  := TADOQuery.Create(Self);
  t4  := TADOQuery.Create(Self);
  t5  := TADOQuery.Create(Self);
  t6  := TADOQuery.Create(Self);
  t7  := TADOQuery.Create(Self);
  t8  := TADOQuery.Create(Self);
  t9  := TADOQuery.Create(Self);
  t10 := TADOQuery.Create(Self);
  tc  := TADOQuery.Create(Self);

  pv  := TQuery.Create(Self);
  norm1 := TQuery.Create(Self);
end;

function TDModule.SetConnectStr(path: string): string;
begin
  Result := 'Provider=MSDASQL.1; Persist Security Info=False; '+ #13 +
    'Extended Properties="Driver={Microsoft dBASE Driver (*.dbf)};'+ #13 +
    'DriverID=277; Dbq='+path+'\"'
end;

end.

