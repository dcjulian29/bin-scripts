@echo off

set PATH=%WINDIR%;%WINDIR%\system32;%WINDIR%\System32\Wbem;%WINDIR%\System32\WindowsPowerShell\v1.0;%ALLUSERSPROFILE%\chocolatey\bin
setx /m PATH %PATH%