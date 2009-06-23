{ **** UBPFD *********** by delphibase.endimus.com ****
>> ��������� (������������) ��������� ����������������
ODBC DSN-�������� ��� ������� � MS SQL-�������

������ ���������� ����������� DSN

������� �� ����� ������� ���������� (� ��� ������� - ����������
��������������) ����������������� DSN-��������� ��� ������� � MS
SQL-�������. ����� ���� � ���������� ���������� ������������� ��������
TCP/IP � ���� 1433 (�� ��� ����� 100% ����������� ��� � ��� ������, ��� ���
�� ������� ����� ������������������ ���������� ��� ���� ���������).

��������� � ���� ������ ��� ����, ����� �������� ����������� �-���
SQLConfigDataSource (�.�. �� ����� ����� �������� � �������� Delphi).

������ �� ���������:
http://www.rsdn.ru/qna/default.asp?db/datasrc.xml
http://www.bbd.net.ru/modules.php?op=modload&name=News&file=article&sid=16
http://www.firststeps.ru/mfc/odbc/r.php?14

�����������: Windows, Registry
�����:       KSergey,
 s_wr@mail.ru���� e-mail ������� �� ����-�����. ��� ��� ��������� � ����� �������� ������ ���� �������� ��������� Java-script
 , ICQ:93229204, �����������
Copyright:   � �������� ������� �� ������ � �-����
SQLConfigDataSource �������������� ���������, ������ �� ������� ���� � ��������
����:        17 ���� 2003 �.
***************************************************** }

unit ODBC_DSN;

interface

uses
  Windows, Registry;

function AddDSNdBaseSource(const ADSNName, DefaultDir, ADataBase: string;
                          ADescription: string = ''): Boolean;
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
  // ��� �-��� ����������� ����������� ��������� ��� ������� � MS SQL �� TCP/IP
  // � �� ���� 1433
  function SetNetLibParam: Boolean;
  begin
    Result := FALSE;
    with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey('\Software\Microsoft\MSSQLServer\Client', TRUE) then
        if not KeyExists('ConnectTo') then
          CreateKey('ConnectTo');
      if OpenKey('ConnectTo', TRUE) then
      begin
        WriteString(AServer, 'DBMSSOCN,' + AServer + ',1433');
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
  Result := Result and SetNetLibParam;
end;

function AddDSNdBaseSource(const ADSNName, DefaultDir, ADataBase: string;
                           ADescription: string = ''): Boolean;
const driver = 'Microsoft dBase Driver (*.dbf)';
var params: string;

begin
  params := 'Description='+ADescription +#0;
  params:= params + 'DSN='+ADSNName +#0;
  params:= params + 'DataBase='+ADataBase +#0+'LANGDRIVER=dBASE RUS cp866'+#0;
  params:= params + 'DefaultDir='+DefaultDir +#0;
  params:= params + 'DataSourse='+DefaultDir +#0;
//  params := 'DSN=' + ADSNName + #0'DataBase= ' + ADataBase + #0'Description=' + ADescription + #0#0;
  Result := SQLConfigDataSource(0, ODBC_ADD_DSN, PChar(driver), PChar(params));
//  Result := Result and SetNetLibParam;
end;

end.