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

setlocal
set UP=%SYSTEMDRIVE%\Users\jeast836

::------------------------------------------------------------------------------

:: My "main" Development folder
mklink /D C:\dev D:\dev

:: SQL Server Management Studio
rmdir /s /q "%UP%\Documents\SQL Server Management Studio\Projects" >nul
mklink /J "%UP%\Documents\SQL Server Management Studio\Projects" C:\dev

:: Visual Studio 2012
rmdir /s /q "%UP%\Documents\Visual Studio 2012\Projects" >nul
mklink /J "%UP%\Documents\Visual Studio 2012\Projects" C:\dev

:: Visual Studio 2010
rmdir /s /q "%UP%\Documents\Visual Studio 2010\Projects" >nul
mklink /J "%UP%\Documents\Visual Studio 2010\Projects" C:\dev

:: Visual Studio 2008
rmdir /s /q "%UP%\Documents\Visual Studio 2008\Projects" >nul
mklink /J "%UP%\Documents\Visual Studio 2008\Projects" C:\dev

:: Visual Studio 2005
rmdir /s /q "%UP%\Documents\Visual Studio 2005\Projects" >nul
mklink /J "%UP%\Documents\Visual Studio 2005\Projects" C:\dev

:: Webmatrix Web Sites
mklink /D "%UP%\Documents\My Web Sites" C:\dev

:: CodeRush Solution Cache
rmdir /s /q "%UP%\AppData\Roaming\CodeRush for VS .NET\1.1\SolutionCache" >nul
mklink /D "%UP%\AppData\Roaming\CodeRush for VS .NET\1.1\SolutionCache" %SYSTEMDRIVE%\Temp
