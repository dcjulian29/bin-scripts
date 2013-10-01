@echo off
setlocal

if [%1] == [] goto NORECIPIENT

goto CONT

:NORECIPIENT

echo.
echo Recipient was not provided...
echo.

goto EOF

:CONT

call %~dp0gpg.bat --keyserver pgp.mit.edu --search-keys "%1"

:EOF

endlocal
