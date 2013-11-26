@echo off
call %SYSTEMDRIVE%\Tools\binaries\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

setlocal

set PSHELL=PowerShell -NoLogo -NonInteractive -Command
set PCMD=Reset-NetworkAdapters

set PEXEC= %PSHELL% "%PCMD%"

%PEXEC%

endlocal

:EOF
