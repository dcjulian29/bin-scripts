@echo off

SET CS=%TEMP%\PowerShellHere.reg

echo Windows Registry Editor Version 5.00 > %CS%
echo. >> %CS%
echo [HKEY_CLASSES_ROOT\Directory\shell\PowerShellHere] >> %CS%
echo @="&PowerShell Here" >> %CS%
echo. >> %CS%
echo [HKEY_CLASSES_ROOT\Directory\shell\PowerShellHere\command] >> %CS%
echo @="\"C:\\WINDOWS\\system32\\windowspowershell\\v1.0\\powershell.exe\" -NoExit -ExecutionPolicy unrestricted -Command [Environment]::CurrentDirectory=(Set-Location -LiteralPath:'%%L' -PassThru).ProviderPath" >> %CS%
echo. >> %CS%
echo [HKEY_CLASSES_ROOT\Drive\shell\PowerShellHere] >> %CS%
echo @="&PowerShell Here" >> %CS%
echo. >> %CS%
echo [HKEY_CLASSES_ROOT\Drive\shell\PowerShellHere\command] >> %CS%
echo @="\"C:\\WINDOWS\\system32\\windowspowershell\\v1.0\\powershell.exe\" -NoExit -ExecutionPolicy unrestricted -Command [Environment]::CurrentDirectory=(Set-Location -LiteralPath:'%%L' -PassThru).ProviderPath" >> %CS%
echo. >> %CS%

REG IMPORT %CS%

DEL /Q %CS%
