@echo off
setlocal

set PSHELL=PowerShell -NoLogo -NonInteractive -Command
set PCMD=Purge-Files -Folder "%TEMP%" -Filter "*.*" -Age 7

set PEXEC= %PSHELL% "%PCMD%"

%PEXEC%
