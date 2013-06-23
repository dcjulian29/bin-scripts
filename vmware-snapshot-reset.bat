@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd
call C:\bin\vmware\ask-vm-directory.cmd YES YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Reseting "%VMNAME%" virtual machine to snapshot...
echo.

robocopy %SNAP% %VM% /MIR /Z /SL /MT /XJ /R:5 /W:5

echo.
echo Snapshot operation complete.
echo.
