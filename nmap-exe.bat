@echo off

setlocal

set PATH=C:\bin\network\nmap;%PATH%

if [%1] == [] goto EXE

echo [%*] | find "--unprivileged" > nul
If %ERRORLEVEL% EQU 0 goto EXE

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% EQU 99 goto PRIVILEGED
if %ERRORLEVEL% EQU 2 goto UNPRIVILEGED

goto EOF

:UNPRIVILEGED

nmap.exe --unprivileged %*

goto EOF

:PRIVILEGED

:EXE

nmap.exe %*

pause

:EOF