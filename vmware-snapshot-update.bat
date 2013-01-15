@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd
call C:\bin\vmware\ask-vm-directory.cmd YES YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Updating the snapshot of "%VMNAME%" virtual machine...
echo.

robocopy "%VM%" "%SNAP%" /MIR /Z /SL /MT /XJ /R:5 /W:5

echo.
echo Snapshot operation complete.
echo.
