@echo off

::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.bat
::------------------------------------------------------------------------------

:: PowerShell
mklink /J %UP%\Documents\WindowsPowerShell %SYSTEMDRIVE%\bin\WindowsPowerShell

:: SSH
mklink /J %UP%\.ssh %SYSTEMDRIVE%\etc\ssh

:: Cygwin
mklink %UP%\.bash_profile %SYSTEMDRIVE%\etc\cygwin\bash_profile
mklink %UP%\.bashrc %SYSTEMDRIVE%\etc\cygwin\bashrc
mklink %UP%\.inputrc %SYSTEMDRIVE%\etc\cygwin\inputrc
mklink %UP%\.minttyrc %SYSTEMDRIVE%\etc\cygwin\minttyrc
mklink %UP%\.Xresources %SYSTEMDRIVE%\etc\cygwin\Xresources

mkdir %SYSTEMDRIVE%\cygwin\home
mklink /J %SYSTEMDRIVE%\cygwin\home\%USERNAME% %UP%

:: Other
mklink %UP%\.etc %SYSTEMDRIVE%\etc
