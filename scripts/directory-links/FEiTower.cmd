@echo off

echo.
echo Don't run this script directly...
echo.
echo 1. Log in with an alternative account (elevate?)
echo 2. Open the script in Notepad
echo 3. Run commands in an elevated shell as needed...
echo.
goto EOF


::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.cmd
::------------------------------------------------------------------------------

:: "Home" directory Links to Aggregate "Data" Directories
:: Temporary until next Laptop when only one drive will be in system.
if not exist %SYSTEMDRIVE%\home mkdir %SYSTEMDRIVE%\home
if not exist %SYSTEMDRIVE%\home\fei mkdir %SYSTEMDRIVE%\home\fei
if not exist %SYSTEMDRIVE%\home\fei\docs mkdir %SYSTEMDRIVE%\home\fei\docs
if not exist %SYSTEMDRIVE%\home\fei\pics mkdir %SYSTEMDRIVE%\home\fei\pics

:: Document Folder Links
mklink /D "%UP%\Documents\FEi" %SYSTEMDRIVE%\home\fei\docs

:: Picture Folder Links
mklink /D "%UP%\Pictures\FEi" %SYSTEMDRIVE%\home\fei\pics
