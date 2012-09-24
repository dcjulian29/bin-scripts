@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd
call C:\bin\vmware\ask-vm-directory.cmd YES NA %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

:: %1 - VM Name --> %VM%
:: %2 - Old Disk Name
:: %3 - New Disk Name

IF "%2" == "" GOTO P2

SET ODISK=%2
GOTO C2

:P2

SET ODISK=drive0.vmdk

SET /p NP1="What is the old name of the disk [%ODISK%]? "
IF [] neq [%NP1%] SET ODISK=%NP1: =% 

:C2

IF "%3" == "" GOTO P3

SET NDISK=%3
GOTO C3

:P3

SET NDISK=drive0.vmdk

SET /p NP2="What is the new name of the disk [%NDISK%]? "
IF [] neq [%NP2%] SET NDISK=%NP2: =% 

:C3

echo.
echo Renaming "%ODISK%" virtual disk...
echo.

%VDM% -n %VM%\%ODISK% %VM%\%NDISK%

echo.
echo Virtual disk operation complete.
echo.
