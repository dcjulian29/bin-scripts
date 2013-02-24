@echo off

setlocal

call %SYSTEMDRIVE%\bin\vmware\_vm_settings.cmd

echo.
echo Starting %VMNAME%
echo.

start "" "%VPLAYER%" %1