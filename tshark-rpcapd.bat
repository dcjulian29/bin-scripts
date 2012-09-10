@echo off

setlocal

set PDIR="%ProgramFiles(x86)%\WinPcap\rpcapd.exe"

if %PDIR% == "\WinPcap\rpcapd.exe" goto B32

goto CONT

:B32

set PDIR="%ProgramFiles%\WinPcap\rpcapd.exe"

:CONT

%PDIR% -n
