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
mklink /D "%SYSTEMDRIVE%\home\JCoG" D:\JCoG
mklink /D "%SYSTEMDRIVE%\home\JNet" D:\JNet

:: Document Folder Links
mklink /D "%UP%\Documents\FEi" %SYSTEMDRIVE%\home\FEi\docs
mklink /D "%UP%\Documents\JNet" %SYSTEMDRIVE%\home\JNet\docs
mklink /D "%UP%\Documents\JCoG" %SYSTEMDRIVE%\home\JCoG\docs
mklink /D "%UP%\Documents\eBooks" D:\eBooks
mklink /D "%UP%\Documents\Virtual Machines" D:\vm

:: Picture Folder Links
mklink /D "%UP%\Pictures\FEi" %SYSTEMDRIVE%\home\FEi\pics
mklink /D "%UP%\Pictures\JCoG" %SYSTEMDRIVE%\home\JCoG\pics
mklink /D "%UP%\Pictures\JNet" %SYSTEMDRIVE%\home\JNet\pics
mklink /D "%UP%\Pictures\Other" D:\Pictures
mklink /D "%UP%\Pictures\Photos" D:\Photos

:: Videos Folder Links
mklink /D "%UP%\Videos\Other" D:\Videos
mklink /D "%UP%\Videos\Webcasts" D:\Webcasts

:: Other Links
mklink /D "%UP%\Desktop\ReviewThis" "%UP%\SkyDrive\Favorites"
mklink /D "%UP%\Documents\Outlook Files\archives" "D:\archives\Outlook"
mklink /D "%UP%\Documents\Outlook Files\archives\_ExternalArchive" "L:\archives\Outlook"
mklink /D "%UP%\Downloads\Magazines\" "%UP%\SkyDrive\Magazines"
mklink /D "%UP%\Downloads\_D" "D:\Downloads"
mklink /D "%UP%\Downloads\_TOSOFTWARE" "D:\Downloads\_TOSOFTWARE"


mklink /D "%SYSTEMDRIVE%\bin" %SYSTEMDRIVE%\home\JNet\bin
mklink /D "%SYSTEMDRIVE%\etc" %SYSTEMDRIVE%\home\JNet\etc

:: Virtual Machines
if not exist D:\vm mkdir D:\vm
mklink /D %SYSTEMDRIVE%\vm D:\vm

