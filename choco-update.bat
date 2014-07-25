@echo off

setlocal

set PCMD="iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"

call %~dp0\..\binaries\pshell.cmd %PCMD%

endlocal

:EOF
