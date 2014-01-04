@echo off

for /f "usebackq delims=" %%O in (`where path-dev.bat`) do set BINPATH=%%~dpO

pushd %BINPATH%\..\development

set DEVPATH=%CD%

popd

set PDIR=%ProgramFiles(x86)%
if ["%PDIR%"] == [""] goto B32

goto CONT

:B32

set PDIR=%ProgramFiles%

:CONT

if exist "%PDIR%\Git\bin" path %PDIR%\Git\bin;%PATH%
if exist "%SYSTEMDRIVE%\tools\apps\gittfs" path %SYSTEMDRIVE%\tools\apps\gittfs;%PATH%
path %DEVPATH%;%PATH%
