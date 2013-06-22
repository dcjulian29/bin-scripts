@echo off

::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.cmd
::------------------------------------------------------------------------------

:: Mecurial
mklink /J %UP%\.hgrc %SYSTEMDRIVE%\etc\mecurial\hgrc

:: Subversion
mklink /J %UP%\.subversion %SYSTEMDRIVE%\etc\subversion
mklink /J %UP%\AppData\Roaming\Subversion %SYSTEMDRIVE%\etc\subversion


:: Git
mklink %UP%\.gitconfig %SYSTEMDRIVE%\etc\git\gitconfig
mklink %UP%\.gitignore %SYSTEMDRIVE%\etc\git\gitignore
