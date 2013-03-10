@echo off
setlocal

set PSHELL=PowerShell -NoLogo -NoProfile -NonInteractive -Command
set PCMD=Disable-NetAdapter -Name Ethernet -Confirm:$false

set PEXEC= %PSHELL% "%PCMD%"

call %SYSTEMDRIVE%\bin\elevate.bat %PEXEC%

