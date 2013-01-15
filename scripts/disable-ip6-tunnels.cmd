@echo off

SET CS=%TEMP%\ip6tunnel.reg

echo Windows Registry Editor Version 5.00 > %CS%
echo. >> %CS%
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters] >> %CS%
echo "DisabledComponents"=dword:00000001 >> %CS%
echo. >> %CS%

REG IMPORT %CS%

DEL /Q %CS%

echo You need to reboot to complete the action...