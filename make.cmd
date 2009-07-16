FOR /F "" %%A in ('svnversion') do SET SVNREV=%%A
@ECHO OFF
ECHO unit version; > version.pas
ECHO interface >> version.pas
ECHO var svnrev:string='%SVNREV%'; >> version.pas
ECHO implementation >> version.pas
ECHO end. >> version.pas
@ECHO ON
pause
MD %CD%\release\%SVNREV%
call rsvars.bat
msbuild Subsidy.dproj /t:rebuild /p:configuration=Release
upx -9 "%CD%\release\%SVNREV%\Subsidy.exe"
copy "C:\.dev\subsidy2007\bin\Subsidy.exe" "%CD%\release\%SVNREV%"
pause
