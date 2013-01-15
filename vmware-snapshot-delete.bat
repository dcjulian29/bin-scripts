@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd
call C:\bin\vmware\ask-vm-directory.cmd YES YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Deleting "%VMNAME%" virtual machine snapshot...
echo.

RMDIR /S /Q "%SNAP%"

echo.
echo Snapshot operation complete.
echo.
