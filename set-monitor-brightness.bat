@echo off
setlocal

IF NOT "%1" == "" GOTO C1

ECHO.
ECHO Please provide a brightness percentage...
ECHO.

GOTO EOF

:C1

echo.
echo Setting monitor brightness to %1%%

SET PSHELL=PowerShell -NoLogo -NoProfile -NonInteractive -Command

%PSHELL% "& C:\bin\scripts\Set-MonitorBrightness.ps1 %1"

echo.

:EOF