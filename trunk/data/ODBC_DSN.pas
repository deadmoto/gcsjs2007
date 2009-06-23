{ **** UBPFD *********** by delphibase.endimus.com ****
>> Добавляет (модифицирует) указанный пользовательский
ODBC DSN-источник для доступа к MS SQL-серверу

Модуль управления источниками DSN

Состоит из одной функции добавления (а при наличии - содержимое
модицицируется) пользовательского DSN-источника для доступа к MS
SQL-серверу. Кроме того в клиентских настройках прописывается протокол
TCP/IP и порт 1433 (за эту часть 100% уверенности нет в том смысле, что мне
не удалось найти документированного интерфейса для этих изменений).

Приведено в виде модуля для того, чтобы включить определение ф-ции
SQLConfigDataSource (т.к. не нашел этого описания в поставке Delphi).

Ссылки на источники:
http://www.rsdn.ru/qna/default.asp?db/datasrc.xml
http://www.bbd.net.ru/modules.php?op=modload&name=News&file=article&sid=16
http://www.firststeps.ru/mfc/odbc/r.php?14

Зависимости: Windows, Registry
Автор:       KSergey,
 s_wr@mail.ruЭтот e-mail защищен от спам-ботов. Для его просмотра в вашем браузере должна быть включена поддержка Java-script
 , ICQ:93229204, Новосибирск
Copyright:   В качестве справки по работе с ф-цией
SQLConfigDataSource использовались источники, ссылки на которые есть в описании
Дата:        17 июня 2003 г.
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
  hwndParent: HWND; // Указатель на окно вызвавшее функцию
  fRequest: WORD; // Тип запроса
  lpszDriver: PChar; // Пользовательское имя драйвера
  lpszAttributes: PChar // атрибуты
  ): Boolean; stdcall; external 'odbccp32.dll' name 'SQLConfigDataSource';

const
  ODBC_ADD_DSN = 1; // Add data source
  ODBC_CONFIG_DSN = 2; // Configure (edit) data source
  ODBC_REMOVE_DSN = 3; // Remove data source

implementation

{******************************************************************************
 * AddDSNMSSQLSource - добавляет (модифицирует) пользовательский DSN-источник
 * для доступа к MS SQL серверу
 * Дополнительно в клиентских настройках прописывается
 * протокол TCP/IP и порт 1433
 *
 * Вход: ADSNName - имя DSN-источника
 * AServer - имя сервера
 * ADataBase - наименование БД на сервере по умолчанию
 * ADescription - описание источника (необязательный параметр)
 *
 * Выход: TRUE - в случае успеха, FALSE - в противном случае
 ******************************************************************************}

function AddDSNMSSQLSource(const ADSNName, AServer, ADataBase: string;
                          ADescription: string = ''): Boolean;
const driver = 'SQL Server';
var params: string;
  // эта ф-ция прописывает необходимые настройки для доступа к MS SQL по TCP/IP
  // и на порт 1433
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