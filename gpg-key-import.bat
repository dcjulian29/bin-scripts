@echo off
setlocal

if [%1] == [] goto NOFILE

goto CONT

:NOFILE

echo.
echo Please provide the file name containing the key to import.
echo.

goto EOF

:CONT

call %~dp0gpg.bat --import "%1"

endlocal
