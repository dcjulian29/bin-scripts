@echo off
setlocal

if [%1] == [] goto NOFILE

goto CONT

:NOFILE

echo.
echo Please provide the file name
echo.

goto EOF

:CONT

call %~dp0gpg.bat --decrypt-files "%1"

endlocal
