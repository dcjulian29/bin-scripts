@echo off

setlocal

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

setx /m PATH "%SYSTEMDRIVE%\bin;%WINDIR%;%WINDIR%\system32;%WINDIR%\System32\Wbem;%WINDIR%\System32\WindowsPowerShell\v1.0"

:EOF
