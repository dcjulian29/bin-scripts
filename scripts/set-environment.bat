@echo off

setlocal

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

echo Setting HOME to %USERPROFILE%
echo.
setx HOME %USERPROFILE%

setx /m TERM msys

set PDIR="%ProgramFiles(x86)%"

if [%PDIR%] == [""] goto B32

goto B64

:B32

set PDIR="%ProgramFiles%"

:B64

echo Setting PF32 to %PDIR%
echo.

setx /m PF32 %PDIR%


call %~dp0\set-path.bat

:EOF
