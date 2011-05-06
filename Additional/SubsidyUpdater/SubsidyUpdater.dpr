program SubsidyUpdater;

uses
  Forms,
  Windows,
  service in 'data\service.pas',
  SevenZipVCL in 'data\SevenZipVCL.pas',
  uMain in 'uMain.pas' {MainFrm},
  uChangeLog in 'uChangeLog.pas' {ChangeLogFrm};

{$R *.res}
{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
