@echo off

setlocal

set PATH=%SYSTEMDRIVE%\Tools\binaries\network\dig;%PATH%

dig.exe %*

endlocal
