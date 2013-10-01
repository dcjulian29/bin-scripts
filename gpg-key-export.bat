@echo off
setlocal

if [%1] == [] goto NOFILE

goto CONT

:NOFILE

echo.
echo Please provide the recipient name containing the key to export.
echo.

goto EOF

:CONT

call %~dp0gpg.bat --armor --export "%1"

endlocal
