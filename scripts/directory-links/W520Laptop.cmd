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
mklink /D "%UP%\Documents\AAMVA" D:\AAMVA\docs
mklink /D "%UP%\Documents\JNet" D:\JNet\docs
mklink /D "%UP%\Documents\JCoG" D:\JCoG\docs
mklink /D "%UP%\Documents\Marriott" D:\Marriott\docs
mklink /D "%UP%\Documents\eBooks" D:\eBooks

:: Picture Folder Links
mklink /D "%UP%\Picture\AAMVA" D:\AAMVA\pics
mklink /D "%UP%\Picture\JCoG" D:\JCoG\pics
mklink /D "%UP%\Picture\JNet" D:\JNet\pics

:: Videos Folder Links
mklink /D "%UP%\Videos\JNet" D:\JNet\videos

:: Other Links
mklink /D "%UP%\Desktop\ReviewThis" "%UP%\SkyDrive\Favorites"
mklink /D "%UP%\Documents\Outlook Files\archives" "D:\archives\Outlook"
mklink /D "%UP%\Documents\Outlook Files\archives\_ExternalArchive" "L:\archives\Outlook"
mklink /D "%UP%\Downloads\Magazines\" "%UP%\SkyDrive\Magazines"
mklink /D "%UP%\Downloads\_D" "D:\Downloads"
mklink /D "%UP%\Downloads\_TOSOFTWARE" "D:\Downloads\_TOSOFTWARE"

