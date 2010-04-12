unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBTables, Dialogs, Registry, ADODB, dbf;

type
  TDataModule1 = class(TDataModule)
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
  DataModule1: TDataModule1;

implementation

uses
  uConnection, service, ODBC_DSN;


{$R *.dfm}

{******************************************************************************}

procedure TDataModule1.FormCreate(Sender: TObject);
begin
  with TRegistry.Create do
    try
      RootKey := System.cardinal($80000001);//HKEY_CURRENT_USER
      if OpenKey('\Software\Subsidy\Connection', True) then
        if not ValueExists('Server') then
        begin
          ConnectionFrm := TConnectionFrm.Create(nil);
          ConnectionFrm.mode := mBug;
          ConnectionFrm.ShowModal;
          ConnectionFrm.Free;
        end
        else
        begin
          if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ReadString('Server'), 'Subsidy', '') then
            ShowMessage('������ ��� �������� DSN ������ SQLSub!');
        end;
    finally
      CloseKey;
      Free;
    end;

  //���������� ���������� ��� ������ _QSQL*.dbf
{  if getConfValue('0.UseTempDir') then
    Session.PrivateDir := GetTempDir;}

  //���������� ���� ��� ��� *.dbf
  if getConfValue('0.OtherDatabasePath') then
    dbfConnection.ConnectionString := SetConnectStr(getConfValue('0.DatabasePath'))
  else
    dbfConnection.ConnectionString := SetConnectStr(ExtractFilePath(ParamStr(0)) + '\database');


  dbf1 := tdbf.Create(self);//�������� ������� dbf-������

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

function TDataModule1.SetConnectStr(path: string): string;
begin
  Result := 'Provider=MSDASQL.1; Persist Security Info=False; '+ #13 +
    'Extended Properties="Driver={Microsoft dBASE Driver (*.dbf)};'+ #13 +
    'DriverID=277; Dbq='+path+'\"'
end;

end.

