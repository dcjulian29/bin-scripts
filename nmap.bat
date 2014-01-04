@echo off

setlocal

if [%1] == [] goto EXE

call %SYSTEMDRIVE%\Tools\binaries\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% EQU 99 goto PRIVILEGED
if %ERRORLEVEL% EQU 2 goto UNPRIVILEGED

goto EOF

:UNPRIVILEGED

call %SYSTEMDRIVE%\Tools\binaries\nmap-exe.bat --unprivileged -vv -n -Pn -sT -sV %*

goto EOF

:PRIVILEGED

call %SYSTEMDRIVE%\Tools\binaries\nmap-exe.bat --privileged -vv -n -Pn -sS -sV -A %*
goto EOF

:EXE
call %SYSTEMDRIVE%\Tools\binaries\nmap-exe.bat 

:EOF
