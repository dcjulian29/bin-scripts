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

call %~dp0gpg.bat --force-mdc --armor --symmetric "%1"

:EOF

endlocal
