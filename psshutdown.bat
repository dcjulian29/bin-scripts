@echo off

call %SYSTEMDRIVE%\Tools\binaries\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

@%SYSTEMDRIVE%\Tools\apps\sysinternals\psshutdown.exe %*

:EOF
