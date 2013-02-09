@echo off

setlocal

call C:\bin\vmware\_vm_settings.cmd

%SystemRoot%\System32\rundll32.exe "%VMPROG%\vmnetui.dll" VMNetUI_ShowStandalone
