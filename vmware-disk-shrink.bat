@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd

:: %1 - Disk Name

IF "%1" == "" GOTO P2

SET ODISK=%1
GOTO C2

:P2

SET ODISK=drive0.vmdk

SET /p NP1="What is the name of the disk [%ODISK%]? "
IF [] neq [%NP1%] SET ODISK=%NP1: =% 

:C2

echo.
echo Shrinking "%ODISK%" virtual disk...
echo.

%VDM% -k "%ODISK%"

echo.
echo Virtual disk operation complete.
echo.
