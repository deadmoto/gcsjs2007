FOR /F "" %%A in ('svnversion') do SET SVNREV=%%A
@ECHO OFF
ECHO unit version; > version.pas
ECHO interface >> version.pas
ECHO var svnrev:string='%SVNREV%'; >> version.pas
ECHO implementation >> version.pas
ECHO end. >> version.pas
@ECHO ON
MD %CD%\release\%SVNREV%
dcc32 Subsidy.dpr -U"%CD%\dcu" -E"%CD%\release\%SVNREV%"
pause