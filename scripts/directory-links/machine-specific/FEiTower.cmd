@echo off

set TARGETHOME=C:\home
set ENVIRONMENT=fei
set DATAHOME=%SYSTEMDRIVE%\home\%ENVIRONMENT%

::------------------------------------------------------------------------------
call %~dp0_common.cmd
::------------------------------------------------------------------------------

if not exist %TARGETHOME%\fei\dev mkdir %TARGETHOME%\%ENVIRONMENT%\dev
if not exist %TARGETHOME%\fei\docs mkdir %TARGETHOME%\%ENVIRONMENT%\docs
if not exist %TARGETHOME%\fei\pics mkdir %TARGETHOME%\%ENVIRONMENT%\pics

:: Folder Links
mklink /D "%SYSTEMDRIVE%\dev" %DATAHOME%\dev
mklink /D "%UP%\Documents\FEi" %DATAHOME%\docs
mklink /D "%UP%\Pictures\FEi" %DATAHOME%\pics


:: Virtual Machines
if not exist %SYSTEMDRIVE%\vm mkdir %SYSTEMDRIVE%\vm