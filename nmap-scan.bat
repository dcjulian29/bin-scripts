@echo off

setlocal

set PATH=C:\Tools\apps\nmap;%PATH%

if [%1] == [] goto ERROR

call %SYSTEMDRIVE%\Tools\binaries\_isElevated.cmd YES "%0" %1
if %ERRORLEVEL% EQU 99 goto PRIVILEGED
if %ERRORLEVEL% EQU 2 goto UNPRIVILEGED

goto EOF

:UNPRIVILEGED

nmap.exe --unprivileged -vv -n -Pn -sT -sV %1

goto EOF

:PRIVILEGED

nmap.exe --privileged -vv -n -Pn -sS -sV -A %1
goto EOF

:ERROR

echo.
echo Please enter the network to scan...
echo.

:EOF


