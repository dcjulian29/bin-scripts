@echo off

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

@%SYSTEMDRIVE%\Tools\apps\sysinternals\psshutdown.exe %*

:EOF
