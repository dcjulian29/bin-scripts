@echo off

set TARGETHOME=C:\home
set ENVIRONMENT=jnet
set DATAHOME=%SYSTEMDRIVE%\home\%ENVIRONMENT%

call %~dp0_common.cmd

if not exist %TARGETHOME%\%ENVIRONMENT%\docs mkdir %TARGETHOME%\%ENVIRONMENT%\docs
if not exist %TARGETHOME%\%ENVIRONMENT%\eBooks mkdir %TARGETHOME%\%ENVIRONMENT%\eBooks
if not exist %TARGETHOME%\%ENVIRONMENT%\paperport mkdir %TARGETHOME%\%ENVIRONMENT%\PaperPort
if not exist %TARGETHOME%\%ENVIRONMENT%\pics mkdir %TARGETHOME%\%ENVIRONMENT%\pics
if not exist %UP%\SkyDrive mkdir %UP%\SkyDrive

mklink /D "%UP%\Documents\JNet" %SYSTEMDRIVE%\home\JNet\docs
mklink /D "%UP%\Documents\eBooks" %SYSTEMDRIVE%\home\JNet\eBooks
mklink /D "%UP%\Documents\PaperPort" %SYSTEMDRIVE%\home\JNet\PaperPort
mklink /D "%UP%\Pictures\JNet" %SYSTEMDRIVE%\home\JNet\pics
mklink /D "%UP%\Documents\SkyDrive" "%UP%\SkyDrive"

call %~dp0\..\AllMachines.bat
