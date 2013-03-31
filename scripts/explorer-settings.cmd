@echo off

SET CS=%TEMP%\ExplorerSettings.reg

echo Windows Registry Editor Version 5.00 > %CS%
echo. >> %CS%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced] >> %CS%
echo "Hidden"=dword:00000001 >> %CS%
echo "HideFileExt"=dword:00000000 >> %CS%
echo "SeparateProcess"=dword:00000001 >> %CS%
echo "AutoCheckSelect"=dword:00000000 >> %CS%
echo "NavPaneExpandToCurrentFolder"=dword:00000001 >> %CS%
echo. >> %CS%

REG IMPORT %CS%

DEL /Q %CS%
