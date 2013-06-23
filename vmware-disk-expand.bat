@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd

:: %1 - Disk Name
:: %2 - New Disk Size

IF "%1" == "" GOTO P2

SET ODISK=%1
GOTO C2

:P2

SET ODISK=drive0.vmdk

SET /p NP1="What is the name of the disk [%ODISK%]? "
IF [] neq [%NP1%] SET ODISK=%NP1: =% 

:C2

IF "%2" == "" GOTO P3

SET NSIZE=%2
GOTO C3

:P3

SET NSIZE=48GB

SET /p NP2="What is the new size of the disk [%NSIZE%]? "
IF [] neq [%NP2%] SET NSIZE=%NP2: =% 

:C3

echo.
echo Resizing "%ODISK%" virtual disk...
echo.

%VDM% -x %NSIZE% "%ODISK%"

echo.
echo Virtual disk operation complete.
echo.
