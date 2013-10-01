@echo off
setlocal

if [%1] == [] goto NOFILE
if [%2] == [] goto NORECIPIENT

set RECIPIENT=%2

goto CONT

:NOFILE

echo.
echo Please provide the file name
echo.

goto EOF

:NORECIPIENT

echo.
echo Recipient was not provided... Encrypting to self...
echo.

set RECIPIENT=Julian Easterling

:CONT

call %~dp0gpg.bat --recipient "%RECIPIENT%" --output "%1.gpg" --encrypt "%1"

endlocal
