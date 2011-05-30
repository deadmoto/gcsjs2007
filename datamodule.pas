unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBTables, Dialogs, Registry, ADODB, dbf;

type
  TDModule = class(TDataModule)
    Query1:      TQuery;
    Database1:   TDatabase;
    DataSource1: TDataSource;
    qTarif: TADOQuery;
    dbfConnection: TADOConnection;
    sqlConnection: TADOConnection;
    sqlQuery1: TADOQuery;
    sqlDataSource: TDataSource;
    sqlQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DBF1: TDBF;
    { Public declarations }
    t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, tc: TADOQuery;
    pv, norm1: TQuery;
    function SetDBFConnectStr(path: string): string;
    function SetSQLConnectStr(path: string): string;
  end;

var
  DModule: TDModule;

implementation

uses
  uConnection, ODBC_DSN, appregistry, md5, uSettings;


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

  sqlConnection.ConnectionString := SetSQLConnectStr(ReadRegProperty('Server'));

  //Назначение пути для баз *.dbf
  if getConfValue('0.OtherDatabasePath') then
    dbfConnection.ConnectionString := SetDBFConnectStr(getConfValue('0.DatabasePath'))
  else
    dbfConnection.ConnectionString := SetDBFConnectStr(ExtractFilePath(ParamStr(0)) + '\database');

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

function TDModule.SetDBFConnectStr(path: string): string;
begin
  Result := format(
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'#13#10 +
    'Extended Properties=dBASE IV;User ID=Admin;Password=;', [path]
  );
end;

function TDModule.SetSQLConnectStr(path: string): string;
begin
  Result := format(
    'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=%s;Password=%s;Initial Catalog=Subsidy;Data Source=%s',
    [ReadRegProperty('User'), GetConnectionPass(ReadRegProperty('Password')), path]
  );
end;

end.

