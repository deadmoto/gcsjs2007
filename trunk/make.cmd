FOR /F "tokens=2 delims='" %%A in (Revision.inc) do SET REV=%%A
MD %CD%\release\%REV%
call rsvars.bat
msbuild Subsidy.dproj /t:rebuild /p:configuration=Release
copy "..\bin\Subsidy.exe" "%CD%\release\%REV%\"
pause

