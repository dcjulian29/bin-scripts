@echo off

set TARGETHOME=D:\JNet
set ENVIRONMENT=jnet
set DATAHOME=%SYSTEMDRIVE%\home\%ENVIRONMENT%

call %~dp0_common.cmd

mklink /D "%SYSTEMDRIVE%\home\FEi" D:\FEi
mklink /D "%SYSTEMDRIVE%\home\SNVUSA" D:\SNVUSA
mklink /D "%SYSTEMDRIVE%\home\JCoG" D:\JCoG

if not exist "E:\Virtual Machines" mkdir "E:\Virtual Machines"
mklink /D %SYSTEMDRIVE%\vm "E:\Virtual Machines"

:: Document Folder Links
mklink /D "%UP%\Documents\FEi" %SYSTEMDRIVE%\home\FEi\docs
mklink /D "%UP%\Documents\JNet" %SYSTEMDRIVE%\home\JNet\docs
mklink /D "%UP%\Documents\JCoG" %SYSTEMDRIVE%\home\JCoG\docs
mklink /D "%UP%\Documents\eBooks" %SYSTEMDRIVE%\home\jnet\ebooks
mklink /D "%UP%\Documents\PaperPort" %SYSTEMDRIVE%\home\jnet\paperport
mklink /D "%UP%\Documents\Virtual Machines" %SYSTEMDRIVE%\vm

:: Picture Folder Links
mklink /D "%UP%\Pictures\FEi" %SYSTEMDRIVE%\home\FEi\pics
mklink /D "%UP%\Pictures\JCoG" %SYSTEMDRIVE%\home\JCoG\pics
mklink /D "%UP%\Pictures\JNet" %SYSTEMDRIVE%\home\JNet\pics

:: Other Links
if not exist %UP%\SkyDrive mkdir %UP%\SkyDrive
mklink /D "%UP%\Documents\SkyDrive" "%UP%\SkyDrive"

call %~dp0\..\AllMachines.bat
call %~dp0\..\DevelopmentMachines.bat
