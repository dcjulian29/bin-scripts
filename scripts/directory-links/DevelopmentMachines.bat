@echo off

::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.bat
::------------------------------------------------------------------------------

:: Mecurial
mklink /J %UP%\.hgrc %SYSTEMDRIVE%\etc\mecurial\hgrc

:: Subversion
mklink /J %UP%\.subversion %SYSTEMDRIVE%\etc\subversion
mklink /J %UP%\AppData\Roaming\Subversion %SYSTEMDRIVE%\etc\subversion


:: Git
mklink %UP%\.gitattributes %SYSTEMDRIVE%\etc\git\gitattributes
mklink %UP%\.gitconfig %SYSTEMDRIVE%\etc\git\gitconfig
mklink %UP%\.gitignore %SYSTEMDRIVE%\etc\git\gitignore
mklink %UP%\.gitk %SYSTEMDRIVE%\etc\cygwin\gitk
