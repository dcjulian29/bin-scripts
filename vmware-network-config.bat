@echo off

setlocal

call %SYSTEMDRIVE%\bin\vmware\_vm_settings.cmd

set CMD=%SystemRoot%\System32\rundll32.exe
set DLL="%VMPROG%\vmnetui.dll"
set EP=VMNetUI_ShowStandalone

set START=%CMD% %DLL% %EP%

%SYSTEMDRIVE%\bin\elevate.bat %START%