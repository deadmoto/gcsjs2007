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
  dbf,dialogs, ADODB, ODBC_DSN, Registry;

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
    procedure FormClose(Sender: TObject);
  private
    { Private declarations }
  public
    DBF1: TDBF;
    { Public declarations }
    t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, pv, tc, norm1, sluj_q: TQuery;
    procedure ChAttrTable(d: integer);
  end;

var
  DataModule1: TDataModule1;

implementation

uses ConnectUnit;


{$R *.dfm}

procedure TDataModule1.FormCreate(Sender: TObject);
begin
  with TRegistry.Create do
  try
    RootKey:= System.Cardinal($80000001);
    if OpenKey('\Software\Subsidy\Connection', TRUE) then
      if not ValueExists('Server') then
        begin
          Form45:= TForm45.Create(nil);
          Form45.mode:= 'bug';
          Form45.ShowModal;
          Form45.Free;
        end
      else
      begin
        if not ODBC_DSN.AddDSNMSSQLSource('SQLSub', ReadString('Server'), 'Clients',  '') then
        ShowMessage('Ошибка при создании DSN записи!');
{        if not ODBC_DSN.AddDSNdBaseSource('DBFSub', ExtractFilePath(paramstr(0))+'database' , 'Clients',  '') then
        ShowMessage('Ошибка при создании DSN записи!');}
      end;
  finally
  CloseKey;
  Free;
  end;

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
  sluj_q := TQuery.Create(Self);
  DataBase2.Params.Add('PATH='+ExtractFilePath(paramstr(0))+'database');
end;

procedure TDataModule1.FormClose(Sender: TObject);
begin
//   tc.Free;
end;

procedure TDataModule1.ChAttrTable(d: integer);
{
  Процедура производит изменения alias
}
begin

end;

end.

