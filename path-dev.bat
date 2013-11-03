@echo off

for /f "usebackq delims=" %%O in (`where path-dev.bat`) do set BINPATH=%%~dpO
set DEVPATH=%BINPATH%development-tools

path %DEVPATH%\git-tfs;%PATH%

set PDIR="%ProgramFiles(x86)%"
if [%PDIR%] == [""] goto B32

goto CONT

:B32

set PDIR="%ProgramFiles%"

:CONT

path "%PDIR%\Git\bin";%PATH%
path %DEVPATH%;%PATH%
