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

wmic os get osarchitecture | find /I "64-Bit" >nul

if exist setup.exe del setup.exe

if %ERRORLEVEL% == 0 goto BITS64

call %SYSTEMDRIVE%\Tools\binaries\pshell.cmd "(New-Object System.Net.WebClient).DownloadFile('http://cygwin.com/setup-x86.exe','.\setup.exe')"

goto EXECUTE

:BITS64

call %SYSTEMDRIVE%\Tools\binaries\pshell.cmd "(New-Object System.Net.WebClient).DownloadFile('http://cygwin.com/setup-x86_64.exe','.\setup.exe')"

:EXECUTE

setup.exe --root "%CYGROOT%" --no-shortcuts --site http://mirrors.kernel.org/sourceware/cygwin --quiet-mode

popd

:EOF

endlocal
