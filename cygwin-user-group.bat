@echo off

setlocal

set CYGROOT=%SYSTEMDRIVE%\cygwin
set CYGSETUPROOT=%CYGROOT%\setup

if exist %CYGROOT% goto UPDATE

echo.
echo Cygwin doesn't appear to be installed... you should install it first.
echo.

goto EOF

:UPDATE

echo Generating User Account Entries...
if exist "%CYGROOT%\etc\passwd" del /f "%CYGROOT%\etc\passwd"
%CYGROOT%\bin\mkpasswd.exe -l -d > %CYGROOT%\etc\passwd

echo Generating Group Entries...
if exist "%CYGROOT%\etc\group" del /f "%CYGROOT%\etc\group"
%CYGROOT%\bin\mkgroup.exe -l -d > %CYGROOT%\etc\group

echo Done.

:EOF

endlocal
