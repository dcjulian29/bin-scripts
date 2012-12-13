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
set UP=%SYSTEMDRIVE%\Users\Julian

::------------------------------------------------------------------------------

:: PowerShell
rmdir /s /q %UP%\Documents\WindowsPowerShell >nul
mklink /J %UP%\Documents\WindowsPowerShell %SYSTEMDRIVE%\bin\WindowsPowerShell

:: SSH
mklink /J %UP%\.ssh %SYSTEMDRIVE%\etc\ssh

:: GIT
mklink %UP%\.gitconfig %SYSTEMDRIVE%\etc\git\gitconfig
mklink %UP%\.gitattributes %SYSTEMDRIVE%\etc\git\gitattributes
mklink %UP%\.gitignore %SYSTEMDRIVE%\etc\git\gitignore
mklink %UP%\.gitk %SYSTEMDRIVE%\etc\git\gitk

:: SVN
mklink /J %UP%\.subversion %SYSTEMDRIVE%\etc\subversion
mklink /J %UP%\AppData\Roaming\Subversion %SYSTEMDRIVE%\etc\subversion

:: Mecurial
mklink %UP%\.hgrc %SYSTEMDRIVE%\etc\mecurial\hgrc

:: Cygwin
mklink %UP%\.bash_profile %SYSTEMDRIVE%\etc\cygwin\bash_profile
mklink %UP%\.bashrc %SYSTEMDRIVE%\etc\cygwin\bashrc
mklink %UP%\.inputrc %SYSTEMDRIVE%\etc\cygwin\inputrc
mklink %UP%\.minttyrc %SYSTEMDRIVE%\etc\cygwin\minttyrc
mklink %UP%\.Xresources %SYSTEMDRIVE%\etc\cygwin\Xresources

:: Downloads, Pictures, Videos
::rmdir /s /q %UP%\Downloads >nul
::mklink /D %UP%\Downloads D:\Downloads
::rmdir /s /q %UP%\Pictures >nul
::mklink /D %UP%\Pictures D:\jnet\pictures
::rmdir /s /q %UP%\Videos >nul
::mklink /D %UP%\Videos D:\jnet\videos

:: Document Folder Links
mklink /D "%UP%\Documents\JNet" D:\JNet\docs
mklink /D "%UP%\Documents\JCoG" D:\JCoG\docs
mklink /D "%UP%\Documents\Marriott" D:\Marriott\docs
mklink /D "%UP%\Documents\eBooks" D:\eBooks

:: Virtual Machines
mklink /D "%UP%\Documents\Virtual Machines" D:\VM

