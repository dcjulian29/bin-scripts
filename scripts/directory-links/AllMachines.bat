@echo off

::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.cmd
::------------------------------------------------------------------------------

:: PowerShell
mklink /J %UP%\Documents\WindowsPowerShell %SYSTEMDRIVE%\bin\WindowsPowerShell

:: SSH
mklink /J %UP%\.ssh %SYSTEMDRIVE%\etc\ssh

:: GPG
mklink /J %UP%\.gnupg %SYSTEMDRIVE%\etc\gnupg

:: Cygwin
mklink %UP%\.profile %SYSTEMDRIVE%\etc\cygwin\profile
mklink %UP%\.bash_profile %SYSTEMDRIVE%\etc\cygwin\bash_profile
mklink %UP%\.bashrc %SYSTEMDRIVE%\etc\cygwin\bashrc
mklink %UP%\.inputrc %SYSTEMDRIVE%\etc\cygwin\inputrc
mklink %UP%\.minttyrc %SYSTEMDRIVE%\etc\cygwin\minttyrc
mklink %UP%\.Xresources %SYSTEMDRIVE%\etc\cygwin\Xresources

mkdir %SYSTEMDRIVE%\cygwin\home
mklink /J %SYSTEMDRIVE%\cygwin\home\%USERNAME% %UP%

:: Other
mklink /J %UP%\.etc %SYSTEMDRIVE%\etc
mklink /J %UP%\.bin %SYSTEMDRIVE%\bin

::BTSync
if not exist %UP%\BTSync mkdir %UP%\BTSync
mklink /D "%UP%\Documents\BTSync" "%UP%\BTSync"
