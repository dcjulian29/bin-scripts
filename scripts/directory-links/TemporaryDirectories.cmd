@echo off

::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.bat
::------------------------------------------------------------------------------

SET T=%SYSTEMDRIVE%\TEMP

if exist %T%\ goto MAKELINK

mkdir %SYSTEMDRIVE%\TEMP

:MAKELINK

if exist "%UP%\AppData\Local\Temp" rmdir /s /q "%UP%\AppData\Local\Temp"
if not exist "%UP%\AppData\Local\Temp" mklink /D "%UP%\AppData\Local\Temp" %T%
echo.

if exist "%SYSTEMROOT%\Temp" rmdir /s /q "%SYSTEMROOT%\Temp"
if not exist "%SYSTEMROOT%\Temp" mklink /D "%SYSTEMROOT%\Temp" %T%
echo.


:: Browser Cache - IE
set C="%UP%\AppData\Local\Microsoft\Windows\Temporary Internet Files"

if exist %C% rmdir /s /q %C%
if not exist %C% mklink /D %C% %T%
echo.

:: Browser Cache - Chrome
set C="%UP%\AppData\Local\Google\Chrome\User Data\Temp" 2>nul

if not exist %C% goto C1
if exist %C% rmdir /s /q %C%
if not exist %C% mklink /D %C% %T%
echo.

:C1

:: Browser Cache - Firefox
set C=%UP%\AppData\Local\Mozilla\Firefox\Profiles
set PROFILE=
for /f "usebackq delims=" %O in (`dir /b /ad %C%`) do set PROFILE=%O
set C=%C%\%PROFILE%\Cache

if not exist %C% goto C2
if exist %C% rmdir /s /q %C%
if not exist %C% mklink /D %C% %T%
echo.

:C2
