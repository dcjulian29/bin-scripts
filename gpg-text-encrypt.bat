@echo off
setlocal

if [%1] == [] goto C1

goto C2

:C1

echo.
echo Please provide recipient...
echo.

goto EOF

:C2

set TEMPFILE=%TEMP%\redirectinput.%RANDOM%

del /F %TEMPFILE% 2>nul

:: Redirect Input to a file that GPG can work on since Windows Batch files don't have an easy way
:: to accept input from the pipeline...
for /F "tokens=*" %%A in ('findstr /n $') do (
  set "line=%%A"
  setlocal EnableDelayedExpansion
  set "line=!line:*:=!"
  echo(!line! >> %TEMPFILE%
  endlocal
)

type %TEMPFILE% | call %~dp0gpg.bat --encrypt --armor --recipient "%1" --force-mdc

del /F %TEMPFILE% 2>nul

:EOF

endlocal
