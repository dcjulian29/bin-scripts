call %~dp0..\_SetUserProfileDirectory.cmd

echo Home Directory: %TARGETHOME%
echo.

:: "Home" directory Links to Aggregate "Data" Directories
if not exist %SYSTEMDRIVE%\home mkdir %SYSTEMDRIVE%\home

if "%SYSTEMDRIVE%\home" EQU "%TARGETHOME%" (
  if not exist %DATAHOME% mkdir %DATAHOME%
) else (
  mklink /D %DATAHOME% %TARGETHOME%
)

if not exist %DATAHOME%\bin mkdir %DATAHOME%\bin
mklink /D %SYSTEMDRIVE%\bin %DATAHOME%\bin

if not exist %DATAHOME%\etc mkdir %DATAHOME%\etc
mklink /D %SYSTEMDRIVE%\etc %DATAHOME%\etc

if not exist %UP%\BTSync mkdir %UP%\BTSync
mklink /D "%UP%\Documents\BTSync" "%UP%\BTSync"
