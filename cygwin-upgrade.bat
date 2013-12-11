@echo off

setlocal

set CYGROOT=%SYSTEMDRIVE%\cygwin
set CYGSETUPROOT=%CYGROOT%\setup

if exist %CYGROOT% goto UPGRADE

echo.
echo Cygwin doesn't appear to be installed... you should install it first.
echo.

goto EOF

:UPGRADE

if not exist %CYGSETUPROOT% mkdir %SYSTEMDRIVE%\cygwin\setup

pushd %CYGSETUPROOT%

call %~dp0pshell.cmd "(New-Object System.Net.WebClient).DownloadFile('http://cygwin.com/setup-x86.exe','.\setup-x86.exe')"

setup-x86.exe --root "%CYGROOT%" --no-shortcuts --site http://mirrors.kernel.org/sourceware/cygwin --quiet-mode

popd

:EOF

endlocal
