@echo off

setlocal

set PATH=%CHOCOLATEYINSTALL%\apps\scriptcs;%PATH%

scriptcs.exe %*

endlocal
