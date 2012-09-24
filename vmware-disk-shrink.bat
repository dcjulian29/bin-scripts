@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd
call C:\bin\vmware\ask-vm-directory.cmd YES NA %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

:: %1 - VM Name --> %VM%
:: %2 - Disk Name

IF "%2" == "" GOTO P2

SET ODISK=%2
GOTO C2

:P2

SET ODISK=drive0.vmdk

SET /p NP1="What is the name of the disk [%ODISK%]? "
IF [] neq [%NP1%] SET ODISK=%NP1: =% 

:C2

echo.
echo Shrinking "%ODISK%" virtual disk...
echo.

%VDM% -k %VM%\%ODISK%

echo.
echo Virtual disk operation complete.
echo.
