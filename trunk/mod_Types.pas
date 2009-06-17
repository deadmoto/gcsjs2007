unit mod_types;

interface

uses Windows, dbgrids, DbTables;

Type   TStr01    = String[1];
       TStr30    = String[30];
       TStr80    = String[80];

Const  NullStr        = '';
       PathDLL        = '.\Plugins\';
       PathUpgrade    = '\\Gate\disk_n\Upgrade_Report\';

Type   TExternalStart      = Procedure(Handle : THandle;MSSQLDB: TDatabase);

       TExternalCSV        = Procedure(Handle : THandle);
       TExternalExcel      = Procedure(Handle : THandle);

Type   TPlugin   = Record
                     ID              : Integer;
                     FileName        : String;
                     Handle          : THandle;
                     ProcessProc     : TExternalStart;
                     BtnName         : TStr30;
                     Hint            : TStr30;
                   end;

Type   TExternalConf       = Procedure(Var Plugins : TPlugin);                   

implementation

end.
