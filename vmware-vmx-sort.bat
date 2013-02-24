@echo off

setlocal

call %SYSTEMDRIVE%\bin\vmware\_vm_settings.cmd

echo.
echo Sorting %1
echo.

call %SYSTEMDRIVE%\bin\python.bat %SYSTEMDRIVE%\bin\vmware\vmx-sort.py %1

echo.
echo Sorting operation complete.
echo.
