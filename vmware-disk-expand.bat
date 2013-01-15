@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd
call C:\bin\vmware\ask-vm-directory.cmd YES NA %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

:: %1 - VM Name --> %VM%
:: %2 - Disk Name
:: %3 - New Disk Size

IF "%2" == "" GOTO P2

SET ODISK=%2
GOTO C2

:P2

SET ODISK=drive0.vmdk

SET /p NP1="What is the name of the disk [%ODISK%]? "
IF [] neq [%NP1%] SET ODISK=%NP1: =% 

:C2

IF "%3" == "" GOTO P3

SET NSIZE=%3
GOTO C3

:P3

SET NSIZE=48GB

SET /p NP2="What is the new size of the disk [%NSIZE%]? "
IF [] neq [%NP2%] SET NSIZE=%NP2: =% 

:C3

echo.
echo Resizing "%ODISK%" virtual disk...
echo.

%VDM% -x %NSIZE% "%VM%\%ODISK%"

echo.
echo Virtual disk operation complete.
echo.
