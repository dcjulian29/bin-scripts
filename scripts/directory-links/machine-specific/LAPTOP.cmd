@echo off

set TARGETHOME=D:\JNet
set ENVIRONMENT=jnet
set DATAHOME=%SYSTEMDRIVE%\home\%ENVIRONMENT%

call %~dp0_common.cmd

mklink /D "%SYSTEMDRIVE%\home\FEi" D:\FEi
mklink /D "%SYSTEMDRIVE%\home\JCoG" D:\JCoG

if not exist D:\vm mkdir D:\vm
mklink /D %SYSTEMDRIVE%\vm D:\vm

:: Document Folder Links
mklink /D "%UP%\Documents\FEi" %SYSTEMDRIVE%\home\FEi\docs
mklink /D "%UP%\Documents\JNet" %SYSTEMDRIVE%\home\JNet\docs
mklink /D "%UP%\Documents\JCoG" %SYSTEMDRIVE%\home\JCoG\docs
mklink /D "%UP%\Documents\eBooks" %SYSTEMDRIVE%\home\JNet\eBooks
mklink /D "%UP%\Documents\PaperPort" %SYSTEMDRIVE%\home\JNet\paperport
mklink /D "%UP%\Documents\Outlook Files\archives" "D:\archives\Outlook"

:Virtual Machines
mklink /D "%UP%\VirtualBox VMs" %SYSTEMDRIVE%\vm

:: Picture Folder Links
mklink /D "%UP%\Pictures\FEi" %SYSTEMDRIVE%\home\FEi\pics
mklink /D "%UP%\Pictures\JCoG" %SYSTEMDRIVE%\home\JCoG\pics
mklink /D "%UP%\Pictures\JNet" %SYSTEMDRIVE%\home\JNet\pics
mklink /D "%UP%\Pictures\Other" D:\Pictures
mklink /D "%UP%\Pictures\Photos" D:\Photos

:: Other Links
if not exist %UP%\SkyDrive mkdir %UP%\SkyDrive
mklink /D "%UP%\Documents\SkyDrive" "%UP%\SkyDrive"

if not exist %UP%\SkyDrive\Magazines mkdir %UP%\SkyDrive\Magazines
mklink /D "%UP%\Downloads\Magazines\" "%UP%\SkyDrive\Magazines"

call %~dp0\..\AllMachines.bat
call %~dp0\..\DevelopmentMachines.bat
