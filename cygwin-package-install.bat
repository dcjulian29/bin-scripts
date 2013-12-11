@echo off

if [%1] NEQ [] goto PACKAGEPROVIDED

echo.
echo Please provide the package name or list of packages separated by commas.
echo.

goto EOF

:PACKAGEPROVIDED

set CYGROOT=%SYSTEMDRIVE%\cygwin
set CYGSETUPROOT=%CYGROOT%\setup
set CYGSETUP=%CYGSETUPROOT%\setup-x86.exe

if exist "%CYGSETUPROOT%\setup-x64.exe" set CYGSETUP=%CYGSETUPROOT%\setup-x64.exe

if exist "%CYGSETUP%" goto :INSTALL

echo.
echo Looking in %CYGSETUPROOT% didn't find the setup program. Is Cygwin installed via my Chocolatey package?
echo.

goto EOF

:INSTALL

setlocal

pushd %CYGSETUPROOT%
echo on
%CYGSETUP% --root "%CYGROOT%" --no-admin --no-shortcuts --site http://mirrors.kernel.org/sourceware/cygwin --quiet-mode -P %*

popd

endlocal

:EOF
