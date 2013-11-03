@echo off

set TARGETHOME=C:\home
set ENVIRONMENT=fei
set DATAHOME=%SYSTEMDRIVE%\home\%ENVIRONMENT%

call %~dp0_common.cmd

if not exist %TARGETHOME%\%ENVIRONMENT%\dev mkdir %TARGETHOME%\%ENVIRONMENT%\dev
if not exist %TARGETHOME%\%ENVIRONMENT%\docs mkdir %TARGETHOME%\%ENVIRONMENT%\docs
if not exist %TARGETHOME%\%ENVIRONMENT%\pics mkdir %TARGETHOME%\%ENVIRONMENT%\pics

mklink /D "%SYSTEMDRIVE%\dev" %DATAHOME%\dev
mklink /D "%UP%\Documents\FEi" %DATAHOME%\docs
mklink /D "%UP%\Pictures\FEi" %DATAHOME%\pics

if not exist %SYSTEMDRIVE%\vm mkdir %SYSTEMDRIVE%\vm
mklink /D "%UP%\VirtualBox VMs" %SYSTEMDRIVE%\vm

call %~dp0\..\AllMachines.bat
call %~dp0\..\DevelopmentMachines.bat
