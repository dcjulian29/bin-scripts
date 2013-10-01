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

call %~dp0gpg.bat --output "%1.gpg" --symmetric "%1"

endlocal
