@echo off

if [%1] == [] goto PROVIDEDRIVE

if exist %1:\ goto MAKELINK

echo.
echo. RAM Drive directory does not exists...
echo.

goto EOF

:PROVIDEDRIVE

echo.
echo Please provide the drive letter of the RAM Drive...
echo.

goto EOF

:MAKELINK

rmdir /s /q  %SYSTEMDRIVE%\TEMP >nul
mklink /D %SYSTEMDRIVE%\TEMP %1:\

:EOF
