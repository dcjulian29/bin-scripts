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
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.bat
::------------------------------------------------------------------------------

:: Document Folder Links
mklink /D "%UP%\Documents\JNet" D:\JNet\docs
mklink /D "%UP%\Documents\JCoG" D:\JCoG\docs
mklink /D "%UP%\Documents\Marriott" D:\Marriott\docs
mklink /D "%UP%\Documents\eBooks" D:\eBooks

