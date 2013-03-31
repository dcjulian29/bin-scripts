@echo off

SET CS=%TEMP%\ConsoleSettings.reg

echo Windows Registry Editor Version 5.00 > %CS%
echo. >> %CS%
echo [HKEY_CURRENT_USER\Console] >> %CS%
echo "ColorTable00"=dword:00000000 >> %CS%
echo "ColorTable01"=dword:00800000 >> %CS%
echo "ColorTable02"=dword:00008000 >> %CS%
echo "ColorTable03"=dword:00808000 >> %CS%
echo "ColorTable04"=dword:00000080 >> %CS%
echo "ColorTable05"=dword:00800080 >> %CS%
echo "ColorTable06"=dword:00008080 >> %CS%
echo "ColorTable07"=dword:00c0c0c0 >> %CS%
echo "ColorTable08"=dword:00808080 >> %CS%
echo "ColorTable09"=dword:00ff0000 >> %CS%
echo "ColorTable10"=dword:0000ff00 >> %CS%
echo "ColorTable11"=dword:00ffff00 >> %CS%
echo "ColorTable12"=dword:000000ff >> %CS%
echo "ColorTable13"=dword:00ff00ff >> %CS%
echo "ColorTable14"=dword:0000ffff >> %CS%
echo "ColorTable15"=dword:00ffffff >> %CS%
echo "CursorSize"=dword:00000019 >> %CS%
echo "EnableColorSelection"=dword:00000000 >> %CS%
echo "ExtendedEditKey"=dword:00000000 >> %CS%
echo "ExtendedEditKeyCustom"=dword:00000000 >> %CS%
echo "FontFamily"=dword:00000036 >> %CS%
echo "FontSize"=dword:00100000 >> %CS%
echo "FontWeight"=dword:00000190 >> %CS%
echo "FullScreen"=dword:00000000 >> %CS%
echo "HistoryBufferSize"=dword:00000032 >> %CS%
echo "HistoryNoDup"=dword:00000000 >> %CS%
echo "InsertMode"=dword:00000001 >> %CS%
echo "LoadConIme"=dword:00000001 >> %CS%
echo "NumberOfHistoryBuffers"=dword:00000004 >> %CS%
echo "PopupColors"=dword:000000f5 >> %CS%
echo "QuickEdit"=dword:00000001 >> %CS%
echo "ScreenBufferSize"=dword:0bb80078 >> %CS%
echo "ScreenColors"=dword:0000000a >> %CS%
echo "TrimLeadingZeros"=dword:00000000 >> %CS%
echo "WindowSize"=dword:00280078 >> %CS%
echo "WordDelimiters"=dword:00000000 >> %CS%
echo "CurrentPage"=dword:00000003 >> %CS%
echo "FaceName"="Consolas" >> %CS%

echo. >> %CS%
echo [-HKEY_CURRENT_USER\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe] >> %CS%
echo. >> %CS%
echo [-HKEY_CURRENT_USER\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe] >> %CS%
echo. >> %CS%

REG IMPORT %CS%

DEL /Q %CS%
