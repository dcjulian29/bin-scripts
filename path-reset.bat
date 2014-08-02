@echo off

set PATH=%WINDIR%;%WINDIR%\system32;%WINDIR%\System32\Wbem;%WINDIR%\System32\WindowsPowerShell\v1.0;%ALLUSERSPROFILE%\chocolatey\bin

if exist "%SYSTEMDRIVE%\tools\binaries" set PATH=%SYSTEMDRIVE%\tools\binaries;%PATH%

setx /m PATH %PATH%

reg delete HKCU\Environment /v Path /f
