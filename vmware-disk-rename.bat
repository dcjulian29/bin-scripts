@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd

:: %1 - Old Disk Name
:: %2 - New Disk Name

IF "%1" == "" GOTO P2

SET ODISK=%1
GOTO C2

:P2

SET ODISK=drive0.vmdk

SET /p NP1="What is the old name of the disk [%ODISK%]? "
IF [] neq [%NP1%] SET ODISK=%NP1: =% 

:C2

IF "%2" == "" GOTO P3

SET NDISK=%2
GOTO C3

:P3

SET NDISK=drive0.vmdk

SET /p NP2="What is the new name of the disk [%NDISK%]? "
IF [] neq [%NP2%] SET NDISK=%NP2: =% 

:C3

echo.
echo Renaming "%ODISK%" virtual disk...
echo.

%VDM% -n "%ODISK%" "%NDISK%"

echo.
echo Virtual disk operation complete.
echo.
