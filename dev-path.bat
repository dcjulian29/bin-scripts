@echo off

for /f "usebackq delims=" %%O in (`where dev-path.bat`) do set BINPATH=%%~dpO
set DEVPATH=%BINPATH%development-tools

path %DEVPATH%\mecurial;%PATH%
path %DEVPATH%\svn\bin;%PATH%
path %DEVPATH%\GitTfs;%PATH%
path %DEVPATH%\msysgit\bin;%PATH%
path %DEVPATH%;%PATH%
