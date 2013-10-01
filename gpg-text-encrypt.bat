@echo off
setlocal

if [%1] == [] goto NOFILE
if [%2] == [] goto NORECIPIENT

goto CONT

:NOFILE

echo.
echo Please provide the file name
echo.

goto EOF

:NORECIPIENT

echo.
echo Please provide the recipent
echo.

goto EOF

:CONT

call %~dp0gpg.bat --force-mdc --armor --recipient "%2" --encrypt "%1" 

:EOF

endlocal
