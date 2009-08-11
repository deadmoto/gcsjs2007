{ **** UBPFD *********** by delphibase.endimus.com ****
>> ��������� (������������) ��������� ����������������
ODBC DSN-�������� ��� ������� � MS SQL-�������

������ ���������� ����������� DSN

������� �� ����� ������� ���������� (� ��� ������� - ����������
��������������) ����������������� DSN-��������� ��� ������� � MS
SQL-�������.

��������� � ���� ������ ��� ����, ����� �������� ����������� �-���
SQLConfigDataSource (�.�. �� ����� ����� �������� � �������� Delphi).

������ �� ���������:
http://www.rsdn.ru/qna/default.asp?db/datasrc.xml
http://www.bbd.net.ru/modules.php?op=modload&name=News&file=article&sid=16
http://www.firststeps.ru/mfc/odbc/r.php?14

�����������: Windows, Registry

***************************************************** }

unit ODBC_DSN;

interface

uses
  Windows, Registry;

//function AddDSNdBaseSource(const ADSNName, DefaultDir, ADescription: string): Boolean;
function AddDSNMSSQLSource(const ADSNName, AServer, ADataBase: string;
                          ADescription: string = ''): Boolean;

function SQLConfigDataSource(
  hwndParent: HWND; // ��������� �� ���� ��������� �������
  fRequest: WORD; // ��� �������
  lpszDriver: PChar; // ���������������� ��� ��������
  lpszAttributes: PChar // ��������
  ): Boolean; stdcall; external 'odbccp32.dll' name 'SQLConfigDataSource';

const
  ODBC_ADD_DSN = 1; // Add data source
  ODBC_CONFIG_DSN = 2; // Configure (edit) data source
  ODBC_REMOVE_DSN = 3; // Remove data source
  ODBC_ADD_SYS_DSN = 4; // Add system data source

implementation

{******************************************************************************
 * AddDSNMSSQLSource - ��������� (������������) ���������������� DSN-��������
 * ��� ������� � MS SQL �������
 * ������������� � ���������� ���������� �������������
 * �������� TCP/IP � ���� 1433
 *
 * ����: ADSNName - ��� DSN-���������
 * AServer - ��� �������
 * ADataBase - ������������ �� �� ������� �� ���������
 * ADescription - �������� ��������� (�������������� ��������)
 *
 * �����: TRUE - � ������ ������, FALSE - � ��������� ������
 ******************************************************************************}

function AddDSNMSSQLSource(const ADSNName, AServer, ADataBase: string;
                          ADescription: string = ''): Boolean;
const driver = 'SQL Server';
var params: string;

  function AddODBCiniRecord: boolean;
  begin
    Result := FALSE;
    with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;//HKEY_LOCAL_MACHINE;
      if OpenKey('\Software\ODBC\ODBC.INI\', TRUE) then
        if not KeyExists('SQLSub') then
          CreateKey('SQLSub');
      if OpenKey('SQLSub', TRUE) then
      begin
        WriteString('Database',ADataBase);
        WriteString('Description',ADescription);
        WriteString('Driver','C:\SYS\system32\SQLSRV32.dll');
        WriteString('LastUser','sa');
        WriteString('Server',AServer);
        Result := TRUE;
      end;
    finally
      CloseKey;
      Free;
    end;

  end;
begin
  params := 'DSN=' + ADSNName + #0'Server=' + AServer + #0'DataBase= ' +
    ADataBase + #0'Description=' + ADescription + #0#0;
  Result := SQLConfigDataSource(0, ODBC_ADD_DSN, PChar(driver), PChar(params));
  Result := Result and AddODBCiniRecord;
end;

{function AddDSNdBaseSource(const ADSNName, DefaultDir, ADescription: string): Boolean;
const driver = 'Microsoft dBase Driver (*.dbf)';
var params: string;
  function SetDefaultDir: boolean;
  begin
    with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey('\Software\ODBC\ODBC.INI\', TRUE) then
        if not KeyExists('DBFSub') then
          CreateKey('DBFSub');
      if OpenKey('DBFSub', TRUE) then
      begin
        WriteString('DefaultDir',DefaultDir);
        Result := TRUE;
      end;
    finally
      CloseKey;
      Free;
    end;
  end;
begin
  params:= 'DSN='+ADSNName + #0'Description=' + ADescription + #0#0;

  Result := SQLConfigDataSource(0, ODBC_ADD_SYS_DSN, PChar(driver), PChar(params));
  Result := Result and SetDefaultDir;
end;
 }

end.
