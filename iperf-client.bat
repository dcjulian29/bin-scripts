@ECHO OFF

SETLOCAL

if [%1] == [] goto PROVIDEHOST

set SEC=15
if [%2] NEQ [] set SEC=%2

call %~dp0\iperf.bat -c %1 -i 1 -t %SEC%

goto EOF

:PROVIDEHOST

echo.
echo Please provide the name of the host running the server component...
echo.

:EOF
