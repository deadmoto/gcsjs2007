program SubsidySQLManager;

uses
  Forms,
  Windows,
  SysUtils;

{$R *.res}

{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}

begin
  WinExec(PChar('Subsidy.exe -sql'), SW_SHOW);

  Application.Initialize;
  Application.Run;
end.
