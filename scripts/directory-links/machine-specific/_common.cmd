echo.
echo Don't run this script directly...
echo.
echo 1. Log in with an alternative account (elevate?)
echo 2. Open the script in Notepad
echo 3. Run commands in an elevated shell as needed...
echo.
pause
exit /b 1

::------------------------------------------------------------------------------
call %~dp0..\_SetUserProfileDirectory.cmd
::------------------------------------------------------------------------------

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

