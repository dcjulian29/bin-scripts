@echo off
call %SYSTEMDRIVE%\Tools\binaries\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

setlocal

color 60

set PCMD=Watch-DefaultGatewayChangeVpn OpenVPN

call %~dp0pshell.cmd "%PCMD%"

endlocal

:EOF
