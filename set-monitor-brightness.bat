@echo off
setlocal

IF NOT "%1" == "" GOTO C1

ECHO.
ECHO Please provide a brightness percentage...
ECHO.

GOTO EOF

:C1

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

echo.
echo Setting monitor brightness to %1%%

SET PSHELL=PowerShell -NoLogo -NoProfile -NonInteractive -Command

%PSHELL% ". C:\bin\WindowsPowerShell\GlobalScripts\10\Set-MonitorBrightness.ps1; Set-MonitorBrightness %1"

echo.

:EOF
