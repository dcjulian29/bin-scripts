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
mklink /D "%SYSTEMDRIVE%\home\FEi" D:\FEi
mklink /D "%SYSTEMDRIVE%\home\SNVUSA" D:\SNVUSA
mklink /D "%SYSTEMDRIVE%\home\JCoG" D:\JCoG
mklink /D "%SYSTEMDRIVE%\home\JNet" D:\JNet

:: Document Folder Links
mklink /D "%UP%\Documents\FEi" %SYSTEMDRIVE%\home\FEi\docs
mklink /D "%UP%\Documents\JNet" %SYSTEMDRIVE%\home\JNet\docs
mklink /D "%UP%\Documents\JCoG" %SYSTEMDRIVE%\home\JCoG\docs
mklink /D "%UP%\Documents\eBooks" %SYSTEMDRIVE%\home\jnet\ebooks
mklink /D "%UP%\Documents\PaperPort" %SYSTEMDRIVE%\home\jnet\paperport
mklink /D "%UP%\Documents\Virtual Machines" "E:\Virtual Machines"

:: Picture Folder Links
mklink /D "%UP%\Pictures\FEi" %SYSTEMDRIVE%\home\FEi\pics
mklink /D "%UP%\Pictures\JCoG" %SYSTEMDRIVE%\home\JCoG\pics
mklink /D "%UP%\Pictures\JNet" %SYSTEMDRIVE%\home\JNet\pics

:SkyDrive
if not exist %UP%\SkyDrive mkdir %UP%\SkyDrive
mklink /D "%UP%\Documents\SkyDrive" "%UP%\SkyDrive"


mklink /D %SYSTEMDRIVE%\bin %SYSTEMDRIVE%\home\jnet\bin
mklink /D %SYSTEMDRIVE%\etc %SYSTEMDRIVE%\home\jnet\etc

:: Virtual Machines
if not exist E:\vm mkdir E:\vm
mklink /D %SYSTEMDRIVE%\vm "E:\Virtual Machines"

:: Now Run "All Machines"